from unittest.util import _MAX_LENGTH
from rest_framework import serializers
from django.contrib.auth import authenticate
from rest_framework_simplejwt.tokens import RefreshToken
from .models import *


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
        response_data['access_token'] = str(refresh.access_token)
        response_data['refresh_token'] = str(refresh)
        response_data['id'] = instance.id
        return response_data
      

class RegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserDetails
        fields = ['id','username','password','first_name', 'last_name', 'email', 'phone_number','date_joined','staff_role','state','district','panchayath','ward','designation','bln_staff']
        extra_kwargs = { 
            'password': {'write_only': True,'required':False},
        }

    def create(self,validated_data):
        user = UserDetails.objects.create_user(**validated_data)
        return user

class StaffRoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = StaffRole
        fields = ['id','name','code']
        

    def create(self,validated_data):
        staff_role = StaffRole.objects.create(**validated_data)
        return staff_role

class StateSerializer(serializers.ModelSerializer):
    class Meta:
        model = State
        fields = ['id','name','code']
        

    def create(self,validated_data):
        state = State.objects.create(**validated_data)
        return state

class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = ['id','name','state']
        

    def create(self,validated_data):
        district = District.objects.create(**validated_data)
        return district


# class BlockSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Block
#         fields = ['id','name','district']
        

#     def create(self,validated_data):
#         block = Block.objects.create(**validated_data)
#         return block

class PanchayathSerializer(serializers.ModelSerializer):
    class Meta:
        model = Panchayath
        fields = ['id','name','district']
        

    def create(self,validated_data):
        panchayath = Panchayath.objects.create(**validated_data)
        return panchayath

class WardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ward
        fields = ['id','name','panchayath']
        

    def create(self,validated_data):
        ward = Ward.objects.create(**validated_data)
        return ward


# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = user_group
#         fields = ['name', 'code']
#         extra_kwargs = {'name': {'required': True}, 'code': {'required': True}, 
            
#         }