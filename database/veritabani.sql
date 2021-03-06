USE [master]
GO
/****** Object:  Database [bookshop]    Script Date: 10.05.2021 04:21:58 ******/
CREATE DATABASE [bookshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookshop', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bookshop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bookshop_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bookshop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bookshop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookshop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [bookshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookshop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bookshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookshop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bookshop] SET  MULTI_USER 
GO
ALTER DATABASE [bookshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookshop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [bookshop]
GO
/****** Object:  StoredProcedure [dbo].[book_Add]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[book_Add]
@name varchar(50),
@type varchar(50),
@releaseDate date,
@pageNum int,
@price int

As
Begin
Insert Into book (name,type,releaseDate,pageNum,price) Values(@name,@type,@releaseDate,@pageNum,@price)
End
GO
/****** Object:  StoredProcedure [dbo].[book_Update]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[book_Update]
@Id int,
@name varchar(50),
@type varchar(50),
@releaseDate date,
@pageNum int,
@price int

As
Begin
Update book Set name=@name,type=@type,releaseDate=@releaseDate,pageNum=@pageNum,price=@price
Where Id=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[customer_Add]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[customer_Add]
@secnum varchar(15),
@name varchar(50),
@surname varchar(50),
@sex varchar(6),
@email varchar(100),
@phone varchar(15),
@address text

As
Begin
Insert Into customer (secnum,name,surname,sex,email,phone,address) Values(@secnum,@name,@surname,@sex,@email,@phone,@address)
End
GO
/****** Object:  StoredProcedure [dbo].[customer_Update]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[customer_Update]
@Id int,
@secnum varchar(15),
@name varchar(50),
@surname varchar(50),
@sex varchar(6),
@email varchar(100),
@phone varchar(15),
@address text

As
Begin
Update customer Set secnum=@secnum,name=@name,surname=@surname,sex=@sex,email=@email,phone=@phone,address=@address
Where Id=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[DataList]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DataList]
@Table varchar(50)
As
Begin
	EXEC('Select * From ' + @Table)
End

GO
/****** Object:  StoredProcedure [dbo].[DeleteReg]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteReg]
@Table varchar(50),
@Id int

As
Begin
EXEC('Delete From '+ @Table+' Where Id='+@Id)
End
GO
/****** Object:  StoredProcedure [dbo].[GetReg]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetReg]
@Table varchar(50),
@Id int

As
Begin
EXEC('Select *From '+ @Table+' Where Id='+@Id)
End
GO
/****** Object:  StoredProcedure [dbo].[GetRegUser]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetRegUser]
@customerId int

As
Begin
Select *From users Where customerId=@customerId
End
GO
/****** Object:  StoredProcedure [dbo].[sales_Add]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sales_Add]
@bookId int,
@customerId int,
@date date

As
Begin
Insert Into sales (bookId,customerId,date) Values(@bookId,@customerId,@date)
End
GO
/****** Object:  StoredProcedure [dbo].[sales_Update]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sales_Update]
@Id int,
@bookId int,
@customerId int,
@date date

As
Begin
Update sales Set bookId=@bookId,customerId=@customerId,date=@date
Where Id=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[UserControl]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[UserControl]
@username varchar(50),
@password varchar(50)

As
Begin
Select *From users Where username=@username and password=@password
End

GO
/****** Object:  StoredProcedure [dbo].[users_Add]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[users_Add]
@customerId int,
@username varchar(50),
@password varchar(50)

As
Begin
Insert Into users (customerId,username,password)
Values(@customerId,@username,@password)
End
GO
/****** Object:  StoredProcedure [dbo].[users_Update]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[users_Update]
@Id int,
@customerId int,
@username varchar(50),
@password varchar(50)

As
Begin
Update users Set customerId=@customerId,username=@username,password=@password
Where Id=@Id
End
GO
/****** Object:  Table [dbo].[book]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[releaseDate] [date] NULL,
	[pageNum] [int] NOT NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[secnum] [varchar](15) NULL,
	[name] [varchar](50) NULL,
	[surname] [varchar](50) NULL,
	[sex] [varchar](6) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](15) NULL,
	[address] [text] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sales]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NULL,
	[customerId] [int] NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 10.05.2021 04:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[customerId] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([Id], [name], [type], [releaseDate], [pageNum], [price]) VALUES (1, N'aaaaa', N'Literary Fiction', CAST(0x7C420B00 AS Date), 630, 34)
INSERT [dbo].[book] ([Id], [name], [type], [releaseDate], [pageNum], [price]) VALUES (2, N'kitap1', N'Detective and Mystery', CAST(0x7F420B00 AS Date), 150, 25)
INSERT [dbo].[book] ([Id], [name], [type], [releaseDate], [pageNum], [price]) VALUES (3, N'kitap2', N'Romance', CAST(0x7F420B00 AS Date), 503, 35)
SET IDENTITY_INSERT [dbo].[book] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([Id], [secnum], [name], [surname], [sex], [email], [phone], [address]) VALUES (3, N'12345678911', N'Kadir Çetin', N'Dündar', N'Man', N'kadir@gmail.com', N'(545) 646-5465', N'istanbul')
INSERT [dbo].[customer] ([Id], [secnum], [name], [surname], [sex], [email], [phone], [address]) VALUES (4, N'12345678912', N'Ahmet', N'Balaban', N'Man', N'ahmet@mail.com', N'(545) 646-5465', N'adana')
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[sales] ON 

INSERT [dbo].[sales] ([Id], [bookId], [customerId], [date]) VALUES (1, 1, 3, CAST(0x7F420B00 AS Date))
INSERT [dbo].[sales] ([Id], [bookId], [customerId], [date]) VALUES (2, 2, 4, CAST(0x7F420B00 AS Date))
INSERT [dbo].[sales] ([Id], [bookId], [customerId], [date]) VALUES (3, 3, 4, CAST(0x7F420B00 AS Date))
SET IDENTITY_INSERT [dbo].[sales] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([Id], [username], [password], [customerId]) VALUES (1, N'kadir', N'12345678', 3)
INSERT [dbo].[users] ([Id], [username], [password], [customerId]) VALUES (2, N'admin', N'123456', 0)
INSERT [dbo].[users] ([Id], [username], [password], [customerId]) VALUES (3, N'ahmet', N'12345678', 4)
SET IDENTITY_INSERT [dbo].[users] OFF
USE [master]
GO
ALTER DATABASE [bookshop] SET  READ_WRITE 
GO
