#供应商基本信息
create table supplier_baseinfo(
	id int(10) primary key auto_increment,
	#地区省份
	diqu varchar(50),
	name varchar(200),
	farendaibiao varchar(20),
	zhucezijin varchar(20),
	suiwudengjihao varchar(100),
	kaihuyinhang varchar(200),
	yinhangzhanghao varchar(30),
	dizhi varchar(200),
	youbian varchar(10),
	tel varchar(20),
	beizhu varchar(255),
	caozuoyuan varchar(50),
	caozuoshijian datetime
);

create table supplier_pingding(
	id int(10) primary key auto_increment,
	no varchar(20),
	zhibiaoren varchar(20),
	shijian datetime,
	biaoji int(5),
	jishu varchar(255),
	yuanliao varchar(255),
	lingdao varchar(255)
);

create table supplier_mingxi(
	id int(10) primary key auto_increment,
	pingding_no int(10),
	gongyingshang varchar(100),
	neizai varchar(20),
	waiguan varchar(20),
	jihua varchar(20),
	shichang varchar(20),
	zonghe varchar(100),
	beizhu varchar(100),
	foreign key(pingding_no) references supplier_pingding(id)
);

#供应商名录
create table supplier_directory(
	id int(10) primary key auto_increment,
	baseinfo_id int(10),
	foreign key(baseinfo_id) references supplier_baseinfo(id)
)

create table supplier_zizhi(
	id int(10) primary key auto_increment,
	no varchar(30),
	zhibiaoren varchar(30),
	shijian datetime,
	biaoji int(3),
	pingding varchar(255),
	lingdao varchar(255)
);

create table supplier_zizhimingxi(
	id int(10) primary key auto_increment,
	faren varchar(20),
	suiwu varchar(20),
	yinhang varchar(20),
	shengchanxuke varchar(20),
	datian varchar(20),
	kaofang varchar(20),
	shengchanguanli varchar(20),
	renyuan varchar(20),
	shijian datetime,
	dengji varchar(20)
)