#coding=utf-8
from django.db.transaction import atomic
from  goods.models import *

def test_model():
    with open('jiukuaijiu.json') as fr:
        import json
        datas = json.loads(fr.read())
        for data in datas:
            print data['category']
            print Category.objects.filter(name=data['category']).count(), "------"
            cate = Category.objects.create(name=data['category'])
            _goods = data['goods']
            for goods in _goods:
                good = Goods.objects.create(name=goods['goodsname'], desc=goods['goods_desc'],
                                            price=goods['goods_price'], oldprice=goods['goods_oldprice'], category=cate)
                sizes = []
                for _size in goods['sizes']:
                    if Size.objects.filter(name=_size[0]).count() == 1:
                        size = Size.objects.get(name=_size[0])
                    else:
                        size = Size.objects.create(name=_size[0], value=_size[1])
                    sizes.append(size)
                colors = []
                for _color in goods['colors']:
                    color = Color.objects.create(name=_color[0], value=_color[1])
                    colors.append(color)

                for _spec in goods['specs']:
                    if GoodsDeatils.objects.filter(name=_spec[0]).count()==1:
                        goodsdeatils=GoodsDeatils.objects.get(name=_spec[0])
                    else:
                        goodsdeatils = GoodsDeatils.objects.create(name=_spec[0])
                    for img in _spec[1]:
                        GoodsDeatilsItem.objects.create(value=img, goodsdeatils=goodsdeatils,goods=good)

                for c in colors:
                    for s in sizes:
                        SKU.objects.create(goods=good, color=c, size=s)

def deleteall():
    Category.objects.filter().delete()
    Color.objects.filter().delete()
    Size.objects.filter().delete()
    GoodsDeatils.objects.filter().delete()