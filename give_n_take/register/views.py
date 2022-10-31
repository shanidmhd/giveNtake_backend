from django.conf import settings
from django.http import Http404, JsonResponse
from django.shortcuts import get_object_or_404, render
from news.models import MeetingAttendance, MeetingHighligths, MeetingPhoto, News
from news.serializers import MeetingHighligthsSerializer, NewsSerializer
from register.models import admin_model
from rest_framework.parsers import MultiPartParser, FormParser
from register.serializers import Registration_Serializer, login_serializers, register_ser, register_serializers
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth.hashers import make_password, check_password
from math import radians, sin, cos, acos
from operator import itemgetter
import random
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
import string
from rest_framework import generics
from user_details.models import StaffRole, UserDetails
from rest_framework.permissions import IsAdminUser, IsAuthenticated
from user_details.serializers import RegistrationSerializer, StaffRoleSerializer, register_admin_serializer
from .permission import IsMeeting, IsNews, IsSuperUser, Iscommittee_admin, Iscommitteeadmin, Isstaffrole, Isusers, roles_users
from rest_framework import viewsets
from user_details.serializers import register_admins_serializer
from rest_framework import status
from django_filters.rest_framework import DjangoFilterBackend
# Create your views here.


class register_api(generics.GenericAPIView):
    serializer_class = register_serializers
 
    def post(self, request):
        #(request.data)
        serializer = register_serializers(data=request.data)
        if serializer.is_valid():
            encryptedpassword = make_password(request.data['password'])
            serializer.save(password=encryptedpassword)
            return Response(
                {
                    "success": request.data["username"]
                    + " are successfully registered "
                },
                status=status.HTTP_201_CREATED,
            )

        return Response(
            {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
        )

class list_api(APIView):
    serializer_class = register_ser
    permission_classes = [IsAuthenticated,Iscommittee_admin]
    def get(self, request):
        adm=admin_model.objects.all()
        serializer = register_ser(adm,many=True)
        return Response(serializer.data)
         
        
class login_api(APIView):
    serializer_class = login_serializers
    @swagger_auto_schema(
        operation_description="Login",
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            required=["username", "password"],
            properties={
                "username": openapi.Schema(
                    type=openapi.TYPE_STRING, description="title: Username"
                ),
                "password": openapi.Schema(
                    type=openapi.TYPE_STRING,
                    description="title:Password",
                ),
            },
        )
    )
    def post(self, request):
        us = admin_model.objects.filter(username=request.data["username"]).first()
        serializer=register_ser(us)
        datas=serializer.data
        if us :
            us_password = us.password
            users = check_password(request.data["password"], us_password)
            if users == True:
                # select 2 digits at random
                digits = random.choices(string.digits, k=15)

                # select 9 uppercase letters at random
                letters = random.choices(string.ascii_uppercase, k=15)

                # shuffle both letters + digits
                sample = random.sample(digits + letters, 25)

                
                us.login_token = sample
                us.save()
                return Response(
                    {"success": "Login successfull", "token": sample,'response':datas},
                    status=status.HTTP_200_OK,
                )

            else:
                return Response(
                    {
                        "error": "OOPS !!! Your password is wrong ! Try again !!"
                    },
                    status=status.HTTP_400_BAD_REQUEST,
                )
        
        return Response({'error':'Account with this username doesnot found'},status=status.HTTP_400_BAD_REQUEST)
    
    

class admin_register(generics.GenericAPIView):
    
    serializer_class = register_admin_serializer
    permission_classes = [IsAuthenticated]
    def post(self,request):
            serializer= register_admin_serializer(data=request.data)
            if serializer.is_valid ():
               
                reg_ser =register_serializers(data=request.data)
                if reg_ser.is_valid():
                    reg=serializer.save(is_admin=True)        
                    reg.set_password(request.data['password'])
                    reg.save()
                    reg_ser.save(user_id=UserDetails.objects.get(id=reg.id),created_by=request.user.id)
                    
                else :
                    return Response(reg_ser.errors)
                
                return Response({'success': request.data['username'] + " succesfully registerd "})
           
            return Response(serializer.errors)


class NewsViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    
    # parser_classes = [MultiPartParser, FormParser]
   
    queryset = News.objects.all()
    serializer_class = NewsSerializer
    permission_classes =[IsAuthenticated,IsNews]
    http_method_names = ['post','get','delete','put']

    

        
    

    def retrieve(self, request,*args, **kargs):
        news_id = kargs.get('pk')
        if news_id:
            try:
                appts = News.objects.get(id=int(news_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            try:
                appts = News.objects.all()
                serializer = self.get_serializer(appts, many=True)
                return Response(serializer.data)
            except:
                return Response({'message': 'No data found'})

    def create(self, request, *args, **kwargs): 
        user_details=UserDetails.objects.get(id=request.user.id)
        data={
       "title" : request.data.get('title',None),   
       "description": request.data.get('description',None), 
       "meeting_link" : request.data.get('meeting_link',None), 
       "news_type": request.data.get('news_type',None), 
       "committe_type"  : request.data.get('committe_type',None), 
       "news_image": request.FILES.get('news_image', None), 
       "date_added": request.data.get('date_added',None), 
       "date_expired": request.data.get('date_expired',None), 
       "region": user_details.district.id, 
       "status": request.data.get('status',None), 
       "created_by": request.user.id
        }
        _serializer = self.serializer_class(data=data)
        if _serializer.is_valid():
            _serializer.save()
            return Response(data=_serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(data=_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
class roles_type_api(generics.GenericAPIView):
    serializer_class = StaffRoleSerializer
    permission_classes = [IsAuthenticated,Isstaffrole]
    def post(self,request):
        roles_users(request)
        serializer=StaffRoleSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'success':'success'})
        
class MeetingHighligthsViewSet(viewsets.ModelViewSet):
    queryset = MeetingHighligths.objects.all()
    serializer_class = MeetingHighligthsSerializer
    permission_classes =[IsAuthenticated,IsMeeting]
    http_method_names = ['post','get','delete','put']

    def create(self, request, *args, **kwargs):
        attendance = request.FILES.getlist('attendance', None)
        photo = request.FILES.getlist('photo', None)
        data = {
            "meeting_minutes": request.POST.get('meeting_minutes', None),
            "description": request.POST.get('description', None),
            "meeting_attendance": request.POST.get('meeting_attendance', None),
            'photo' : request.FILES.getlist('photo', None),
            "created_by": request.user.id
            }
        _serializer = self.serializer_class(data=data, context={'attendance': attendance,'photo':photo})
        if _serializer.is_valid():
            _serializer.save()
           
            return Response(data=_serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(data=_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    # @swagger_auto_schema(
    #     operation_description="meeting minutes list",
    #     manual_parameters=[openapi.Parameter(
    #         'district_id', 
    #         openapi.IN_QUERY, 
    #         type=openapi.TYPE_STRING
    #         )],
    # )

    def list(self, request):
        #(request.user.is_superuser)
        appts = MeetingHighligths.objects.values()
        for meeting_highligths in appts:
            lst_attendance = []
            lst_photo = []
            attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
            for att in attendance:
                att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                lst_attendance.append(att)
            photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
            for att in photo:
                att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                lst_photo.append(att)
            meeting_highligths['attendance']=lst_attendance
            meeting_highligths['photo']=lst_photo
        return Response({'results':appts})
    
    def retrieve(self, request,*args, **kargs):
        meeting_highligths_id = kargs.get('pk')
        if meeting_highligths_id:
            try:
                lst_attendance = []
                lst_photo = []
                meeting_highligths = MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).values().first()
                attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
                for att in attendance:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_attendance.append(att)
                photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
                for att in photo:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_photo.append(att)
                meeting_highligths['attendance']=lst_attendance
                meeting_highligths['photo']=lst_photo
                return Response({'results':meeting_highligths})
            except:
                return Response({'message': 'No data found'})
            
        else:
            appts = MeetingHighligths.objects.values()
            for meeting_highligths in appts:
                lst_attendance = []
                lst_photo = []
                attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
                for att in attendance:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_attendance.append(att)
                photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
                for att in photo:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_photo.append(att)
                meeting_highligths['attendance']=lst_attendance
                meeting_highligths['photo']=lst_photo
            return Response({'results':appts})

    def update(self, request,*args, **kargs):
        meeting_minutes = request.data.get('meeting_minutes')
        description = request.data.get('description')
        meeting_attendance = request.data.get('meeting_attendance')
        attendances = request.data.get('attendance')
        photos = request.data.get('photo')
        meeting_highligths_id = kargs.get('pk')
        if meeting_highligths_id:
            try:
                meeting_highligths = MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).values().first()
                if not meeting_minutes:
                    meeting_minutes =  meeting_highligths['meeting_minutes']
                if not description:
                    description = meeting_highligths['description']
                if not meeting_attendance:
                    meeting_attendance = meeting_attendance['meeting_attendance']
                MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).update(meeting_minutes=meeting_minutes,description=description,meeting_attendance=meeting_attendance)
                if attendances:
                    MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).delete()
                    for attendance in attendances:
                        MeetingAttendance.objects.create(meeting_highligths_id=meeting_highligths['id'],attendance=attendance)
                if photos:
                    MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).delete()
                    for photo in photos:
                        MeetingPhoto.objects.create(meeting_highligths_id=meeting_highligths['id'],photo=photo)
                meeting_highligths = MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).values().first()
                lst_attendance = []
                lst_photo = []
                attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
                for att in attendance:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_attendance.append(att)
                photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
                for att in photo:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_photo.append(att)
                meeting_highligths['attendance']=lst_attendance
                meeting_highligths['photo']=lst_photo
                return Response({'results':meeting_highligths})
            except:
                return Response({'message': 'No data found'})

class AdminUserViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    # parser_classes = [MultiPartParser, FormParser]
    serializer_class = register_serializers
    queryset = admin_model.objects.all()
    http_method_names = ['get', 'post', 'delete']
    permission_classes = [IsAuthenticated,Iscommittee_admin]
    def retrieve(self, request,*args, **kargs):
        user_id = kargs.get('pk')
        if user_id:
            try:
                appts = admin_model.objects.get(id=int(user_id))
                serializer = register_ser(appts, many=False)
                sdata=serializer.data
                sdata['user_image'] =   ( "http"
                    + ":"
                    + "//" 
                    + settings.IMAGE_URL
                    # + settings.IMAGE_PATH
                
                    + sdata["user_image"]
                )
                return Response({'results':sdata})
            except:
                return Response({'message': 'No data found'})
            
    def list(self,request):
        appts = admin_model.objects.all()
        serializer = Registration_Serializer(appts, many=True)
        for s in serializer.data :
            s['user_image']=      ( "http"
                    + ":"
                    + "//" 
                    + settings.IMAGE_URL
                    # + settings.IMAGE_PATH
                
                    + s["user_image"]
                )
            # s['user_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + s['user_image']
        return Response({'results':serializer.data})
    
    
class update_admin(APIView):
        def get_object(self, id):
            admin_id = admin_model.objects.get(id=id)
            return admin_id
        def get(self, request, id, format=None):
            snippet = self.get_object(id)
            serializer = Registration_Serializer(snippet)
            return Response(serializer.data)
        def patch(self, request, id, format=None):
            snippet = self.get_object(id)
            serializer = register_serializers(snippet, data=request.data,partial=True)
          
        
            if serializer.is_valid():
                serializer.save()
                print(serializer.data,'ser')
                user_id_r=int(serializer.data['user_id'])
                us=UserDetails.objects.filter(id=user_id_r).first()
                reg_ser=register_admins_serializer(us, data=request.data,partial=True)#
                #(request.data,'rewqqqqq')
                if reg_ser.is_valid():
                    #(request.data,'rrrr')
                    #(reg_ser.errors)
                    reg_ser.save()
                    return Response("success")
                else :
                    #(reg_ser.errors,'kkkk')
                    return Response(serializer.data)
            else :
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # def update(self, request,*args, **kargs):
    #     meeting_minutes = request.data.get('meeting_minutes')
    #     description = request.data.get('description')
    #     meeting_attendance = request.data.get('meeting_attendance')
    #     attendances = request.data.get('attendance')
    #     photos = request.data.get('photo')
    #     meeting_highligths_id = kargs.get('pk')
    #     if meeting_highligths_id:
    #         try:
    #             meeting_highligths = MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).values().first()
    #             if not meeting_minutes:
    #                 meeting_minutes =  meeting_highligths['meeting_minutes']
    #             if not description:
    #                 description = meeting_highligths['description']
    #             if not meeting_attendance:
    #                 meeting_attendance = meeting_attendance['meeting_attendance']
    #             MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).update(meeting_minutes=meeting_minutes,description=description,meeting_attendance=meeting_attendance)
    #             if attendances:
    #                 MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).delete()
    #                 for attendance in attendances:
    #                     MeetingAttendance.objects.create(meeting_highligths_id=meeting_highligths['id'],attendance=attendance)
    #             if photos:
    #                 MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).delete()
    #                 for photo in photos:
    #                     MeetingPhoto.objects.create(meeting_highligths_id=meeting_highligths['id'],photo=photo)
    #             meeting_highligths = MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).values().first()
    #             lst_attendance = []
    #             lst_photo = []
    #             attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
    #             for att in attendance:
    #                 att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
    #                 lst_attendance.append(att)
    #             photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
    #             for att in photo:
    #                 att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
    #                 lst_photo.append(att)
    #             meeting_highligths['attendance']=lst_attendance
    #             meeting_highligths['photo']=lst_photo
    #             return Response({'results':meeting_highligths})
    #         except:
    #             return Response({'message': 'No data found'})

class UserRegistrationViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    # parser_classes = [MultiPartParser, FormParser]
    serializer_class = RegistrationSerializer
    queryset = UserDetails.objects.all()
    http_method_names = [ 'post','get','delete']
    permission_classes = [IsAuthenticated,Isusers]
    # def retrieve(self, request,*args, **kargs):
    #     user_id = kargs.get('pk')
    #     if user_id:
    #         try:
    #             appts = UserDetails.objects.get(id=int(user_id))
    #             serializer = Registration_Serializer(appts, many=False)
    #             return Response({'results':serializer.data})
    #         except:
    #             return Response({'message': 'No data found'})
    # def list (self,request):
    #         appts = UserDetails.objects.all()
    #         serializer = Registration_Serializer(appts, many=True)
    #         data=serializer.data
    #         for simage in data :
                
    #             simage['user_image']=      ( "http"
    #                 + ":"
    #                 + "//" 
    #                 + settings.IMAGE_URL
    #                 # + settings.IMAGE_PATH
                
    #                 + simage["user_image"]
    #             )
    #         return Response({'results':serializer.data})
            # else :
           
        
class StaffRoleViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = StaffRoleSerializer
    queryset = StaffRole.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']
    permission_classes = [IsAuthenticated,Isstaffrole]

    def list(self, request):
        appts = StaffRole.objects.values()
        for ins in appts:
            try:
                lst_sidebar = []
                if ins['json_sidebar']:
                    sidebar = ins['json_sidebar'][1:-1].split(',')
                    for side in sidebar:
                        lst_sidebar.append(side[1:-1])
                ins['json_sidebar'] = lst_sidebar
            except:
                pass
        serializer = self.get_serializer(appts, many=True)
        return Response({'results':serializer.data})

    def retrieve(self, request,*args, **kargs):
        staff_role_id = kargs.get('pk')
        if staff_role_id:
            try:
                appts = StaffRole.objects.filter(id=int(staff_role_id)).values().first()
                try:
                    lst_sidebar = []
                    if appts['json_sidebar']:
                        sidebar = appts['json_sidebar'][1:-1].split(',')
                        for side in sidebar:
                            lst_sidebar.append(side[1:-1])
                    appts['json_sidebar'] = lst_sidebar
                except:
                    pass
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            appts = StaffRole.objects.values()
            for ins in appts:
                try:
                    lst_sidebar = []
                    if ins['json_sidebar']:
                        sidebar = ins['json_sidebar'][1:-1].split(',')
                        for side in sidebar:
                            lst_sidebar.append(side[1:-1])
                    ins['json_sidebar'] = lst_sidebar
                except:
                    pass
            serializer = self.get_serializer(appts, many=True)
            return Response({'results':serializer.data})
        

