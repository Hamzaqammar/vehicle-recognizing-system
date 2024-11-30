import cv2
from django.shortcuts import render
import easyocr
from django.http import StreamingHttpResponse, JsonResponse
from django.views.decorators import gzip
from vehicle.models import vehicle

# Initialize the EasyOCR reader (supports multiple languages)
reader = easyocr.Reader(['en'], gpu=False)

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
                detected_plate = result[0][1]
                print("Detected Number Plate:", detected_plate)  # Printing to console

                # Get the bounding box of the detected plate
                # EasyOCR returns the coordinates as a list of points
                points = result[0][0]  # This is a list of 4 points defining the bounding box

                # Convert points to tuples with integer coordinates
                top_left = tuple(map(int, points[0]))
                bottom_right = tuple(map(int, points[2]))

                # Draw a green rectangle around the detected number plate
                cv2.rectangle(frame, top_left, bottom_right, (0, 255, 0), 2)  # Green color and thickness of 2

                try:
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
                    pass  # If no vehicle is found for that number plate, the default values remain

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

    # If no match found, show the message
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
