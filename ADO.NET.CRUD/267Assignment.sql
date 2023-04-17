create database Assignment

use Assignment

create table Details
(
Id int identity(1,1) primary key,
Name varchar(120) not null,
PhoneNumber bigint not null,
Address varchar(200) not null
)

select * from Details

insert into Details values
('Ajay',7997282200,'Vizag'),
('Chandra',6935246871,'Visakhapatnam'),
('Moon',8569782455,'Space')

alter table Details add Country varchar(100)
alter table Details add Salary money
alter table Details add Pincode int

update Details set Country = 'India' where Id in (1,2,3)
update Details set Salary = 5000 where Name = 'Ajay'
update Details set Salary = 4000 where Name = 'Chandra'
update Details set Salary = 6000 where Name = 'Moon'

update Details set Pincode = 500020 where Address in ('Vizag','Visakhapatnam')
update Details set Pincode = 100001 where Name = 'Moon'

select Id from Details where Country='India'

select max(salary) from Details where Id in (1,2,3)

select * from Details where max(Salary) in (1,2,3)

select min(salary) from Details where Id in (1,2,3)

select sum(salary) from Details 

select avg(salary) from Details

create table OrderTable
(
ProductId int identity(1,1) primary key,
ProductName varchar(220) not null,
Quantity int not null,
Rating float not null
)

select *from OrderTable

insert into OrderTable values
('Laptop',5,4.5),
('HeadPhones',10,4.6),
('KeyBoard',10,4),
('Mouse',15,4.5)


--create procedure GetDetails
--as
--begin
--set nocount on;
--select Id,Name,PhoneNumber,Address
--from Details
--end
--go

--create procedure EnterDetails
--@ProductName varchar(200),
--@Quantity int,
--@Rating float
--as 
--begin
--set nocount on;
--insert into OrderTable(ProductName,Quantity,Rating)
--values (@ProductName,@Quantity,@Rating);
--end
--go

--CREATE PROCEDURE UpdateDetails
--    @Id int,
--    @Name varchar(120),
--    @PhoneNumber bigint,
--    @Address varchar(200)
--AS
--BEGIN
--    UPDATE Details
--    SET Name = @Name,
--        PhoneNumber = @PhoneNumber,
--        Address = @Address
--    WHERE Id = @Id
--END

--CREATE PROCEDURE DeleteDetails
--    @Id INT
--AS
--BEGIN
--    DELETE FROM Details
--    WHERE Id = @Id
--END
