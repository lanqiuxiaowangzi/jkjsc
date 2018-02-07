#coding:utf-8
from __future__ import unicode_literals

from django.db import models

# Create your models here.
from User.models import User, Address
from goods.models import Goods


class Order(models.Model):
    out_trade_num = models.UUIDField(auto_created=True,unique=True) # 调用支付的时候使用的
    order_num = models.CharField(max_length=50) #20180111920123,给用户看的
    address = models.ForeignKey(Address,on_delete=models.CASCADE)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    trade_no = models.CharField(max_length=120,default='')# 商户和支付宝交易的一个凭证
    status = models.CharField(max_length=20,default='待付款') # 待付款，待发货，待收货，待评价,完成
    payway = models.CharField(max_length=20,default='alipay')


class OrderItem(models.Model):
    goodsid = models.IntegerField()
    colorid = models.IntegerField()
    sizeid = models.IntegerField()
    count = models.PositiveIntegerField()  # 正数
    order = models.ForeignKey(Order,on_delete=models.CASCADE)

    def goods(self):
        return Goods.objects.get(id=self.goodsid)

    def all_price(self):
        # print self.goods().price
        return int(str(self.count)) * float(str(self.goods().price))
