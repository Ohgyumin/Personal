create table DrawClient(
	id varchar(20),
	pw varchar(20),
	name varchar(20)
);
create table Draw(
	Dpk int,
	Dtitle varchar(20),
	Dcontent varchar(20),
	files varchar(200),
	Ddate date
);

insert into DrawClient values('oh','1234','오');
insert into Draw(Dpk,Dtitle,Dcontent,Ddate) values ((select nvl(max(dpk),0)+1 from draw),'제목','내용',sysdate);

select * from DrawClient;
select * from Draw;

drop table DrawClient;
drop table Draw;