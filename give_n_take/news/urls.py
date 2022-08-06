from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import *

router = DefaultRouter()

router.register(r'news_type', NewsTypeViewSet)
router.register(r'news', NewsViewSet)
router.register(r'meeting', MeetingHighligthsViewSet)

urlpatterns = [
    path('', include(router.urls)),
    
    ]