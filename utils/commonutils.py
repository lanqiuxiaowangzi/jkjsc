#coding=utf-8
from django.core.paginator import Paginator
def get_objects_by_page(object_list=None,pagenum=1,per_page=12):
    paginator = Paginator(object_list=object_list,per_page=per_page)
    pagenum = int(pagenum)
    if pagenum<1:pagenum=1
    if pagenum>paginator.num_pages:pagenum=paginator.num_pages
    # print str(paginator.num_pages)+"-------------"
    page = paginator.page(pagenum)
    # page.next_page_number()
    return page,page.object_list
#encoding=utf-8
import random
# import matplotlib.pyplot as plt
import string
import sys
import math
# from Canvas import ImageItem

from PIL import Image,ImageDraw,ImageFont,ImageFilter

#生成几位数的验证码
from io import BytesIO

number = 4
#生成验证码图片的高度和宽度
size = (129,53)
#背景颜色，默认为白色
bgcolor = (255,255,255)
#字体颜色，默认为蓝色
fontcolor = (0,0,0)
#干扰线颜色。默认为红色
linecolor = (0,0,0)
#是否要加入干扰线
draw_line = True
#加入干扰线条数的上下限
line_number = (1,5)

#用来随机生成一个字符串
def gene_text():
    # source = list(string.letters)
    # for index in range(0,10):
    #     source.append(str(index))
    source = ['0','1','2','3','4','5','6','7','8','9']
    # source = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H','I','J', 'K','L', 'M', 'N','O','P','Q','R',
    #           'S', 'T', 'U', 'V', 'W', 'Z','X', 'Y']
    return ''.join(random.sample(source,number))#number是生成验证码的位数
#用来绘制干扰线
def gene_line(draw,width,height):
    # begin = (random.randint(0, width), random.randint(0, height))
    # end = (random.randint(0, width), random.randint(0, height))
    begin = (0, random.randint(0, height)) # 起点
    end = (74, random.randint(0, height)) # 终点
    draw.line([begin, end], fill = linecolor,width=3)

#生成验证码
def gene_code():
    width,height = size #宽和高
    image = Image.new('RGBA',(width,height),bgcolor) #创建图片
    import  os
    path = os.path.join(os.getcwd(),'Arial.ttf')
    # print os.path.exists(path),'0-----------'
    font = ImageFont.truetype(path,36) #验证码的字体
    draw = ImageDraw.Draw(image)  #创建画笔
    text = gene_text() #生成字符串
    font_width, font_height = font.getsize(text)
    draw.text(((width - font_width) / number, (height - font_height) / number),text,\
            font= font,fill=fontcolor) #填充字符串
    if draw_line:
        gene_line(draw,width,height)
    image = image.transform((width+30,height+10), Image.AFFINE, (1,-0.3,0,-0.1,1,0),Image.BILINEAR)  #创建扭曲
    # image = image.transform((width+20,height+10), Image.AFFINE, (1,-0.3,0,-0.1,1,0),Image.BILINEAR)  #创建扭曲
    image = image.filter(ImageFilter.EDGE_ENHANCE_MORE) #滤镜，边界加强
    # image = image.filter(ImageFilter.EDGE_ENHANCE_MORE)  # 滤镜，边界加强
    bytes = BytesIO() # 内存
    image.save(bytes,format='png')  # 保存验证码图片
    return bytes.getvalue(),text # 获得二进制数据,

def get_provinces():
    with open('assets/province.json') as fr:
        raw_content = fr.read()
    return eval(raw_content)
def get_citys_by_provinceid(provinceid):
    with open('assets/city.json') as fr:
        raw_content = fr.read()
    citys = eval(raw_content)
    return citys[provinceid]
def get_areas_by_cityid(cityid):
    with open('assets/area.json') as fr:
        raw_content = fr.read()
    areas=eval(raw_content)
    return areas[cityid]
def get_citys_areas_by_provinceid(provinceid):
    citys = get_citys_by_provinceid(provinceid)
    city_id = citys[0]['id']
    areas = get_areas_by_cityid(city_id)
    return citys,areas

