USE [master]
GO
/****** Object:  Database [PeliculasDB]    Script Date: Aug/9/2020 12:52:03 PM ******/
CREATE DATABASE [PeliculasDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PeliculasDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PeliculasDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PeliculasDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PeliculasDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PeliculasDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PeliculasDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PeliculasDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PeliculasDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PeliculasDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PeliculasDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PeliculasDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PeliculasDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PeliculasDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PeliculasDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PeliculasDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PeliculasDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PeliculasDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PeliculasDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PeliculasDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PeliculasDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PeliculasDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PeliculasDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PeliculasDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PeliculasDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PeliculasDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PeliculasDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PeliculasDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PeliculasDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PeliculasDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PeliculasDB] SET  MULTI_USER 
GO
ALTER DATABASE [PeliculasDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PeliculasDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PeliculasDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PeliculasDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PeliculasDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PeliculasDB] SET QUERY_STORE = OFF
GO
USE [PeliculasDB]
GO
/****** Object:  Table [dbo].[TBL_PELICULA]    Script Date: Aug/9/2020 12:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PELICULA](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[Director] [varchar](50) NULL,
	[AutorPrincipal] [varchar](50) NULL,
	[No_Actores] [int] NULL,
	[Duracion] [float] NULL,
	[Estreno] [int] NULL,
 CONSTRAINT [PK_TBL_PELICULA] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_PELICULA_T2_6]    Script Date: Aug/9/2020 12:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PELICULA_T2_6](
	[Codigo] [int] NOT NULL,
	[Titulo] [varchar](50) NULL,
	[Director] [varchar](50) NULL,
	[ActorPrincipal] [varchar](50) NULL,
	[No_Actores] [int] NULL,
	[Duracion] [float] NULL,
	[Estreno] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_PELICULA] ON 

INSERT [dbo].[TBL_PELICULA] ([Codigo], [Titulo], [Director], [AutorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (1, N'The Godfather', N'Francis Ford Coppola', N'Al Pacino', 30, 2, 1994)
INSERT [dbo].[TBL_PELICULA] ([Codigo], [Titulo], [Director], [AutorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (2, N'The Shawshank', N'Frank Darabont', N'Morgan Freeman', 15, 3, 1972)
INSERT [dbo].[TBL_PELICULA] ([Codigo], [Titulo], [Director], [AutorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (3, N'The Matrix', N'Lana Wachowski', N'Keanu Reeves', 15, 2.3, 1999)
INSERT [dbo].[TBL_PELICULA] ([Codigo], [Titulo], [Director], [AutorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (4, N'City of God', N'Fernando Meirelles', N'Alexandre Rodrigues', 10, 3, 2002)
INSERT [dbo].[TBL_PELICULA] ([Codigo], [Titulo], [Director], [AutorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (5, N'Star Wars: Episode IV', N'George Lucas', N'Harrison Ford', 20, 2.4, 2007)
SET IDENTITY_INSERT [dbo].[TBL_PELICULA] OFF
INSERT [dbo].[TBL_PELICULA_T2_6] ([Codigo], [Titulo], [Director], [ActorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (1, N'The Godfather', N'Francis Ford Coppola', N'Al Pacino', 30, 2, 1994)
INSERT [dbo].[TBL_PELICULA_T2_6] ([Codigo], [Titulo], [Director], [ActorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (2, N'The Shawshank', N'Frank Darabont', N'Morgan Freeman', 15, 3, 1972)
INSERT [dbo].[TBL_PELICULA_T2_6] ([Codigo], [Titulo], [Director], [ActorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (3, N'The Matrix', N'Lana Wachowski', N'Keanu Reeves', 15, 2.3, 1999)
INSERT [dbo].[TBL_PELICULA_T2_6] ([Codigo], [Titulo], [Director], [ActorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (4, N'City of God', N'Fernando Meirelles', N'Alexandre Rodrigues', 10, 3, 2002)
INSERT [dbo].[TBL_PELICULA_T2_6] ([Codigo], [Titulo], [Director], [ActorPrincipal], [No_Actores], [Duracion], [Estreno]) VALUES (5, N'Star Wars: Episode IV', N'George Lucas', N'Harrison Ford', 20, 2.4000000953674316, 2007)
USE [master]
GO
ALTER DATABASE [PeliculasDB] SET  READ_WRITE 
GO
