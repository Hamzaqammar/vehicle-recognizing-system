import re  # For regular expressions
import cv2
from django.shortcuts import render
import easyocr
from django.http import StreamingHttpResponse, JsonResponse
from django.views.decorators import gzip
from vehicle.models import vehicle

# Initialize the EasyOCR reader
reader = easyocr.Reader(['en'], gpu=False)

# List of region keywords to ignore
ignored_regions = ["Sindh","Sind", "Punjab", "ICT", "Islamabad"]

# Function to clean and validate detected license plates
def clean_plate_text(detected_text):
    # Remove unwanted characters
    cleaned_text = re.sub(r"[^\w\-]", "", detected_text)  # Keep alphanumeric and hyphens only
    cleaned_text = cleaned_text.upper()  # Normalize to uppercase

    # Remove ignored regions
    for region in ignored_regions:
        cleaned_text = cleaned_text.replace(region.upper(), "")

    # Validate against a basic license plate format (e.g., ABC-123, KED5641)
    match = re.match(r"^[A-Z]{2,3}-?\d{3,4}$", cleaned_text)
    if match:
        return match.group()  # Return the valid plate
    return None  # Invalid plate

# Video capture generator
def generate_video():
    cap = cv2.VideoCapture(0)  # Use the webcam (0 is the default webcam)
    while True:
        ret, frame = cap.read()
        if ret:
            gray_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            result = reader.readtext(gray_frame)

            # Default messages for all fields
            generate_video.last_detected_name = "No match found"
            generate_video.last_detected_age = ""
            generate_video.last_detected_gender = ""
            generate_video.last_detected_cnic = ""
            generate_video.last_detected_depart = ""
            generate_video.last_detected_phone = ""
            generate_video.last_detected_address = ""
            generate_video.last_detected_make = ""
            generate_video.last_detected_model = ""

            if result:
                # Combine detected text into one string
                detected_texts = [item[1] for item in result]
                detected_plate_raw = " ".join(detected_texts)
                print("Raw Detected Plate:", detected_plate_raw)

                # Clean and validate the detected plate
                detected_plate = clean_plate_text(detected_plate_raw)
                print("Cleaned Detected Plate:", detected_plate)

                if detected_plate:
                    try:
                        # Query the vehicle database with the cleaned plate
                        owner = vehicle.objects.get(plate_num=detected_plate)
                        # Update details
                        generate_video.last_detected_name = owner.owner_name
                        generate_video.last_detected_age = owner.owner_age
                        generate_video.last_detected_gender = owner.owner_gender
                        generate_video.last_detected_cnic = owner.owner_cnic
                        generate_video.last_detected_depart = owner.owner_depart
                        generate_video.last_detected_phone = owner.owner_phone
                        generate_video.last_detected_address = owner.owner_address
                        generate_video.last_detected_make = owner.vehicle_Make
                        generate_video.last_detected_model = owner.vehicle_Model
                    except vehicle.DoesNotExist:
                        pass  # No match in the database

                # Draw a rectangle around the detected number plate
                if len(result) > 0:
                    points = result[0][0]  # Bounding box of the first detected text
                    top_left = tuple(map(int, points[0]))
                    bottom_right = tuple(map(int, points[2]))
                    cv2.rectangle(frame, top_left, bottom_right, (0, 255, 0), 2)  # Green rectangle

            ret, buffer = cv2.imencode('.jpg', frame)
            frame = buffer.tobytes()
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')


@gzip.gzip_page
def video_feed(request):
    return StreamingHttpResponse(generate_video(), content_type='multipart/x-mixed-replace; boundary=frame')


def new(request):
    return render(request, 'newindex.html')


def get_owner_info(request):
    # Return the detected owner information as JSON
    owner_info = {
        'owner_name': generate_video.last_detected_name,
        'owner_age': generate_video.last_detected_age,
        'owner_gender': generate_video.last_detected_gender,
        'owner_cnic': generate_video.last_detected_cnic,
        'owner_depart': generate_video.last_detected_depart,
        'owner_phone': generate_video.last_detected_phone,
        'owner_address': generate_video.last_detected_address,
        'vehicle_Make': generate_video.last_detected_make,
        'vehicle_Model': generate_video.last_detected_model
    }

    if generate_video.last_detected_name == "No match found":
        owner_info = {
            'owner_name': "No match found",
            'owner_age': "",
            'owner_gender': "",
            'owner_cnic': "",
            'owner_depart': "",
            'owner_phone': "",
            'owner_address': "",
            'vehicle_Make': "",
            'vehicle_Model': ""
        }

    return JsonResponse(owner_info)
