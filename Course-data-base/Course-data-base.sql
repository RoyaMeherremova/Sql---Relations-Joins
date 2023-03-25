create database Course

use Course

create table Educations(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50) not null,
 [Durations] int

)


insert into Educations ([Name],[Durations])
values ('Proqramminq',360),
       ('Designer',250),
	   ('Digital Marketinq',280),
	   ('Sistem Adminstration',300),
	   ('UX/UI',350)


create table Groups(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50) not null,
 [EducationId] int foreign key references Educations(Id),
 [RoomId] int foreign key references Rooms(Id),
 [WeekDaySeansId] int foreign key references WeekDaySeans(Id)
)
insert into Groups ([Name])
values ('P-135'),
       ('D-130'),
	   ('DM-104'),
	   ('SA-110'),
	   ('UX/UI-135')
     

create table Rooms(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50) not null,
 [Capacity] int
) 

insert into Rooms ([Name],[Capacity])
values ('Neptun',20),
       ('Serious',15),
	   ('Pluton',18),
	   ('Yupiter',22),
	   ('Saturn',21)
     

create table Weekdays(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50) not null
)

insert into Weekdays ([Name])
values ('Weekdays'),
       ('Weekend')
	   

create table WeekDaySeans(
 [Id] int primary key identity(1,1),
 [WeekDayId] int foreign key references Weekdays(Id),
 [SeansId] int foreign key references Seanses(Id)
)

create table Seanses(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50) not null
)
insert into Seanses ([Name])
values ('Morning'),
       ('Afternoon'),
	   ('Evening')
	 
create table Countries(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50) not null,
)
insert into Countries ([Name])
values ('Azerbaycan'),
       ('Turkiye'),
	   ('Pakistan'),
	   ('Georgia'),
	   ('England')

create table Cities(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50) not null,
 [CountryId] int foreign key references Countries(id)
)

insert into Cities ([Name])
values ('Baku'),
       ('Gence'),
	   ('Ankara'),
	   ('Tbilisi'),
	   ('London')
	
create table Teachers(
 [Id] int primary key identity(1,1),
 [Fullname] nvarchar(100) not null,
 [Email] nvarchar(100) unique,
 [Address] nvarchar(100) default 'XXX',
 [Salary] decimal,
 [CityId] int foreign key references Cities(id)
)
insert into Teachers ([Fullname],[Email],[Address],[Salary])
values ('Konul Ibrahimova','konul@gmail.com','Bayil',5000),
       ('Cinare Ibadova','cinare@gmail.com','LokLok',4000),
       ('Roya Meherremova','roya@gmail.com','Sumqayit',3000),
       ('Ali Talibov','ali@gmail.com','Xetai',2000),
       ('Cavid Ismayilzade','cavid@gmail.com','Sulutepe',1000),
	   ('Alakbar Hasanov','alakbar@gmail.com','Bayil',3500)

create table GroupTeachers(
 [Id] int primary key identity(1,1),
 [GroupId] int foreign key references Groups(Id),
 [TeacherId] int foreign key references Teachers(Id)
)

create table Roles(
 [Id] int primary key identity(1,1),
 [Name] nvarchar(50) not null,
)
insert into Roles ([Name])
values ('Director'),
       ('Deputy'),
      ('Librarian'),
      ('Keeper'),
      ('Master'),
	  ('Cleaner')

create table StaffMembers(
 [Id] int primary key identity(1,1),
 [Fullname] nvarchar(100) not null,
 [Salary] decimal,
 [CityId] int foreign key references Cities(id)
)
insert into StaffMembers ([FullName],[Salary])
VALUES ('Daniel',500),
       ('Ikram',600),
       ('Tebriz',700),
       ('Umid',800),
       ('Aga',900),
	   ('Sebnem',400)

create table RoleMembers(
 [Id] int primary key identity(1,1),
 [RoleId] int foreign key references Roles(Id),
 [MemberId] int foreign key references StaffMembers(Id)
)
create table Students(
 [Id] int primary key identity(1,1),
 [Fullname] nvarchar(100) not null,
 [Birthday] date,
 [Address] nvarchar(100) default 'XXX',
 [CityId] int foreign key references Cities(id)
)
insert into Students ([FullName],[Birthday],[Address])
VALUES ('Anar Aliyev','1995-04-11','Raboci'),
       ('Samil Abbasli','1996-05-12','Bayil'),
       ('Cavid Bashirov','1997-06-13','Ehmedli'),
       ('Besir Huseynzade','1998-07-14','Mastaga'),
       ('Gunel Semedova','1999-08-15','Elmler'),
	   ('Sehla Imanova','1997-05-15','Elmler')

create table GroupStudents(
 [Id] int primary key identity(1,1),
 [GroupId] int foreign key references Groups(Id),
 [StudentId] int foreign key references Students(Id)
)















