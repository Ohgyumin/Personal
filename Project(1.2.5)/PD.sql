create table DrawClient(
	id varchar(100) primary key,
	pw varchar(20) not null,
	name varchar(20)
);
create table Draw(
	Dpk int primary key,
	id varchar(100) not null,
	Dtitle varchar(20) not null,
	Dcontent varchar(20) not null,
	files varchar(200),
	Ddate date
);
create table coloring(
	Cpk int primary key,
	Ctitle varchar(20)not null,
	Cfiles varchar(200) not null,
	filename varchar(200)
); 

insert into DrawClient values('oh','1234','오');
insert into DrawClient values('oh','1234','김');
insert into DrawClient values('oh','1234','최');
select * from DRAWCLIENT where id = ('oh');
insert into DrawClient values('admin', 'admin', '관리자');
insert into Draw(Dpk,Dtitle,Dcontent,Ddate) values ((select nvl(max(dpk),0)+1 from draw),'제목','내용',sysdate);

select * from DrawClient;
select * from Draw;
select * from COLORING;

drop table DrawClient;
drop table Draw;
drop table Coloring;