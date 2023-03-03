from rest_framework import serializers
from django.conf import settings
from user_details.models import UserDetails
from . models import admin_model,committee_members
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
        
        model = admin_model
        fields = ['id','name','username','phone_number','staff_role','state','state','district','panchayath','ward','created_by','user_image','committee_type','user_id']
        
        
    def to_representation(self, instance):
        rep= super().to_representation(instance)
        user_details=UserDetails.objects.filter(id=rep['user_id']).values('first_name','last_name','email','date_joined','designation','bln_staff','date_added','date_modified','pin_code','address','blood_group','str_panchayath','str_ward','is_details').first()
        if user_details:
            rep['first_name']=user_details['first_name']
            rep['last_name']=user_details['last_name']
            rep['email']=user_details['email']
            rep['date_joined']=user_details['date_joined']
            rep['designation']=user_details['designation']
            rep['bln_staff']=user_details['bln_staff']
            rep['date_added']=user_details['date_added']
            rep['date_modified']=user_details['date_modified']
            rep['pin_code']=user_details['pin_code']
            rep['address']=user_details['address']
            rep['blood_group']=user_details['blood_group']
            rep['str_panchayath']=user_details['str_panchayath']
            rep['str_ward']=user_details['str_ward']
            rep['is_details']=user_details['is_details']
        user=admin_model.objects.filter(id=rep['id']).values('user_image').first()
        if user['user_image']:
            rep['user_image']=settings.HOST_ADDRESS+settings.MEDIA_URL+user['user_image']

            rep['user_image']='null'
        return rep

class admin_booking_serializers(serializers.ModelSerializer):
    class Meta :
        model = admin_model
        fields =['id','username']
        
        
class committe_members_serializers(serializers.ModelSerializer):
    class Meta :
        model = committee_members
        exclude =['login_token']
        

class committee_list_ser(WritableNestedModelSerializer):
    staff_role = StaffRole_Serializer()
    committee_type =Committee_type_TypeSerializer()
    state=State_staff_Serializer()
    district=District_staff_Serializer()
    panchayath =Panchayath_staff_Serializer()
    ward =Ward_staff_Serializer()
    class Meta :
        model = committee_members
        exclude =['login_token']
        