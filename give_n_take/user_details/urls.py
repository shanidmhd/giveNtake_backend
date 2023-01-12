from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import *

router = DefaultRouter()
router.register(r'register', UserRegistrationViewSet)
router.register(r'state', StateViewSet)
router.register(r'district', DistrictViewSet)
router.register(r'staff_role', StaffRoleViewSet)
router.register(r'committee_type', CommitteeTypeViewSet)
router.register(r'panchayath', PanchayathViewSet)
router.register(r'ward', WardViewSet)
urlpatterns = [
    path('', include(router.urls)),
    path('login/', UserLoginView.as_view(), name="user_login"),
    path('get_user/',get_user_by_name.as_view()),
    path('get_user_committee/',get_user_by_committe.as_view()),
    path('get_state_user/',get_state_by_user.as_view()),
    path('get_district_user/',get_district_by_user.as_view()),
    path('get_area_by_usercommitte/',get_area_by_usercommitte.as_view()),
    path('get_dist_pan_ward_created/',district_ward_panchayath_created_by.as_view()),
    path('count/users/',Users_count.as_view())

    ]