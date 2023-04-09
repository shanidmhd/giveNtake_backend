
from django.conf import settings
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render
from django.utils import timezone
from rest_framework import viewsets
from .serializers import (
    Program_Serializer,
    Ticket_Booking_serializer,
    Program_get_Serializer,
    ticket_get_serializer,
    ticket_id_serializer,
)
from .models import Program_model, TicketBooking
from rest_framework.response import Response
from rest_framework import status
from register.models import admin_model,committee_members
from rest_framework.permissions import IsAuthenticated
from django.http import Http404
from user_details.models import UserDetails, District, State,Ward,Panchayath
from register.permission import Isprogram
from pyqrcode import QRCode
import qrcode
from rest_framework.decorators import api_view
import random 
import string
# Create your views here.
from django.core.files import File
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView

class ProgramAPI(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """

    serializer_class = Program_Serializer
    queryset = Program_model.objects.all()
    http_method_names = ["get", "post", "put", "delete"]
    permission_classes = [IsAuthenticated,Isprogram]

    def create(self, request):
        serializer = self.serializer_class(data=request.data)
        admin = (
            admin_model.objects.filter(user_id__id=request.user.id)
            .values("committee_type__name", "state", "district", "panchayath", "ward", "committee_type_id")
            .first()
        )
        fk_admin_id = admin_model.objects.get(user_id__id=request.user.id)

        # The first check is for superuser and if it qualifies actions specific to superuser is processed else
        # the remaining part of the code is executed.
        if request.user.is_superuser or admin["committee_type_id"] in [1, 2, 3]:

            if int(request.data['committe_type']) == 4:
                if serializer.is_valid():
                    serializer.save(
                        fk_admin_id=fk_admin_id,
                        available_seats=request.data["total_seats"],
                        fk_state=State.objects.get(id=request.data["state_region"]),
                    )
                    return Response(
                        {"success": "Program succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
            elif int(request.data['committe_type']) == 5:
                if serializer.is_valid():
                    serializer.save(
                        fk_admin_id=fk_admin_id,
                        available_seats=request.data["total_seats"],
                        fk_district=District.objects.get(id=request.data["district_region"]),
                    )
                    return Response(
                        {"success": "Program succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
            elif int(request.data['committe_type']) == 6:
                if serializer.is_valid():
                    serializer.save(
                        fk_admin_id=fk_admin_id,
                        available_seats=request.data["total_seats"],
                        fk_panchayath=Panchayath.objects.get(id=request.data["panchayath_region"]),
                    )
                    return Response(
                        {"success": "Program succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
            elif int(request.data['committe_type']) == 7:
                if serializer.is_valid():
                    serializer.save(
                        fk_admin_id=fk_admin_id,
                        available_seats=request.data["total_seats"],
                        fk_ward=Ward.objects.get(id=request.data["ward_region"]),
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
                        fk_admin_id=fk_admin_id,
                        available_seats=request.data["total_seats"]
                    )
                    return Response(
                        {"success": "Program succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )

        # Checking the committee type of the admin and then it is saving the program accordingly.
        elif admin["committee_type__name"] == "State Committee":
           
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
        elif admin["committee_type__name"] == "Panchayath Committee":
           
            if serializer.is_valid():
                serializer.save(
                    fk_admin_id=fk_admin_id,
                    available_seats=request.data["total_seats"],
                    fk_panchayath=Panchayath.objects.get(id=admin["panchayath"]),
                )
                return Response(
                    {"success": "Program succesfully added"},
                    status=status.HTTP_201_CREATED,
                )

            return Response(
                {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
            )
        elif admin["committee_type__name"] == "Ward Committee":
           
            if serializer.is_valid():
                serializer.save(
                    fk_admin_id=fk_admin_id,
                    available_seats=request.data["total_seats"],
                    fk_ward=Ward.objects.get(id=admin["ward"]),
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
                    fk_admin_id=fk_admin_id,
                    available_seats=request.data["total_seats"]
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

    # def destroy(self, request, *args, **kwargs):
    #     user_object = self.get_object()
    #     Program_model.objects.get(id=user_object.id).delete()
    #     user_object.delete()
    #     return Response(status=status.HTTP_204_NO_CONTENT)
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
            if res['qr_code_image'] :
                res['qr_code_image']=settings.HOST_ADDRESS + str(res['qr_code_image'])
            res["fk_user_id"] = UserDetails.objects.filter(id=res["fk_user_id"]).values(
                "id", "username"
            )
            res["fk_program"] =  Program_model.objects.filter(id=res["fk_program"]).values(
            "id", "program_name", "venue", "date",'start_time','end_time','address','contact_no','food','agenda','inauguration_name','total_seats',"available_seats",'price',"fk_admin_id__id"
        )
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
     
            if no_of_seat_r <= int(program["available_seats"]):
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
                sample = self.generate_random_code()
                result='QR'+''.join(sample)
                url = '/program/qr/'+ str(result) + '/'
                qr_image = qrcode.make(url)
                filename = f"qrimage{timezone.now()}.png"
                qr_image.save(f'media/qrcode/{filename}')
                destination_file = open(f'media/qrcode/{filename}', "rb")
                ser.qr_code_image.save(filename, File(destination_file), save=True)
                TicketBooking.objects.filter(id=int(pk)).update(qr_random_num=result)
               

            else:
                serializer.save()
            return Response({"sucess": 'success','qrcode':settings.HOST_ADDRESS + serializer.data['qr_code_image']}, status=status.HTTP_200_OK)
        return Response(
            {"error": status.HTTP_400_BAD_REQUEST}, status=status.HTTP_400_BAD_REQUEST
        )

    def generate_random_code(self):
        digits = random.choices(string.digits, k=2)
        letters = random.choices(string.ascii_lowercase, k=9)
        sample = random.sample(digits + letters, 7)
        try:
            TicketBooking.objects.get(qr_random_num=sample)
        except ObjectDoesNotExist:
            return sample
        else:
            self.generate_random_code()


@api_view(('GET',))
def invalid_qrcode(req,random):
    if req.user.is_authenticated :
        if req.method == 'GET':
            get_object_or_404
            admin_id=get_object_or_404(committee_members,username=req.GET.get('username')).id
            if admin_id :
                
                ticket_random_number=TicketBooking.objects.get(qr_random_num=random).fk_program.id
                program= Program_model.objects.filter(id=ticket_random_number,qr_permission__id=admin_id)
                if program :
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
                                    "status" : status.HTTP_200_OK,
                                    "success":"success"
                                }
                    else :
                        data={
                            "error" : "QR already scanned",
                            "status" : status.HTTP_400_BAD_REQUEST
                        }
                    TicketBooking.objects.filter(qr_random_num=random).update(qr_image_scanned=True)
                    
                    return Response(data)
                return Response({'error':'You dont have permission to scan qr code'},status=status.HTTP_400_BAD_REQUEST)
         
    return Response({"error":"Please login"},status=status.HTTP_401_UNAUTHORIZED)
            # id=req.GET['id']
        # TicketBooking.objects.filter(id=id).update(qr_code_image='media/qrcode/error.png')



@api_view(('GET',))
def get_ticket_booking_id(req):
    if req.method == 'GET' :
        if req.user.is_authenticated :
            ticket_get=TicketBooking.objects.filter(fk_user_id__id=req.user.id).values('id','fk_user_id','fk_program','no_of_seats','total_amount','payment_status','date_booked','qr_code_image').order_by('-date_booked')
            for ticket in ticket_get :
                if ticket['qr_code_image']:
                    ticket['qr_code_image']=settings.HOST_ADDRESS+settings.MEDIA_URL  + ticket['qr_code_image']
                ticket["fk_user_id"] = UserDetails.objects.filter(id=ticket["fk_user_id"]).values(
                "id", "username")
                ticket["fk_program"] = Program_model.objects.filter(id=ticket["fk_program"]).values(
            "id", "program_name", "venue", "date",'start_time','end_time','address','contact_no','food','agenda','inauguration_name','total_seats',"available_seats",'price',"fk_admin_id__id",'fk_admin_id__username'
        )
            return Response(ticket_get)
        else :
            return Response(status.HTTP_401_UNAUTHORIZED)
        
@api_view(('GET',))
def get_ticket_booking_completed_id(req):
    if req.method == 'GET' :
        if req.user.is_authenticated :
            ticket_get=TicketBooking.objects.filter(fk_user_id__id=req.user.id,payment_completed=True).values('id','fk_user_id','fk_program','no_of_seats','total_amount','payment_status','date_booked','qr_code_image').order_by('-date_booked')
            for ticket in ticket_get :
                 ticket['qr_code_image']=settings.HOST_ADDRESS+settings.MEDIA_URL  + ticket['qr_code_image']
                 ticket["fk_user_id"] = UserDetails.objects.filter(id=ticket["fk_user_id"]).values(
                "id", "username")
                 ticket["fk_program"] = Program_model.objects.filter(id=ticket["fk_program"]).values(
            "id", "program_name", "venue", "date",'start_time','end_time','address','contact_no','food','agenda','inauguration_name','total_seats',"available_seats",'price',"fk_admin_id__id","fk_admin_id__username"
        )
    
            return Response(ticket_get)
        else :
            return Response(status.HTTP_401_UNAUTHORIZED)

@api_view(('GET',))
def program_based_create_by(req):
    if req.method == 'GET':
        if req.user.is_authenticated :
            user=admin_model.objects.get(user_id__id=req.user.id)
            program_filter_data=Program_model.objects.filter(fk_admin_id__id=user.id)
            serializer=Program_get_Serializer(program_filter_data,many=True)
            return Response(serializer.data)
        else :
            return Response(status.HTTP_401_UNAUTHORIZED)
    else :
        pass

@api_view(('GET',))
def program_based_state(req):
    if req.method == 'GET':
        if req.user.is_authenticated :
            program_filter_data=Program_model.objects.filter(
                fk_state__id=UserDetails.objects.get(id=req.user.id).state.id
            ).order_by('-date')
            serializer=Program_get_Serializer(program_filter_data,many=True)
            return Response(serializer.data)
        else :
            return Response(status.HTTP_401_UNAUTHORIZED)
    else :
        pass
    
@api_view(('GET',))
def program_based_district(req):
    if req.method == 'GET':
        if req.user.is_authenticated :
            program_filter_data=Program_model.objects.filter(
                fk_district__id=UserDetails.objects.get(id=req.user.id).district.id
            ).order_by('-date')
            serializer=Program_get_Serializer(program_filter_data,many=True)
            return Response(serializer.data)
        else :
            return Response(status.HTTP_401_UNAUTHORIZED)
    else :
        pass
    
@api_view(('GET',))
def program_based_panchayath(req):
    if req.method == 'GET':
        if req.user.is_authenticated :
            if UserDetails.objects.get(id=req.user.id).panchayath.id :
                try :
                    program_filter_data=Program_model.objects.filter(
                        fk_panchayath__id=UserDetails.objects.get(id=req.user.id).panchayath.id
                    ).order_by('-date')
                    serializer=Program_get_Serializer(program_filter_data,many=True)
                    return Response(serializer.data)
                except Exception as e :
                    return Response({'result':[]})
            else :
                return Response(status=status.HTTP_400_BAD_REQUEST)
        else :
            return Response(status.HTTP_401_UNAUTHORIZED)
    else :
        pass

@api_view(('GET',))
def program_based_ward(req):
    if req.method == 'GET':
        if req.user.is_authenticated :
            if UserDetails.objects.get(id=req.user.id).panchayath.id :
                try :
                    program_filter_data=Program_model.objects.filter(
                        fk_ward__id=UserDetails.objects.get(id=req.user.id).ward.id
                    ).order_by('-date')
                    serializer=Program_get_Serializer(program_filter_data,many=True)
                    return Response(serializer.data)
                except Exception as e :
                    return Response({'result':[]})
            else :
                return Response(status=status.HTTP_400_BAD_REQUEST)
        else :
            return Response(status.HTTP_401_UNAUTHORIZED)
    else :
        pass
class Program_all_API(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """

    serializer_class = Program_Serializer
    queryset = Program_model.objects.all()
    http_method_names = ["get", "post", "put", "delete"]
    permission_classes = [IsAuthenticated]
    


class Programs_count(APIView):
    def get(self,request):
        count=Program_model.objects.count()
        return Response({'count':count})