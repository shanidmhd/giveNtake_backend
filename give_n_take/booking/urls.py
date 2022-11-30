from django.urls import path, include
from .views import *
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register("details", ProgramAPI)
router.register("booking", TicketBooking_API)


urlpatterns = [
    path("", include(router.urls)),
    path('qr/<str:random>/',invalid_qrcode),
    path('ticket/booked_by/',get_ticket_booking_id),
    path('created_by/',program_based_create_by),
    path('by_state/',program_based_state),
    path('by_district/',program_based_district)
]
