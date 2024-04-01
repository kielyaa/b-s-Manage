#coding:utf-8
__author__ = "ila"
from django.db import models

from .model import BaseModel

from datetime import datetime



class sheng(BaseModel):
    __doc__ = u'''sheng'''
    __tablename__ = 'sheng'




    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    sheng=models.CharField ( max_length=255,null=False, unique=False, verbose_name='乡镇' )
    '''
    sheng=VARCHAR
    '''
    class Meta:
        db_table = 'sheng'
        verbose_name = verbose_name_plural = '乡镇'
class fupinzhengce(BaseModel):
    __doc__ = u'''fupinzhengce'''
    __tablename__ = 'fupinzhengce'



    __authTables__={}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    fupinzhengce=models.CharField ( max_length=255,null=False, unique=False, verbose_name='帮扶政策' )
    shiyongduixiang=models.CharField ( max_length=255, null=True, unique=False, verbose_name='适用对象' )
    zhengceneirong=models.TextField   ( null=False, unique=False, verbose_name='政策内容' )
    banburiqi=models.DateField   (  null=True, unique=False, verbose_name='颁布日期' )
    '''
    fupinzhengce=VARCHAR
    shiyongduixiang=VARCHAR
    zhengceneirong=Text
    banburiqi=Date
    '''
    class Meta:
        db_table = 'fupinzhengce'
        verbose_name = verbose_name_plural = '帮扶政策'
class fupinxinxi(BaseModel):
    __doc__ = u'''fupinxinxi'''
    __tablename__ = 'fupinxinxi'



    __authTables__={}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    xingming=models.CharField ( max_length=255,null=False, unique=False, verbose_name='姓名' )
    xingbie=models.CharField ( max_length=255,null=False, unique=False, verbose_name='性别' )
    touxiang=models.TextField   (  null=True, unique=False, verbose_name='头像' )
    sheng=models.CharField ( max_length=255,null=False, unique=False, verbose_name='乡镇' )
    jiatingzhuzhi=models.CharField ( max_length=255,null=False, unique=False, verbose_name='家庭住址' )
    chengyuanshuliang=models.IntegerField  (  null=True, unique=False, verbose_name='家庭成员数量' )
    yuannianshouru=models.FloatField   (  null=True, unique=False, verbose_name='原年收入' )
    yuankezhipeishouru=models.FloatField   (  null=True, unique=False, verbose_name='原可支配收入' )
    xiannianshouru=models.FloatField   (  null=True, unique=False, verbose_name='现年收入' )
    xiankezhipeishouru=models.FloatField   (  null=True, unique=False, verbose_name='现可支配收入' )
    kezhipeizhanbi=models.FloatField   (  null=True, unique=False, verbose_name='可支配占比' )
    pinkundengji=models.CharField ( max_length=255,null=False, unique=False, verbose_name='贫困等级' )
    fupinzhengce=models.CharField ( max_length=255,null=False, unique=False, verbose_name='帮扶政策' )
    fupinneirong=models.TextField   (  null=True, unique=False, verbose_name='帮扶内容' )
    fupinjieguo=models.CharField ( max_length=255,null=False, unique=False, verbose_name='帮扶结果' )
    dengjiriqi=models.DateField   (  null=True, unique=False, verbose_name='登记日期' )
    '''
    xingming=VARCHAR
    xingbie=VARCHAR
    touxiang=Text
    sheng=VARCHAR
    jiatingzhuzhi=VARCHAR
    chengyuanshuliang=Integer
    yuannianshouru=Float
    yuankezhipeishouru=Float
    xiannianshouru=Float
    xiankezhipeishouru=Float
    kezhipeizhanbi=Float
    pinkundengji=VARCHAR
    fupinzhengce=VARCHAR
    fupinneirong=Text
    fupinjieguo=VARCHAR
    dengjiriqi=Date
    '''
    class Meta:
        db_table = 'fupinxinxi'
        verbose_name = verbose_name_plural = '帮扶信息'
class systemintro(BaseModel):
    __doc__ = u'''systemintro'''
    __tablename__ = 'systemintro'



    __authTables__={}
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    title=models.CharField ( max_length=255,null=False, unique=False, verbose_name='标题' )
    subtitle=models.CharField ( max_length=255, null=True, unique=False, verbose_name='副标题' )
    content=models.TextField   ( null=False, unique=False, verbose_name='内容' )
    picture1=models.TextField   (  null=True, unique=False, verbose_name='图片1' )
    picture2=models.TextField   (  null=True, unique=False, verbose_name='图片2' )
    picture3=models.TextField   (  null=True, unique=False, verbose_name='图片3' )
    '''
    title=VARCHAR
    subtitle=VARCHAR
    content=Text
    picture1=Text
    picture2=Text
    picture3=Text
    '''
    class Meta:
        db_table = 'systemintro'
        verbose_name = verbose_name_plural = '系统简介'
