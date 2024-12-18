"""
URL configuration for Fyp project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views

admin.site.site_header = "Smart Vehicle Admin"
admin.site.site_title = "Smart Vehicle Portal"
admin.site.index_title = "Welcome to Design of Smart Vehicle Recognition System for Comprehensive Information"

urlpatterns = [
    path('admin/', admin.site.urls),
    # path('video_feed', views.video_feed, name='video_feed'),
    # path('', views.index, name='index'),
    # path('result/', views.result, name='result'),
    # path('unauth/', views.unauth, name='unauth'),
    path('new/', views.new, name='newindex'),
    path('video_feed/', views.video_feed, name='video_feed'),
    path('get_owner_info/', views.get_owner_info, name='get_owner_info'),
]
