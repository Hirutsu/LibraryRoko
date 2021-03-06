USE [master]
GO
/****** Object:  Database [BurchuladzeLibrary]    Script Date: 03/29/2022 11:17:21 PM ******/
CREATE DATABASE [BurchuladzeLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BurchuladzeLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BurchuladzeLibrary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BurchuladzeLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BurchuladzeLibrary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BurchuladzeLibrary] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BurchuladzeLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BurchuladzeLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BurchuladzeLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BurchuladzeLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BurchuladzeLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BurchuladzeLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BurchuladzeLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [BurchuladzeLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BurchuladzeLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BurchuladzeLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BurchuladzeLibrary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BurchuladzeLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BurchuladzeLibrary] SET QUERY_STORE = OFF
GO
USE [BurchuladzeLibrary]
GO
/****** Object:  UserDefinedTableType [dbo].[dtIntEntity]    Script Date: 03/29/2022 11:17:21 PM ******/
CREATE TYPE [dbo].[dtIntEntity] AS TABLE(
	[EntityID] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[SecondName] [nvarchar](200) SPARSE  NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorsBooks]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorsBooks](
	[AuthorId] [int] NOT NULL,
	[BookId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorsPatents]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorsPatents](
	[AuthorId] [int] NOT NULL,
	[PatentId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[EditionId] [int] NOT NULL,
	[PublicationHouse] [nvarchar](300) NULL,
	[ISBN] [nvarchar](30) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editions]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editions](
	[EditionId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](300) NULL,
	[PublicationPlace] [nvarchar](200) NULL,
	[PublicationYear] [int] NULL,
	[CountPages] [int] NULL,
	[Description] [nvarchar](2000) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Editions] PRIMARY KEY CLUSTERED 
(
	[EditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsPapers]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsPapers](
	[NewsPaperId] [int] IDENTITY(1,1) NOT NULL,
	[EditionId] [int] NOT NULL,
	[PublicationHouse] [nvarchar](300) NULL,
	[Number] [int] NULL,
	[Date] [date] NULL,
	[ISSN] [nvarchar](20) NULL,
 CONSTRAINT [PK_NewsPapers] PRIMARY KEY CLUSTERED 
(
	[NewsPaperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patents]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patents](
	[PatentId] [int] IDENTITY(1,1) NOT NULL,
	[EditionId] [int] NOT NULL,
	[RegNumber] [int] NULL,
	[AppDate] [date] NULL,
	[PublicationDate] [date] NULL,
 CONSTRAINT [PK_Patents] PRIMARY KEY CLUSTERED 
(
	[PatentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([AuthorId], [FirstName], [SecondName]) VALUES (4039, N'Александр', N'Пушкин')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [SecondName]) VALUES (4040, N'Лев', N'Толстой')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [SecondName]) VALUES (4041, N'Александр', N'Дюма')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [SecondName]) VALUES (4042, N'Артем', N'Анохин')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [SecondName]) VALUES (4043, N'Даниил', N'Орлов')
INSERT [dbo].[Authors] ([AuthorId], [FirstName], [SecondName]) VALUES (4044, N'Павел', N'Дуров')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
INSERT [dbo].[AuthorsBooks] ([AuthorId], [BookId]) VALUES (4039, 3024)
INSERT [dbo].[AuthorsBooks] ([AuthorId], [BookId]) VALUES (4040, 3024)
INSERT [dbo].[AuthorsBooks] ([AuthorId], [BookId]) VALUES (4039, 3025)
INSERT [dbo].[AuthorsBooks] ([AuthorId], [BookId]) VALUES (4040, 3025)
INSERT [dbo].[AuthorsBooks] ([AuthorId], [BookId]) VALUES (4041, 3025)
GO
INSERT [dbo].[AuthorsPatents] ([AuthorId], [PatentId]) VALUES (4042, 1007)
INSERT [dbo].[AuthorsPatents] ([AuthorId], [PatentId]) VALUES (4043, 1007)
INSERT [dbo].[AuthorsPatents] ([AuthorId], [PatentId]) VALUES (4042, 1008)
INSERT [dbo].[AuthorsPatents] ([AuthorId], [PatentId]) VALUES (4043, 1008)
INSERT [dbo].[AuthorsPatents] ([AuthorId], [PatentId]) VALUES (4039, 1009)
INSERT [dbo].[AuthorsPatents] ([AuthorId], [PatentId]) VALUES (4040, 1009)
INSERT [dbo].[AuthorsPatents] ([AuthorId], [PatentId]) VALUES (4044, 1010)
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookId], [EditionId], [PublicationHouse], [ISBN]) VALUES (3024, 3058, N'Аванта', N'ISBN 1-56389-668-5')
INSERT [dbo].[Books] ([BookId], [EditionId], [PublicationHouse], [ISBN]) VALUES (3025, 3062, N'Баванта', N'ISBN 1-56389-668-1')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Editions] ON 

