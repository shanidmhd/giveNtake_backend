from django.shortcuts import render
from rest_framework import viewsets
from . serializers import Program_Serializer,Ticket_Booking_serializer,Program_get_Serializer
from . models import Program_model,TicketBooking
from rest_framework.response import Response
from rest_framework import status
from register.models import admin_model
from rest_framework.permissions import IsAuthenticated
from django.http import Http404
from user_details.models import UserDetails

# Create your views here.


class ProgramAPI(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    
    serializer_class = Program_Serializer
    queryset = Program_model.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']
    permission_classes=[IsAuthenticated]
    def create(self,request):
        serializer=self.serializer_class(data=request.data)
        if serializer.is_valid():
            fk_admin_id=admin_model.objects.get(user_id__id=request.user.id)
            serializer.save(fk_admin_id=fk_admin_id,available_seats=request.data['total_seats'])
            return Response({'success':'Program succesfully added'},status=status.HTTP_201_CREATED)
        return Response({'error':serializer.errors},status=status.HTTP_400_BAD_REQUEST)
    
   
    def retrieve(self,request,*args, **kargs):

        prog_id = kargs.get('pk')
        if prog_id:
            try:
                appts = Program_model.objects.get(id=int(prog_id))
                serializer = Program_get_Serializer(appts, many=False)
                return Response({'results':serializer.data})
            except Program_model.DoesNotExist:
                raise Http404
        return Response(status=status.HTTP_400_BAD_REQUEST)
            
            
    def list(self,request):
        
        appts = Program_model.objects.all()
        serializer = Program_get_Serializer(appts, many=True)
        return Response({'results':serializer.data})
           


class TicketBooking_API(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    
    serializer_class = Ticket_Booking_serializer
    queryset = TicketBooking.objects.all()
    http_method_names = ['get', 'post' , 'delete']
    permission_classes=[IsAuthenticated]

    def retrieve(self, request,*args, **kargs):
        news_id = kargs.get('pk')
        if news_id:
            try:
                appts = TicketBooking.objects.get(id=int(news_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            try:
                appts = TicketBooking.objects.all()
                serializer = self.get_serializer(appts, many=True)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})

    def create(self, request, *args, **kwargs): 
        """
        It creates a new object of the model and saves it to the database.
        
        :param request: The request object
        :return: The response is a JSON object.
        """

        _serializer = self.serializer_class(data=request.data)
        if _serializer.is_valid():
           # Getting the program id and the number of seats from the request data and then it is
           # getting the program object from the database and then it is calculating the remaining
           # seats and then it is saving the serializer and then it is updating the program object
           # with the remaining seats.
            program_id=request.data['fk_program']
            no_of_seat_r=int(request.data['no_of_seats'])
            
            program=Program_model.objects.filter(id=program_id).values('available_seats').first()
            if no_of_seat_r < int(program['available_seats']) :
                remaining_seats= program['available_seats'] - no_of_seat_r
                _serializer.save(fk_user_id=UserDetails.objects.get(id=request.user.id))
                Program_model.objects.filter(id=program_id).update(available_seats=remaining_seats)
                return Response(data=_serializer.data, status=status.HTTP_201_CREATED)
            else :
                return Response({'error':'seats is not available'},status=status.HTTP_400_BAD_REQUEST)
        
        else:
            return Response(data=_serializer.errors, status=status.HTTP_400_BAD_REQUEST)