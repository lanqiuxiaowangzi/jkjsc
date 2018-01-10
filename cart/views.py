# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http.response import HttpResponse, HttpResponseRedirect, JsonResponse
from django.shortcuts import render
# 根据你的状态做不同的操作---->.....?
# Create your views here.
from django.views import View
from cart.cartmanager import *
class CartListView(View):
    def get(self,request):
        cartitems = get_cart_manager(request).get_all()
        return render(request,'cart.html',{'cartitems':cartitems})


class CartView(View):
    # curd
    def post(self,request):
        request.session.modified = True # session只有认为数据发生改变的时候，才会调用存储的方法

        if request.POST.get('type') == 'add':
            self.add(request)
            return HttpResponseRedirect('cart.html')
        elif request.POST.get('type') == 'incre':
            self.incre(request)
            return JsonResponse({'result':True})
        elif request.POST.get('type') == 'min':
            self.min(request)
            return JsonResponse({'result': True})
        elif request.POST.get('type') == 'delete':
            self.delete(request)
            return JsonResponse({'result':True})

    def add(self,request):
        cart_manager = get_cart_manager(request)
        cart_manager.add(**request.POST.dict())
    def delete(self,request):
        cart_manager = get_cart_manager(request)
        cart_manager.delete(**request.POST.dict())
    def incre(self,request):
        cart_manager = get_cart_manager(request)
        cart_manager.update(step=1,**request.POST.dict())
    def min(self,request):
        cart_manager = get_cart_manager(request)
        cart_manager.update(step=-1,**request.POST.dict())


