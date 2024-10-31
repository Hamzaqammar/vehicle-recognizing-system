import cv2
from django.shortcuts import render
import easyocr
from django.http import StreamingHttpResponse
from django.views.decorators import gzip
from vehicle.models import vehicle
from django.http import JsonResponse

# Initialize the EasyOCR reader (supports multiple languages)
reader = easyocr.Reader(['en'])

# Video capture generator
def generate_video():
    cap = cv2.VideoCapture(0)
    while True:
        ret, frame = cap.read()
        if ret:
            gray_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            result = reader.readtext(gray_frame)
            generate_video.last_detected_name = "No match found"  # Default message
            generate_video.last_detected_age = ""
            if result:
                detected_plate = result[0][1]
                print("Detected Number Plate:", detected_plate)  # Printing to console
                try:
                    owner = vehicle.objects.get(plate_num=detected_plate)
                    generate_video.last_detected_name = owner.owner_name
                    generate_video.last_detected_age = owner.owner_age
                    
                    
                except vehicle.DoesNotExist:
                    pass
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
    owner_info = {
        'owner_name': generate_video.last_detected_name,
        'owner_age': generate_video.last_detected_age
    }
    return JsonResponse(owner_info)