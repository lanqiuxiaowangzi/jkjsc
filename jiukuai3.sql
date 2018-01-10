/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.1.72-community : Database - jiukuaijiu3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jiukuaijiu3` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jiukuaijiu3`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add sku',7,'add_sku'),(20,'Can change sku',7,'change_sku'),(21,'Can delete sku',7,'delete_sku'),(22,'Can add size',8,'add_size'),(23,'Can change size',8,'change_size'),(24,'Can delete size',8,'delete_size'),(25,'Can add goods deatils item',9,'add_goodsdeatilsitem'),(26,'Can change goods deatils item',9,'change_goodsdeatilsitem'),(27,'Can delete goods deatils item',9,'delete_goodsdeatilsitem'),(28,'Can add color',10,'add_color'),(29,'Can change color',10,'change_color'),(30,'Can delete color',10,'delete_color'),(31,'Can add goods',11,'add_goods'),(32,'Can change goods',11,'change_goods'),(33,'Can delete goods',11,'delete_goods'),(34,'Can add category',12,'add_category'),(35,'Can change category',12,'change_category'),(36,'Can delete category',12,'delete_category'),(37,'Can add goods deatils',13,'add_goodsdeatils'),(38,'Can change goods deatils',13,'change_goodsdeatils'),(39,'Can delete goods deatils',13,'delete_goodsdeatils'),(40,'Can add user',14,'add_user'),(41,'Can change user',14,'change_user'),(42,'Can delete user',14,'delete_user'),(43,'Can add address',15,'add_address'),(44,'Can change address',15,'change_address'),(45,'Can delete address',15,'delete_address'),(46,'Can add cart item',16,'add_cartitem'),(47,'Can change cart item',16,'change_cartitem'),(48,'Can delete cart item',16,'delete_cartitem');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$36000$fnrM1kDMwpKQ$DYpIOe06MnHrkLXIhzmEM9risUe6yhobybSh0YPv+iQ=','2018-01-04 08:28:55',1,'shilei','','','',1,1,'2018-01-04 08:27:10');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `cart_cartitem` */

DROP TABLE IF EXISTS `cart_cartitem`;

CREATE TABLE `cart_cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NOT NULL,
  `colorid` int(11) NOT NULL,
  `sizeid` int(11) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_cartitem_goodsid_colorid_sizeid_0b632a19_uniq` (`goodsid`,`colorid`,`sizeid`),
  KEY `cart_cartitem_user_id_292943b8_fk_User_user_id` (`user_id`),
  CONSTRAINT `cart_cartitem_user_id_292943b8_fk_User_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cart_cartitem` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(16,'cart','cartitem'),(5,'contenttypes','contenttype'),(12,'goods','category'),(10,'goods','color'),(11,'goods','goods'),(13,'goods','goodsdeatils'),(9,'goods','goodsdeatilsitem'),(8,'goods','size'),(7,'goods','sku'),(6,'sessions','session'),(15,'User','address'),(14,'User','user');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2018-01-04 07:43:16'),(2,'auth','0001_initial','2018-01-04 07:43:20'),(3,'admin','0001_initial','2018-01-04 07:43:21'),(4,'admin','0002_logentry_remove_auto_add','2018-01-04 07:43:21'),(5,'contenttypes','0002_remove_content_type_name','2018-01-04 07:43:21'),(6,'auth','0002_alter_permission_name_max_length','2018-01-04 07:43:21'),(7,'auth','0003_alter_user_email_max_length','2018-01-04 07:43:22'),(8,'auth','0004_alter_user_username_opts','2018-01-04 07:43:22'),(9,'auth','0005_alter_user_last_login_null','2018-01-04 07:43:22'),(10,'auth','0006_require_contenttypes_0002','2018-01-04 07:43:22'),(11,'auth','0007_alter_validators_add_error_messages','2018-01-04 07:43:22'),(12,'auth','0008_alter_user_username_max_length','2018-01-04 07:43:22'),(13,'auth','0009_alter_user_last_name_max_length','2018-01-04 07:43:23'),(14,'sessions','0001_initial','2018-01-04 07:43:23'),(15,'goods','0001_initial','2018-01-04 08:06:46'),(16,'goods','0002_auto_20180108_1434','2018-01-08 06:34:45'),(17,'User','0001_initial','2018-01-08 12:55:32'),(18,'User','0002_auto_20180106_1605','2018-01-08 12:55:32'),(19,'User','0003_address','2018-01-08 12:55:33'),(20,'cart','0001_initial','2018-01-10 02:24:37');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('eh3t5hjtncsveudxnb9pdkv2xghugx0o','OTI1ZTM4MjBmMzJmMzVlZWIxMDk4ZGI0MzBlOWY2M2M1OTliN2U4Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjRkYWMwNGJkZDEwMWYzZWVhY2M1YzZiNDYwNTkyMTVlNGI0ZWVlN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-18 08:28:55');

