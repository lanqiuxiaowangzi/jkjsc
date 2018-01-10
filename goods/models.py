# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=100,unique=True,verbose_name='类别名称')
    def __unicode__(self):
        return u'%s'%self.name
    class Meta(object):
        verbose_name_plural='类别'
        ordering=['id']
class Goods(models.Model):
    name = models.CharField(max_length=100,verbose_name='名称')
    desc = models.CharField(max_length=100,verbose_name='描述')
    price = models.DecimalField(max_digits=5,decimal_places=2,verbose_name='价格')
    oldprice = models.DecimalField(max_digits=5,decimal_places=2,verbose_name='原价')
    category = models.ForeignKey(Category,verbose_name='类别',on_delete=models.CASCADE)
    def __unicode__(self):
        return u'%s' % self.name
    def img(self):
        return self.sku_set.first().color.value
    def colors(self):
        # 红色 (10,20,30,40)
        colors = []
        for sku in self.sku_set.all():
            color = sku.color
            if color not  in colors:
                colors.append(color)
        return colors
    def sizes(self):
        sizes = []
        for sku in self.sku_set.all():
            size = sku.size
            if size not  in sizes:
                sizes.append(size)
        return sizes
    def detatils(self):
        #[(name,['img1','img2']),]
        import collections
        datas =  collections.OrderedDict()
        for details in self.goodsdeatilsitem_set.all():
            #{'商品详情':['img1'],'sad':['ads','asdsad']}
            if details.name() not  in datas:
                datas[details.name()]=[details.value]
            else:
                datas[details.name()].append(details.value)
        return datas
    class Meta(object):
        verbose_name_plural='商品'
        ordering=['id']

class Color(models.Model):
    name = models.CharField(max_length=20,verbose_name='名称')
    value = models.ImageField(upload_to='media/color/',verbose_name='值')

    def __unicode__(self):
        return u'%s' % self.name

    class Meta(object):
        verbose_name_plural = '颜色'
        ordering = ['id']

            # goods = models.ForeignKey(Goods)
# 多对多关系
class Size(models.Model):
    name = models.CharField(max_length=20,verbose_name='名称')
    value = models.CharField(max_length=20,verbose_name='值')
    # goodsset = models.ManyToManyField(Goods)
    def __unicode__(self):
        return u'%s' % self.name

    class Meta(object):
        verbose_name_plural = '尺寸'
        ordering = ['id']
class GoodsDeatils(models.Model):
    # goods = models.ForeignKey(Goods,verbose_name='商品')
    name =   models.CharField(max_length=20,verbose_name='名称',unique=True)
    def __unicode__(self):
        return u'%s' % self.name

    class Meta(object):
        verbose_name_plural = '详情'
        ordering = ['id']
class GoodsDeatilsItem(models.Model):
    goods = models.ForeignKey(Goods,on_delete=models.CASCADE)
    goodsdeatils = models.ForeignKey(GoodsDeatils,verbose_name='详情',on_delete=models.CASCADE)
    value = models.ImageField(upload_to='media/',verbose_name='图片')

    def name(self):
        return self.goodsdeatils.name
    def __unicode__(self):
        return u'%s' %self.goodsdeatils.name

    class Meta(object):
        verbose_name_plural = '详情条目'
        ordering = ['id']
class SKU(models.Model):
    color = models.ForeignKey(Color,verbose_name='颜色',on_delete=models.CASCADE)
    size = models.ForeignKey(Size,verbose_name='尺寸',on_delete=models.CASCADE)
    goods = models.ForeignKey(Goods,verbose_name='商品',on_delete=models.CASCADE)
    count = models.IntegerField(default=100,verbose_name='库存')
    #100--->100--->500
    # 火车票100 --->100
    class Meta(object):
        verbose_name_plural = '库存'
        ordering = ['id']
