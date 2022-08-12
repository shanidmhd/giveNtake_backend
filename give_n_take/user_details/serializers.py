from unittest.util import _MAX_LENGTH
from rest_framework import serializers
from django.contrib.auth import authenticate
from rest_framework_simplejwt.tokens import RefreshToken
from .models import *
from django.conf import settings


class UserLoginSerializer(serializers.Serializer):
    """
    Serializer class for validating the user from the user email and password. Also will send the otp
    """
    username = serializers.CharField(max_length=255, write_only=True)
    password = serializers.CharField(max_length=128, write_only=True)

    def validate(self, data):
        user = authenticate(username=data.get("username", None), password=data.get("password", None))
        if user is None:
            raise serializers.ValidationError(
                'User login failed'
            )
        return user
        
    def to_representation(self, instance):
        response_data = super().to_representation(instance)
        refresh = RefreshToken.for_user(instance)
        user_details = UserDetails.objects.get(id=instance.id)
        response_data['access_token'] = str(refresh.access_token)
        response_data['refresh_token'] = str(refresh)
        response_data['id'] = user_details.id
        response_data['first_name'] = user_details.first_name
        response_data['last_name'] = user_details.last_name
        response_data['email'] = user_details.email
        response_data['phone_number'] = user_details.phone_number
        response_data['date_joined'] = user_details.date_joined
        if user_details.staff_role:
            response_data['staff_role_id'] = user_details.staff_role.id
            response_data['staff_role_name'] = user_details.staff_role.name
            lst_sidebar = []
            try:
                if user_details.staff_role.json_sidebar:
                    sidebar = user_details.staff_role.json_sidebar[1:-1].split(',')
                    for side in sidebar:
                        lst_sidebar.append(side[1:-1])
                response_data['json_sidebar'] = lst_sidebar
            except:
                response_data['json_sidebar'] = user_details.staff_role.json_sidebar
        if user_details.state:
            response_data['state_id'] = user_details.state.id
            response_data['state_name'] = user_details.state.name
        if user_details.district:
            response_data['district_id'] = user_details.district.id
            response_data['district_name'] = user_details.district.name
        if user_details.panchayath:
            response_data['panchayath_id'] = user_details.panchayath.id
            response_data['panchayath_name'] = user_details.panchayath.name
        if user_details.ward:
            response_data['ward_id'] = user_details.ward.id
            response_data['ward_name'] = user_details.ward.name
        response_data['bln_staff'] = user_details.bln_staff
        if user_details.user_image:
            response_data['user_image'] = settings.HOST_ADDRESS + settings.MEDIA_URL + user_details.user_image.name
        return response_data
      

class RegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserDetails
        fields = ['id','username','password','first_name', 'last_name', 'email', 'phone_number','date_joined','staff_role','state','district','panchayath','ward','designation','bln_staff','created_by','modified_by','date_added','date_modified','user_image']
        extra_kwargs = { 
            'password': {'write_only': True,'required':False},
            'username': {'required':False}, 
        }

    def create(self,validated_data):
        user = UserDetails.objects.create_user(**validated_data)
        return user
    
    def get_user_by_username(self, obj):
        user = UserDetails.objects.get(username = obj)
        return user

class StaffRoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = StaffRole
        fields = ['id','name','code','json_sidebar','created_by','modified_by','date_added','date_modified']
        

    def create(self,validated_data):
        staff_role = StaffRole.objects.create(**validated_data)
        return staff_role

class CommitteeTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = CommitteeType
        fields = ['id','name','code','created_by','modified_by','date_added','date_modified']
        

    def create(self,validated_data):
        committee_type = CommitteeType.objects.create(**validated_data)
        return committee_type

class CommitteeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Committee
        fields = ['id','name','phone_number','staff_role','committee_type','created_by','modified_by','date_added','date_modified']
        

    def create(self,validated_data):
        committee = Committee.objects.create(**validated_data)
        return committee

class StateSerializer(serializers.ModelSerializer):
    class Meta:
        model = State
        fields = ['id','name','code','created_by','modified_by','date_added','date_modified']
        

    def create(self,validated_data):
        state = State.objects.create(**validated_data)
        return state

class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = ['id','name','state','created_by','modified_by','date_added','date_modified']
        

    def create(self,validated_data):
        district = District.objects.create(**validated_data)
        return district


class PanchayathSerializer(serializers.ModelSerializer):
    class Meta:
        model = Panchayath
        fields = ['id','name','district','created_by','modified_by','date_added','date_modified']
        

    def create(self,validated_data):
        panchayath = Panchayath.objects.create(**validated_data)
        return panchayath

class WardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ward
        fields = ['id','name','panchayath','created_by','modified_by','date_added','date_modified']
        

    def create(self,validated_data):
        ward = Ward.objects.create(**validated_data)
        return ward


