# views.py
# from django.shortcuts import render
# from django.http import StreamingHttpResponse
# import cv2
# import threading
# import pytesseract

# class VideoCamera(object):
#     def __init__(self):
#         self.video = cv2.VideoCapture(0)
#         (self.grabbed, self.frame) = self.video.read()
#         threading.Thread(target=self.update, args=()).start()

#     def __del__(self):
#         self.video.release()

#     def get_frame(self):
#         image = self.frame
#         plate_number = self.recognize_plate(image)
#         if plate_number:
#             print(f"Recognized Number Plate: {plate_number}")
#         _, jpeg = cv2.imencode('.jpg', image)
#         return jpeg.tobytes()

#     def update(self):
#         while True:
#             (self.grabbed, self.frame) = self.video.read()

#     def recognize_plate(self, image):
#         # Assuming the number plate recognition logic
#         # Convert the image to gray scale
#         gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
#         # Use pytesseract to do OCR on the image
#         plate_number = pytesseract.image_to_string(gray, config='--psm 8') # Adjust config as necessary
#         return plate_number.strip()

# def gen(camera):
#     while True:
#         frame = camera.get_frame()
#         yield (b'--frame\r\n'
#                b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')

# def video_feed(request):
#     return StreamingHttpResponse(gen(VideoCamera()),
#                                  content_type='multipart/x-mixed-replace; boundary=frame')

# def index(request):
#     return render(request, 'index.html')


# def result(request):
#     return render(request,'result.html')

# def unauth(request):
#     return render(request,'unauth.html')
import cv2
from django.shortcuts import render
import easyocr
from django.http import StreamingHttpResponse
from django.views.decorators import gzip
from vehicle.models import vehicle

# Initialize the EasyOCR reader (supports multiple languages)
reader = easyocr.Reader(['en'])

# Video capture generator
def generate_video():
    # Open video capture from default camera
    cap = cv2.VideoCapture(0)

    while True:
        ret, frame = cap.read()

        if ret:
            # Convert frame to grayscale for processing
            gray_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

            # OCR processing to detect text (number plate)
            result = reader.readtext(gray_frame)

            # Initialize owner_name with default message
            owner_name = "No match found"
            
            if result:
                detected_plate = result[0][1]  # Detected plate number
                print("Detected Number Plate:", detected_plate)  # Printing to console

                # Query the database for a matching number plate
                try:
                    owner = vehicle.objects.get(plate_num=detected_plate)
                    owner_name = owner.owner_name
                    owner_age = owner.owner_age
                    print("Owner Name:", owner_name)
                    print("Owner age:", owner_age)
                except vehicle.DoesNotExist:
                    print("No matching vehicle found for plate:", detected_plate)
                    

            # Encode frame for streaming
            ret, buffer = cv2.imencode('.jpg', frame)
            frame = buffer.tobytes()

            # Yield the frame for streaming and update owner name in frontend
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')

            # Update owner name on the client side
            yield (b'<script>'
                   b'document.getElementById("result").innerHTML = "' + owner_name.encode() + b'";'
                   b'</script>\r\n')

@gzip.gzip_page
def video_feed(request):
    return StreamingHttpResponse(generate_video(), content_type='multipart/x-mixed-replace; boundary=frame')

def new(request):
    return render(request, 'newindex.html')
