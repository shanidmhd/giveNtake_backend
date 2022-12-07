# # Reading the excel file and returning the sheet names.

import django
import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'give_n_take.settings')
from django.core.management.base import BaseCommand, CommandError
import logging
django.setup()
import pandas as pd
import os 
from user_details.models import District,Panchayath,State

logger = logging.getLogger(__name__)
path=os.getcwd()
dirs = os.listdir(path)
kollam_list = []
alppzha_list=[]
tvm_list=[]
ptnm_list=[]
kttym_list=[]
iduuki_list=[]
ernklm_list=[]
trissur_list=[]
mlprm_list=[]
kzkde_list=[]
wynd_list=[]
knnur_list=[]
ksrgd_list=[]
plkd_list=[]

class Command(BaseCommand):
    def handle(self, *args, **options):
        for file in dirs:
            if file.endswith(".xlsx"):
         
                df = pd.read_excel("excel.xlsx", sheet_name='Kollam')
                
                for index, row in df.iterrows():
                
                    kollam_list.append(row.values[1])
                    
                #name='Kollam',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Kollam').first()
                if dist :
                    for k in kollam_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Kollam panchayath added succesfully')
                else :
                    logger.warning('Kollam dist not found')
                        
                        
                tvm=pd.read_excel("excel.xlsx", sheet_name='Trivandrum')
                for index, row in tvm.iterrows():
                    # print(index(0),'idex')
                    
                    tvm_list.append(row.values[1])
                #name='Trivandrum',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Trivandrum').first()
                if dist :
                    
                    for k in tvm_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Trivandrum pacjayath added succesfully')
                else :
                    logger.warning('Trivandrum District not found')
                # print(tvm_list,'tvm')
               
                ptnm=pd.read_excel("excel.xlsx", sheet_name='Pathanamthitta')
                for index, row in ptnm.iterrows():
                    # print(index(0),'idex')
                    
                    ptnm_list.append(row.values[1])
                #name='Pathanamthitta',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Pathanamthitta').first()
                if dist :
                    for k in ptnm_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('pathanam added succesfully')
                else :
                    logger.warning('Pathanam District not found')
                    
                
                alppzha=pd.read_excel("excel.xlsx", sheet_name='Alappuzha')
                for index, row in alppzha.iterrows():
                    # print(index(0),'idex')
                    
                    alppzha_list.append(row.values[1])
                #name='Alappuzha',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Alappuzha').first()
                if dist :
                    for k in alppzha_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('pathanam added succesfully')
                else :
                    logger.warning('Pathanam District not found')
                
                
                kttym=pd.read_excel("excel.xlsx", sheet_name='Kottayam')
                for index, row in kttym.iterrows():
                    # print(index(0),'idex')
                    
                    kttym_list.append(row.values[1])
                #name='Kottayam',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Kottayam').first()
                if dist :
                    for k in kttym_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Kottayam added succesfully')
                else :
                    logger.warning('Kottayam District not found')
                
                
                
                iduuki=pd.read_excel("excel.xlsx", sheet_name='Idukki')
                for index, row in iduuki.iterrows():
                    # print(index(0),'idex')
                    
                    iduuki_list.append(row.values[1])
                #name='Idukki',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Idukki').first()
                if dist :
                    for k in iduuki_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Idukki added succesfully')
                else :
                    logger.warning('Idukki District not found')
                    
                ernklm=pd.read_excel("excel.xlsx", sheet_name='Ernakulam')
                for index, row in ernklm.iterrows():
                    # print(index(0),'idex')
                    
                    ernklm_list.append(row.values[1])
                #name='Ernakulam',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Ernakulam').first()
                if dist :
                    for k in ernklm_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Ernakulam added succesfully')
                else :
                    logger.warning('Ernakulam District not found')
                    
                
                
                trissur=pd.read_excel("excel.xlsx", sheet_name='Thrissur')
                for index, row in trissur.iterrows():
                    # print(index(0),'idex')
                    
                    trissur_list.append(row.values[1])
                #name='Thrissur',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Thrissur').first()
                if dist :
                    for k in trissur_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Thrissur added succesfully')
                else :
                    logger.warning('Thrissur District not found')
                    
                    
                mlprm=pd.read_excel("excel.xlsx", sheet_name='Malappuram')
                for index, row in mlprm.iterrows():
                    # print(index(0),'idex')
                    
                    mlprm_list.append(row.values[1])
                #name='Malappuram',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Malappuram').first()
                if dist :
                    for k in mlprm_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Malappuram added succesfully')
                else :
                    logger.warning('Malappuram District not found')
                    
                kzkde=pd.read_excel("excel.xlsx", sheet_name='Kozhikode')
                for index, row in kzkde.iterrows():
                    # print(index(0),'idex')
                    
                    kzkde_list.append(row.values[1])
                #name='Kozhikode',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Kozhikode').first()
                if dist :
                    for k in kzkde_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Kozhikode added succesfully')
                else :
                    logger.warning('Kozhikode District not found')
                
                '''Wayanad'''
                
                wynd=pd.read_excel("excel.xlsx", sheet_name='Wayanad')
                for index, row in wynd.iterrows():
                    # print(index(0),'idex')
                    
                    wynd_list.append(row.values[1])
                #name='Wayanad',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Wayanad').first()
                if dist :
                    for k in wynd_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Wayanad added succesfully')
                else :
                    logger.warning('Wayanad District not found')
                
                '''Kannur'''
                
                knnur=pd.read_excel("excel.xlsx", sheet_name='Kannur')
                for index, row in knnur.iterrows():
                    # print(index(0),'idex')
                    
                    knnur_list.append(row.values[1])
                #name='Kannur',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Kannur').first()
                if dist :
                    for k in knnur_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Kannur added succesfully')
                else :
                    logger.warning('Kannur District not found')
                
                '''Kasargod'''
                
                ksrgd=pd.read_excel("excel.xlsx", sheet_name='Kasargode')
                for index, row in ksrgd.iterrows():
                    # print(index(0),'idex')
                    
                    ksrgd_list.append(row.values[1])
                #name='Kasargode',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Kasargode').first()
                if dist :
                    for k in ksrgd_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Kasargode added succesfully')
                else :
                    logger.warning('Kasargode District not found')
                
                '''Palakad'''
                
                ptnm=pd.read_excel("excel.xlsx", sheet_name='Palakkad')
                for index, row in ptnm.iterrows():
                    # print(index(0),'idex')
                    
                    plkd_list.append(row.values[1])
                #name='Palakkad',state=State.objects.get(id=104))
                dist= District.objects.filter(name='Palakkad').first()
                if dist :
                    for k in plkd_list :
                        Panchayath.objects.create(name=k,district=District.objects.get(id=dist.id))
                    logger.warning('Palakkad added succesfully')
                else :
                    logger.warning('Palakkad District not found')
                    
    
        return logger.warning('success')             
    
                    
