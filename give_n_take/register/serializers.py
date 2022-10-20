from rest_framework import serializers
from . models import admin_model
from drf_writable_nested.serializers import WritableNestedModelSerializer
from user_details.serializers import Committee_type_TypeSerializer, District_staff_Serializer, Panchayath_staff_Serializer, StaffRole_Serializer, StaffRoleSerializer,CommitteeTypeSerializer, State_staff_Serializer,StateSerializer,DistrictSerializer,PanchayathSerializer, Ward_staff_Serializer,WardSerializer

class register_serializers(serializers.ModelSerializer):
    class Meta :
        model = admin_model
        exclude = ['login_token']

class login_serializers(serializers.ModelSerializer):
    class Meta :
        model = admin_model
        fields = ['username','password']
        
        
class register_ser(WritableNestedModelSerializer):
    staff_role = StaffRole_Serializer()
    committe_type =Committee_type_TypeSerializer()
    state=State_staff_Serializer()
    district=District_staff_Serializer()
    panchayath =Panchayath_staff_Serializer()
    ward =Ward_staff_Serializer()
    class Meta :
        model = admin_model
        exclude =['login_token','username']