INSERT [dbo].[Editions] ([EditionId], [Title], [PublicationPlace], [PublicationYear], [CountPages], [Description], [Type]) VALUES (3058, N'Капитанская дочка', N'Москва', 1900, 211, N'О дочке капитана', 1)
INSERT [dbo].[Editions] ([EditionId], [Title], [PublicationPlace], [PublicationYear], [CountPages], [Description], [Type]) VALUES (3059, N'Rusphone', N'Россия', 2022, 1000, N'О новом российском телефоне', 3)
INSERT [dbo].[Editions] ([EditionId], [Title], [PublicationPlace], [PublicationYear], [CountPages], [Description], [Type]) VALUES (3061, N'Желтая пресса', N'Москва', 2022, 10, N'О Алле Пугачевы', 2)
INSERT [dbo].[Editions] ([EditionId], [Title], [PublicationPlace], [PublicationYear], [CountPages], [Description], [Type]) VALUES (3062, N'Капитан', N'Саратов', 2001, 100, N'о капитане', 1)
INSERT [dbo].[Editions] ([EditionId], [Title], [PublicationPlace], [PublicationYear], [CountPages], [Description], [Type]) VALUES (3063, N'rusphone', N'Россия', 2022, 555, N'О рос телефоне', 3)
INSERT [dbo].[Editions] ([EditionId], [Title], [PublicationPlace], [PublicationYear], [CountPages], [Description], [Type]) VALUES (3064, N'росграм', N'Россия', 2011, 11, N'российский инстаграм', 3)
INSERT [dbo].[Editions] ([EditionId], [Title], [PublicationPlace], [PublicationYear], [CountPages], [Description], [Type]) VALUES (3065, N'Вк', N'Россия', 2007, 1000, N'социальная сеть клон фейсбука', 3)
INSERT [dbo].[Editions] ([EditionId], [Title], [PublicationPlace], [PublicationYear], [CountPages], [Description], [Type]) VALUES (3066, N'Москва слезам не верит', N'Москва', 2000, 100, N'О Москве и ее москвичах', 2)
SET IDENTITY_INSERT [dbo].[Editions] OFF
GO
SET IDENTITY_INSERT [dbo].[NewsPapers] ON 

INSERT [dbo].[NewsPapers] ([NewsPaperId], [EditionId], [PublicationHouse], [Number], [Date], [ISSN]) VALUES (1004, 3061, N'Волга-пресс', 31228, CAST(N'2022-03-13' AS Date), N'ISSN 1234-4321')
INSERT [dbo].[NewsPapers] ([NewsPaperId], [EditionId], [PublicationHouse], [Number], [Date], [ISSN]) VALUES (1005, 3066, N'Москва-Пресс', 999, CAST(N'2022-02-28' AS Date), N'ISSN 1234-2111')
SET IDENTITY_INSERT [dbo].[NewsPapers] OFF
GO
SET IDENTITY_INSERT [dbo].[Patents] ON 

