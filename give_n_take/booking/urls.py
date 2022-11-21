from django.urls import path,include
from .views import *
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('details', ProgramAPI)
router.register('booking', TicketBooking_API)



urlpatterns = [
    path('', include(router.urls)),
    
    ]