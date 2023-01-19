CREATE TABLE [books] ([ID] [int] identity(1,1) not null,[Name] varchar(100) null,[Price] float null,[BoughtDate] datetime null)
select * from books


CREATE TABLE lendout(ID INT IDENTITY(1,1) NOT NULL,BookName VARCHAR(100) NOT NULL,StudentID INT NOT NULL)INSERT INTO lendout(BookName, studentID) VALUES('Book A', 1)INSERT INTO lendout(BookName, studentID) VALUES('Book d', 2)INSERT INTO lendout(BookName, studentID) VALUES('Book H', 3)INSERT INTO lendout(BookName, studentID) 
VALUES('Book A', 4)INSERT INTO lendout(BookName, studentID) VALUES('Book D', 5)

select * from lendout
select * from students


create table dbo.students(ID int identity(1,1),Name varchar(30),Age int)
insert into dbo.students
select 'Mike' ,18 union
select 'Steve' ,19 union
select 'Rob' ,20 union
select 'Student Name 1' ,21 union
select 'Student Name 2' ,22 union
select 'Student Name 3' ,23 union
select 'Kevin' ,27 union
CREATE TABLE [dbo].[students]([id] [int] IDENTITY(1,1) NOT NULL,[name] [varchar](50) NOT NULL,[age] [int] NULL) ON [PRIMARY] IDENTITY INSERT [dbo].[students] ONINSERT [dbo].[students] ([id], [name], [age]) VALUES (5, N'Kunle', 23)INSERT [dbo].[students] ([id], [name], [age]) VALUES (1, N'Mike', 18)INSERT [dbo].[students] ([id], [name], [age]) VALUES (2, N'Steve', 19)INSERT [dbo].[students] ([id], [name], [age]) VALUES (3, N'Rob', 20)SET IDENTITY_INSERT [dbo].[students] 

drop table [dbo].[students]select 'Peter' ,19


CREATE TABLE [dbo].[student]([id] [int] IDENTITY(1,1) NOT NULL,[name] [varchar](50) NOT NULL,[age] [int] NULL) ON [PRIMARY] IDENTITY_INSERT [dbo].[student] ONINSERT [dbo].[student] ([id], [name], [age]) VALUES (5, N'Kunle', 23)INSERT [dbo].[student] ([id], [name], [age]) VALUES (1, N'Mike', 18)INSERT [dbo].[student] ([id], [name], [age]) VALUES (2, N'Steve', 19)INSERT [dbo].[student] ([id], [name], [age]) VALUES (3, N'Rob', 20)SET IDENTITY_INSERT [dbo].[student] OFFGO