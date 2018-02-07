#coding=utf-8
from collections import OrderedDict

from django.db.models import F

from cart.models import *
class CartManager(object):
    def add(self, goodsid, colorid, sizeid, count, *args, **kwargs):
        '''添加商品，如果商品已经存在就更新商品的数量(self.update())，否则直接放到购物车'''
        pass

    def delete(self, goodsid, colorid, sizeid, *args, **kwargs):
        '''删除一个购物项'''
        pass

    def get_all(self, *args, **kwargs):
        ''':return CartItem  多个购物项'''
        pass
    def update(self,goodsid,colorid,sizeid,step,*args,**kwargs):
        '''更新购物项的数据,添加减少购物项数据'''
        pass

class SessionCartManager(CartManager):
    cart_name = 'cart'
    def __init__(self,session):
        self.session = session
        # 创建购物车[cartItem1,cartItem2]  {'goodsid,colorid,sizeid':catr}
        if self.cart_name not  in self.session:
            self.session[self.cart_name]=OrderedDict()
    def add(self,goodsid,colorid,sizeid,count,*args,**kwargs):
        key = self.__gen_key(goodsid,colorid,sizeid)
        if key in self.session[self.cart_name]:
            self.update(goodsid,colorid,sizeid,count,*args,**kwargs)
        else:
            self.session[self.cart_name][key]=CartItem(goodsid=goodsid,colorid=colorid,sizeid=sizeid,count=count)
            pass
    def delete(self,goodsid,colorid,sizeid,*args,**kwargs):
        key = self.__gen_key(goodsid,colorid,sizeid)
        if key in self.session[self.cart_name]:
            del self.session[self.cart_name][key]
    def get_all(self,*args,**kwargs):
        return self.session[self.cart_name].values()
    def update(self,goodsid,colorid,sizeid,step,*args,**kwargs):
        key = self.__gen_key(goodsid,colorid,sizeid)
        if key in self.session[self.cart_name]:
            cartitem = self.session[self.cart_name][key]
            cartitem.count=int(str(cartitem.count))+int(step)
            # print cartitem.count,type(cartitem.count),'购物车数据'
        else:
            raise Exception('SessionManager中的update出错了')
    def __gen_key(self,goodsid,colorid,sizeid):
        return goodsid+','+colorid+','+sizeid

    def migrate_session2db(self):
        if 'user'  in self.session:
            user = self.session['user']
            for cartitem in self.get_all():
               if  CartItem.objects.filter(goodsid=cartitem.goodsid,sizeid=cartitem.sizeid,colorid=cartitem.colorid) == 0:
                cartitem.user = user
                cartitem.save()
               else:
                   item = CartItem.objects.get(goodsid=cartitem.goodsid, sizeid=cartitem.sizeid, colorid=cartitem.colorid)
                   item.count=int(str(item.count))+int(cartitem.count)
                   item.save()

            del self.session[self.cart_name]


class DBCartManager(CartManager):
    def __init__(self,user):
        self.user = user
    def get_all(self,*args,**kwargs):
        return self.user.cartitem_set.order_by('id').filter(isdelete=False).all()
    def delete(self,goodsid,colorid,sizeid,*args,**kwargs):
        self.user.cartitem_set.filter(goodsid=goodsid,colorid=colorid,sizeid=sizeid).update(isdelete=True)
    def add(self,goodsid,colorid,sizeid,count,*args,**kwargs):
        from django.db.models import F
        if self.user.cartitem_set.filter(goodsid=goodsid,colorid=colorid,sizeid=sizeid).count()==1:
           self.update(goodsid,colorid,sizeid,count,*args,**kwargs)
        else:
            CartItem.objects.create(goodsid=goodsid,colorid=colorid,sizeid=sizeid,count=count,user=self.user)
    def update(self,goodsid,colorid,sizeid,step,*args,**kwargs):
        self.user.cartitem_set.filter(goodsid=goodsid, colorid=colorid, sizeid=sizeid).update(
            count=F('count') + int(step))
    def get_cart_item(self,goodsid,colorid,sizeid,*args,**kwargs):
        return self.user.cartitem_set.get(goodsid=goodsid,sizeid=sizeid,colorid=colorid)
# 工厂模式
def get_cart_manager(request):
    #根据当前的状态，返回
    if request.session.get('user'):
        return DBCartManager(request.session.get('user'))
    return SessionCartManager(request.session)


