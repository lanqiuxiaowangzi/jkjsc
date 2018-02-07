# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db.models.expressions import F
from django.http.response import HttpResponse, HttpResponseRedirect
from django.shortcuts import render

# Create your views here.
from django.views import View

from User.models import Address
from cart.cartmanager import get_cart_manager
from cart.models import CartItem
from goods.models import SKU


class OrderView(View):
    def get(self,request):
         import urllib
         import jsonpickle
         # 数据做操作之前，先做判断(用户登录?)
         if not  request.session.get('user'):
             return HttpResponseRedirect('/user/login?redirct=order&cartitems='+request.GET.get('cartitems'))
         else:
             #[{'asd':"sdad","sadsa","sadsad","asds"},{"sdad","asdsa","asdsad"}]
            # print request.GET.get('cartitems'),'========='
            raw_cartitems = jsonpickle.loads('['+request.GET.get('cartitems')+']')
            # print raw_cartitems[0],'---------------'
            # 还没有创建订单()
            request.session['raw_cartitems']=raw_cartitems
            return HttpResponseRedirect('/order/order.html')


class OrderListView(View):
    def get(self,request):
        cart_manager = get_cart_manager(request)
        cartitems = [cart_manager.get_cart_item(**item) for item in request.session.get('raw_cartitems',[])]
        address = request.session.get('user').address_set.get(isdefault=True)
        allprice = 0
        for cartitem in cartitems:
            allprice+=cartitem.all_price()
        return render(request,'order.html',{'address':address,'cartitems':cartitems,'allpirce':allprice})

#Order  订单做的事情
# 将购物项转换成订单项(待支付)
# 将购物项从购物车删除
# 修改库存
# 根据支付方式跳转到支付界面
# 支付成功
# 验签
# 修改订单状态--->待发货
from .models import *
from django.db.transaction import atomic
from  utils.alipay import AliPay
alipay = AliPay( appid='2016082600316845', app_notify_url='http://127.0.0.1:8000/order/checkorder', app_private_key_path='app_private_key',
                 alipay_public_key_path='alipay_public_key', return_url='http://127.0.0.1:8000/order/checkorder')

class ToOrderView(View):
    @atomic
    def get(self,request):
        import  json,uuid,datetime
        cartitems = json.loads(request.GET.get('cartitems'))
        raw_order={
        'address': Address.objects.get(id = request.GET.get('address')),
        'payway':request.GET.get('payway','alipay'),
        'out_trade_num':uuid.uuid4().get_hex(),
        'order_num':datetime.datetime.today().strftime('%Y%m%d%H%M%S'),
         'user':request.session.get('user'),
        }
        order = Order.objects.create(**raw_order)
        total_amount = 0
        for item in cartitems:
            orderitem = OrderItem.objects.create(order=order,**item) # 产生订单项
            total_amount+=orderitem.all_price()
            CartItem.objects.filter(**item).delete()
            SKU.objects.filter(goods_id=item['goodsid'],color_id=item['colorid'],size_id=item['sizeid']).update(count=F('count')-int(item['count']))
            if 'raw_cartitems' in request.session:
                del request.session['raw_cartitems']
        params = alipay.direct_pay(subject='九块九电商支付',total_amount=str(total_amount),out_trade_no=order.out_trade_num)
        import urllib
        url = 'https://openapi.alipaydev.com/gateway.do?'+params
        # print url
        return HttpResponseRedirect(url)


class CheckOrderView(View):
    def get(self,request):
        d = request.GET.dict()
        sign = d.pop('sign')
        if alipay.verify(d,sign):
            out_trade_no = d.get('out_trade_no')
            order  = Order.objects.get(out_trade_num=out_trade_no)
            if order.status == '待付款':
                order.status='待发货'
                order.trade_no=d.get('trade_no')
                order.save()
            # return HttpResponse('success')
            return HttpResponse('付款成功')
        else:
            return HttpResponse('支付失败')