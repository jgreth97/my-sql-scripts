set @max = 1100;

select *
	from student 
	where sat > @max
    order by sat desc 
    