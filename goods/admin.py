# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from goods.models import *
class SKUInline(admin.TabularInline):
    model = SKU
    extra = 1
class GoodsDeatilsItemInline(admin.TabularInline):
    model = GoodsDeatilsItem
    extra = 1

class GoodsModelAdmin(admin.ModelAdmin):
    list_display = ['name','desc','price','oldprice','category']
    list_per_page = 10
    search_fields = ['name']
    list_filter = ['category__name']
    inlines = [GoodsDeatilsItemInline,SKUInline]  # inline内联显示
class SKUModelAdmin(admin.ModelAdmin):
    list_display = ['goods','color','size','count']
    list_per_page = 10
    list_filter = ['goods']
    search_fields = ['goods__name']

class GoodsDeatilsItemModelAdmin(admin.ModelAdmin):
    inlines = [GoodsDeatilsItemInline]

admin.site.register(Category)
admin.site.register(Goods,GoodsModelAdmin)
admin.site.register(Color)
admin.site.register(Size)
admin.site.register(GoodsDeatils)
admin.site.register(GoodsDeatilsItem)
admin.site.register(SKU,SKUModelAdmin)