class get_news_by_user(APIView): 
    queryset = News.objects.all()
    permission_classes = [IsAuthenticated,IsNews]
    @swagger_auto_schema(
        operation_description="User",
        manual_parameters=[openapi.Parameter(
            'username', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def get(self,request):
        try:
            news =News.objects.filter(created_by_id=request.user.id).values()
            for item in news:
                item['news_image']=settings.HOST_ADDRESS + settings.MEDIA_URL +item['news_image']
            return Response({'results':news})
        except Exception as e:
            return Response({'results':"Failed to get user news"})
        

class get_meeting_by_user(APIView): 
    queryset = News.objects.all()
    permission_classes = [IsAuthenticated,IsMeeting]
    @swagger_auto_schema(
        operation_description="User",
        manual_parameters=[openapi.Parameter(
            'username', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def get(self,request):
        try:
            appts = MeetingHighligths.objects.filter(created_by_id=request.user.id).values()
            for meeting_highligths in appts:
                lst_attendance = []
                lst_photo = []
                attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
                for att in attendance:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_attendance.append(att)
                photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
                for att in photo:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_photo.append(att)
                meeting_highligths['attendance']=lst_attendance
                meeting_highligths['photo']=lst_photo
            return Response({'results':appts})
        except Exception as e:
            return Response({'results':"Failed to get user meetings"})
        

class get_committee_admin_created(APIView): 
    queryset = admin_model.objects.all()
    serializer_class=Registration_Serializer
    permission_classes = [IsAuthenticated,Iscommitteeadmin]
    @swagger_auto_schema(
        operation_description="User",
        manual_parameters=[openapi.Parameter(
            'username', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def get(self,request):
        try:
            admin_ =admin_model.objects.filter(created_by=request.user.id)
            admin_list=Registration_Serializer(admin_,many=True)
            for item in admin_list.data:
                item['user_image']=      ( "http"
                    + ":"
                    + "//" 
                    + settings.IMAGE_URL
                    # + settings.IMAGE_PATH
                
                    + item["user_image"]
                )
                # item['user_image']=settings.HOST_ADDRESS + settings.MEDIA_URL +item['user_image']
            return Response({'results':admin_list.data},status=status.HTTP_200_OK)
        except Exception as e:
            return Response({'results':"Failed to get admin  list"},status=status.HTTP_400_BAD_REQUEST)
# class UserViewSet(viewsets.ModelViewSet):
#     """
#     A viewset for viewing and editing user instances.
#     """
#     serializer_class = UserSerializer
#     queryset = User.objects.all()
                
class admin_filter_list(generics.ListAPIView):
    queryset = admin_model.objects.all()
    serializer_class = Registration_Serializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['state', 'district','committee_type']