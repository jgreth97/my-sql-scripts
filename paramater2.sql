set @highsat = 1200;
set @lowsat = 1000; 
select *
	from student 
	where sat >= @lowsat and sat <= @highsat;

