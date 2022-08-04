import code
import json
from opcode import stack_effect
from optparse import Values
import pdb
import sys
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
        user = authenticate(username=request.data['username'], password=request.data['password'])
        if user:
                serializer = self.serializer_class(data=request.data)
                serializer.is_valid(raise_exception=True)
                return Response({'message': 'User Login Successfully', 'data':serializer.data}, status=status.HTTP_200_OK)
        else:
            url = "https://new.giventake.world/api/v1/auth/login/"
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
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            appts = UserDetails.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response({'results':serializer.data})

class StaffRoleViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = StaffRoleSerializer
    queryset = StaffRole.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    def retrieve(self, request,*args, **kargs):
        staff_role_id = kargs.get('pk')
        if staff_role_id:
            try:
                appts = StaffRole.objects.get(id=int(staff_role_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            appts = StaffRole.objects.all()
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

class CommitteeViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = CommitteeSerializer
    queryset = Committee.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    def retrieve(self, request,*args, **kargs):
        committee_id = kargs.get('pk')
        if committee_id:
            try:
                appts = Committee.objects.get(id=int(committee_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            appts = Committee.objects.all()
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

class DistrictViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = DistrictSerializer
    queryset = District.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    @swagger_auto_schema(
        operation_description="District list",
        manual_parameters=[openapi.Parameter(
            'state_id', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
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


