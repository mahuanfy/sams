/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - sams
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sams` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sams`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_nameid` varchar(20) NOT NULL,
  `a_username` varchar(20) NOT NULL,
  `a_password` varchar(20) NOT NULL,
  `a_trank` int(11) DEFAULT '3',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`a_id`,`a_nameid`,`a_username`,`a_password`,`a_trank`) values (1,'15610409153608','管理员马','123456',3),(2,'15610305150697','管理员杨','123456',3),(3,'admin','我是管理员','123456',3);

/*Table structure for table `class_currise` */

DROP TABLE IF EXISTS `class_currise`;

CREATE TABLE `class_currise` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `cl_name` varchar(20) NOT NULL,
  `cl_class1` varchar(20) DEFAULT NULL,
  `cl_class2` varchar(20) DEFAULT NULL,
  `cl_class3` varchar(20) DEFAULT NULL,
  `cl_class4` varchar(20) DEFAULT NULL,
  `cl_class5` varchar(20) DEFAULT NULL,
  `cl_class6` varchar(20) DEFAULT NULL,
  `cl_class7` varchar(20) DEFAULT NULL,
  `cl_class8` varchar(20) DEFAULT NULL,
  `cl_class9` varchar(20) DEFAULT NULL,
  `cl_class10` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `class_currise` */

insert  into `class_currise`(`cl_id`,`cl_name`,`cl_class1`,`cl_class2`,`cl_class3`,`cl_class4`,`cl_class5`,`cl_class6`,`cl_class7`,`cl_class8`,`cl_class9`,`cl_class10`) values (1,'软件1501','软件工程','通信工程','电子信息工程','网络工程','计算机组成原理','大学英语','C语言程序设计','php程序设计',NULL,NULL);

/*Table structure for table `currise` */

DROP TABLE IF EXISTS `currise`;

CREATE TABLE `currise` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(20) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `currise` */

insert  into `currise`(`c_id`,`c_name`) values (1,'web技术开发(java)'),(2,'计算机组成原理'),(3,'软件工程'),(4,'大学英语'),(5,'网站设计'),(6,'工科数学'),(7,'C语言程序设计'),(8,'php程序设计'),(9,'orcal数据库'),(10,'html5入门'),(11,'体育');

/*Table structure for table `evaluate` */

DROP TABLE IF EXISTS `evaluate`;

CREATE TABLE `evaluate` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_studentid` varchar(20) DEFAULT NULL,
  `e_teacherid` varchar(20) DEFAULT NULL,
  `e_teacher_s` varchar(500) DEFAULT NULL,
  `e_sudent_t` varchar(500) DEFAULT NULL,
  `e_message_t` varchar(500) DEFAULT NULL,
  `e_message_s` varchar(500) DEFAULT NULL,
  `e_discern` varchar(20) DEFAULT NULL,
  `e_time` varchar(20) DEFAULT NULL,
  `e_studentname` varchar(20) DEFAULT NULL,
  `e_teachername` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `evaluate` */

