# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http.request import HttpRequest
from django.http.response import HttpResponse
from django.shortcuts import render
from  django.views import View
# Create your views here.
# raw = r'/media/color/zong.jpg'
# import re
# re.sub(r'\/media\/(.*)',r'\1',raw)
# phone = '18212345678'
#re.sub(r'(\d{3})\d{4}(\d{4})',r'\1****\2',phone)
#
from django.views.generic.list import ListView

from utils.commonutils import *
from goods.models import *

class IndexView(View):
    categorys = Category.objects.all()
    current_categoryid=Category.objects.first().id
    def get(self,request,categoryid=None,pagenum=1):
        if categoryid == None:categoryid=self.current_categoryid
        page,goods = get_objects_by_page(Goods.objects.filter(category_id=categoryid).all(),pagenum=pagenum)
        return  render(request,'index.html',{'categorys':self.categorys,'current_categoryid':int(categoryid),'goods':goods,'page':page})


def warpper_recommend_goods_cookie(fun):
    def _wrapper(goodsDetailsView,request,goodsid,*args,**kwargs):
        raw_commend_goods = request.COOKIES.get('recommend_goods','')
        commend_goods  = [item for item in raw_commend_goods.split() if item.strip()]
        recommend_goods=[Goods.objects.get(id = raw_commend_good) for raw_commend_good in commend_goods if raw_commend_good != goodsid and Goods.objects.get(id=goodsid).category_id ==
                         Goods.objects.get(id=raw_commend_good).category_id][:4]  # 修改成自己的算法
        response = fun(goodsDetailsView,request,goodsid,recommend_goods,*args,**kwargs)
        if goodsid not in commend_goods:
            commend_goods.append(goodsid)
        else:
            commend_goods.remove(goodsid)
            commend_goods.insert(0,goodsid)
        response.set_cookie('recommend_goods',' '.join(commend_goods),max_age=60*60*24*365*10)
        return response
    return _wrapper
class GoodsDetailsView(View):
    @warpper_recommend_goods_cookie
    def get(self,request,goodsid,recommend_goods=[]):
        goods = Goods.objects.get(id=goodsid)
        return render(request,'goodsdetatils.html',{'goods':goods,'recommend_goods':recommend_goods})