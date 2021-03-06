USE [master]
GO
/****** Object:  Database [IMBD_DB]    Script Date: 2/07/2021 11:42:17 a. m. ******/
CREATE DATABASE [IMBD_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMBD_DB', FILENAME = N'/var/opt/mssql/data/IMBD_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IMBD_DB_log', FILENAME = N'/var/opt/mssql/data/IMBD_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IMBD_DB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMBD_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMBD_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IMBD_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IMBD_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IMBD_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IMBD_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IMBD_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IMBD_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IMBD_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IMBD_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IMBD_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IMBD_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IMBD_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IMBD_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IMBD_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IMBD_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IMBD_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IMBD_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IMBD_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IMBD_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IMBD_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IMBD_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IMBD_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IMBD_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [IMBD_DB] SET  MULTI_USER 
GO
ALTER DATABASE [IMBD_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IMBD_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IMBD_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IMBD_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IMBD_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IMBD_DB', N'ON'
GO
ALTER DATABASE [IMBD_DB] SET QUERY_STORE = OFF
GO
USE [IMBD_DB]
GO
/****** Object:  Table [dbo].[AlternativeAttribute]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlternativeAttribute](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](100) NULL,
	[n] [smallint] NULL,
 CONSTRAINT [PK_AlternativeAttribute] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlternativeTitle]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlternativeTitle](
	[id] [bigint] NOT NULL,
	[titleId] [bigint] NOT NULL,
	[regionId] [bigint] NOT NULL,
	[languageId] [bigint] NOT NULL,
	[alternativeTypeId] [bigint] NOT NULL,
	[alternativeAttributeId] [bigint] NOT NULL,
	[title] [nvarchar](100) NULL,
	[ordering] [int] NULL,
	[isOriginal] [smallint] NULL,
	[n] [smallint] NULL,
 CONSTRAINT [PK_AlternativeTitle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlternativeType]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlternativeType](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](100) NULL,
	[n] [smallint] NULL,
 CONSTRAINT [PK_AlternativeType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Director]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Director](
	[nameId] [bigint] NOT NULL,
	[titleId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Episode]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Episode](
	[id] [bigint] NOT NULL,
	[titleId] [bigint] NOT NULL,
	[parentId] [bigint] NOT NULL,
	[season] [int] NULL,
	[episode] [int] NULL,
	[n] [smallint] NULL,
 CONSTRAINT [PK_Episode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[id] [bigint] NOT NULL,
	[name] [nchar](100) NULL,
	[n] [smallint] NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KnowForTitle]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KnowForTitle](
	[nameId] [bigint] NOT NULL,
	[titleId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](100) NULL,
	[n] [smallint] NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Name]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Name](
	[id] [bigint] NOT NULL,
	[primeryName] [nvarchar](100) NULL,
	[birthYear] [date] NULL,
	[DeathYear] [date] NULL,
 CONSTRAINT [PK_Name] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameProfession]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameProfession](
	[nameId] [bigint] NOT NULL,
	[professionId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Principal]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Principal](
	[id] [bigint] NOT NULL,
	[nameId] [bigint] NOT NULL,
	[titleId] [bigint] NOT NULL,
	[categoryId] [bigint] NOT NULL,
	[jobId] [bigint] NULL,
	[order] [bigint] NULL,
	[character] [nvarchar](50) NULL,
 CONSTRAINT [PK_Principal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profession]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profession](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Profession] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[id] [bigint] NOT NULL,
	[titleId] [bigint] NOT NULL,
	[averageRating] [int] NULL,
	[numVotes] [bigint] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](100) NULL,
	[n] [smallint] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[id] [bigint] NOT NULL,
	[titleTypeId] [bigint] NOT NULL,
	[primaryTitle] [nvarchar](100) NULL,
	[originalTitle] [nvarchar](100) NULL,
	[isAdult] [smallint] NULL,
	[startYear] [date] NULL,
	[endYear] [date] NULL,
	[runtime] [nvarchar](50) NULL,
	[n] [smallint] NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleGenre]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleGenre](
	[titleId] [bigint] NOT NULL,
	[genreId] [bigint] NOT NULL,
	[n] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleType]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleType](
	[id] [bigint] NOT NULL,
	[name] [varchar](100) NULL,
	[n] [smallint] NULL,
 CONSTRAINT [PK_TitleType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writer]    Script Date: 2/07/2021 11:42:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writer](
	[nameId] [bigint] NOT NULL,
	[titleId] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlternativeTitle]  WITH CHECK ADD  CONSTRAINT [FK_AlternativeTitle_AlternativeAttribute] FOREIGN KEY([alternativeAttributeId])
REFERENCES [dbo].[AlternativeAttribute] ([id])
GO
ALTER TABLE [dbo].[AlternativeTitle] CHECK CONSTRAINT [FK_AlternativeTitle_AlternativeAttribute]
GO
ALTER TABLE [dbo].[AlternativeTitle]  WITH CHECK ADD  CONSTRAINT [FK_AlternativeTitle_AlternativeType] FOREIGN KEY([alternativeTypeId])
REFERENCES [dbo].[AlternativeType] ([id])
GO
ALTER TABLE [dbo].[AlternativeTitle] CHECK CONSTRAINT [FK_AlternativeTitle_AlternativeType]
GO
ALTER TABLE [dbo].[AlternativeTitle]  WITH CHECK ADD  CONSTRAINT [FK_AlternativeTitle_Language] FOREIGN KEY([languageId])
REFERENCES [dbo].[Language] ([id])
GO
ALTER TABLE [dbo].[AlternativeTitle] CHECK CONSTRAINT [FK_AlternativeTitle_Language]
GO
ALTER TABLE [dbo].[AlternativeTitle]  WITH CHECK ADD  CONSTRAINT [FK_AlternativeTitle_Region] FOREIGN KEY([regionId])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[AlternativeTitle] CHECK CONSTRAINT [FK_AlternativeTitle_Region]
GO
ALTER TABLE [dbo].[AlternativeTitle]  WITH CHECK ADD  CONSTRAINT [FK_AlternativeTitle_Title] FOREIGN KEY([titleId])
REFERENCES [dbo].[Title] ([id])
GO
ALTER TABLE [dbo].[AlternativeTitle] CHECK CONSTRAINT [FK_AlternativeTitle_Title]
GO
ALTER TABLE [dbo].[Director]  WITH CHECK ADD  CONSTRAINT [FK_Director_Name] FOREIGN KEY([nameId])
REFERENCES [dbo].[Name] ([id])
GO
ALTER TABLE [dbo].[Director] CHECK CONSTRAINT [FK_Director_Name]
GO
ALTER TABLE [dbo].[Director]  WITH CHECK ADD  CONSTRAINT [FK_Director_Title] FOREIGN KEY([titleId])
REFERENCES [dbo].[Title] ([id])
GO
ALTER TABLE [dbo].[Director] CHECK CONSTRAINT [FK_Director_Title]
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_Title] FOREIGN KEY([titleId])
REFERENCES [dbo].[Title] ([id])
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_Title]
GO
ALTER TABLE [dbo].[KnowForTitle]  WITH CHECK ADD  CONSTRAINT [FK_KnowForTitle_Name] FOREIGN KEY([nameId])
REFERENCES [dbo].[Name] ([id])
GO
ALTER TABLE [dbo].[KnowForTitle] CHECK CONSTRAINT [FK_KnowForTitle_Name]
GO
ALTER TABLE [dbo].[KnowForTitle]  WITH CHECK ADD  CONSTRAINT [FK_KnowForTitle_Title] FOREIGN KEY([titleId])
REFERENCES [dbo].[Title] ([id])
GO
ALTER TABLE [dbo].[KnowForTitle] CHECK CONSTRAINT [FK_KnowForTitle_Title]
GO
ALTER TABLE [dbo].[NameProfession]  WITH CHECK ADD  CONSTRAINT [FK_NameProfession_Name] FOREIGN KEY([nameId])
REFERENCES [dbo].[Name] ([id])
GO
ALTER TABLE [dbo].[NameProfession] CHECK CONSTRAINT [FK_NameProfession_Name]
GO
ALTER TABLE [dbo].[NameProfession]  WITH CHECK ADD  CONSTRAINT [FK_NameProfession_Profession] FOREIGN KEY([professionId])
REFERENCES [dbo].[Profession] ([id])
GO
ALTER TABLE [dbo].[NameProfession] CHECK CONSTRAINT [FK_NameProfession_Profession]
GO
ALTER TABLE [dbo].[Principal]  WITH CHECK ADD  CONSTRAINT [FK_Principal_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Principal] CHECK CONSTRAINT [FK_Principal_Category]
GO
ALTER TABLE [dbo].[Principal]  WITH CHECK ADD  CONSTRAINT [FK_Principal_Name] FOREIGN KEY([nameId])
REFERENCES [dbo].[Name] ([id])
GO
ALTER TABLE [dbo].[Principal] CHECK CONSTRAINT [FK_Principal_Name]
GO
ALTER TABLE [dbo].[Principal]  WITH CHECK ADD  CONSTRAINT [FK_Principal_Title] FOREIGN KEY([titleId])
REFERENCES [dbo].[Title] ([id])
GO
ALTER TABLE [dbo].[Principal] CHECK CONSTRAINT [FK_Principal_Title]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Title] FOREIGN KEY([titleId])
REFERENCES [dbo].[Title] ([id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Title]
GO
ALTER TABLE [dbo].[Title]  WITH CHECK ADD  CONSTRAINT [FK_Title_TitleType] FOREIGN KEY([titleTypeId])
REFERENCES [dbo].[TitleType] ([id])
GO
ALTER TABLE [dbo].[Title] CHECK CONSTRAINT [FK_Title_TitleType]
GO
ALTER TABLE [dbo].[TitleGenre]  WITH CHECK ADD  CONSTRAINT [FK_TitleGenre_Genre] FOREIGN KEY([genreId])
REFERENCES [dbo].[Genre] ([id])
GO
ALTER TABLE [dbo].[TitleGenre] CHECK CONSTRAINT [FK_TitleGenre_Genre]
GO
ALTER TABLE [dbo].[TitleGenre]  WITH CHECK ADD  CONSTRAINT [FK_TitleGenre_Title] FOREIGN KEY([titleId])
REFERENCES [dbo].[Title] ([id])
GO
ALTER TABLE [dbo].[TitleGenre] CHECK CONSTRAINT [FK_TitleGenre_Title]
GO
ALTER TABLE [dbo].[Writer]  WITH CHECK ADD  CONSTRAINT [FK_Writer_Name] FOREIGN KEY([nameId])
REFERENCES [dbo].[Name] ([id])
GO
ALTER TABLE [dbo].[Writer] CHECK CONSTRAINT [FK_Writer_Name]
GO
ALTER TABLE [dbo].[Writer]  WITH CHECK ADD  CONSTRAINT [FK_Writer_Title] FOREIGN KEY([titleId])
REFERENCES [dbo].[Title] ([id])
GO
ALTER TABLE [dbo].[Writer] CHECK CONSTRAINT [FK_Writer_Title]
GO
USE [master]
GO
ALTER DATABASE [IMBD_DB] SET  READ_WRITE 
GO