insert  into `evaluate`(`e_id`,`e_studentid`,`e_teacherid`,`e_teacher_s`,`e_sudent_t`,`e_message_t`,`e_message_s`,`e_discern`,`e_time`,`e_studentname`,`e_teachername`) values (1,'15610409153608','15610305150697',NULL,NULL,'<p><b>本周三下午，西区305开会 望周知<img src=\'http://localhost:8080/Admin/plugins/layui/images/face/0.gif\' alt=\'[微笑]\'><img src=\'http://localhost:8080/Admin/plugins/layui/images/face/69.gif\' alt=\'[话筒]\'></b></p>','','1','2017-06-03 12:30','',NULL),(2,NULL,'15610409153608',NULL,NULL,'<b>    明天中午 12:30 西区201 开会 望周知<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/0.gif\" alt=\"[微笑]\"></b>','','1','2017-06-03 19:30',NULL,NULL),(3,NULL,'15610409153608',NULL,NULL,'    发布区\n',NULL,'1','2017-6-9 12:5:25',NULL,NULL),(4,NULL,'15610409153608',NULL,NULL,'    发布区<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/38.gif\" alt=\"[哼]\">\n',NULL,'1','2017-6-9 12:15:13',NULL,NULL),(5,NULL,'15610409153608',NULL,NULL,'<p>小明同学 下了来我办公室一下<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/26.gif\" alt=\"[怒]\"></p>',NULL,'1','2017-6-9 13:3:50',NULL,NULL),(6,NULL,'15610409153608',NULL,NULL,'<b><i>    小黄同学 来我办公室一下 &nbsp;<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/28.gif\" alt=\"[馋嘴]\"></i></b>',NULL,'1','2017-6-9 13:15:24',NULL,NULL),(7,NULL,'15610409153608',NULL,NULL,'    发布区\n',NULL,'1','2017-6-9 13:15:53',NULL,NULL),(8,'15610409153608','15610409153608',NULL,'老师 我计算机原理要挂了&nbsp;<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/12.gif\" alt=\"[泪]\">',NULL,NULL,'2','2017-6-9 13:55:18','马欢欢',NULL),(9,'15610409153608','15610305150697',NULL,'什么时候我们考试呢 老师？<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/27.gif\" alt=\"[疑问]\"><img src=\"http://localhost:8080/Admin/plugins/layui/images/face/27.gif\" alt=\"[疑问]\">',NULL,NULL,'2','2017-6-9 13:56:22','马欢欢',NULL),(10,NULL,'15610409153608',NULL,NULL,'杨同学 ，这次计算机原理考试 不用来考试了<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/26.gif\" alt=\"[怒]\">',NULL,'1','2017-6-9 14:1:15',NULL,NULL),(11,NULL,'15610409153608',NULL,NULL,'杨董 来我办公室一下<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/21.gif\" alt=\"[衰]\">',NULL,'1','2017-6-9 14:15:59',NULL,NULL),(12,'15610305150697','15610409153608',NULL,'<b>学习网站</b>&nbsp;<a target=\"_blank\" href=\"https://www.layui.com/doc/modules/layer.html#layer.msg\">https://www.layui.com/doc/modules/layer.html#layer.msg</a>\n',NULL,NULL,'2','2017-6-9 14:20:44','杨璐鹏',NULL),(13,NULL,'15610409153608',NULL,NULL,'<p>这个标签可以将留言的框的颜色编程灰色 layui-quote-nm</p>\n',NULL,'1','2017-6-9 14:37:6',NULL,NULL),(14,'15610409153608','15610409153608',NULL,'老师 我们暑假在家应该怎么学？<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/27.gif\" alt=\"[疑问]\">',NULL,NULL,'2','2017-6-9 16:54:18','马欢欢',NULL),(15,'15610305150697','15610409153608',NULL,'老师 我想请问你一个问题&nbsp;<img src=\"http://192.168.1.102:8080/Admin/plugins/layui/images/face/41.gif\" alt=\"[悲伤]\">',NULL,NULL,'2','2017-6-9 17:38:58','杨璐鹏',NULL),(16,'15610409153608','15610409153608',NULL,'<div>老师 我们周三下午要开会吗？<img alt=\"[围观]\" src=\"http://192.168.1.102:8080/Admin/plugins/layui/images/face/64.gif\"></div>',NULL,NULL,'2','2017-6-9 17:50:41','马欢欢',NULL),(17,'15610409153608','15610409153608',NULL,'<div>哈哈哈哈<img alt=\"[嘻嘻]\" src=\"http://192.168.1.102:8080/Admin/plugins/layui/images/face/1.gif\"></div>',NULL,NULL,'2','2017-6-9 22:31:19','马欢欢',NULL),(18,NULL,'15610409153608',NULL,NULL,'来趟我办公室',NULL,'1','2017-6-9 22:31:55',NULL,NULL),(19,'15610409153608','15610409153608',NULL,'老师你好<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/1.gif\" alt=\"[嘻嘻]\">',NULL,NULL,'2','2017-6-11 10:30:23','马欢欢',NULL),(20,'15610903150627','15610409153608',NULL,'老师 给我添个成绩<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/1.gif\" alt=\"[嘻嘻]\">',NULL,NULL,'2','2017-6-12 11:24:50','毛良伟',NULL),(29,'15610409153608','15610305150697',NULL,'杨璐鹏你好',NULL,NULL,'2','2017-6-13 11:7:47','马欢欢',NULL),(30,'15610409153608','15610409153608',NULL,'马欢欢 你好',NULL,NULL,'2','2017-6-13 11:7:57','马欢欢',NULL),(31,'15610305150697','15610305150697',NULL,'杨老师 我是路鹏&nbsp;',NULL,NULL,'2','2017-6-13 11:9:53','杨璐鹏',NULL),(32,'15610305150697','15610409153608',NULL,'马老师 我计算机原理挂了',NULL,NULL,'2','2017-6-13 11:10:8','杨璐鹏',NULL),(33,NULL,'15610305150697',NULL,NULL,'明天开会<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/13.gif\" alt=\"[偷笑]\">',NULL,'1','2017-6-13 14:10:29',NULL,NULL),(42,NULL,'15610409153608',NULL,NULL,'杨璐鹏 来我办公室一趟',NULL,'1','2017-6-13 14:33:27',NULL,NULL),(44,'15610409153608','15610305150697',NULL,'老师 你好',NULL,NULL,'2','2017-6-13 15:35:11','马欢欢',NULL),(45,'15610409153608','15610305150697',NULL,'888888',NULL,NULL,'2','2017-6-13 15:35:18','马欢欢',NULL),(46,'15610409153608','15610305150697',NULL,'<div style=\"text-align: center;\"><b><u>杨老师 你好 我下午想请假<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/16.gif\" alt=\"[太开心]\"></u></b></div>',NULL,NULL,'2','2017-6-13 15:39:55','马欢欢',NULL),(47,NULL,'15610409153608',NULL,NULL,'1231231232131\n',NULL,'1','2017-6-15 16:35:40',NULL,'马欢老师'),(48,'15610409153608','15610409153608',NULL,'<b>老师你好 我们实训报告怎么交？<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/27.gif\" alt=\"[疑问]\"></b>',NULL,NULL,'2','2017-6-16 14:27:36','马欢欢',NULL),(49,'15610409153608','15610409153608',NULL,'<b>老师 我们明天还来吗</b>？<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/1.gif\" alt=\"[嘻嘻]\">',NULL,NULL,'2','2017-6-16 14:31:50','马欢欢',NULL),(50,NULL,'15610409153608',NULL,NULL,'明天下午 全体同学开会<img src=\"http://localhost:8080/Admin/plugins/layui/images/face/0.gif\" alt=\"[微笑]\">',NULL,'1','2017-6-16 14:32:36',NULL,'马欢老师');

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_studentid` varchar(20) NOT NULL,
  `sc_name` varchar(20) DEFAULT NULL,
  `sc_class1` int(11) DEFAULT NULL,
  `sc_class2` int(11) DEFAULT NULL,
  `sc_class3` int(11) DEFAULT NULL,
  `sc_class4` int(11) DEFAULT NULL,
  `sc_class5` int(11) DEFAULT NULL,
  `sc_class6` int(11) DEFAULT NULL,
  `sc_class7` int(11) DEFAULT NULL,
  `sc_class8` int(11) DEFAULT NULL,
  `sc_class9` int(11) DEFAULT NULL,
  `sc_class10` int(11) DEFAULT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `score` */

insert  into `score`(`sc_id`,`sc_studentid`,`sc_name`,`sc_class1`,`sc_class2`,`sc_class3`,`sc_class4`,`sc_class5`,`sc_class6`,`sc_class7`,`sc_class8`,`sc_class9`,`sc_class10`) values (1,'15610409153608','马欢欢',86,77,100,10,100,88,75,100,110,100),(2,'15610305150697','杨璐鹏',100,100,100,100,100,100,100,100,100,100),(13,'15610903150627','毛良伟',89,88,78,85,65,74,78,67,87,69),(14,'123456789','小华',0,0,0,0,0,0,0,0,0,0),(15,'987654321','小李',88,88,88,88,88,88,88,88,88,88);

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_studentid` varchar(30) NOT NULL,
  `s_username` varchar(20) NOT NULL,
  `s_password` varchar(20) NOT NULL,
  `s_sex` varchar(10) NOT NULL,
  `s_class` varchar(20) NOT NULL,
  `s_rank` int(11) DEFAULT '1',
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `s_studentid` (`s_studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `students` */

insert  into `students`(`s_id`,`s_studentid`,`s_username`,`s_password`,`s_sex`,`s_class`,`s_rank`) values (1,'15610409153608','马欢欢','950525','男','软件1501',1),(2,'15610305150697','杨璐鹏','256815','男','软件1501',1),(4,'1561040915789','张亮','123456','男','软件1502',1),(5,'15610409153609','小华','123456','女','通信1503',1),(7,'15610903150627','毛良伟','123456','男','软件1503',1),(8,'student','我是学生','123456','女','软件1501',1),(9,'123456789','小华','123456','女','软件1501',1),(10,'987654321','小李','123456','男','1501',1);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_teacherid` varchar(20) NOT NULL,
  `t_username` varchar(20) NOT NULL,
  `t_password` varchar(20) NOT NULL,
  `t_sex` varchar(20) NOT NULL,
  `t_rank` int(11) DEFAULT '2',
  `t_tipsay` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`t_id`,`t_teacherid`,`t_username`,`t_password`,`t_sex`,`t_rank`,`t_tipsay`) values (1,'15610305150697','杨璐鹏老师','123456','男',2,'计算机原理'),(2,'15610409153608','马欢老师','123456','男',2,'软件工程'),(3,'1546232145','张老师','123456','女',2,'java web'),(4,'1436253536','沈老师','123456','男',2,'计算机组成原理'),(6,'teacher','我是老','123456','女',2,'计算机组成原理');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