/*Table structure for table `goods_category` */

DROP TABLE IF EXISTS `goods_category`;

CREATE TABLE `goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `goods_category` */

insert  into `goods_category`(`id`,`name`) values (13,'内衣'),(2,'女装'),(8,'家纺'),(7,'居家'),(11,'数码'),(9,'文体'),(5,'母婴'),(12,'电器'),(1,'男装'),(4,'箱包'),(6,'美妆'),(10,'美食'),(14,'装饰'),(3,'鞋子');

/*Table structure for table `goods_color` */

DROP TABLE IF EXISTS `goods_color`;

CREATE TABLE `goods_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `goods_color` */

insert  into `goods_color`(`id`,`name`,`value`) values (1,'红色','color/hong_Dm4fQ6U.jpg'),(2,'绿色','color/lv_cTMJg2K.jpg'),(3,'黄色','color/huang_bvCMlhn.jpg'),(4,'黑色','color/hei_rFOWelp.jpg'),(5,'白色','color/bai_mt1VrH5.jpg'),(6,'三号色','color/san.jpg'),(7,'红色','color/hong_y7wQwRw.jpg'),(8,'黄色','color/huang_NKcgOlT.jpg'),(9,'紫色','color/zi_umktLLD.jpg'),(10,'蓝色','color/lan_BKQdpOj.jpg'),(11,'红色','color/hong_zHPXVqY.jpg'),(12,'蓝色','color/lan_IThSO4Z.jpg'),(13,'蓝色','color/lan_ELubwxG.jpg'),(14,'绿色','color/lv_H5hkmmq.jpg'),(15,'红色','color/hong_4FhJTrJ.jpg'),(16,'蓝色','color/lan_7rd4yDs.jpg'),(17,'灰色','color/hui.jpg'),(18,'蓝色','color/lan.jpg'),(19,'红色','color/hong_UO2LzHh.jpg'),(20,'黑色','color/hei_cOOnNKI.jpg'),(21,'黑色','color/hei_kYyKPNv.jpg'),(22,'绿色','color/lv_sxlJZTq.jpg'),(23,'白色','color/bai_B7tmsjh.jpg'),(24,'黑色','color/hei_sNOao2p.jpg'),(25,'橘色','color/ju.jpg'),(26,'紫色','color/zi.jpg'),(27,'斑马色','color/ban_fSqFE03.jpg'),(28,'黑色','color/hei_ZyxMfgc.jpg'),(29,'白色','color/bai.jpg'),(30,'黑色','color/hei_goVnbhs.jpg'),(31,'绿色','color/lv_eFlravj.jpg'),(32,'红色','color/hong_nwQGdMd.jpg'),(33,'棕色','color/zong_v7JDaAc.jpg'),(34,'斑马色','color/ban.jpg'),(35,'黑色','color/hei_3vOTo3s.jpg'),(36,'绿色','color/lv.jpg'),(37,'黄','color/huang.jpg'),(38,'黑色','color/hei_JeBWGjF.jpg'),(39,'黑色','color/hei_LfSKcUV.jpg'),(40,'黑色','color/hei_1d7yrVm.jpg'),(41,'黑色','color/hei.jpg'),(42,'红色','color/hongse.jpg'),(43,'黑色','color/h_2og4uJv.jpg'),(44,'红色','color/hong.jpg'),(45,'棕色','color/zong.jpg');

/*Table structure for table `goods_goods` */

DROP TABLE IF EXISTS `goods_goods`;

CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `oldprice` decimal(5,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_category_id_da3507dd_fk_goods_category_id` (`category_id`),
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `goods_goods` */

insert  into `goods_goods`(`id`,`name`,`desc`,`price`,`oldprice`,`category_id`) values (1,'90绒大毛领保暖羽绒服','梦娜世家2017女式新款修身中长款毛领时尚显瘦欧美气质羽绒服A88','99.00','499.00',2),(2,'秋时尚印花两件套装裙','秋装时尚印花复古时尚休闲两件套装裙子','35.00','100.00',2),(3,'韩版侧开叉宽松毛衣','新款韩版前短后长 侧开叉宽松圆领 纯色大码套头针织衫外套','39.00','369.00',2),(4,'无袖套头毛衣马甲女秋','2017秋季新款上衣潮 笑脸学院风针织背心无袖套头毛衣马甲女春秋','39.00','296.00',2),(5,'红色原宿bf风小外套','诗赫姿秋新款红色原宿bf风牛仔小外套女','69.00','229.00',2),(6,'不规则毛边喇叭牛仔裤','诗赫姿秋新款不规则毛边喇叭长裤牛仔裤','65.00','199.00',2),(7,'宽松短款牛仔外套','诗赫姿秋新款宽松短款时尚绣花牛仔外套女','79.00','259.00',2),(8,'气质收腰显瘦连衣裙','诗赫姿秋新款气质时尚收腰显瘦连衣裙女','69.00','199.00',2),(9,'针织袖拼接毛呢打底裙','诗赫姿秋新款针织袖时尚拼接毛呢打底裙','69.00','199.00',2),(10,'双排扣假两件连衣裙','诗赫姿秋新款简约双排扣假两件连衣裙女','69.00','299.00',2),(11,'修身包臀蕾丝打底裙','诗赫姿秋新款修身包臀蕾丝打底裙连衣裙','69.00','199.00',2),(12,'修身显瘦格子打底裙','诗赫姿秋新款修身显瘦格子打底裙连衣裙','69.90','259.00',2),(13,'条纹显瘦网纱连衣裙','诗赫姿秋新款条纹时尚显瘦网纱连衣裙女','69.90','199.00',2),(14,'显瘦蕾丝中长连衣裙','诗赫姿秋新款时尚显瘦蕾丝中长连衣裙女','69.00','255.00',2),(15,'时尚修身两件套装裙','诗赫姿秋新款时尚修身两件套装连衣裙女','68.90','299.00',2),(16,'条纹针织包臀连衣裙','诗赫姿秋条纹时尚针织包臀打底裙连衣裙','65.00','199.00',2),(17,'系带显瘦宽松套装','诗赫姿秋系带显瘦宽松时尚套装阔腿裤女','69.90','259.00',2),(18,'秋季V领镂空蕾丝衫','新款大码女装蕾丝衫韩版修身V领长袖打底衫网纱镂空上衣','28.00','124.00',2),(19,'松紧腰PU皮短裤','秋冬时尚百搭高腰PU皮阔腿短裤女打底皮裤','19.90','199.00',2),(20,'高腰刺绣PU皮短裙','秋冬时尚高腰刺绣PU皮短裙女打底半身裙','29.90','199.00',2),(21,'修身短款呢子小外套','秋装新款女装毛呢短外套女 时尚修身短款呢子小西装潮','39.00','199.00',2),(22,'中长款双面呢毛呢外套','中长款双面呢毛呢外套','33.00','256.00',2);

/*Table structure for table `goods_goodsdeatils` */

DROP TABLE IF EXISTS `goods_goodsdeatils`;

CREATE TABLE `goods_goodsdeatils` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `goods_goodsdeatils` */

insert  into `goods_goodsdeatils`(`id`,`name`) values (1,'参数规格'),(2,'整体款式'),(3,'模特实拍');

/*Table structure for table `goods_goodsdeatilsitem` */

DROP TABLE IF EXISTS `goods_goodsdeatilsitem`;

CREATE TABLE `goods_goodsdeatilsitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goodsdeatils_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsdeatilsitem_goods_id_82c6cff0_fk_goods_goods_id` (`goods_id`),
  KEY `goods_goodsdeatilsit_goodsdeatils_id_826cb0e7_fk_goods_goo` (`goodsdeatils_id`),
  CONSTRAINT `goods_goodsdeatilsitem_goods_id_82c6cff0_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `goods_goodsdeatilsit_goodsdeatils_id_826cb0e7_fk_goods_goo` FOREIGN KEY (`goodsdeatils_id`) REFERENCES `goods_goodsdeatils` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

/*Data for the table `goods_goodsdeatilsitem` */

insert  into `goods_goodsdeatilsitem`(`id`,`value`,`goods_id`,`goodsdeatils_id`) values (1,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',1,1),(2,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',1,2),(3,'/media/1_mpwtoGA.jpg',1,3),(4,'/media/2_UuQkY4b.jpg',1,3),(5,'/media/3_ViMgWv6.jpg',1,3),(6,'/media/4_BDmgdFv.jpg',1,3),(7,'/media/5_ozWIsej.jpg',1,3),(8,'/media/6_Pny8yTQ.jpg',1,3),(9,'/media/7_K4tB09L.jpg',1,3),(10,'/media/8_60MJMwS.jpg',1,3),(11,'/media/9_8YomGSk.jpg',1,3),(12,'/media/10_vonnLjk.jpg',1,3),(13,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',2,1),(14,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',2,2),(15,'/media/1_DNiW0D5.jpg',2,3),(16,'/media/2_eHi0Rix.jpg',2,3),(17,'/media/3_2e1cWcs.jpg',2,3),(18,'/media/4_D0ck80V.jpg',2,3),(19,'/media/5_bxMyxv5.jpg',2,3),(20,'/media/6_Z4j72Ft.jpg',2,3),(21,'/media/7_3QbFC0z.jpg',2,3),(22,'/media/8_OQGcrwL.jpg',2,3),(23,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',3,1),(24,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',3,2),(25,'/media/1_QoLgPlj.jpg',3,3),(26,'/media/2_lHY8mE9.jpg',3,3),(27,'/media/3_GiFc4gk.jpg',3,3),(28,'/media/4_IBO3QkF.jpg',3,3),(29,'/media/5_NjssJjH.jpg',3,3),(30,'/media/6_TJDGChY.jpg',3,3),(31,'/media/7_Sv0tWHZ.jpg',3,3),(32,'/media/8_MDhSM1I.jpg',3,3),(33,'/media/9_BUoWkrL.jpg',3,3),(34,'/media/10_k9f1eEK.jpg',3,3),(35,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',4,1),(36,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',4,2),(37,'/media/1_ORTzeTY.jpg',4,3),(38,'/media/2_RbgTYId.jpg',4,3),(39,'/media/3_1CyOSyR.jpg',4,3),(40,'/media/4_0490Pq4.jpg',4,3),(41,'/media/5_gk51Yc1.jpg',4,3),(42,'/media/6_MNo76Wb.jpg',4,3),(43,'/media/7_4JyLPNO.jpg',4,3),(44,'/media/8_VX32aT2.jpg',4,3),(45,'/media/9_x8mkplo.jpg',4,3),(46,'/media/10_1OVaH2E.jpg',4,3),(47,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',5,1),(48,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',5,2),(49,'/media/1_0IilSTS.jpg',5,3),(50,'/media/2_dU6RLKQ.jpg',5,3),(51,'/media/3_eLYKeSJ.jpg',5,3),(52,'/media/4_mwUqQ7u.jpg',5,3),(53,'/media/5_AOfqMfX.jpg',5,3),(54,'/media/6_LE1Qg19.jpg',5,3),(55,'/media/7_7RVZFif.jpg',5,3),(56,'/media/8_W5zUBfp.jpg',5,3),(57,'/media/9_Py3cDKv.jpg',5,3),(58,'/media/10_w9OXfoC.jpg',5,3),(59,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',6,1),(60,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',6,2),(61,'/media/1_f8GP2Js.jpg',6,3),(62,'/media/2_mewqiym.jpg',6,3),(63,'/media/3_T3najRK.jpg',6,3),(64,'/media/4_Zn7OFjf.jpg',6,3),(65,'/media/5_z6JRqPe.jpg',6,3),(66,'/media/6_96JhJlq.jpg',6,3),(67,'/media/7_eNtOUP3.jpg',6,3),(68,'/media/8_B13UoeN.jpg',6,3),(69,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',7,1),(70,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',7,2),(71,'/media/1_bmqDR3N.jpg',7,3),(72,'/media/2_72CrUqv.jpg',7,3),(73,'/media/3_FVVk5kE.jpg',7,3),(74,'/media/4_LNKrlRN.jpg',7,3),(75,'/media/5_qHsL809.jpg',7,3),(76,'/media/6_EXgGQLK.jpg',7,3),(77,'/media/7_lJD2O84.jpg',7,3),(78,'/media/8_TM4De6X.jpg',7,3),(79,'/media/9_gLF6TGo.jpg',7,3),(80,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',8,1),(81,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',8,2),(82,'/media/1_VJ7ZAQ6.jpg',8,3),(83,'/media/2_w4cxzhY.jpg',8,3),(84,'/media/3_U55lgsP.jpg',8,3),(85,'/media/4_EzoxL21.jpg',8,3),(86,'/media/5_Rewgb01.jpg',8,3),(87,'/media/6_ze76f9K.jpg',8,3),(88,'/media/7_6Wq1Bgx.jpg',8,3),(89,'/media/8_R2uMfUz.jpg',8,3),(90,'/media/9_D7uVd9z.jpg',8,3),(91,'/media/10_0RIywDD.jpg',8,3),(92,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',9,1),(93,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',9,2),(94,'/media/1_mfc1bTY.jpg',9,3),(95,'/media/2_GohidDO.jpg',9,3),(96,'/media/3_mFj1A5X.jpg',9,3),(97,'/media/4_H23ayWL.jpg',9,3),(98,'/media/5_SGzSxZZ.jpg',9,3),(99,'/media/6_li3hJqN.jpg',9,3),(100,'/media/7_lK1M9SF.jpg',9,3),(101,'/media/8_7L4e40W.jpg',9,3),(102,'/media/9_TW7TlmY.jpg',9,3),(103,'/media/10_woLP7jo.jpg',9,3),(104,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',10,1),(105,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',10,2),(106,'/media/1_oeshNKk.jpg',10,3),(107,'/media/2_iQ7dNj1.jpg',10,3),(108,'/media/3_8WGGwE5.jpg',10,3),(109,'/media/4_m2QcMFM.jpg',10,3),(110,'/media/5_m3BYUyr.jpg',10,3),(111,'/media/6_mJhhcKP.jpg',10,3),(112,'/media/7_NKEyR9K.jpg',10,3),(113,'/media/8_gRR4RHz.jpg',10,3),(114,'/media/9_YhUmuWF.jpg',10,3),(115,'/media/10_8H4hKoc.jpg',10,3),(116,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',11,1),(117,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',11,2),(118,'/media/1_Rqdz7U7.jpg',11,3),(119,'/media/2_wyGJ4ta.jpg',11,3),(120,'/media/3_NNxcobt.jpg',11,3),(121,'/media/4_LOhSXlh.jpg',11,3),(122,'/media/5_OEepnkc.jpg',11,3),(123,'/media/6_om0yrNS.jpg',11,3),(124,'/media/7_va0yr9Y.jpg',11,3),(125,'/media/8_egWx7Pl.jpg',11,3),(126,'/media/9_JJPOi3d.jpg',11,3),(127,'/media/10_yXoBnL0.jpg',11,3),(128,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',12,1),(129,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',12,2),(130,'/media/1_EPbLlsh.jpg',12,3),(131,'/media/2_CG1HTi2.jpg',12,3),(132,'/media/3_LrJ1TCJ.jpg',12,3),(133,'/media/4_ppO44fs.jpg',12,3),(134,'/media/5_3tIgCS6.jpg',12,3),(135,'/media/6_KN6SOts.jpg',12,3),(136,'/media/7_7vLJg1T.jpg',12,3),(137,'/media/8_BaXff43.jpg',12,3),(138,'/media/9_AexcCbE.jpg',12,3),(139,'/media/10_yG5bZ6x.jpg',12,3),(140,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',13,1),(141,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',13,2),(142,'/media/1_X1vUHuX.jpg',13,3),(143,'/media/2_rQvH5hc.jpg',13,3),(144,'/media/3_T5aiJXo.jpg',13,3),(145,'/media/4_VYfCSBP.jpg',13,3),(146,'/media/5_KdbwcPL.jpg',13,3),(147,'/media/6_7stuZRI.jpg',13,3),(148,'/media/7_WB2mznP.jpg',13,3),(149,'/media/8_7HnFJUe.jpg',13,3),(150,'/media/9_HN634xt.jpg',13,3),(151,'/media/10_Gs7AS8Z.jpg',13,3),(152,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',14,1),(153,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',14,2),(154,'/media/1_qhSeLSP.jpg',14,3),(155,'/media/2_T1EYNmq.jpg',14,3),(156,'/media/3_M5MK3Rp.jpg',14,3),(157,'/media/4_Qsb0wFi.jpg',14,3),(158,'/media/5_8L7yPar.jpg',14,3),(159,'/media/6_Xaip1y1.jpg',14,3),(160,'/media/7_MEUf1z0.jpg',14,3),(161,'/media/8_KtL5Rj0.jpg',14,3),(162,'/media/9_yFn3P2g.jpg',14,3),(163,'/media/10_TmP9DXa.jpg',14,3),(164,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',15,1),(165,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',15,2),(166,'/media/1_YVRqAfG.jpg',15,3),(167,'/media/2_rJP2AdH.jpg',15,3),(168,'/media/3_gQdONuG.jpg',15,3),(169,'/media/4_7T0yj4F.jpg',15,3),(170,'/media/5_DI2p1Wl.jpg',15,3),(171,'/media/6_CmqXZLW.jpg',15,3),(172,'/media/7_XOIrJSq.jpg',15,3),(173,'/media/8_ZqFUlsq.jpg',15,3),(174,'/media/9_CwxVXnR.jpg',15,3),(175,'/media/10_gn66t3j.jpg',15,3),(176,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',16,1),(177,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',16,2),(178,'/media/1_v57UFo5.jpg',16,3),(179,'/media/2_nT3X3Gi.jpg',16,3),(180,'/media/3_C9361FH.jpg',16,3),(181,'/media/4_KPjviHC.jpg',16,3),(182,'/media/5_j9H6NUg.jpg',16,3),(183,'/media/6_0yvtHsK.jpg',16,3),(184,'/media/7_OyIqVRu.jpg',16,3),(185,'/media/8_zaePCtI.jpg',16,3),(186,'/media/9_zDqfKRE.jpg',16,3),(187,'/media/10_o3nc5fU.jpg',16,3),(188,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',17,1),(189,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',17,2),(190,'/media/1_vXCGxCI.jpg',17,3),(191,'/media/2_54gKgQP.jpg',17,3),(192,'/media/3_eNxYhCr.jpg',17,3),(193,'/media/4_BprQkfJ.jpg',17,3),(194,'/media/5_qsc95lP.jpg',17,3),(195,'/media/6_UAGLwbX.jpg',17,3),(196,'/media/7_F6hIwWB.jpg',17,3),(197,'/media/8_a2kJabS.jpg',17,3),(198,'/media/9_SZ0wMpy.jpg',17,3),(199,'/media/10_MeWXSKs.jpg',17,3),(200,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',18,1),(201,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',18,2),(202,'/media/1_NMUUNXC.jpg',18,3),(203,'/media/2_Ouot4Pr.jpg',18,3),(204,'/media/3_Gz1jfea.jpg',18,3),(205,'/media/4_I75CkJ3.jpg',18,3),(206,'/media/5_o83wrz9.jpg',18,3),(207,'/media/6_a6urQrM.jpg',18,3),(208,'/media/7_Wj7Dhuj.jpg',18,3),(209,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',19,1),(210,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',19,2),(211,'/media/1_hYKWHNU.jpg',19,3),(212,'/media/2_HG8qNBO.jpg',19,3),(213,'/media/3_aDwC2Ql.jpg',19,3),(214,'/media/4_Rj4l1L8.jpg',19,3),(215,'/media/5_23MIkpl.jpg',19,3),(216,'/media/6_q3Kpy4T.jpg',19,3),(217,'/media/7_9VDJMAo.jpg',19,3),(218,'/media/8_aIKJvFt.jpg',19,3),(219,'/media/9_InpWyDb.jpg',19,3),(220,'/media/10_5jDjWzb.jpg',19,3),(221,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',20,1),(222,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',20,2),(223,'/media/1_elE8eIp.jpg',20,3),(224,'/media/2_4vn9XVx.jpg',20,3),(225,'/media/3_D1iL18X.jpg',20,3),(226,'/media/4_i3s0HY6.jpg',20,3),(227,'/media/5_fjAcCOl.jpg',20,3),(228,'/media/6_ECsXNEg.jpg',20,3),(229,'/media/7_7pnv5eG.jpg',20,3),(230,'/media/8_dDvDZt3.jpg',20,3),(231,'/media/9_e0PyyUN.jpg',20,3),(232,'/media/10_w27K7NE.jpg',20,3),(233,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',21,1),(234,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',21,2),(235,'/media/1_lCofK1Q.jpg',21,3),(236,'/media/2_fN7fXqT.jpg',21,3),(237,'/media/3_sQci5N1.jpg',21,3),(238,'/media/4_t8f1jLp.jpg',21,3),(239,'/media/5_pnAqZij.jpg',21,3),(240,'/media/6_Jyvt0gV.jpg',21,3),(241,'/media/7_88GAaTo.jpg',21,3),(242,'/media/8_dwmGQq1.jpg',21,3),(243,'/media/9_IVxniTc.jpg',21,3),(244,'/media/10_MBQOH1D.jpg',21,3),(245,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_03.png',22,1),(246,'/static/img/%E8%AF%A6%E6%83%85%E9%A1%B5_06.png',22,2),(247,'/media/1.jpg',22,3),(248,'/media/2.jpg',22,3),(249,'/media/3.jpg',22,3),(250,'/media/4.jpg',22,3),(251,'/media/5.jpg',22,3),(252,'/media/6.jpg',22,3),(253,'/media/7.jpg',22,3),(254,'/media/8.jpg',22,3),(255,'/media/9.jpg',22,3),(256,'/media/10.jpg',22,3);

/*Table structure for table `goods_size` */

DROP TABLE IF EXISTS `goods_size`;

CREATE TABLE `goods_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `goods_size` */

insert  into `goods_size`(`id`,`name`,`value`) values (1,'150','150'),(2,'160','160'),(3,'165','165'),(4,'170','170'),(5,'S','S'),(6,'M','M'),(7,'L','L'),(8,'XL','XL'),(9,'均码','均码');

/*Table structure for table `goods_sku` */

DROP TABLE IF EXISTS `goods_sku`;

CREATE TABLE `goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_sku_color_id_e349cce3_fk_goods_color_id` (`color_id`),
  KEY `goods_sku_goods_id_29d98d3b_fk_goods_goods_id` (`goods_id`),
  KEY `goods_sku_size_id_a74ad7cd_fk_goods_size_id` (`size_id`),
  CONSTRAINT `goods_sku_color_id_e349cce3_fk_goods_color_id` FOREIGN KEY (`color_id`) REFERENCES `goods_color` (`id`),
  CONSTRAINT `goods_sku_goods_id_29d98d3b_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `goods_sku_size_id_a74ad7cd_fk_goods_size_id` FOREIGN KEY (`size_id`) REFERENCES `goods_size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

/*Data for the table `goods_sku` */

insert  into `goods_sku`(`id`,`count`,`color_id`,`goods_id`,`size_id`) values (1,100,1,1,1),(2,100,1,1,2),(3,100,1,1,3),(4,100,1,1,4),(5,100,2,1,1),(6,100,2,1,2),(7,100,2,1,3),(8,100,2,1,4),(9,100,3,1,1),(10,100,3,1,2),(11,100,3,1,3),(12,100,3,1,4),(13,100,4,1,1),(14,100,4,1,2),(15,100,4,1,3),(16,100,4,1,4),(17,100,5,2,5),(18,100,5,2,6),(19,100,5,2,7),(20,100,5,2,8),(21,100,6,2,5),(22,100,6,2,6),(23,100,6,2,7),(24,100,6,2,8),(25,100,7,3,9),(26,100,8,3,9),(27,100,9,3,9),(28,100,10,4,6),(29,100,11,5,5),(30,100,11,5,6),(31,100,11,5,7),(32,100,11,5,8),(33,100,12,6,5),(34,100,12,6,6),(35,100,12,6,7),(36,100,13,7,6),(37,100,13,7,7),(38,100,13,7,8),(39,100,14,8,5),(40,100,14,8,6),(41,100,14,8,7),(42,100,14,8,8),(43,100,15,8,5),(44,100,15,8,6),(45,100,15,8,7),(46,100,15,8,8),(47,100,16,8,5),(48,100,16,8,6),(49,100,16,8,7),(50,100,16,8,8),(51,100,17,9,5),(52,100,17,9,6),(53,100,17,9,7),(54,100,17,9,8),(55,100,18,9,5),(56,100,18,9,6),(57,100,18,9,7),(58,100,18,9,8),(59,100,19,9,5),(60,100,19,9,6),(61,100,19,9,7),(62,100,19,9,8),(63,100,20,9,5),(64,100,20,9,6),(65,100,20,9,7),(66,100,20,9,8),(67,100,21,10,5),(68,100,21,10,6),(69,100,21,10,7),(70,100,21,10,8),(71,100,22,11,5),(72,100,22,11,6),(73,100,22,11,7),(74,100,22,11,8),(75,100,23,11,5),(76,100,23,11,6),(77,100,23,11,7),(78,100,23,11,8),(79,100,24,11,5),(80,100,24,11,6),(81,100,24,11,7),(82,100,24,11,8),(83,100,25,12,6),(84,100,25,12,7),(85,100,25,12,8),(86,100,26,12,6),(87,100,26,12,7),(88,100,26,12,8),(89,100,27,13,5),(90,100,27,13,6),(91,100,27,13,7),(92,100,27,13,8),(93,100,28,13,5),(94,100,28,13,6),(95,100,28,13,7),(96,100,28,13,8),(97,100,29,14,5),(98,100,29,14,6),(99,100,29,14,7),(100,100,29,14,8),(101,100,30,14,5),(102,100,30,14,6),(103,100,30,14,7),(104,100,30,14,8),(105,100,31,15,5),(106,100,31,15,6),(107,100,31,15,7),(108,100,31,15,8),(109,100,32,15,5),(110,100,32,15,6),(111,100,32,15,7),(112,100,32,15,8),(113,100,33,15,5),(114,100,33,15,6),(115,100,33,15,7),(116,100,33,15,8),(117,100,34,16,6),(118,100,34,16,7),(119,100,34,16,8),(120,100,35,17,5),(121,100,35,17,6),(122,100,35,17,7),(123,100,35,17,8),(124,100,36,17,5),(125,100,36,17,6),(126,100,36,17,7),(127,100,36,17,8),(128,100,37,17,5),(129,100,37,17,6),(130,100,37,17,7),(131,100,37,17,8),(132,100,38,18,5),(133,100,38,18,6),(134,100,38,18,7),(135,100,39,19,5),(136,100,39,19,6),(137,100,39,19,7),(138,100,39,19,8),(139,100,40,20,5),(140,100,40,20,6),(141,100,40,20,7),(142,100,40,20,8),(143,100,41,21,5),(144,100,41,21,6),(145,100,41,21,7),(146,100,41,21,8),(147,100,42,21,5),(148,100,42,21,6),(149,100,42,21,7),(150,100,42,21,8),(151,100,43,22,5),(152,100,43,22,6),(153,100,43,22,7),(154,100,43,22,8),(155,100,44,22,5),(156,100,44,22,6),(157,100,44,22,7),(158,100,44,22,8),(159,100,45,22,5),(160,100,45,22,6),(161,100,45,22,7),(162,100,45,22,8);

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `isdefault` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_address_user_id_08596f52_fk_User_user_id` (`user_id`),
  CONSTRAINT `User_address_user_id_08596f52_fk_User_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_address` */

/*Table structure for table `user_user` */

DROP TABLE IF EXISTS `user_user`;

CREATE TABLE `user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `user_user` */

insert  into `user_user`(`id`,`account`,`password`) values (1,'admin','a78ae8dc9a41d1c183ca3bdba0c6d9d9'),(2,'123456','e10adc3949ba59abbe56e057f20f883e'),(3,'123456789@qq.com','e10adc3949ba59abbe56e057f20f883e'),(4,'123456@qq.com','e10adc3949ba59abbe56e057f20f883e');

/*Table structure for table `user_user2` */

DROP TABLE IF EXISTS `user_user2`;

CREATE TABLE `user_user2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(254) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_user2` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
