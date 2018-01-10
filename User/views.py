# -*- coding: utf-8 -*-
from __future__ import unicode_literals
# from demjson import JSON
# import demjson
from django.http.request import HttpRequest
from django.http.response import HttpResponseRedirect, HttpResponse, JsonResponse
from django.shortcuts import render
from django.views import View

from cart.cartmanager import SessionCartManager
from User.models import *
from User.forms import *
from utils.commonutils import *
# Create your views here.
class RegisterView(View):
    def get(self,request):
        return render(request,'register.html')
    def post(self,request):
        datas = request.POST.dict()
        register_form = RegisterForm(datas)
        if register_form.is_valid():
            user = User.register(**register_form.cleaned_data)
            request.session['user']=user  # (redis)
            return HttpResponseRedirect('/user/usercenter/')
        else:
            return render(request,'register.html',{'errors':register_form.errors,'info':datas})
class VerifyView(View):
    def get(self,request):
        img ,verifycode = gene_code()
        request.session['verifycode']=verifycode
        return HttpResponse(img,content_type='image/png')

class LoginView(View):
    def get(self,request):
        redirct = request.GET.get('redirct','')
        return render(request,'login.html',{'redirct':redirct})
    def post(self,request):
        try:
          user = User.login(**request.POST.dict())
          request.session['user']=user
          SessionCartManager(request.session).migrate_session2db()
          if request.POST.get('redirct') == 'cart':
              return HttpResponseRedirect('/cart/cart.html')
          return HttpResponseRedirect('/user/usercenter')
        except UserNotExistException :
            return render(request,'login.html')
class LogoutView(View):
    def post(self,request):
        if 'user' in request.session:
            del request.session['user']
        return JsonResponse({'result':True})
class VerifyCodeView(View):
    def get(self,request):
        result = request.session.get('verifycode','-1111') == request.GET.get('verifycode')
        return JsonResponse({'result':result})
class UserCenterView(View):
    def get(self,request):
        return render(request,'usercenter.html')
html='''<div id='dizhi'><p>{name}</p><p>{phone}</p><p>{address}</p><p>{details}</p></div>'''  # 给android/ios发送html片段
class UserAddressView(View):
    def get(self,request):
        return render(request,'address.html',{'provinces':get_provinces()})
    def post(self,request):
        type = request.POST.get('type','1')
        if type == '1' :
            provinceId = request.POST.get('provinceId')
            citys ,areas = get_citys_areas_by_provinceid(provinceId)
            return JsonResponse({'citys':citys,'areas':areas})
        elif type == '2':
            cityId = request.POST.get('cityId')
            areas = get_areas_by_cityid(cityId)
            return JsonResponse({'areas': areas})
        elif type=='3':
            name = request.POST['name']
            phone = request.POST['phone']
            address = request.POST['address']
            user = request.session.get('user')
            # User().address_set.count()
            Address.objects.create(name=name,phone=phone,address=address,user=user,isdefault=(lambda count:True if count==0 else False)(user.address_set.count()))
            addresses  = []
            for address1 in Address.objects.all():
                name = address1.name
                phone = address1.phone
                address,details=(lambda a:(''.join(a[:-1]),''.join(a[-1])))(address1.address.split(','))
                addresses.append(html.format(name=name,phone=phone,address=address,details=details))
            return JsonResponse({'addresses':addresses})


# 用户没登录（+session+）--->(session---》数据库)---》（数据迁移）