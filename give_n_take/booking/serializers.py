from rest_framework import serializers
from booking.models import Program_model, TicketBooking
from user_details.models import State, District, UserDetails, Ward, Panchayath
from user_details.serializers import StateSerializer, DistrictSerializer, PanchayathSerializer, WardSerializer
from register.serializers import admin_booking_serializers
from drf_writable_nested.serializers import WritableNestedModelSerializer
import pysnooper


class Program_get_Serializer(WritableNestedModelSerializer):
    fk_admin_id = admin_booking_serializers()
    fk_state = StateSerializer()
    fk_district = DistrictSerializer()
    fk_panchayath = PanchayathSerializer()
    fk_ward = WardSerializer()

    class Meta:
        model = Program_model
        fields = "__all__"


class Program_Serializer(serializers.ModelSerializer):
    price = serializers.IntegerField(required=True)
    committe_type = serializers.IntegerField(required=False)
    state_region = serializers.IntegerField(required=False)
    district_region = serializers.IntegerField(required=False)
    panchayath_region = serializers.IntegerField(required=False)
    ward_region = serializers.IntegerField(required=False)

    class Meta:
        model = Program_model
        fields = (
            'address', 'agenda', 'committe_type', 'contact_no', 'date', 'end_time', 'food', 'inauguration_name',
            'map_url', 'price', 'program_name', 'qr_permission', 'start_time', 'state_region', 'total_seats', 'venue',
            'state_region', 'district_region', 'panchayath_region', 'ward_region', 'available_seats'
        )

    def create(self, validated_data):
        new_data = {
            key: val for key, val in validated_data.items() if key not in [
                'committe_type','state_region', 'district_region', 'panchayath_region', 'ward_region', 'qr_permission'
            ]
        }
        program_model_obj = Program_model.objects.create(**new_data)
        program_model_obj.qr_permission.set(validated_data.get('qr_permission'))
        program_model_obj.save()
        return program_model_obj

    def update(self, instance, validated_data):
        filled_seats = instance.total_seats - instance.available_seats
        super().update(instance=instance, validated_data=validated_data)
        if 'total_seats' in validated_data:
            instance.available_seats = validated_data['total_seats'] - filled_seats
        if 'committe_type' in validated_data:
            if validated_data.get('committe_type') == 4:
                instance.fk_state = State.objects.get(id=validated_data.get('state_region'))
                instance.fk_district = None
                instance.fk_panchayath = None
                instance.fk_ward = None
            elif validated_data.get('committe_type') == 5:
                instance.fk_state = None
                instance.fk_district = District.objects.get(id=validated_data.get('district_region'))
                instance.fk_panchayath = None
                instance.fk_ward = None
            elif validated_data.get('committe_type') == 6:
                instance.fk_state = None
                instance.fk_district = None
                instance.fk_panchayath = Panchayath.objects.get(id=validated_data.get('panchayath_region'))
                instance.fk_ward = None
            elif validated_data.get('committe_type') == 7:
                instance.fk_state = None
                instance.fk_district = None
                instance.fk_panchayath = None
                instance.fk_ward = Ward.objects.get(id=validated_data.get('ward_region'))
            else:
                instance.fk_state = None
                instance.fk_district = None
                instance.fk_panchayath = None
                instance.fk_ward = None
        instance.save()
        return instance


class Ticket_Booking_serializer(serializers.ModelSerializer):
    no_of_seats = serializers.IntegerField(required=True, min_value=5)
    qr_random_num = serializers.CharField(write_only=True,required=False)
    qr_image_scanned = serializers.BooleanField(write_only=True,required=False)
    class Meta:
        model = TicketBooking
        fields = "__all__"

    def create(self, validated_data):
        ticket = TicketBooking.objects.create(**validated_data)
        return ticket

    def to_representation(self, instance):
        res = super().to_representation(self.instance)
        res["fk_user_id"] = UserDetails.objects.filter(id=res["fk_user_id"]).values(
            "id", "username"
        )
        res["fk_program"] = Program_model.objects.filter(id=res["fk_program"]).values(
            "id", "program_name", "venue", "date",'start_time','end_time','address','contact_no','food','agenda','inauguration_name','total_seats',"available_seats",'price',"fk_admin_id__id"
        )
        return res


class ticket_get_serializer(serializers.ModelSerializer):
    qr_random_num = serializers.CharField(write_only=True)
    qr_image_scanned = serializers.BooleanField(write_only=True)
    class Meta:
        model = TicketBooking
        fields = "__all__"

  
class ticket_id_serializer(serializers.ModelSerializer):
    qr_random_num = serializers.CharField(write_only=True)
    qr_image_scanned = serializers.BooleanField(write_only=True)
    class Meta:
        model = TicketBooking
        fields = "__all__"

  


