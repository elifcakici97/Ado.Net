USE [master]
GO
/****** Object:  Database [Magaza77]    Script Date: 2.08.2023 10:46:41 ******/
CREATE DATABASE [Magaza77]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Magaza77', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Magaza77.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Magaza77_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Magaza77_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Magaza77] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Magaza77].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Magaza77] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Magaza77] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Magaza77] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Magaza77] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Magaza77] SET ARITHABORT OFF 
GO
ALTER DATABASE [Magaza77] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Magaza77] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Magaza77] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Magaza77] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Magaza77] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Magaza77] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Magaza77] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Magaza77] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Magaza77] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Magaza77] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Magaza77] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Magaza77] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Magaza77] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Magaza77] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Magaza77] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Magaza77] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Magaza77] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Magaza77] SET RECOVERY FULL 
GO
ALTER DATABASE [Magaza77] SET  MULTI_USER 
GO
ALTER DATABASE [Magaza77] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Magaza77] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Magaza77] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Magaza77] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Magaza77] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Magaza77] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Magaza77', N'ON'
GO
ALTER DATABASE [Magaza77] SET QUERY_STORE = ON
GO
ALTER DATABASE [Magaza77] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Magaza77]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 2.08.2023 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelNo] [int] NULL,
	[AdSoyad] [varchar](50) NULL,
	[Birimi] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
	[Maas] [int] NULL,
	[Telefon] [int] NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([ID], [PersonelNo], [AdSoyad], [Birimi], [Adres], [Maas], [Telefon]) VALUES (3, 569, N'Yeşim AKINCI', N'Reyon Görevlisi', N'BURSA', 14000, 214563987)
INSERT [dbo].[Personel] ([ID], [PersonelNo], [AdSoyad], [Birimi], [Adres], [Maas], [Telefon]) VALUES (4, 542, N'Elif ÇAKICI', N'Mağaza Müdürü', N'YALOVA', 25000, 539863256)
INSERT [dbo].[Personel] ([ID], [PersonelNo], [AdSoyad], [Birimi], [Adres], [Maas], [Telefon]) VALUES (5, 452, N'Ahmet YILMAZ', N'Müdür Yardımcıcı', N'ÇANAKKALE', 22000, 852369563)
INSERT [dbo].[Personel] ([ID], [PersonelNo], [AdSoyad], [Birimi], [Adres], [Maas], [Telefon]) VALUES (6, 266, N'Hande YALÇIN', N'Kasa Görevlisi', N'BURSA', 15500, 203689455)
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
/****** Object:  StoredProcedure [dbo].[AraAd]    Script Date: 2.08.2023 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AraAd]
@AdSoyad varchar(50)
as begin
select*from Personel where AdSoyad like '%'+@AdSoyad+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[AraBirimi]    Script Date: 2.08.2023 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AraBirimi]
@Birimi varchar(50)
as begin
select*from Personel where Birimi like '%'+@Birimi+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[AraNo]    Script Date: 2.08.2023 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AraNo]
@PersonelNo int

as begin
select*from Personel where PersonelNo like '%' + cast(@PersonelNo as varchar(50))+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[PGuncelle]    Script Date: 2.08.2023 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PGuncelle]
@ID int,
@PersonelNo int,
@AdSoyad varchar(50),
@Birimi varchar(50),
@Adres varchar(50),
@Maas int,
@Telefon int
as begin
update Personel set PersonelNo=@PersonelNo,AdSoyad=@AdSoyad,Birimi=@Birimi,Adres=@Adres,Maas=@Maas,Telefon=@Telefon where ID=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[PKaydet]    Script Date: 2.08.2023 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKaydet]
@PersonelNo int,
@AdSoyad varchar(50),
@Birimi varchar(50),
@Adres varchar(50),
@Maas int,
@Telefon int
as begin
insert into Personel (PersonelNo,AdSoyad,Birimi,Adres,Maas,Telefon)values(@PersonelNo,@AdSoyad,@Birimi,@Adres,@Maas,@Telefon)
end
GO
/****** Object:  StoredProcedure [dbo].[PListele]    Script Date: 2.08.2023 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PListele]
as begin
select*from Personel
end
GO
/****** Object:  StoredProcedure [dbo].[PSil]    Script Date: 2.08.2023 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PSil]
@ID int
as begin
delete from Personel where ID=@ID
end
GO
USE [master]
GO
ALTER DATABASE [Magaza77] SET  READ_WRITE 
GO
