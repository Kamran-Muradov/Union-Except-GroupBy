create table Users(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50),
 [Email] nvarchar(100)
)

create table Doctors(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50),
 [Email] nvarchar(100)
)

select * from Users
union
select * from Doctors

select * from Users
union all
select * from Doctors

select [Email] from Users
union all
select [Email] from Teachers

select [Name],[Email] from Users
union all
select [Name],[Email] from Teachers

select [Name],[Email] from Users
union all
select [Name],[Email] from Teachers
union all
select [Name],[Email] from Doctors

select * from Users
intersect
select * from Doctors

select * from Users
except
select * from Doctors

select COUNT(*) as 'Student Count', Age
from Students
Group by Age

declare @num1 int = 50

declare @num2 int = 30

if @num1 > @num2
	print 'Yes'

else
	print 'no'

select * from Teachers
select * from Students

create function dbo.getStudentsAvgAge()
returns int
as
begin
	return (select AVG(Age) from Students)
end

create function dbo.getTeachersAvgAge()
returns int
as
begin
	return (select AVG(Age) from Teachers)
end


create procedure usp_checkStudentsAndTeachersAvgAges
@studentAvgAge int,
@teacherAvgAge int
as
begin
	if @studentAvgAge > @teacherAvgAge
		print 'Student average age is bigger than teachers average ages'
	else
		print 'Student average age is not bigger than teachers average ages'
end

declare @stuAvgAge int = (select dbo.getStudentsAvgAge())
declare @teacAvgAge int = (select dbo.getTeachersAvgAge())

exec usp_checkStudentsAndTeachersAvgAges @stuAvgAge,@teacAvgAge

create procedure usp_checkStudentsAndTeachersAvgAges2
as
begin
	declare @stuAvgAge int = (select dbo.getStudentsAvgAge())
	declare @teacAvgAge int = (select dbo.getTeachersAvgAge())
	if @stuAvgAge > @teacAvgAge
		print 'Student average age is bigger than teachers average ages'
	else
		print 'Student average age is not bigger than teachers average ages'
end

exec usp_checkStudentsAndTeachersAvgAges2


DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 10)
BEGIN
    PRINT 'The counter value is = ' + CONVERT(VARCHAR,@Counter)
    SET @Counter  = @Counter  + 1
END


USE AdventureWorks2014
GO
-- Basic example of TRY...CATCH
 
BEGIN TRY
-- Generate a divide-by-zero error  
  SELECT
    1 / 0 AS Error;
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO