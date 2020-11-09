select cl.*, i.lastname 'Instructor'
	from Class cl
    left join instructor i
    on i.id = cl.instructorid
    