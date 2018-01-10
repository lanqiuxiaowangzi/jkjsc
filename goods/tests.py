# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase

# Create your tests here.
from goods.models import *
from django.db.transaction import atomic  #事务
class MyTest(TestCase):
    # def setUp(self):
    #     with open('jiukuaijiu.json') as fr:
    #         import json
    #         datas = json.loads(fr.read())
    #         for data in datas:
    #             print data['category']
    #             print Category.objects.filter(name__contains=data['category']).count(), "------"
    #             cate = Category.objects.create(name=data['category'])
    #             _goods = data['goods']
    #             for goods in _goods:
    #                 good = Goods.objects.create(name=goods['goodsname'], desc=goods['goods_desc'],
    #                                             price=goods['goods_price'], oldprice=goods['goods_oldprice'],
    #                                             category=cate)
    #                 sizes = []
    #                 for _size in goods['sizes']:
    #                     if Size.objects.filter(name__contains=_size[0]).count() == 1:
    #                         size = Size.objects.get(name__contains=_size[0])
    #                     else:
    #                         size = Size.objects.create(name=_size[0], value=_size[1])
    #                     sizes.append(size)
    #                 colors = []
    #                 for _color in goods['colors']:
    #                     color = Color.objects.create(name=_color[0], value=_color[1])
    #                     colors.append(color)
    #
    #                 for _spec in goods['specs']:
    #                     goodsdeatils = GoodsDeatils.objects.create(name=_spec[0], goods=good)
    #                     for img in _spec[1]:
    #                         GoodsDeatilsItem.objects.create(value=img, goodsdeatils=goodsdeatils)
    #
    #                 for c in colors:
    #                     for s in sizes:
    #                         SKU.objects.create(goods=good, color=c, size=s)
    # def tearDown(self):
    #
    @atomic
    def test_model(self):
        with open('jiukuaijiu.json') as fr:
            import json
            datas = json.loads( fr.read())
            for data in datas:
                print data['category']
                print Category.objects.filter(name__contains=data['category']).count(),"------"
                cate = Category.objects.create(name=data['category'])
                _goods = data['goods']
                for goods in _goods:
                    good = Goods.objects.create(name=goods['goodsname'],desc=goods['goods_desc'],price=goods['goods_price'],oldprice=goods['goods_oldprice'],category = cate )
                    sizes =[]
                    for _size in goods['sizes']:
                        if Size.objects.filter(name__contains=_size[0]).count()==1:
                             size = Size.objects.get(name__contains=_size[0])
                        else:
                            size = Size.objects.create(name=_size[0],value=_size[1])
                        sizes.append(size)
                    colors = []
                    for _color in goods['colors']:
                        color = Color.objects.create(name=_color[0],value=_color[1])
                        colors.append(color)

                    for _spec in goods['specs']:
                        goodsdeatils = GoodsDeatils.objects.create(name=_spec[0],goods=good)
                        for img in _spec[1]:
                            GoodsDeatilsItem.objects.create(value=img,goodsdeatils=goodsdeatils)

                    for c in colors:
                        for s in sizes:
                            SKU.objects.create(goods=good,color=c,size=s)

    def test_quer(self):
        print '===='*10
        print Goods.objects.all()