#基地评价
create table base_evaluate(
	id int(10) primary key auto_increment,
	iso varchar(20) not null,
	danju_no varchar(20) not null,
	zhidanren varchar(20) not null references sys_user(id),
	zhidanriqi datetime,
	#shenhebiaozhi tinyint(2),
	#shenheren varchar(20) not null references sys_user(id),
	#shenheriqi datetime,
	jidi_id int(10) references base_basicinfo(id),
	nianfen varchar(20) not null,
	caozuoren int(10) references sys_user(id),
	beizhu varchar(200),
	filename varchar(100) not null
);

#基地基本信息
create table base_basicinfo(
	id int(10) primary key auto_increment,
	name varchar(50),
	gongyingshang int(10) references supplier_baseinfo(id),
	diqu varchar(50),
	dizhi varchar(200),
	youbian varchar(10),
	tel varchar(20)	
);

create table shengcangaikuang(
	id int(10) primary key auto_increment,
	iso varchar(20) not null,
	danju_no varchar(20) not null,
	zhidanren int(10) not null references sys_user(id),
	zhidanriqi datetime,
	jidi_id int(10) references base_basicinfo(id),
	nianfen varchar(20) not null,
	caozuoren int(10) references sys_user(id),
	miaoqitianshu int(10),
	jianyecishu int(10),
	zhuangmiaolv varchar(10),
	yizaimidu varchar(10),
	shidanliang varchar(10),
	shilinliang varchar(10),
	shijialiang varchar(10),
	youxiaoyeshu int(10),
  	zhugao double(6,2),
  	dingyechang double(6,2),
	dingyekuan double(6,2)
)

#苗床期
create table base_miaochuang(
	id int(10) primary key auto_increment,
	jidi_no varchar(30),
	diaochariqi datetime,
	yumiaodian varchar(50),
	bozhongqi varchar(50),
	pinzhong varchar(50),
	zhongzhimianji double(10,2),
	yumiaofangshi varchar(30),
	bingchongqingkuang varchar(30),
	jianyecishu int(4),
	zhuangmiaolv double(10,2),
	yewuyuan varchar(50),
	pianqujingli varchar(50)
) 

#移栽
create table base_yizai(
	id int(10) primary key auto_increment,
	jidi_no varchar(30),
	diaocariqi datetime,
	diaochadian varchar(50),
	yizaishijian varchar(50),
	diaochamianji double(10,2),
	pinzhong varchar(50),
	zhongzhimidu varchar(20),
	shifeizhonglei varchar(30),
	shifeifangshi varchar(30),
	dimofugai varchar(10),
	yewuyuan varchar(50),
	pianqujingli varchar(50)
) 
#旺长期
create table base_wangzhang(
	id int(10) primary key auto_increment,
	jidi_no varchar(30),
	diaocariqi datetime,
	diaochadian varchar(50),
	yepianshu int(5),
	zhugao double(10,2),
	binghai varchar(50),
	chonghai varchar(50),
	jiemopeitu varchar(10),
	weisheng varchar(30),
	paiguan varchar(30),
	zhangshi varchar(30),
	zhengqidu varchar(30),
	yewuyuan varchar(50),
	pianqujingli varchar(50)
)
#烘烤期
create table base_hongkao(
	id int(10) primary key auto_increment,
	jidi_no varchar(30),
	diaocariqi datetime,
	diaochadian varchar(50),
	zhongzhimianji double(10,2),
	youxiaoyeshu int(5),
	zhugao double(10,2),
	dingyefayu varchar(20),
	binghai varchar(20),
	kaofang varchar(20),
	caishouyewei varchar(20),
	caishouchengshudu varchar(20),
	hongkao varchar(20),
	hunbuwei varchar(20),
	waiguan varchar(20),
	yewuyuan varchar(50),
	pianqujingli varchar(50)
)

create table base_chanliangyuce1(
	id int(10) primary key auto_increment,
	jidi_id int(10) references base_basicinfo(id),
	shang_mianji double(10,2),
	shang_muzhu int(10),
	shang_youxiao int(10),
	shang_yezhong double(10,2),
	zhong_mianji double(10,2),
	zhong_muzhu int(10),
	zhong_youxiao int(10),
	zhong_yezhong double(10,2),
	xia_mianji double(10,2),
	xia_muzhu int(10),
	xia_youxiao int(10),
	xia_yezhong double(10,2),
	zaihai double(10,2),
	chanliang double(12,2),
	niandu varchar(10),
	jidu varchar(2),
	caozuoren varchar(20)
)


