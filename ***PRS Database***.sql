Use sys;
Drop database if exists PRS;
create database PRS;
use PRS;

create table User( 

ID int not null primary key auto_increment,
Username 	varchar(20) not null,
Password 	varchar(10) not null,
Firstname 	varchar(20) not null,
Lastname 	varchar(20) not null,
PhoneNumber varchar(12) not null,
Email 		varchar(75) not null,
IsReviewer 	bit default 0,
IsAdmin 	bit default 0
);
insert User
(Username, Password, Firstname, Lastname, PhoneNumber, Email) 
values 
('Jgrether','Train@MAX','Jackson', 'Grether', '614-849-2716', 'jackgrether@gmail.com');

select * from user;

create table Vendor(
ID int not null primary key auto_increment,
Code 		varchar(10) not null unique,
Name 		varchar(255) not null,
Address 	varchar(255) not null,
City 		varchar(255) not null,
State 		varchar(2) 	not null,
Zip 		varchar(5) 	not null,
PhoneNumber varchar(12) not null,
Email 		varchar(100) not null
);

insert Vendor
(Code, Name, Address, City, State, Zip, PhoneNumber, Email)
values 
('XXXXXXX', 'Michael Scarn', '305 Scaranton Ave','Scarnton', 'PA', '90210', '111-111-1111', 'MikeScarn@yahoo.com');
 
 select * from Vendor;

create table Product(

ID 			int 	not null primary key auto_increment,

VendorID 	int 	not null,
	foreign key (VendorID) references Vendor(ID),
    
PartNumber 	varchar(50) not null,
Name 		varchar(150) not null,
Price 		decimal(10,2) not null,
Unit 		varchar(255),
Photopath 	varchar(255),

Constraint vendorpart unique(VendorID, PartNumber)
);
insert Product
( VendorID, PartNumber, Name, Price, Unit, Photopath)
values 
(1, '1k-34PWw','Valve', 10, 'VR Headsets', 'Digital');

select * from product;

create table Request(
ID int primary key not null auto_increment,
UserID int not null,
	foreign key(UserID) references User(ID),
Description varchar(100),
Justification varchar(255) not null,
DateNeeded Date not null,
DeliveryMode varchar(25) not null,
Status varchar(20) not null default 'New',
Total decimal(10,2) not null default 0,
SubmittedDate datetime not null,
ReasonForRejection varchar(100)
);

insert Request 
(UserID, Description, Justification, DateNeeded, DeliveryMode, SubmittedDate, ReasonForRejection)
values 
('1', 'Asked for Shoes', 'Has no shoes', '2020-09-30', 'UPS', '2020-09-27 00:00:00', 'We dont like hime');
select * from Request;

create table LineItem(
ID int not null primary key auto_increment,
RequestID int not null, 
	foreign key (RequestID) references Request(ID),
ProductID int not null, 
	foreign key (ProductID) references Product(ID),
Quantity int not null,

constraint req_prdt Unique (RequestID, ProductID)
);
insert LineItem
(RequestID, ProductID, Quantity) 
values
(1,1,4000);

select * from LineItem;

DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;
 
