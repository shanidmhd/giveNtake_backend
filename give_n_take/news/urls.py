from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import *

router = DefaultRouter()

router.register(r'news_type', NewsTypeViewSet)
router.register(r'news', NewsViewSet)
router.register(r'meeting', MeetingHighligthsViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('get_news_by_user/',get_news_by_user.as_view()),
    path('get_news_by_user_region/',get_news_by_user_region.as_view()),
    path('get_meeting_by_user/',get_meeting_by_user.as_view())
    ]