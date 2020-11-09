update student set 
majorid = (select id from Major where description = 'accounting')                                        
where id = 110


