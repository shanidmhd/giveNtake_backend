import code
import json
from optparse import Values
import sys
import requests
from django.db.models import Q
from django.shortcuts import render
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework import viewsets
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework import status
from .models import *
from datetime import datetime
from .serializers import *
from django.conf import settings
from register.models import admin_model
from django.shortcuts import get_object_or_404

from user_details.models import State, District, Panchayath, Ward


class NewsTypeViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = NewsTypeSerializer
    queryset = NewsType.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    def retrieve(self, request,*args, **kargs):
        news_type_id = kargs.get('pk')
        if news_type_id:
            try:
                appts = NewsType.objects.get(id=int(news_type_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
            
        else:
            appts = NewsType.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response({'results':serializer.data})

class NewsViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    parser_classes = [MultiPartParser, FormParser]
    serializer_class = NewsSerializer
    queryset = News.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']
    permission_classes=[IsAuthenticated]

    def retrieve(self, request, pk=None):
        queryset = News.objects.all()
        user = get_object_or_404(queryset, pk=pk)
        serializer = NewsSerializer(user)
        # serializer.data['news_image']=settings.HOST_ADDRESS+settings.MEDIA_URL+serializer.data['news_image']
        return Response(serializer.data)
    
    def list(self,request):
       
      
        district_news = News.objects.filter(district_region=(UserDetails.objects.get(id=request.user.id).district)).order_by('date_added').values('id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified','district_region__id','district_region__name')
        for p in district_news :
            if p['news_image'] is not None :
                p['news_image']=settings.HOST_ADDRESS+settings.MEDIA_URL+p['news_image']
        state_news = News.objects.filter(state_region=(UserDetails.objects.get(id=request.user.id).state)).order_by('date_added').values('id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified','state_region__id','state_region__name')
        for p in state_news :
            if p['news_image'] is not None :
                p['news_image']=settings.HOST_ADDRESS+settings.MEDIA_URL+p['news_image']
        panchayath_news = News.objects.filter(panchayath_region=(UserDetails.objects.get(id=request.user.id).panchayath)).order_by('date_added').values('id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified','panchayath_region__id','panchayath_region__name')
        
        for p in panchayath_news :
            if p['news_image'] is not None :
                p['news_image']=settings.HOST_ADDRESS+settings.MEDIA_URL+p['news_image']
                
        all_news = News.objects.filter(show_all=True).order_by('date_added').values('id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified')
        for p in all_news :
            if p['news_image'] is not None :
                p['news_image']=settings.HOST_ADDRESS+settings.MEDIA_URL+p['news_image']# serializer = self.get_serializer(appts, many=True)
        response={
        'district' : district_news,
        'panchayath' : panchayath_news,
        'state' : state_news,
        'all':all_news
        }
    
            
        return Response({'results':response})
        

    def create(self, request, *args, **kwargs): 
            serializer = self.serializer_class(data=request.data)
            admin = (
                 UserDetails.objects.filter(id=request.user.id)
                .values("committee_type__name", "state", "district","panchayath","ward")
                .first()
            )
            # fk_admin_id = admin_model.objects.get(user_id__id=request.user.id)

            # Checking the committee type of the admin and then it is saving the program accordingly.
            if request.user.is_superuser:

                if int(request.data['committe_type'])==4:
                    if serializer.is_valid():
                        serializer.save(
                            state_region=State.objects.get(id=request.data['state_region']),created_by=UserDetails.objects.get(id=request.user.id)
                        )
                        return Response(
                            {"success": "News succesfully added"},
                            status=status.HTTP_201_CREATED,
                        )

                    return Response(
                        {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                    )
                elif int(request.data['committe_type'])==5:
                    print('dist')
                    if serializer.is_valid():
                        serializer.save(
                            district_region=District.objects.get(id=request.data["district_region"]),created_by=UserDetails.objects.get(id=request.user.id)
                        )
                        return Response(
                            {"success": "News succesfully added"},
                            status=status.HTTP_201_CREATED,
                        )

                    return Response(
                        {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                    )
                elif int(request.data['committe_type'])==6:
                    if serializer.is_valid():
                        serializer.save(
                            panchayath_region=Panchayath.objects.get(id=request.data["panchayath_region"]),created_by=UserDetails.objects.get(id=request.user.id)
                        )
                        return Response(
                            {"success": "News succesfully added"},
                            status=status.HTTP_201_CREATED,
                        )

                    return Response(
                        {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                    )
                elif int(request.data['committe_type'])==7:
                    if serializer.is_valid():
                        serializer.save(
                            ward_region=Ward.objects.get(id=request.data["ward_region"]),created_by=UserDetails.objects.get(id=request.user.id)
                        )
                        return Response(
                            {"success": "News succesfully added"},
                            status=status.HTTP_201_CREATED,
                        )

                    return Response(
                        {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                    )
                else :
                    if serializer.is_valid():
                        serializer.save(
                        created_by=UserDetails.objects.get(id=request.user.id), show_all=True
                        )
                        return Response(
                            {"success": "News succesfully added"},
                            status=status.HTTP_201_CREATED,
                        )

                    return Response(
                        {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                    )
            elif admin["committee_type__name"] == "State Committee":
            
                if serializer.is_valid():
                    serializer.save(
                        state_region=State.objects.get(id=admin["state"]),created_by=UserDetails.objects.get(id=request.user.id)
                    )
                    return Response(
                        {"success": "News succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
            elif admin["committee_type__name"] == "District Committee":
            
                if serializer.is_valid():
                    serializer.save(
                        district_region=District.objects.get(id=admin["district"]),created_by=UserDetails.objects.get(id=request.user.id)
                    )
                    return Response(
                        {"success": "News succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
                
            elif admin["committee_type__name"] == "Panchayath Committee":
                if serializer.is_valid():
                    serializer.save(
                        panchayath_region=Panchayath.objects.get(id=admin["panchayath"]),created_by=UserDetails.objects.get(id=request.user.id)
                    )
                    return Response(
                        {"success": "News succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
            elif admin["committee_type__name"] == "Ward Committee":
            
                if serializer.is_valid():
                    serializer.save(
                        ward_region=Ward.objects.get(id=admin["ward"]),created_by=UserDetails.objects.get(id=request.user.id)
                    )
                    return Response(
                        {"success": "News succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
            
            else:
            
                if serializer.is_valid():
                    serializer.save(
                        show_all=True,created_by=UserDetails.objects.get(id=request.user.id)
                    )
                    return Response(
                        {"success": "Program succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
      
class get_news_by_user(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
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
            news =News.objects.filter(created_by_id=request.user.id).order_by('date_added').values()
            for item in news:
                item['meeting_link'] = item['meeting_link'] \
                    if item['meeting_link'] not in ['undefined', None] else "N/A"
                item['news_image']=settings.HOST_ADDRESS + settings.MEDIA_URL +item['news_image']
            return Response({'results':news})
        except Exception as e:
            return Response({'results':[]})

class get_news_by_user_region_district(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
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
            user_details=UserDetails.objects.get(id=request.user.id)
            news =News.objects.filter(district_region=user_details.district.id).order_by('date_added').values()
            for item in news:
                item['meeting_link'] = item['meeting_link'] \
                    if item['meeting_link'] not in ['undefined', None] else "N/A"
                item['news_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + item['news_image']
            return Response({'results': news})
        except Exception as e:
            return Response({'results':[]})
        
        
class get_news_by_user_region_state(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
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
            user_details=UserDetails.objects.get(id=request.user.id)
            news =News.objects.filter(state_region=user_details.state.id).order_by('date_added').values()
            for item in news:
                item['meeting_link'] = item['meeting_link'] \
                    if item['meeting_link'] not in ['undefined', None] else "N/A"
                item['news_image']=settings.HOST_ADDRESS + settings.MEDIA_URL +item['news_image']
            return Response({'results':news})
        except Exception as e:
            return Response({'results':[]})
        
class get_news_by_user_region_panchayath(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
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
            user_details=UserDetails.objects.get(id=request.user.id)
            news =News.objects.filter(panchayath_region=user_details.panchayath.id).order_by('date_added').values()
            for item in news:
                item['meeting_link'] = item['meeting_link'] \
                    if item['meeting_link'] not in ['undefined', None] else "N/A"
                item['news_image']=settings.HOST_ADDRESS + settings.MEDIA_URL +item['news_image']
            return Response({'results':news})
        except Exception as e:
            return Response({'results':[]})
        
        
class get_news_by_user_region_ward(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
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
            user_details=UserDetails.objects.get(id=request.user.id)
            news =News.objects.filter(ward_region=user_details.ward.id).order_by('date_added').values()
            for item in news:
                item['meeting_link'] = item['meeting_link'] \
                    if item['meeting_link'] not in ['undefined', None] else "N/A"
                item['news_image']=settings.HOST_ADDRESS + settings.MEDIA_URL +item['news_image']
            return Response({'results':news})
        except Exception as e:
            return Response({'results':[]})

class get_news_by_user_region_all(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
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
            user_details=UserDetails.objects.get(id=request.user.id)
            news =News.objects.filter(show_all=True).order_by('date_added').values()
            for item in news:
                item['meeting_link'] = item['meeting_link'] \
                    if item['meeting_link'] not in ['undefined', None] else "N/A"
                item['news_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + item['news_image']
            return Response({'results':news})
        except Exception as e:
            return Response({'results':[]})     


class MeetingHighligthsViewSet(viewsets.ModelViewSet):
    queryset = MeetingHighligths.objects.all()
    serializer_class = MeetingHighligthsSerializer
    http_method_names = ['post','get','delete','put']

    def create(self, request, *args, **kwargs):
        attendance = request.FILES.getlist('attendance', None)
        photo = request.FILES.getlist('photo', None)
        data = {
            "meeting_minutes": request.POST.get('meeting_minutes', None),
            "description": request.POST.get('description', None),
            "meeting_attendance": request.POST.get('meeting_attendance', None),
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
        appts =MeetingHighligths.objects.values('id','meeting_minutes','description','meeting_attendance','district_region','district_region__name','ward_region','ward_region__name','state_region__id','state_region__name','panchayath_region','created_by')
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
            appts =MeetingHighligths.objects.values('id','meeting_minutes','description','meeting_attendance','district_region','district_region__name','ward_region','ward_region__name','state_region__id','state_region__name','panchayath_region','created_by')
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
                self.update_region(meeting_highligths_id)
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
                    # for attendance in attendances:
                    MeetingAttendance.objects.create(meeting_highligths_id=meeting_highligths['id'],attendance=attendances)
                if photos:
                    MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).delete()
                    # for photo in photos:
                    MeetingPhoto.objects.create(meeting_highligths_id=meeting_highligths['id'],photo=photos)
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

    def update_region(self, meeting_highligths_id):
        try:
            committe_type = int(self.request.data.get('committe_type'))
        except TypeError:
            committe_type = None
        if self.request.user.is_superuser:
            instance = MeetingHighligths.objects.filter(id=meeting_highligths_id)
            region_data = {
                'state_region': None,
                'district_region': None,
                'panchayath_region': None,
                'ward_region': None,
                'committe_type_id': committe_type
            }
            if committe_type == 4:
                region_data['state_region'] = State.objects.get(id=self.request.data.get('state_region'))
            elif committe_type == 5:
                print('dist')
                region_data['district_region'] = District.objects.get(id=self.request.data.get('district_region'))
            elif committe_type == 6:
                region_data['panchayath_region'] = Panchayath.objects.get(id=self.request.data.get('panchayath_region'))
            elif committe_type == 7:
                region_data['ward_region'] = Ward.objects.get(id=self.request.data.get('ward_region'))
            else:
                pass
            instance.update(**region_data)




class get_meeting_by_user(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
    @swagger_auto_schema(
        operation_description="User",
        manual_parameters=[openapi.Parameter(
            'username', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def get(self,request):
        # admin = admin_model.objects.filter(
        #     user_id__id=request.user.id
        # ).values("committee_type_id", 'state_id', 'district_id', 'panchayath_id', 'ward_id')[0]
        # filter_id_list = []
        # if admin['committee_type_id'] == 4:
        #     district_id_list = District.objects.filter(state_id=admin['state_id']).values_list('id', flat=True)
        #     filter_id_list.extend(
        #         list(
        #             admin_model.objects.filter(
        #                 district_id__in=district_id_list, committee_type_id=4
        #             ).values_list("user_id_id", flat=True)
        #         )
        #     )
        # elif admin['committee_type_id'] == 5:
        #     panchayath_id_list = Panchayath.objects.filter(district_id=admin['district_id']).values_list(
        #         'id', flat=True
        #     )
        #     filter_id_list.extend(
        #         list(
        #             admin_model.objects.filter(
        #                 panchayath_id__in=panchayath_id_list, committee_type_id=5
        #             ).values_list("user_id_id", flat=True)
        #         )
        #     )
        # elif admin['committee_type_id'] == 6:
        #     ward_id_list = Ward.objects.filter(panchayath_id=admin['panchayath_id']).values_list('id', flat=True)
        #     filter_id_list.extend(
        #         list(
        #             admin_model.objects.filter(
        #                 ward_id=ward_id_list, committee_type_id=6
        #             ).values_list("user_id_id", flat=True)
        #         )
        #     )
        # elif admin['committee_type_id'] == 3:
        #     state_id_list = State.objects.values_list('id', flat=True)
        #     filter_id_list.extend(
        #         list(
        #             admin_model.objects.filter(
        #                 state_id__in=state_id_list, committee_type_id=3
        #             ).values_list("user_id_id", flat=True)
        #         )
        #     )
        # else:
        #     pass

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
            return Response({'results': "Failed to get user meetings"})


class News_all_ViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    parser_classes = [MultiPartParser, FormParser]
    serializer_class = NewsSerializer
    queryset = News.objects.all()
    http_method_names = ['get']
    
    
    def list(self,request):
        datas=News.objects.all()
        serializer=NewsSerializer(datas,many=True)
        for s in serializer.data :
            s['district_region']=District.objects.filter(id=  s['district_region']).values('id','name','state__name')
            s['state_region']=State.objects.filter(id=  s['state_region']).values('id','name')
            s['panchayath_region']=Panchayath.objects.filter(id=  s['panchayath_region']).values('id','name','district__name')
            # if s['news_image'] is not None :
            #     s['news_image']=settings.HOST_ADDRESS +s['news_image']
        return Response({'results':serializer.data})
    
    
    
class News_count(APIView):
    def get(self,request):
        count=News.objects.count()
        return Response({'count':count})

class Meeting_count(APIView):
    def get(self,request):
        count=MeetingHighligths.objects.count()
        return Response({'count':count})
    