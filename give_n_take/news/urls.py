from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import *

router = DefaultRouter()

router.register(r'news_type', NewsTypeViewSet)
router.register(r'news', NewsViewSet)
router.register(r'meeting', MeetingHighligthsViewSet)
router.register(r'all', News_all_ViewSet)


urlpatterns = [
    path('', include(router.urls)),
    path('get_news_by_user/',get_news_by_user.as_view()),
    path('get_news_by_user_region/district/',get_news_by_user_region_district.as_view()),
    path('get_news_by_user_region/state/',get_news_by_user_region_state.as_view()),
    path('get_news_by_user_region/panchayath/',get_news_by_user_region_panchayath.as_view()),
    path('get_news_by_user_region/ward/',get_news_by_user_region_ward.as_view()),
    path('get_news_by_user_region/all/',get_news_by_user_region_all.as_view()),
    path('get_meeting_by_user/',get_meeting_by_user.as_view()),
    path('count/news/',News_count.as_view()),
    path('count/meeting/',News_count.as_view())

    ]