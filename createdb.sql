CREATE DATABASE Sample
GO

USE [Sample]
GO

IF OBJECT_ID('[dbo].[Users]') IS NOT NULL
DROP TABLE [dbo].[Users]
GO

IF OBJECT_ID('[dbo].[Roles]') IS NOT NULL
DROP TABLE [dbo].[Roles]
GO

IF OBJECT_ID('[dbo].[Company]') IS NOT NULL
DROP TABLE [dbo].[Company]
GO

CREATE TABLE [dbo].[Company](  
    [Id] [int] IDENTITY(1,1) NOT NULL,  
    [Companyname] [nvarchar](50) NOT NULL,  
    [Companyaddress] [nvarchar](50) NULL,
	[Companycity] [nvarchar] (50) NULL,
	[Companystate] [nvarchar] (50) NULL,
	[Companyzip] [nvarchar] (50) NULL,
	[Companyphone] [nvarchar] (50) NULL,
	CONSTRAINT PK_Company PRIMARY KEY (Id, Companyname)
) ON [PRIMARY]  
GO 

CREATE TABLE [dbo].[Roles](  
    [Id] [int] IDENTITY(1,1) NOT NULL,  
    [RoleName] [nvarchar](50) NULL,  
    PRIMARY KEY CLUSTERED   
    (  
        [Id] ASC  
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
    ) ON [PRIMARY]  
    GO

CREATE TABLE [dbo].[Users](  
    [Id] [int] IDENTITY(1,1) NOT NULL,  
    [Username] [nvarchar](50) NULL,  
    [Password] [nvarchar](50) NULL,
	[Companyname] [nvarchar] (50) NULL,
	[RoleName] [nvarchar] (50) NULL,
PRIMARY KEY CLUSTERED   
(  
    [Id] ASC  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
) ON [PRIMARY]  
GO  


INSERT INTO dbo.Roles (RoleName)
VALUES ('admin');

INSERT INTO dbo.Roles (RoleName)
VALUES ('customer');

INSERT INTO dbo.Roles (RoleName)
VALUES ('admincustomer');

INSERT INTO dbo.Company (Companyname)
VALUES ('DemoCompany');

INSERT INTO dbo.Users (Username, Password, Companyname, RoleName)
VALUES ('demoadmin', '1234', 'DemoCompany', 'admin');

select * from dbo.Users;

select * from dbo.Roles;

select * from dbo.Company;
