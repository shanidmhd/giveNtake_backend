from rest_framework.permissions import BasePermission,IsAdminUser



from .models import admin_model
from rest_framework.response import Response

    
class IsSuperUser(IsAdminUser):
    print('llll')
    def has_permission(self, request, view):
        print('super',request.user.is_superuser)
        return bool(request.user.is_superuser)
    
def roles_users(request):
    role_list=[]
    roles=admin_model.objects.filter(user_id__id=request.user.id).first()
    for i in roles.staff_role.json_sidebar:
        print(i,'iii')
        role_list.append(i)
    print(role_list)
    return role_list

# class Isadmin(BasePermission):
#     def has_permission(self, request, view):
#         if request.user.is_admin:
#             return True

class IsNews(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first() :
            if 'news' in roles_users(request):
                return True
            else  :
                return False 
        elif request.user.is_superuser:
                return True
        else :
                return False

           


class IsMeeting(BasePermission):
    print('lllls')
    def has_permission(self, request, view):
        print(request.user.is_superuser,'meeting')
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'meeting' in roles_users(request):
                return True
            else :
                return False
        elif request.user.is_superuser:
                return True
        else :
                return False

class Iscommitteeadmin(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'committee-admin' in roles_users(request):
                return True
            else :
                return False
        elif request.user.is_superuser:
                return True
        else :
                return False

class Issettings(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'settings' in roles_users(request):
                return True
            else :
                return False
        elif request.user.is_superuser:
                return True
        else :
                return False
            
class Isusers(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'user' in roles_users(request) :
                return True
            else :
                return False
            
        elif request.user.is_superuser:
                return True
        else :
                return False
            
class Isstaffrole(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'role-type' in roles_users(request) :
                return True
            else :
                return False
            
        elif request.user.is_superuser:
                return True
        else :
                return False
            
            
class Iscommittee_admin(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'committee-admin' in roles_users(request) :
                return True
            else :
                return False
        elif request.user.is_superuser:
                return True
        else :
                return False
            
