select *
	from student s
	left join Major m 
		on m.id = s.MajorId 