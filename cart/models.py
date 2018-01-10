# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
from User.models import User
from goods.models import Goods, Color, Size


class CartItem(models.Model):
    goodsid = models.IntegerField()
    colorid = models.IntegerField()
    sizeid = models.IntegerField()
    count = models.PositiveIntegerField() # 正数
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    isdelete = models.BooleanField(default=False)
    class Meta():
        unique_together=['goodsid','colorid','sizeid']
    def goods(self):
        return Goods.objects.get(id = self.goodsid)
    def color(self):
        return Color.objects.get(id= self.colorid)
    def size(self):
        return Size.objects.get(id = self.sizeid)
    def all_price(self):
        # print self.goods().price
        return int(str(self.count))*float(str(self.goods().price))
