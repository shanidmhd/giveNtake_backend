from rest_framework import serializers

from user_details.models import UserDetails
from . models import admin_model
from drf_writable_nested.serializers import WritableNestedModelSerializer
from user_details.serializers import Committee_type_TypeSerializer, District_staff_Serializer, Panchayath_staff_Serializer, StaffRole_Serializer, StaffRoleSerializer,CommitteeTypeSerializer, State_staff_Serializer,StateSerializer,DistrictSerializer,PanchayathSerializer, Ward_staff_Serializer,WardSerializer

class register_serializers(serializers.ModelSerializer):
    class Meta :
        model = admin_model
        fields ='__all__'

class login_serializers(serializers.ModelSerializer):
    class Meta :
        model = admin_model
        fields = ['username','password']
        
        
class register_ser(WritableNestedModelSerializer):
    staff_role = StaffRole_Serializer()
    committee_type =Committee_type_TypeSerializer()
    state=State_staff_Serializer()
    district=District_staff_Serializer()
    panchayath =Panchayath_staff_Serializer()
    ward =Ward_staff_Serializer()
    class Meta :
        model = admin_model
        exclude =['login_token']
        

class Registration_Serializer(WritableNestedModelSerializer):
    staff_role = StaffRole_Serializer()
    committee_type =Committee_type_TypeSerializer()
    state=State_staff_Serializer()
    district=District_staff_Serializer()
    panchayath =Panchayath_staff_Serializer()
    ward =Ward_staff_Serializer()
    class Meta :
        
        model = UserDetails
        fields = ['id','name','username','first_name', 'last_name', 'email', 'phone_number','date_joined','staff_role','state','state','district','panchayath','ward','designation','bln_staff','created_by','modified_by','date_added','date_modified','user_image','committee_type','pin_code','address','blood_group','str_panchayath','str_ward','is_details']