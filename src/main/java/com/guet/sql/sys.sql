#user
create table sys_user(
	id int(10) primary key auto_increment,
	name varchar(20) not null,
	username varchar(20) unique not null,
	password varchar(20) not null,
	sex varchar(5),
	employee_id varchar(10) unique not null,
	dept_id varchar(10) references dept(id),
	tel varchar(15),
	email varchar(20) unique,
	image varchar(50) 
);

#dept
create table sys_dept(
	id int(10) primary key auto_increment,
	dept_id varchar(10) unique not null,
	dept_name varchar(20) unique not null,
	tel varchar(15)
);

#role
create table sys_role(
	id int(10) primary key auto_increment,
	role_name varchar(20) unique not null,
	#角色描述
	roles varchar(100),
	create_time datetime,
	is_systemrole tinyint(2)  not null
);

#sys_resource
create table sys_resource(
	id int(10) primary key auro_increment,
	resource_id varchar(20) unique not null,
	title varchar(32) not null,
	uri varchar(32) not null,
	parent_id varchar(20),
	name varchar(32) not null,
);

#authority
#添加	1
#删除	2
#修改	4
#审核	8
#驳回	16
#导出	32
#导入 64

#sys_role_resource
create table sys_role_resource(
	id int(10) primary key auto_increment,
	resource_id int(10) references sys_resource(id),
	role_id int(10) references sys_role(id),
	authority int(4) not null
);

#sys_user_role
create table sys_user_role(
	id int(10) primary key auto_increment,
	user_id int(10) references user(id),
	role_id int(10) references role(id)
);

