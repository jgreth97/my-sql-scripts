Use sys;

Drop database if exists BcDb;

create database BcDb;

use BcDb;

create table Customer (

ID int not null primary key auto_increment, 
Code varchar(10) not null,
Name varchar(30) not null,
Sales decimal(9,2) not null default 0,
Active bit not null default 1, 
Created datetime not null default current_timestamp 
);

insert Customer 
	(Code, Name, Sales) 
		values
    ('A', 'BigLLC', 10000), 
    ('B', 'BurgerKing', 60000),
    ('C', 'MacDons', 70000);
    Insert Customer (Code, Name, Sales) Values
    ('D', 'Wenders', 90000);
	
select * from Customer;

Create table Orders (
	 ID int not null primary key auto_increment,
     Description varchar(30) not null,
     Total decimal(9,2) not null default 0,
     CustomerID int not null, 
		foreign Key (CustomerID) references Customer(ID)
);
            

insert Orders 
	(Description, Total, CustomerID)
    values
    ('1st Order', 3, 1),
    ('2nd Order', 5, 2);
    
select * from orders; 
    

    
    
    


     
     
     



