-- 1 --

use [master];
go
if db_id('Event_poster') is not null
begin
	drop database [Event_poster];
end
go
create database [Event_poster];
go

-- 2 --

use [Event_poster];
go

-- 3 --

create table [Categories]
(
[Id] int not null identity(1, 1) primary key,
[Name] nvarchar(50) not null check([Name] <> N'')
);

create table [Tickets_max]
(
[Id] int not null identity(1, 1) primary key,
[Quantity] int not null default 0
);

create table [Tickets_sold]
(
[Id] int not null identity(1, 1) primary key,
[Quantity] int not null default 0
);

create table [Images]
(
[Id] int not null identity(1, 1) primary key,
[File_name] nvarchar(50) not null check([File_name] <> N''),
[Title] nvarchar(50) not null check([Title] <> N''),
[Source] varbinary(max) not null check([Source] <> N'')
);

create table [Age_restrictions]
(
[Id] int not null identity(1, 1) primary key,
[Age_restriction] int not null default 0
);

create table [Descriptions]
(
[Id] int not null identity(1, 1) primary key,
[Description] nvarchar(500) not null check([Description] <> N'')
);

create table [Times_start]
(
[Id] int not null identity(1, 1) primary key,
[Time_start] time not null check ([Time_start] >= '00:00:00')
);

create table [Times_end]
(
[Id] int not null identity(1, 1) primary key,
[Time_end] time not null check ([Time_end] >= '00:00:00')
);

create table [Places]
(
[Id] int not null identity(1, 1) primary key,
[Name] nvarchar(50) not null check([Name] <> N'')
);

create table [Cities]
(
[Id] int not null identity(1, 1) primary key,
[Name] nvarchar(50) not null check([Name] <> N'')
);

create table [Countries]
(
[Id] int not null identity(1, 1) primary key,
[Name] nvarchar(50) not null check([Name] <> N'')
);

create table [Dates_end]
(
[Id] int not null identity(1, 1) primary key,
[Date_end] date not null check ([Date_end] >= '1900-01-01')
);

create table [Dates_start]
(
[Id] int not null identity(1, 1) primary key,
[Date_start] date not null check ([Date_start] >= '1900-01-01')
);

create table [Events]
(
[Id] int not null identity(1, 1) primary key,
[Name] nvarchar(50) not null check([Name] <> N'')
);

create table [Tickets_cost]
(
[Id] int not null identity(1, 1) primary key,
[Cost] money not null default 0
);

create table [Birth_dates]
(
[Id] int not null identity(1, 1) primary key,
[Birth_date] date not null check ([Birth_date] >= '1900-01-01')
);

create table [Emails]
(
[Id] int not null identity(1, 1) primary key,
[Email] nvarchar(50) not null check([Email] <> N'')
);

create table [Clients]
(
[Id] int not null identity(1, 1) primary key,
[Surname] nvarchar(50) not null check([Surname] <> N''),
[Name] nvarchar(50) not null check([Name] <> N''),
[Patronymic] nvarchar(50) not null check([Patronymic] <> N'')
);

create table [Archive]
(
[Id] int not null identity(1, 1) primary key,
[Client_Email] nvarchar(50) not null check([Client_Email] <> N''),
[Client_Birth_date] date not null check ([Client_Birth_date] >= '1900-01-01'),
[Client_Ticket_cost] money not null default 0,
[Event_Name] nvarchar(50) not null check([Event_Name] <> N''),
[Event_Date_start] date not null check ([Event_Date_start] >= '1900-01-01'),
[Event_Date_end] date not null check ([Event_Date_end] >= '1900-01-01'),
[Event_Country_Name] nvarchar(50) not null check([Event_Country_Name] <> N''),
[Event_City_Name] nvarchar(50) not null check([Event_City_Name] <> N''),
[Event_Place_Name] nvarchar(50) not null check([Event_Place_Name] <> N''),
[Event_Time_end] time not null check ([Event_Time_end] >= '00:00:00'),
[Event_Time_start] time not null check ([Event_Time_start] >= '00:00:00'),
[Event_Description] nvarchar(500) not null check([Event_Description] <> N''),
[Event_Age_restriction] int not null default 0,
[Event_Image_File_name] nvarchar(50) not null check([Event_Image_File_name] <> N''),
[Event_Image_Title] nvarchar(50) not null check([Event_Image_Title] <> N''),
[Event_Image_Source] varbinary(max) not null check([Event_Image_Source] <> N''),
[Event_Tickets_sold_Quantity] int not null default 0,
[Event_Tickets_max_Quantity] int not null default 0,
[Event_Category_Name] nvarchar(50) not null check([Event_Category_Name] <> N'')
);

--4--

create table [Events_Categories]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Category_id] int not null foreign key ([Category_id])
references [Categories] ([Id])
);

create table [Events_Tickets_max]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Tickets_max_id] int not null foreign key ([Tickets_max_id])
references [Tickets_max] ([Id])
);

create table [Events_Tickets_sold]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Tickets_sold_id] int not null foreign key ([Tickets_sold_id])
references [Tickets_sold] ([Id])
);

create table [Events_Images]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Image_id] int not null foreign key ([Image_id])
references [Images] ([Id])
);

create table [Events_Age_restrictions]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Age_restriction_id] int not null foreign key ([Age_restriction_id])
references [Age_restrictions] ([Id])
);

create table [Events_Descriptions]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Description_id] int not null foreign key ([Description_id])
references [Descriptions] ([Id])
);

create table [Events_Times_start]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Time_start_id] int not null foreign key ([Time_start_id])
references [Times_start] ([Id])
);

create table [Events_Times_end]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Time_end_id] int not null foreign key ([Time_end_id])
references [Times_end] ([Id])
);

create table [Events_Places]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Place_id] int not null foreign key ([Place_id])
references [Places] ([Id])
);

create table [Events_Cities]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[City_id] int not null foreign key ([City_id])
references [Cities] ([Id])
);

create table [Events_Countries]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Country_id] int not null foreign key ([Country_id])
references [Countries] ([Id])
);

create table [Events_Dates_start]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Date_start_id] int not null foreign key ([Date_start_id])
references [Dates_start] ([Id])
);

create table [Events_Dates_end]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Date_end_id] int not null foreign key ([Date_end_id])
references [Dates_end] ([Id])
);

create table [Events_Tickets_cost]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Ticket_cost_id] int not null foreign key ([Ticket_cost_id])
references [Tickets_cost] ([Id])
);

create table [Events_Clients]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Client_id] int not null foreign key ([Client_id])
references [Clients] ([Id])
);

create table [Clients_Emails]
(
[Id] int not null identity(1, 1) primary key,
[Client_id] int not null foreign key ([Client_id])
references [Clients] ([Id]),
[Email_id] int not null foreign key ([Email_id])
references [Emails] ([Id])
);

create table [Clients_Birth_dates]
(
[Id] int not null identity(1, 1) primary key,
[Client_id] int not null foreign key ([Client_id])
references [Clients] ([Id]),
[Birth_date_id] int not null foreign key ([Birth_date_id])
references [Birth_dates] ([Id])
);

create table [Events_Archive]
(
[Id] int not null identity(1, 1) primary key,
[Event_id] int not null foreign key ([Event_id])
references [Events] ([Id]),
[Archive_id] int not null foreign key ([Archive_id])
references [Archive] ([Id])
);