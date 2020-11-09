select * 
	from Student
	where gpa > (select avg(gpa)from Student)
    