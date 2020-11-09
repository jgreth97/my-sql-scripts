Insert Student 
	(Id, Firstname, Lastname, SAT, GPA, MajorId)
Values -- Always pleral 
	(0, 'Joe', 'Swanson', 1450, 3.75, 
    -- the above are all not null but null items can be inserted and given a value. 
    -- can also be (0, 'Joe', 'Swanson', 1450, 3.75,4) 
    -- you can also use parameters where the 0 is 
    (select id 
		from major 
			where description = 'Math')) 
            
    