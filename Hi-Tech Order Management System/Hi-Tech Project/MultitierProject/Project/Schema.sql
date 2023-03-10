USE [master]
GO
/****** Object:  Database [Hi-TechDB]    Script Date: 12/10/2021 11:24:51 AM ******/
CREATE DATABASE [Hi-TechDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hi-TechDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVEREXP\MSSQL\DATA\Hi-TechDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hi-TechDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVEREXP\MSSQL\DATA\Hi-TechDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hi-TechDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hi-TechDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hi-TechDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hi-TechDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hi-TechDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hi-TechDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hi-TechDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hi-TechDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hi-TechDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hi-TechDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hi-TechDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hi-TechDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hi-TechDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hi-TechDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hi-TechDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hi-TechDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hi-TechDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hi-TechDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hi-TechDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hi-TechDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hi-TechDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hi-TechDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hi-TechDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hi-TechDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hi-TechDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hi-TechDB] SET  MULTI_USER 
GO
ALTER DATABASE [Hi-TechDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hi-TechDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hi-TechDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hi-TechDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hi-TechDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hi-TechDB] SET QUERY_STORE = OFF
GO
USE [Hi-TechDB]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorsBook]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorsBook](
	[AuthorID] [int] NOT NULL,
	[ISBN] [bigint] NOT NULL,
	[YearPublished] [int] NOT NULL,
	[Edition] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AuthorsBook] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ISBN] [bigint] NOT NULL,
	[BookTitle] [nvarchar](100) NOT NULL,
	[QOH] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PublisherID] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](150) NOT NULL,
	[StreetName] [nvarchar](150) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactEmail] [nvarchar](100) NOT NULL,
	[CreditLimit] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[JobID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[OrderID] [int] NOT NULL,
	[ISBN] [bigint] NOT NULL,
	[QuantityOrdered] [int] NOT NULL,
 CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[OrderDate] [nvarchar](50) NOT NULL,
	[OrderType] [nvarchar](50) NOT NULL,
	[RequiredDate] [nvarchar](50) NOT NULL,
	[ShippingDate] [nvarchar](50) NOT NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherID] [int] NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[WebAddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 12/10/2021 11:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[UserID] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserAccounts] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (1, N'William', N'Shakespeare', N'')
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (2, N'Ernest', N'Hemingway', N'eh@gmail.com')
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (3, N'Anton', N'Chekhov', N'')
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [Email]) VALUES (4, N'Jesse', N'Liberty', N'jl@gmail.com')
GO
INSERT [dbo].[AuthorsBook] ([AuthorID], [ISBN], [YearPublished], [Edition]) VALUES (1, 9780743477123, 2003, N'Updated')
GO
INSERT [dbo].[Books] ([ISBN], [BookTitle], [QOH], [UnitPrice], [CategoryID], [PublisherID]) VALUES (9780596001179, N'Programming C#', 200, 15.850000381469727, 333, 101)
INSERT [dbo].[Books] ([ISBN], [BookTitle], [QOH], [UnitPrice], [CategoryID], [PublisherID]) VALUES (9780743477123, N'Hamlet', 100, 20.5, 111, 100)
INSERT [dbo].[Books] ([ISBN], [BookTitle], [QOH], [UnitPrice], [CategoryID], [PublisherID]) VALUES (9784876361328, N'Study Of Chinese Drama', 80, 130.39999389648438, 222, 103)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (111, N'Tragedy')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (222, N'Novel')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (333, N'Programming')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (444, N'Sci-Fi')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (555, N'Romance')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [StreetName], [Province], [City], [PostalCode], [ContactName], [ContactEmail], [CreditLimit]) VALUES (1111111, N'LaSalle College', N'2000 Saint-Catherine St W', N'QC', N'Montreal', N'H3H 2T2', N'LaSalle Manager', N'manager@lasallecollege.com', 5000)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [StreetName], [Province], [City], [PostalCode], [ContactName], [ContactEmail], [CreditLimit]) VALUES (2222222, N'Concordia University', N'2000 Saint-Catherine St W', N'QC', N'Montreal', N'H3G 1M8', N'Concordia Manager', N'manager@concordia.ca', 2000)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [JobID]) VALUES (111, N'Henry', N'Brown', N'(514) 111-1111', N'hebr@gmail.com', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [JobID]) VALUES (222, N'Thomas', N'Moore', N'(514) 222-2222', N'thmo@gmail.com', 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [JobID]) VALUES (333, N'Peter', N'Wang', N'(514) 333-3333', N'pewa@gmail.com', 3)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [JobID]) VALUES (444, N'Mary', N'Brown', N'(514) 444-4444', N'mabr@gmail.com', 4)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [JobID]) VALUES (555, N'Jennifer', N'Bouchard', N'(514) 555-5555', N'jebo@gmail.com', 4)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [JobID]) VALUES (666, N'Kim Hoa', N'Nguyen', N'(514) 666-6666', N'king@gmail.com', 5)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [JobID]) VALUES (999, N'Dainal', N'Le', N'(514) 709-9558', N'danile@gmail.com', 1)
GO
INSERT [dbo].[Jobs] ([JobID], [JobTitle]) VALUES (1, N'MIS Manager')
INSERT [dbo].[Jobs] ([JobID], [JobTitle]) VALUES (2, N'Sales Manager')
INSERT [dbo].[Jobs] ([JobID], [JobTitle]) VALUES (3, N'Inventory Controller')
INSERT [dbo].[Jobs] ([JobID], [JobTitle]) VALUES (4, N'Order Clerk')
INSERT [dbo].[Jobs] ([JobID], [JobTitle]) VALUES (5, N'Accountant')
GO
INSERT [dbo].[OrderLines] ([OrderID], [ISBN], [QuantityOrdered]) VALUES (1111111, 9780596001179, 50)
INSERT [dbo].[OrderLines] ([OrderID], [ISBN], [QuantityOrdered]) VALUES (2222222, 9780596001179, 20)
INSERT [dbo].[OrderLines] ([OrderID], [ISBN], [QuantityOrdered]) VALUES (3333333, 9780743477123, 30)
INSERT [dbo].[OrderLines] ([OrderID], [ISBN], [QuantityOrdered]) VALUES (4444444, 9780743477123, 40)
INSERT [dbo].[OrderLines] ([OrderID], [ISBN], [QuantityOrdered]) VALUES (5555555, 9784876361328, 15)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderType], [RequiredDate], [ShippingDate], [OrderStatus], [CustomerID], [EmployeeID]) VALUES (1111111, N'1/1/2019', N'In Person', N'1/20/2019', N'1/13/2019', N'Done', 1111111, 444)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderType], [RequiredDate], [ShippingDate], [OrderStatus], [CustomerID], [EmployeeID]) VALUES (2222222, N'12/1/2020', N'Email', N'12/10/2020', N'12/5/2020', N'Canceled', 2222222, 333)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderType], [RequiredDate], [ShippingDate], [OrderStatus], [CustomerID], [EmployeeID]) VALUES (3333333, N'12/10/2020', N'Phone', N'12/20/2020', N'12/14/2020', N'Pending', 2222222, 111)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderType], [RequiredDate], [ShippingDate], [OrderStatus], [CustomerID], [EmployeeID]) VALUES (4444444, N'12/14/2020', N'Phone', N'12/20/2020', N'12/16/2020', N'Pending', 1111111, 555)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderType], [RequiredDate], [ShippingDate], [OrderStatus], [CustomerID], [EmployeeID]) VALUES (5555555, N'12/15/2020', N'Email', N'1/15/2021', N'1/10/2021', N'Pending', 1111111, 555)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [WebAddress]) VALUES (100, N'Simon & Schuster', N'www.simonandschuster.com')
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [WebAddress]) VALUES (101, N'Scribner', N'www.scribnerbooks.com')
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [WebAddress]) VALUES (103, N'O''Reilly Media', N'www.oreilly.com')
GO
INSERT [dbo].[UserAccounts] ([UserID], [Password], [EmployeeID], [Comment]) VALUES (111, N'hebr', 111, N'MIS Manager')
INSERT [dbo].[UserAccounts] ([UserID], [Password], [EmployeeID], [Comment]) VALUES (222, N'thmo', 222, N'Sales Manager')
INSERT [dbo].[UserAccounts] ([UserID], [Password], [EmployeeID], [Comment]) VALUES (333, N'pewa', 333, N'Inventory Controller')
INSERT [dbo].[UserAccounts] ([UserID], [Password], [EmployeeID], [Comment]) VALUES (444, N'mabr', 444, N'Order Clerk')
INSERT [dbo].[UserAccounts] ([UserID], [Password], [EmployeeID], [Comment]) VALUES (555, N'jebo', 555, N'Order Clerk')
INSERT [dbo].[UserAccounts] ([UserID], [Password], [EmployeeID], [Comment]) VALUES (666, N'king', 666, N'Accountant')
INSERT [dbo].[UserAccounts] ([UserID], [Password], [EmployeeID], [Comment]) VALUES (999, N'danile', 999, N'This part can be empty!')
GO
ALTER TABLE [dbo].[AuthorsBook]  WITH CHECK ADD  CONSTRAINT [FK_AuthorsBook_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[AuthorsBook] CHECK CONSTRAINT [FK_AuthorsBook_Authors]
GO
ALTER TABLE [dbo].[AuthorsBook]  WITH CHECK ADD  CONSTRAINT [FK_AuthorsBook_Books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Books] ([ISBN])
GO
ALTER TABLE [dbo].[AuthorsBook] CHECK CONSTRAINT [FK_AuthorsBook_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publishers] ([PublisherID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Jobs]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Books] ([ISBN])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Books]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserAccounts_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[UserAccounts] CHECK CONSTRAINT [FK_UserAccounts_Employees]
GO
USE [master]
GO
ALTER DATABASE [Hi-TechDB] SET  READ_WRITE 
GO
