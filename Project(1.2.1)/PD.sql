create table DrawClient(
	id varchar(20),
	pw varchar(20),
	name varchar(20)
);
create table Draw(
	Dpk int,
	Dname varchar(100),
	Dtitle varchar(20),
	Dcontent varchar(20),
	Ddate date
);

insert into DrawClient values('oh','1234','오');

select * from DrawClient;
select * from Draw;

drop table DrawClient;
drop table Draw;