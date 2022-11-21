from rest_framework  import serializers
from . models import Program_model,TicketBooking
from user_details.models import State,District,UserDetails
from user_details.serializers  import StateSerializer,DistrictSerializer
from register.serializers import admin_booking_serializers
from drf_writable_nested.serializers import WritableNestedModelSerializer
 
class Program_get_Serializer(WritableNestedModelSerializer):
    fk_admin_id=admin_booking_serializers()
    fk_state=StateSerializer()
    fk_district=DistrictSerializer()
    class Meta :
        model = Program_model
        fields = '__all__'
        
class Program_Serializer(serializers.ModelSerializer):
   
    class Meta :
        model = Program_model
        fields = '__all__'

class Ticket_Booking_serializer(serializers.ModelSerializer):
    no_of_seats = serializers.IntegerField(required=True, min_value=5)
    
    class Meta :
        model = TicketBooking
        fields = '__all__'
        
    def create(self,validated_data):
        ticket = TicketBooking.objects.create(**validated_data)
        return ticket
    
    def to_representation(self, instance):
        res=super().to_representation(self.instance)
        res['fk_user_id']=UserDetails.objects.filter(id=res['fk_user_id']).values('id','username')
        res['fk_program']=Program_model.objects.filter(id=res['fk_program']).values('id','program_name','venue','available_seats')
        return res