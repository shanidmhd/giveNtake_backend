from django.conf import settings
from django.shortcuts import render
from rest_framework import viewsets
from .serializers import (
    Program_Serializer,
    Ticket_Booking_serializer,
    Program_get_Serializer,
    ticket_get_serializer,
)
from .models import Program_model, TicketBooking
from rest_framework.response import Response
from rest_framework import status
from register.models import admin_model
from rest_framework.permissions import IsAuthenticated
from django.http import Http404
from user_details.models import UserDetails, District, State
from register.permission import Iscommitteeadmin
import pyqrcode
import png
from pyqrcode import QRCode
import qrcode
import logging
import pysnooper
from rest_framework.decorators import api_view
import random 
import string
# Create your views here.
from django.core.files import File


class ProgramAPI(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """

    serializer_class = Program_Serializer
    queryset = Program_model.objects.all()
    http_method_names = ["get", "post", "put", "delete"]
    permission_classes = [IsAuthenticated]

    def create(self, request):
        serializer = self.serializer_class(data=request.data)
        admin = (
            admin_model.objects.filter(user_id__id=request.user.id)
            .values("committee_type__name", "state", "district")
            .first()
        )
        fk_admin_id = admin_model.objects.get(user_id__id=request.user.id)

        # Checking the committee type of the admin and then it is saving the program accordingly.

        if admin["committee_type__name"] == "State Committee":
           
            if serializer.is_valid():
                serializer.save(
                    fk_admin_id=fk_admin_id,
                    available_seats=request.data["total_seats"],
                    fk_state=State.objects.get(id=admin["state"]),
                )
                return Response(
                    {"success": "Program succesfully added"},
                    status=status.HTTP_201_CREATED,
                )

            return Response(
                {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
            )
        elif admin["committee_type__name"] == "District Committee":
           
            if serializer.is_valid():
                serializer.save(
                    fk_admin_id=fk_admin_id,
                    available_seats=request.data["total_seats"],
                    fk_district=District.objects.get(id=admin["district"]),
                )
                return Response(
                    {"success": "Program succesfully added"},
                    status=status.HTTP_201_CREATED,
                )

            return Response(
                {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
            )
        else:
           
            if serializer.is_valid():
                serializer.save(
                    fk_admin_id=fk_admin_id, available_seats=request.data["total_seats"]
                )
                return Response(
                    {"success": "Program succesfully added"},
                    status=status.HTTP_201_CREATED,
                )

            return Response(
                {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
            )

    def retrieve(self, request, *args, **kargs):

        prog_id = kargs.get("pk")
        if prog_id:
            try:
                appts = Program_model.objects.get(id=int(prog_id))
                serializer = Program_get_Serializer(appts, many=False)
                return Response({"results": serializer.data})
            except Program_model.DoesNotExist:
                raise Http404
        return Response(status=status.HTTP_400_BAD_REQUEST)

    def list(self, request):
        appts = Program_model.objects.all()
        serializer = Program_get_Serializer(appts, many=True)
        return Response({"results": serializer.data})


class TicketBooking_API(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """

    serializer_class = Ticket_Booking_serializer
    queryset = TicketBooking.objects.all()
    http_method_names = ["get", "post", "patch", "delete"]
    permission_classes = [IsAuthenticated]

    def list(self, request):

        appts = TicketBooking.objects.all()
        serializer =ticket_get_serializer(appts, many=True)
        for res in serializer.data:
            res['qr_code_image']=settings.HOST_ADDRESS + str(res['qr_code_image'])
            res["fk_user_id"] = UserDetails.objects.filter(id=res["fk_user_id"]).values(
                "id", "username"
            )
            res["fk_program"] = Program_model.objects.filter(
                id=res["fk_program"]
            ).values("id", "program_name", "venue", "available_seats")
        return Response({"results": serializer.data})

    def retrieve(self, request, *args, **kargs):
        news_id = kargs.get("pk")
        if news_id:
            try:
                appts = TicketBooking.objects.get(id=int(news_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({"results": serializer.data})
            except:
                return Response({"message": "No data found"})
        else:
            try:
                appts = TicketBooking.objects.all()
                serializer = self.get_serializer(appts, many=True)
                return Response({"results": serializer.data})
            except:
                return Response({"message": "No data found"})
    
    def create(self, request, *args, **kwargs):
        """
        It creates a new object of the model and saves it to the database.

        :param request: The request object
        :return: The response is a JSON object.
        """
       
        _serializer = self.serializer_class(data=request.data)
        if _serializer.is_valid():
            # Getting the program id and the number of seats from the request data and then it is
            # getting the program object from the database and then it is calculating the remaining
            # seats and then it is saving the serializer and then it is updating the program object
            # with the remaining seats.
            program_id = request.data["fk_program"]
           
            no_of_seat_r = int(request.data["no_of_seats"])
           
            program = (
                Program_model.objects.filter(id=program_id)
                .values("id","available_seats", "price")
                .first()
            )
     
            if no_of_seat_r < int(program["available_seats"]):
                remaining_seats = program["available_seats"] - no_of_seat_r
                total_price = no_of_seat_r * int(program["price"])
                _serializer.save(
                    fk_user_id=UserDetails.objects.get(id=request.user.id),
                    total_amount=total_price,
                )
                Program_model.objects.filter(id=program_id).update(
                    available_seats=remaining_seats
                )
                return Response(data=_serializer.data, status=status.HTTP_201_CREATED)
            else:
                return Response(
                    {"error": "seats is not available"},
                    status=status.HTTP_400_BAD_REQUEST,
                )

        else:
            return Response(data=_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def partial_update(self, request, pk):

        testmodel_object = TicketBooking.objects.get(id=int(pk))
        serializer = Ticket_Booking_serializer(
            testmodel_object, data=request.data, partial=True
        )  # set partial=True to update a data partially
        if serializer.is_valid():
            if request.data["payment_status"] == "completed":
                ser = TicketBooking.objects.get(id=int(pk))
                ser_data = Ticket_Booking_serializer(ser, many=False)
                user = {}
                program = {}
                for ser in ser_data.data["fk_user_id"]:
                    user["id"] = ser["id"]
                    user["username"] = ser["username"]
                for pro in ser_data.data["fk_program"]:
                    program["id"] = pro["id"]
                    program["name"] = pro["program_name"]
                    program["venue"] = pro["venue"]
                    program["date"] = pro["date"]
                    program['created_by'] = pro["fk_admin_id__id"]

                ser = serializer.save(payment_completed=True)
                digits = random.choices(string.digits,k=2)
                lettters = random.choices(string.ascii_lowercase,k=9)
                sample=random.sample(digits+lettters,7)
                result='QR'+''.join(sample)
                url =settings.HOST_ADDRESS + '/program/qr/'+ str(result) + '/'
                qr_image = qrcode.make(url)
                qr_image.save("media/qrcode/qrimage.png")
                destination_file = open("media/qrcode/qrimage.png", "rb")
                ser.qr_code_image.save("qrimage.png", File(destination_file), save=True)
                TicketBooking.objects.filter(id=int(pk)).update(qr_random_num=result)

            else:
                serializer.save()
            return Response({"sucess": "success"}, status=status.HTTP_200_OK)
        return Response(
            {"error": status.HTTP_400_BAD_REQUEST}, status=status.HTTP_400_BAD_REQUEST
        )

@api_view(('GET',))
def invalid_qrcode(req,random):
    if req.method == 'GET':
        ser_get = TicketBooking.objects.get(qr_random_num=random)
        ser_data = Ticket_Booking_serializer(ser_get, many=False)
        user = {}
        program = {}
        for ser in ser_data.data["fk_user_id"]:
            user["id"] = ser["id"]
            user["username"] = ser["username"]
        for pro in ser_data.data["fk_program"]:
            program["id"] = pro["id"]
            program["name"] = pro["program_name"]
            program["venue"] = pro["venue"]
            program["date"] = pro["date"]
            program['created_by'] = pro["fk_admin_id__id"]
        if ser_get.qr_image_scanned == False :
            data = {
                        "booking_id": ser_data.data["id"],
                        "no_of_seats": ser_data.data["no_of_seats"],
                        "payment_status":ser_data.data['payment_status'],
                        "userdetails": user,
                        "program_details": program,
                    }
        else :
            data={
                "error" : "QR already scanned",
                "status" : status.HTTP_400_BAD_REQUEST
            }
        TicketBooking.objects.filter(qr_random_num=random).update(qr_image_scanned=True)
        
        return Response(data)
        # id=req.GET['id']
        # TicketBooking.objects.filter(id=id).update(qr_code_image='media/qrcode/error.png')