INSERT [dbo].[Patents] ([PatentId], [EditionId], [RegNumber], [AppDate], [PublicationDate]) VALUES (1007, 3059, 666, CAST(N'2022-01-14' AS Date), CAST(N'2022-03-06' AS Date))
INSERT [dbo].[Patents] ([PatentId], [EditionId], [RegNumber], [AppDate], [PublicationDate]) VALUES (1008, 3063, 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-29' AS Date))
INSERT [dbo].[Patents] ([PatentId], [EditionId], [RegNumber], [AppDate], [PublicationDate]) VALUES (1009, 3064, 2, CAST(N'2022-03-08' AS Date), CAST(N'2022-03-09' AS Date))
INSERT [dbo].[Patents] ([PatentId], [EditionId], [RegNumber], [AppDate], [PublicationDate]) VALUES (1010, 3065, 999, CAST(N'2007-01-23' AS Date), CAST(N'2022-03-23' AS Date))
SET IDENTITY_INSERT [dbo].[Patents] OFF
GO
INSERT [dbo].[Users] ([Login], [Password], [Role]) VALUES (N'levan', N'C7AD44CBAD762A5DA0A452F9E854FDC1E0E7A52A38015F23F3EAB1D80B931DD472634DFAC71CD34EBC35D16AB7FB8A90C81F975113D6C7538DC69DD8DE9077EC', N'admin')
GO
ALTER TABLE [dbo].[AuthorsBooks]  WITH CHECK ADD  CONSTRAINT [FK_AuthorsBooks_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([AuthorId])
GO
ALTER TABLE [dbo].[AuthorsBooks] CHECK CONSTRAINT [FK_AuthorsBooks_Authors]
GO
ALTER TABLE [dbo].[AuthorsBooks]  WITH CHECK ADD  CONSTRAINT [FK_AuthorsBooks_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AuthorsBooks] CHECK CONSTRAINT [FK_AuthorsBooks_Books]
GO
ALTER TABLE [dbo].[AuthorsPatents]  WITH CHECK ADD  CONSTRAINT [FK_AuthorsPatents_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([AuthorId])
GO
ALTER TABLE [dbo].[AuthorsPatents] CHECK CONSTRAINT [FK_AuthorsPatents_Authors]
GO
ALTER TABLE [dbo].[AuthorsPatents]  WITH CHECK ADD  CONSTRAINT [FK_AuthorsPatents_Patents] FOREIGN KEY([PatentId])
REFERENCES [dbo].[Patents] ([PatentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AuthorsPatents] CHECK CONSTRAINT [FK_AuthorsPatents_Patents]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Editions] FOREIGN KEY([EditionId])
REFERENCES [dbo].[Editions] ([EditionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Editions]
GO
ALTER TABLE [dbo].[NewsPapers]  WITH CHECK ADD  CONSTRAINT [FK_NewsPapers_Editions] FOREIGN KEY([EditionId])
REFERENCES [dbo].[Editions] ([EditionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsPapers] CHECK CONSTRAINT [FK_NewsPapers_Editions]
GO
ALTER TABLE [dbo].[Patents]  WITH CHECK ADD  CONSTRAINT [FK_Patents_Editions] FOREIGN KEY([EditionId])
REFERENCES [dbo].[Editions] ([EditionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Patents] CHECK CONSTRAINT [FK_Patents_Editions]
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorsByBookIds]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAuthorsByBookIds]
	@ids [dtIntEntity] READONLY
AS
BEGIN
	SELECT a.[AuthorId], [FirstName], [SecondName], ba.BookId FROM [Authors] a
	LEFT JOIN [AuthorsBooks] ba on ba.AuthorId = a.AuthorId
	WHERE ba.BookId IN (SELECT [EntityID] FROM @ids)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorsByPatentIds]    Script Date: 03/29/2022 11:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAuthorsByPatentIds]
	@ids [dtIntEntity] READONLY
AS
BEGIN
	SELECT a.[AuthorId], [FirstName], [SecondName], ba.PatentId FROM [Authors] a
	LEFT JOIN [AuthorsPatents] ba on ba.AuthorId = a.AuthorId
	WHERE ba.PatentId IN (SELECT [EntityID] FROM @ids)
END
GO
USE [master]
GO
ALTER DATABASE [BurchuladzeLibrary] SET  READ_WRITE 
GO
