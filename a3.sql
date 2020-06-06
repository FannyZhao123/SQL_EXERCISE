--creattable for assignment 3


connect to cs348

drop table department
create table department ( \
	d_name        	varchar(30) not null, \
    d_loca        	varchar(60) not null, \
    d_chair     	integer not null, \
    primary key (d_name) \
    )


drop table course
create table course ( \
	d_name        	varchar(30) not null, \
    c_num     		integer not null, \
	c_name        	varchar(30) not null, \
    primary key (c_num), \
    foreign key (d_name) references department (d_name) \
    )

drop table student
create table student ( \
    s_id     		integer not null, \
	s_name        	varchar(30) not null, \
	d_name        	varchar(30) not null, \
    primary key (s_id), \
    foreign key (d_name) references department (d_name) \
    )

drop table section
create table section ( \
    sec_num     	integer not null, \
	sec_instructor  varchar(30) not null, \
	sec_semster		varchar(30) not null, \
    c_num     		integer not null, \
    primary key (sec_num, sec_semster), \
    foreign key (c_num) references course (c_num) \
    )


drop table taken
create table taken ( \
    s_id     		integer not null, \
    c_num     		integer not null, \
    grade     		integer not null, \
    foreign key (c_num) references course (c_num), \
    foreign key (s_id) references student (s_id) \
    )

