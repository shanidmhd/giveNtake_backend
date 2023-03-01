import code
import json
from mimetypes import common_types
from opcode import stack_effect
from optparse import Values
import pdb
import sys
from turtle import pd
import requests
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
from register.serializers import Registration_Serializer

class UserLoginView(APIView):
    """
    Class for user login(active users)
    """
    permission_classes = [AllowAny]
    serializer_class = UserLoginSerializer
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
        ),
        responses={
            status.HTTP_200_OK: openapi.Schema(
                type=openapi.TYPE_OBJECT,
                properties={
                    "data": openapi.Schema(
                        type=openapi.TYPE_OBJECT,
                        properties={
                            "access_token": openapi.Schema(
                                type=openapi.TYPE_STRING,
                                description="Access token",
                            ),
                            "refresh_token": openapi.Schema(
                                type=openapi.TYPE_STRING,
                                description="Refresh token",
                            ),
                        },
                    ),
                    "message": openapi.Schema(
                        type=openapi.TYPE_STRING,
                        description="Login Successfull",
                    ),
                },
            ),
            status.HTTP_404_NOT_FOUND: openapi.Schema(
                type=openapi.TYPE_OBJECT,
                properties={
                    "message": openapi.Schema(
                        type=openapi.TYPE_STRING, description="Page not found."
                    )
                },
            ),
        },
    )
    def post(self, request, *args, **kwargs):
        str_username= request.data['username']
        str_password=request.data['password']
        try:
            is_admin = request.data['is_admin']
        except:
            is_admin = False
        user = authenticate(username=request.data['username'], password=request.data['password'])
        if user:
            serializer = self.serializer_class(data=request.data)
            serializer.is_valid(raise_exception=True)
            if is_admin:
                try:
                    if serializer.data['committee_type_id']:
                        return Response({'message': 'User Login Successfully', 'data':serializer.data}, status=status.HTTP_200_OK)
                except:
                    return Response({'message': 'Access Denied'})
            else:
                return Response({'message': 'User Login Successfully', 'data':serializer.data}, status=status.HTTP_200_OK)
        else:
            try:
                url = "https://giventake.world/api/v1/auth/login/"
                res =  requests.post(url,json={"userId":str_username,"password":str_password})
                data = json.loads(res.text)
                if data['status']:
                    res_user = UserDetails.objects.filter(username = str_username)
                    if res_user:
                        pass
                    else:
                        ins_user = UserDetails(
                                            username = str_username,
                                            date_joined = datetime.now(),
                                            is_active = True,
                                            is_superuser = False)
                        ins_user.set_password(str_password)
                        ins_user.save()
                    serializer = self.serializer_class(data=request.data)
                    serializer.is_valid(raise_exception=True)
                    return Response({'message': 'User Login Successfully', 'data':serializer.data}, status=status.HTTP_200_OK)
                else:
                    return Response({'message': 'User Login Failed'}, status=401)
            except:
                return Response({'message': 'User Login Failed (Connection Refused)'}, status=401)

    

class UserRegistrationViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    parser_classes = [MultiPartParser, FormParser]
    serializer_class = RegistrationSerializer
    queryset = UserDetails.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    def retrieve(self, request,*args, **kargs):
        user_id = kargs.get('pk')
        if user_id:
            try:
                appts = UserDetails.objects.get(id=int(user_id))
                serializer = self.get_serializer(appts, many=False)
                serializer.data['user_image']=settings.HOST_ADDRESS+settings.MEDIA_URL+serializer.data['user_image']
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            appts = UserDetails.objects.all()
            serializer = self.get_serializer(appts, many=True)
            for image in serializer.data :
                image['user_image']=settings.HOST_ADDRESS+image['user_image']
            return Response({'results':serializer.data})
    
    def list(self,request):
        appts = UserDetails.objects.all()
        serializer = self.get_serializer(appts, many=True)
        for image in serializer.data :
            if image['user_image'] is not None :
                image['user_image']=settings.HOST_ADDRESS+image['user_image']
        return Response({'results':serializer.data})

class StaffRoleViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = StaffRoleSerializer
    queryset = StaffRole.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

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

class CommitteeTypeViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = CommitteeTypeSerializer
    queryset = CommitteeType.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    def retrieve(self, request,*args, **kargs):
        committee_type_id = kargs.get('pk')
        if committee_type_id:
            try:
                appts = CommitteeType.objects.get(id=int(committee_type_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            appts = CommitteeType.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response({'results':serializer.data})

class StateViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = StateSerializer
    queryset = State.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    def retrieve(self, request,*args, **kargs):
        state_id = kargs.get('pk')
        if state_id:
            try:
                appts = State.objects.get(id=int(state_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            appts = State.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response({'results':serializer.data})
    
    def create(self, request, *args, **kwargs): 
        data={
       "name" : request.data.get('name',None),
       "code" : request.data.get('code',None),
       "created_by": request.user.id
        }
        _serializer = self.serializer_class(data=data)
        if _serializer.is_valid():
            _serializer.save()
            return Response(data=_serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(data=_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class DistrictViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = DistrictSerializer
    queryset = District.objects.all()
    http_method_states = ['get', 'post', 'put' , 'delete']

    @swagger_auto_schema(
        operation_description="District list",
        manual_parameters=[openapi.Parameter(
            'state_id', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def create(self, request, *args, **kwargs): 
        data={
       "name" : request.data.get('name',None),
       "code" : request.data.get('code',None),
       "state" : request.data.get('state',None),
       "created_by": request.user.id
        }
        _serializer = self.serializer_class(data=data)
        if _serializer.is_valid():
            _serializer.save()
            return Response(data=_serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(data=_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def list(self, request):
        state_id = request.GET.get('state_id')
        if state_id:
            appts = District.objects.filter(state_id=state_id)
            serializer = self.get_serializer(appts, many=True)
            return Response(serializer.data)
        else:
            appts = District.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response(serializer.data)

    def retrieve(self, request,*args, **kargs):
        district_id = kargs.get('pk')
        if district_id:
            try:
                appts = District.objects.get(id=int(district_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
            
        else:
            appts = District.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response({'results':serializer.data})


# class BlockViewSet(viewsets.ModelViewSet):
#     """
#     A viewset for register and edit user instances.
#     """
#     serializer_class = BlockSerializer
#     queryset = Block.objects.all()
#     http_method_names = ['get', 'post', 'put' , 'delete']

#     @swagger_auto_schema(
#         operation_description="Block list",
#         manual_parameters=[openapi.Parameter(
#             'district_id', 
#             openapi.IN_QUERY, 
#             type=openapi.TYPE_STRING
#             )],
#     )
#     def list(self, request):
#         district_id = request.GET.get('district_id')
#         if district_id:
#             appts = Block.objects.filter(district_id=district_id)
#             serializer = self.get_serializer(appts, many=True)
#             return Response(serializer.data)
#         else:
#             appts = Block.objects.all()
#             serializer = self.get_serializer(appts, many=True)
#             return Response(serializer.data)

#     def retrieve(self, request,*args, **kargs):
#         block_id = kargs.get('pk')
#         if block_id:
#             try:
#                 appts = Block.objects.get(id=int(block_id))
#                 serializer = self.get_serializer(appts, many=False)
#                 return Response({'results':serializer.data})
#             except:
#                 return Response({'message': 'No data found'})
            
#         else:
#             appts = Block.objects.all()
#             serializer = self.get_serializer(appts, many=True)
#             return Response({'results':serializer.data})
    

class PanchayathViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = PanchayathSerializer
    queryset = Panchayath.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    @swagger_auto_schema(
        operation_description="panchayath list",
        manual_parameters=[openapi.Parameter(
            'district_id', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def list(self, request):
        district_id = request.GET.get('district_id')
        if district_id:
            appts = Panchayath.objects.filter(district_id=district_id)
            serializer = self.get_serializer(appts, many=True)
            return Response(serializer.data)
        else:
            appts = Panchayath.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response(serializer.data)
    
    def retrieve(self, request,*args, **kargs):
        panchayath_id = kargs.get('pk')
        if panchayath_id:
            try:
                appts = Panchayath.objects.get(id=int(panchayath_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
            
        else:
            appts = Panchayath.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response({'results':serializer.data})

class WardViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = WardSerializer
    queryset = Ward.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    @swagger_auto_schema(
        operation_description="Ward list",
        manual_parameters=[openapi.Parameter(
            'panchayath_id', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def list(self, request):
        panchayath_id = request.GET.get('panchayath_id')
        if panchayath_id:
            appts = Ward.objects.filter(panchayath_id=panchayath_id)
            serializer = self.get_serializer(appts, many=True)
            return Response(serializer.data)
        else:
            appts = Ward.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response(serializer.data)
    
    def retrieve(self, request,*args, **kargs):
        ward_id = kargs.get('pk')
        if ward_id:
            try:
                appts = Ward.objects.get(id=int(ward_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
            
        else:
            appts = Ward.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response({'results':serializer.data})


class get_user_by_name(APIView):
    queryset = UserDetails.objects.all()
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
            if request.GET.get('username'):
                user = UserDetails.objects.filter(username=request.GET.get('username')).values("username","name","first_name","last_name","phone_number","id","staff_role_id","staff_role__name","user_image","is_details",
                "state_id","state_id__name","district_id","district_id__name","panchayath_id","panchayath_id__name","ward_id","ward_id__name","committee_type_id","committee_type_id__name")
                if user:
                    user[0]['user_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + user[0]['user_image']
                    return Response({'results':user})
                else:
                    return Response({'results':'No data found'})
            else:
                return Response({'results':'No data found'})
        except Exception as e:
            return Response({'results':"Failed to get user"})

class get_user_by_committe(APIView):
    queryset = UserDetails.objects.all()
    permission_classes = [AllowAny]
    @swagger_auto_schema(
        operation_description="User",
        manual_parameters=[openapi.Parameter(
            'committee_type', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            ),openapi.Parameter(
            'id', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def get(self,request):
        try:
            commitee_type=int(request.GET.get('committee_type')) if request.GET.get('committee_type') else ''
            id=int(request.GET.get('id')) if request.GET.get('id') else ''
            state_committee_id = CommitteeType.objects.filter(name='State Committee').values('id').first()['id']
            district_committee_id = CommitteeType.objects.filter(name='District Committee').values('id').first()['id']
            panchayath_committee_id = CommitteeType.objects.filter(name='Panchayath Committee').values('id').first()['id']
            ward_committee_id = CommitteeType.objects.filter(name='Ward Committee').values('id').first()['id']

            if commitee_type==state_committee_id and id:
                user = UserDetails.objects.filter(committee_type_id=commitee_type,state_id=id).values("username","first_name","last_name","phone_number","id","staff_role_id","staff_role__name","user_image","is_details",
                "state_id","state_id__name","district_id","district_id__name","panchayath_id","panchayath_id__name","ward_id","ward_id__name","committee_type_id","committee_type_id__name","str_panchayath","str_ward")
                if user:
                    user[0]['user_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + user[0]['user_image']
                return Response({'results':user})
                
            elif commitee_type==district_committee_id and id:

                user = UserDetails.objects.filter(committee_type_id=commitee_type,district_id=id).values("username","first_name","last_name","phone_number","id","staff_role_id","staff_role__name","user_image","is_details",
            "state_id","state_id__name","district_id","district_id__name","panchayath_id","panchayath_id__name","ward_id","ward_id__name","committee_type_id","committee_type_id__name","str_panchayath","str_ward")   
                if user:
                    user[0]['user_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + user[0]['user_image']
                return Response({'results':user})
                
            elif commitee_type==panchayath_committee_id and id:
                user = UserDetails.objects.filter(committee_type_id=commitee_type,panchayath_id=id).values("username","first_name","last_name","phone_number","id","staff_role_id","staff_role__name","user_image","is_details",
                "state_id","state_id__name","district_id","district_id__name","panchayath_id","panchayath_id__name","ward_id","ward_id__name","committee_type_id","committee_type_id__name","str_panchayath","str_ward")   
                if user:
                    user[0]['user_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + user[0]['user_image']
                return Response({'results':user}) 
                  
            elif commitee_type==ward_committee_id and id:
                user = UserDetails.objects.filter(committee_type_id=commitee_type,ward_id=id).values("username","first_name","last_name","phone_number","id","staff_role_id","staff_role__name","user_image","is_details",
                "state_id","state_id__name","district_id","district_id__name","panchayath_id","panchayath_id__name","ward_id","ward_id__name","committee_type_id","committee_type_id__name","str_panchayath","str_ward")   
                if user:
                    user[0]['user_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + user[0]['user_image']
                return Response({'results':user})    
            else:
                user = UserDetails.objects.filter(committee_type_id=commitee_type).values("username","first_name","last_name","phone_number","id","staff_role_id","staff_role__name","user_image","is_details",
                "state_id","state_id__name","district_id","district_id__name","panchayath_id","panchayath_id__name","ward_id","ward_id__name","committee_type_id","committee_type_id__name","str_panchayath","str_ward")
                if user:
                    user[0]['user_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + user[0]['user_image']
                return Response({'results':user})   
        except Exception as e:
            return Response({'results':"Failed to get user"})

class get_state_by_user(APIView): 
    queryset = State.objects.all()
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
            state =State.objects.filter(created_by_id=request.user.id).values('id','created_by','name','code')
            return Response({'results':state})
        except Exception as e:
            return Response({'results':"Failed to get user news"})

class get_district_by_user(APIView): 
    queryset = District.objects.all()
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
            district =District.objects.filter(created_by_id=request.user.id).values('id','created_by','name','code','state','state_id__name')
            return Response({'results':district})
        except Exception as e:
            return Response({'results':"Failed to get user news"})

class get_area_by_usercommitte(APIView):
    queryset = Committee.objects.all()
    permission_classes = [AllowAny]
    def get(self,request):
        try:
            user_details=UserDetails.objects.filter(id=request.user.id).values('committee_type__name').first()
            if user_details['committee_type__name']=='State Committee':
                users = District.objects.filter(created_by_id=request.user.id).values('id','name','state_id','state__name','created_by','modified_by','date_added','date_modified')
                for user in users:
                    user['parent_name'] = user['state__name']
                return Response({'results':users})
            elif user_details['committee_type__name'] =='District Committee' :
                users = Panchayath.objects.filter(created_by_id=request.user.id).values('id','name','district_id','district__name','created_by','modified_by','date_added','date_modified')
                for user in users:
                    user['parent_name'] = user['district__name']  
                return Response({'results':users})
            elif  user_details['committee_type__name']=='Panchayath Committee':
                users = Panchayath.objects.filter(created_by_id=request.user.id).values('id','name','panchayath_id','panchayath__name','created_by','modified_by','date_added','date_modified')
                for user in users:
                    user['parent_name'] = user['panchayath__name']  
                return Response({'results':users})
            else:
                return Response({'results':[]})
        except Exception as e:
            return Response({'results':[]})


class district_ward_panchayath_created_by(APIView):
    permission_classes = [IsAuthenticated]
    def get(self,request):
    
        district_details = District.objects.filter(created_by_id=request.user.id).values('id','name','state_id','state__name','created_by','modified_by','date_added','date_modified')
        panchayath_details=Panchayath.objects.filter(created_by_id=request.user.id).values('id','name','district_id','district__name','created_by','modified_by','date_added','date_modified')
        ward_details=Ward.objects.filter(created_by_id=request.user.id).values('id','name','panchayath_id','panchayath__name','created_by','modified_by','date_added','date_modified')
        for dist in  district_details :
            dist['parent_name']=dist['state__name']
            dist['parent_id']=dist['state_id']
        for pan in panchayath_details :
            pan['parent_name'] = pan['district__name']
            pan['parent_id'] = pan['district_id']  
        for ward in ward_details:
                ward['parent_name'] = ward['panchayath__name']  
                ward['parent_id'] = ward['panchayath_id']  
    

        #     ward_list.append(ward)
       
        response={
            'district' : district_details,
            'panchayath' : panchayath_details,
            'ward' : ward_details
        }
    
        return Response({'results':response}) 
    
    

class Users_count(APIView):
    def get(self,request):
        count=UserDetails.objects.count()
        return Response({'count':count})
    