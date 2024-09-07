# views.py
from django.shortcuts import render
from django.http import StreamingHttpResponse
import cv2
import threading
import pytesseract

class VideoCamera(object):
    def __init__(self):
        self.video = cv2.VideoCapture(0)
        (self.grabbed, self.frame) = self.video.read()
        threading.Thread(target=self.update, args=()).start()

    def __del__(self):
        self.video.release()

    def get_frame(self):
        image = self.frame
        plate_number = self.recognize_plate(image)
        if plate_number:
            print(f"Recognized Number Plate: {plate_number}")
        _, jpeg = cv2.imencode('.jpg', image)
        return jpeg.tobytes()

    def update(self):
        while True:
            (self.grabbed, self.frame) = self.video.read()

    def recognize_plate(self, image):
        # Assuming the number plate recognition logic
        # Convert the image to gray scale
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        # Use pytesseract to do OCR on the image
        plate_number = pytesseract.image_to_string(gray, config='--psm 8') # Adjust config as necessary
        return plate_number.strip()

def gen(camera):
    while True:
        frame = camera.get_frame()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')

def video_feed(request):
    return StreamingHttpResponse(gen(VideoCamera()),
                                 content_type='multipart/x-mixed-replace; boundary=frame')

def index(request):
    return render(request, 'index.html')


def result(request):
    return render(request,'result.html')

def unauth(request):
    return render(request,'unauth.html')