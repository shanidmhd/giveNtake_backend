from django.urls import include, path 
from . import views
from rest_framework.routers import DefaultRouter


router = DefaultRouter()

# router.register(r'news_type', NewsTypeViewSet)
router.register(r'news', views.NewsViewSet)
router.register(r'meeting', views.MeetingHighligthsViewSet)
router.register(r'users', views.UserRegistrationViewSet)
router.register(r'role', views.StaffRoleViewSet)
router.register(r'admin', views.AdminUserViewSet)
urlpatterns = [
 path('admin/', include(router.urls)),
#  path('',views.register_api.as_view())   ,
# #  path('login/',views.login_api.as_view()),
 path('list/',views.list_api.as_view()),
 path('',views.admin_register.as_view()),
 path('get_news_user_id/',views.get_news_by_user.as_view()),
 path('get_committee_admin_created/',views.get_committee_admin_created.as_view()),
 path('get_meeting_by_user_id/',views.get_meeting_by_user.as_view()),
 path('admin/update/<int:id>/',views.update_admin.as_view()),
 path('admin/filter/',views.admin_filter_list.as_view())

]