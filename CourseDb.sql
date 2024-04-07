create database CourseDb

use CourseDb

create table Countries(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50)
)

create table Cities(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[CountryId] int,
	foreign key ([CountryId]) references Countries(Id)
)

create table Students(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[Surname] nvarchar(50),
	[Address] nvarchar(100),
	[Age] int,
	[Email] nvarchar(100),
	[CityId] int,
	foreign key ([CityId]) references Cities(Id)
)

create table Teachers(
	[Id] int primary key identity(1,1),
	[FullName] nvarchar(100),
	[Salary] float,
	[Address] nvarchar(100),
	[Email] nvarchar(100),
)

create table Educations(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
)

create table Rooms(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[Capacity] int
)

create table Groups(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[Capacity] int,
	[RoomId] int,
	foreign key ([RoomId]) references Rooms(Id),
	[EducationId] int,
	foreign key ([EducationId]) references Educations(Id)
)

create table StudentGroups(
	[Id] int primary key identity(1,1),
	[StudentId] int,
	foreign key ([StudentId]) references Students(Id),
	[GroupId] int,
	foreign key ([GroupId]) references Groups(Id)
)

create table GroupTeachers(
	[GroupId] int,
	foreign key ([GroupId]) references Groups(Id),
	[TeacherId] int,
	foreign key ([TeacherId]) references Teachers(Id)
)

create table StaffMembers(
	[Id] int primary key identity(1,1),
	[FullName] nvarchar(100),
	[Age] int,
	[Salary] float,
	[CityId] int,
	foreign key ([CityId]) references Cities(Id)
)

create table Departments(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(100)
)

create table Roles(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(100),
	[DepartmentId] int,
	foreign key ([DepartmentId]) references Departments(Id)
)

create table RoleStaffMembers(
	[Id] int primary key identity(1,1),
	[RoleId] int,
	foreign key([RoleId]) references Roles(Id),
	[StaffMemberId] int,
	foreign key ([StaffMemberId]) references StaffMembers(Id)
)


create procedure usp_createCountry
@name nvarchar(50)
as
begin
	insert into Countries([Name])
	values(@name)
end

exec usp_createCountry 'Azerbaycan'
exec usp_createCountry 'Turkiye'
exec usp_createCountry 'Rusiya'
exec usp_createCountry 'USA'
exec usp_createCountry 'Gurcustan'
exec usp_createCountry 'Ukrayna'

create procedure usp_createCity
@name nvarchar(50),
@countryId int
as
begin
	insert into Cities([Name],[CountryId])
	values(@name,@countryId)
end

exec usp_createCity 'Baki',1
exec usp_createCity 'Moskva',3 
exec usp_createCity 'Istanbul',2
exec usp_createCity 'New York',4
exec usp_createCity 'Gence',1

create procedure usp_createStudent
@name nvarchar(50),
@surname nvarchar(50),
@address nvarchar(100),
@age int,
@email nvarchar(100),
@cityId int
as
begin
	insert into Students([Name],[Surname],[Address],[Age],[Email],[CityId])
	values(@name,@surname,@address,@age,@email,@cityId)
end

exec usp_createStudent 'Kamran','Muradov','Nizami',24,'kamran@gmail.com',1
exec usp_createStudent 'Rashad','Aghayev','Neftciler',21,'rashad@gmail.com',1
exec usp_createStudent 'Ilqar','Shiriyev','Yasamal',26,'ilqar@gmail.com',2
exec usp_createStudent 'Hacixan','Hacixanov','Kurdexani',17,'hacixa@gmail.com',3
exec usp_createStudent 'Amirastan','Mereyev','Xezer',33,'amirastan@gmail.com',4

create procedure usp_createTeacher
@fullName nvarchar(100),
@salary float,
@address nvarchar(100),
@email nvarchar(100)
as
begin
	insert into Teachers([FullName],[Salary],[Address],[Email])
	values(@fullName,@salary,@address,@email)
end

exec usp_createTeacher 'Fatime Qayxanova', 1500, '28 May','fatime@gmail.com'
exec usp_createTeacher 'Fexriyye Tagizade', 1740, '28 May','fexriyye@gmail.com'
exec usp_createTeacher 'Afide Veliyeva', 1600, 'Xezer','afide@gmail.com'

create procedure usp_createEducation
@name nvarchar(50)
as
begin
	insert into Educations([Name])
	values(@name)
end

exec usp_createEducation 'Programlashdirma'
exec usp_createEducation 'Design'
exec usp_createEducation 'Digital Marketing'

create procedure usp_createRoom
@name nvarchar(50),
@capacity int
as
begin
	insert into Rooms([Name],[Capacity])
	values(@name,@capacity)
end

exec usp_createRoom 'Sun',20
exec usp_createRoom 'Moon',15
exec usp_createRoom 'Sirius',25

create procedure usp_createGroup
@name nvarchar(50),
@capacity int,
@roomId int,
@educationId int
as
begin
	insert into Groups([Name],[Capacity],[RoomId],[EducationId])
	values(@name,@capacity,@roomId,@educationId)
end

exec usp_createGroup 'PB101',20,1,1
exec usp_createGroup 'PB236',15,1,2
exec usp_createGroup 'PB135',20,3,3


create procedure usp_createStudentGroup
@studentId int,
@groupId int
as
begin
	insert into StudentGroups([StudentId],[GroupId])
	values(@studentId,@groupId)
end

exec usp_createStudentGroup 1,1
exec usp_createStudentGroup 2,1
exec usp_createStudentGroup 3,2
exec usp_createStudentGroup 4,3
exec usp_createStudentGroup 5,3


create procedure usp_createGroupTeacher
@groupId int,
@teacherId int
as
begin
	insert into GroupTeachers([GroupId],[TeacherId])
	values(@groupId,@teacherId)
end 

exec usp_createGroupTeacher 1,1
exec usp_createGroupTeacher 2,2
exec usp_createGroupTeacher 3,3

create procedure usp_createStaffMember
@fullName nvarchar(100),
@age int,
@salary float,
@cityId int
as
begin
	insert into StaffMembers([FullName],[Age],[Salary],[CityId])
	values (@fullName,@age,@salary,@cityId)
end

exec usp_createStaffMember 'Arif Bayramov', 35,950,1
exec usp_createStaffMember 'Xedice Ceferli', 26,3500,2
exec usp_createStaffMember 'Kemale Qurbanova', 30,1300,3

create procedure usp_createDepartment
@name nvarchar(100)
as
begin
	insert into Departments([Name])
	values(@name)
end

exec usp_createDepartment 'IT'
exec usp_createDepartment 'Satış'

create procedure usp_createRole
@name nvarchar(100),
@departmentId int
as
begin
	insert into Roles([Name],[DepartmentId])
	values(@name,@departmentId)
end

exec usp_createRole 'IT mütəxəssis',1
exec usp_createRole 'Mühasib',2

create procedure usp_createRoleStaffMember
@roleId int,
@staffMemberId int
as
begin
	insert into RoleStaffMembers([RoleId],[StaffMemberId])
	values(@roleId,@staffMemberId)
end

exec usp_createRoleStaffMember 1,2
exec usp_createRoleStaffMember 1,3
exec usp_createRoleStaffMember 2,1









