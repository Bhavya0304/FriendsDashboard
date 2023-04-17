create table [User](
	Id int primary key identity(1,1),
	Username varchar(255) unique not null,
	FirstName varchar(255),
	LastName varchar(255),
	Email varchar(255) unique not null,
	[PasswordHash] varchar(255) not null,
	[Status] varchar(255),
	[CreatedOn] datetime default getdate(),
	[UpdatedOn] datetime default getdate(),
	[Rand] varchar(255) unique
)

create table UserProfile
(
	Id int primary key identity(1,1),
	UserId int foreign key references [User](Id),
	ProfilePhoto varchar(255),
	PetName varchar(255),
	Bio varchar(max),
	DOB date,
	[Address] varchar(max),
	[Country] varchar(255),
	[Status] varchar(255),
	[CreatedOn] datetime default getdate(),
	[UpdatedOn] datetime default getdate(),
	[Rand] varchar(255) unique
)

create table [Group](
	Id int primary key identity(1,1),
	GroupName varchar(255),
	[CreatedBy] int foreign key references [User](Id),
	[Status] varchar(255),
	[CreatedOn] datetime default getdate(),
	[UpdatedOn] datetime default getdate(),
	[Rand] varchar(255) unique
)

create table UserGroup
(
	Id int primary key identity(1,1),
	GroupId int foreign key references [Group](Id), 
	UserId int foreign key references [User](Id),
)