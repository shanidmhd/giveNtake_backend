from rest_framework.permissions import BasePermission



from .models import admin_model


    

def roles_users(request):
    role_list=[]
    roles=admin_model.objects.filter(user_id__id=request.user.id).first()
    for i in roles.staff_role.json_sidebar:
        role_list.append(i)
    return role_list

# class Isadmin(BasePermission):
#     def has_permission(self, request, view):
#         if request.user.is_admin:
#             return True

class IsNews(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'news' in roles_users(request):
                return True
            else :
                return False

           


class IsMeeting(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'meeting' in roles_users(request):
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


class Issettings(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'settings' in roles_users(request):
                return True
            else :
                return False
            
class Isusers(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'users' in roles_users(request) :
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
            
            
class Iscommittee_admin(BasePermission):
    def has_permission(self, request, view):
        if admin_model.objects.filter(user_id__id=request.user.id).first():
            if 'committee-admin' in roles_users(request) :
                return True
            else :
                return False
            
