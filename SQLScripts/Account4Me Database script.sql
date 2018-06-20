USE [master]
GO
/****** Object:  Database [BackendCapstone]    Script Date: 6/20/2018 5:08:31 PM ******/
CREATE DATABASE [BackendCapstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BackendCapstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BackendCapstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BackendCapstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BackendCapstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BackendCapstone] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BackendCapstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BackendCapstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BackendCapstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BackendCapstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BackendCapstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BackendCapstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [BackendCapstone] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BackendCapstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BackendCapstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BackendCapstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BackendCapstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BackendCapstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BackendCapstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BackendCapstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BackendCapstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BackendCapstone] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BackendCapstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BackendCapstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BackendCapstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BackendCapstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BackendCapstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BackendCapstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BackendCapstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BackendCapstone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BackendCapstone] SET  MULTI_USER 
GO
ALTER DATABASE [BackendCapstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BackendCapstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BackendCapstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BackendCapstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BackendCapstone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BackendCapstone] SET QUERY_STORE = OFF
GO
USE [BackendCapstone]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BackendCapstone]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 6/20/2018 5:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](200) NOT NULL,
	[TimeAtLocation] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentLocations]    Script Date: 6/20/2018 5:08:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentLocations](
	[StudentLocationsId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[CheckedIn] [datetime] NULL,
	[CheckedOut] [datetime] NULL,
 CONSTRAINT [PK_StudentLocations] PRIMARY KEY CLUSTERED 
(
	[StudentLocationsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 6/20/2018 5:08:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[HomeroomTeacherId] [int] NOT NULL,
	[IsAtSchool] [bit] NOT NULL,
	[InTransit] [bit] NOT NULL,
	[IsGoneTooLong] [bit] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[InHomeroom] [bit] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 6/20/2018 5:08:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[IsHomeroomTeacher] [bit] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (1, N'gym', 45)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (2, N'speech - Leslie', 35)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (3, N'Tier II Intervention', 30)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (4, N'Tier III Intervention', 45)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (5, N'Special Ed - Fann', 30)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (6, N'Special Ed - Brewer', 30)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (7, N'speech - Savage', 30)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (8, N'Office', 15)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (9, N'Art', 45)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (10, N'Library', 45)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (11, N'Technology', 45)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (12, N'Guidance', 30)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (13, N'Cafeteria', 25)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (14, N'Red Playground', 30)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (15, N'Teacher A', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (16, N'Teacher B', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (17, N'Teacher C', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (18, N'Teacher D', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (19, N'Teacher E', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (20, N'Teacher F', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (21, N'Teacher G', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (22, N'Teacher H', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (23, N'Teacher I', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (24, N'Teacher J', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (25, N'Teacher K', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (26, N'Teacher L', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (27, N'Teacher M', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (28, N'Teacher N', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (29, N'Teacher O', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (30, N'Teacher P', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (31, N'Teacher Q', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (32, N'Teacher R', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (33, N'Teacher S', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (34, N'Teacher T', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (35, N'Teacher U', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (36, N'Teacher V', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (37, N'Teacher W', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (38, N'Teacher X', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (39, N'Teacher Y', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (40, N'Teacher Z', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (41, N'Sensory Room', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (42, N'Blue Playground', 30)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (43, N'Pre-K Playground', 45)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (44, N'Restroom', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (45, N'Teacher Workroom', NULL)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (46, N'Computer Lab #27', 0)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [TimeAtLocation]) VALUES (47, N'Ms. Stoops', NULL)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[StudentLocations] ON 

INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (1, 18, 3, CAST(N'2018-06-16T14:22:07.130' AS DateTime), CAST(N'2018-06-16T14:22:05.270' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (2, 18, 2, CAST(N'2018-06-16T14:22:53.390' AS DateTime), CAST(N'2018-06-16T14:22:39.000' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (3, 18, 11, CAST(N'2018-06-16T14:23:07.953' AS DateTime), CAST(N'2018-06-16T14:23:02.537' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (4, 18, 7, CAST(N'2018-06-18T19:16:24.200' AS DateTime), CAST(N'2018-06-16T14:26:00.523' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (5, 18, 7, CAST(N'2018-06-18T19:16:24.200' AS DateTime), CAST(N'2018-06-16T14:26:19.890' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (6, 18, 7, CAST(N'2018-06-18T19:16:24.200' AS DateTime), CAST(N'2018-06-18T19:16:22.057' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (7, 28, 11, CAST(N'2018-06-18T19:17:02.530' AS DateTime), CAST(N'2018-06-18T19:16:48.590' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (8, 28, 11, CAST(N'2018-06-18T19:17:02.530' AS DateTime), CAST(N'2018-06-18T19:16:54.167' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (9, 28, 11, CAST(N'2018-06-18T19:17:02.530' AS DateTime), CAST(N'2018-06-18T19:16:59.120' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (10, 28, 7, CAST(N'2018-06-18T19:21:37.607' AS DateTime), CAST(N'2018-06-18T19:21:23.193' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (11, 43, 7, CAST(N'2018-06-18T19:22:38.953' AS DateTime), CAST(N'2018-06-18T19:22:20.183' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (12, 43, 7, CAST(N'2018-06-18T19:22:38.953' AS DateTime), CAST(N'2018-06-18T19:22:25.903' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (13, 43, 7, CAST(N'2018-06-18T19:22:38.953' AS DateTime), CAST(N'2018-06-18T19:22:30.807' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (14, 43, 11, CAST(N'2018-06-18T19:28:02.527' AS DateTime), CAST(N'2018-06-18T19:27:36.110' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (15, 43, 11, CAST(N'2018-06-18T19:28:02.527' AS DateTime), CAST(N'2018-06-18T19:27:55.273' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (16, 18, 2, CAST(N'2018-06-18T19:47:42.833' AS DateTime), CAST(N'2018-06-18T19:28:22.800' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (17, 18, 2, CAST(N'2018-06-18T19:47:42.833' AS DateTime), CAST(N'2018-06-18T19:47:36.613' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (18, 30, 1, CAST(N'2018-06-18T19:50:11.270' AS DateTime), CAST(N'2018-06-18T19:48:04.583' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (19, 18, 8, CAST(N'2018-06-18T19:51:55.410' AS DateTime), CAST(N'2018-06-18T19:50:55.863' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (20, 18, 2, CAST(N'2018-06-18T19:52:54.460' AS DateTime), CAST(N'2018-06-18T19:52:30.630' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (21, 18, 2, CAST(N'2018-06-18T19:52:54.460' AS DateTime), CAST(N'2018-06-18T19:52:34.760' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (22, 18, 2, CAST(N'2018-06-18T19:52:54.460' AS DateTime), CAST(N'2018-06-18T19:52:41.163' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (23, 18, 14, CAST(N'2018-06-18T20:02:43.770' AS DateTime), CAST(N'2018-06-18T20:00:55.440' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (24, 18, 14, CAST(N'2018-06-18T20:02:43.770' AS DateTime), CAST(N'2018-06-18T20:01:43.920' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (25, 18, 14, CAST(N'2018-06-18T20:02:43.770' AS DateTime), CAST(N'2018-06-18T20:02:14.883' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (26, 18, 6, CAST(N'2018-06-18T20:12:13.520' AS DateTime), CAST(N'2018-06-18T20:08:21.720' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (27, 28, 1, CAST(N'2018-06-18T20:08:59.907' AS DateTime), CAST(N'2018-06-18T20:08:37.080' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (28, 30, 11, CAST(N'2018-06-18T20:12:12.250' AS DateTime), CAST(N'2018-06-18T20:08:51.007' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (29, 28, 10, CAST(N'2018-06-18T20:12:15.430' AS DateTime), CAST(N'2018-06-18T20:12:10.737' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (30, 16, 3, CAST(N'2018-06-19T01:44:49.423' AS DateTime), CAST(N'2018-06-18T20:30:17.310' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (31, 23, 7, NULL, CAST(N'2018-06-18T20:30:22.037' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (32, 21, 11, NULL, CAST(N'2018-06-18T20:30:25.253' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (33, 24, 8, CAST(N'2018-06-19T01:44:53.833' AS DateTime), CAST(N'2018-06-18T20:30:32.683' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (34, 19, 4, NULL, CAST(N'2018-06-18T20:55:01.110' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (35, 31, 12, NULL, CAST(N'2018-06-18T20:55:06.893' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (36, 32, 10, NULL, CAST(N'2018-06-18T20:56:47.200' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (37, 35, 14, NULL, CAST(N'2018-06-18T20:56:52.720' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (38, 53, 3, NULL, CAST(N'2018-06-18T20:59:11.520' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (39, 51, 14, NULL, CAST(N'2018-06-18T20:59:16.397' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (40, 98, 4, NULL, CAST(N'2018-06-18T21:02:34.183' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (41, 99, 14, NULL, CAST(N'2018-06-18T21:04:04.930' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (42, 72, 4, CAST(N'2018-06-18T21:12:46.550' AS DateTime), CAST(N'2018-06-18T21:05:07.100' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (43, 73, 14, CAST(N'2018-06-18T21:12:51.463' AS DateTime), CAST(N'2018-06-18T21:06:01.563' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (44, 95, 14, NULL, CAST(N'2018-06-18T21:28:58.897' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (45, 42, 11, NULL, CAST(N'2018-06-19T01:46:23.090' AS DateTime))
INSERT [dbo].[StudentLocations] ([StudentLocationsId], [StudentId], [LocationId], [CheckedIn], [CheckedOut]) VALUES (46, 44, 2, CAST(N'2018-06-19T01:46:33.980' AS DateTime), CAST(N'2018-06-19T01:46:29.830' AS DateTime))
SET IDENTITY_INSERT [dbo].[StudentLocations] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (7, 40, 0, 0, 0, N'Peter', N'Pan', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (8, 40, 0, 0, 0, N'Captain', N'Hook', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (9, 40, 0, 0, 0, N'Tinker', N'Bell', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (10, 40, 0, 0, 0, N'Billy', N'Bob', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (11, 40, 0, 0, 0, N'Candy', N'Sweet', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (12, 40, 0, 0, 0, N'Star', N'Shine', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (13, 40, 0, 0, 0, N'Bright', N'Light', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (14, 40, 0, 0, 0, N'Willow', N'WInd', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (15, 40, 0, 0, 0, N'Vin', N'Diesel', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (16, 14, 1, 0, 0, N'Abby', N'Blue', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (17, 15, 0, 0, 0, N'Clay', N'David', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (18, 16, 1, 0, 0, N'Evan', N'Fly', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (19, 17, 1, 0, 0, N'Gavin', N'Heath', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (20, 14, 0, 0, 0, N'Isabelle', N'Jolie', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (21, 14, 1, 0, 0, N'Kate', N'Long', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (23, 14, 1, 0, 0, N'Mandy', N'Neal', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (24, 14, 1, 0, 0, N'Opal', N'Peanut', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (25, 15, 0, 0, 0, N'Quentin', N'Rowe', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (26, 15, 0, 0, 0, N'Steve', N'Tate', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (27, 15, 0, 0, 0, N'Unique', N'Vine', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (28, 16, 1, 0, 0, N'Wendy', N'Young', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (29, 16, 0, 0, 0, N'Zane', N'Abernathy', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (30, 16, 1, 0, 0, N'Brian', N'Cathey', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (31, 17, 1, 0, 0, N'Deena', N'Evers', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (32, 17, 1, 0, 0, N'Frank', N'Guthrie', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (33, 17, 1, 0, 0, N'Hal', N'Irvin', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (34, 17, 1, 0, 0, N'Justin', N'Kelly', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (35, 17, 1, 0, 0, N'Landon', N'Mark', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (36, 18, 0, 0, 0, N'Nathan', N'Oakley', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (37, 18, 0, 0, 0, N'Penny', N'Queen', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (38, 18, 0, 0, 0, N'Robert', N'Smith', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (39, 19, 0, 0, 0, N'Tiffany', N'Turner', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (40, 19, 0, 0, 0, N'Serena', N'Stephen', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (41, 19, 0, 0, 0, N'Casey', N'Crain', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (42, 20, 1, 0, 0, N'Rudy', N'Rose', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (43, 20, 1, 0, 0, N'Bethany', N'Bean', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (44, 20, 1, 0, 0, N'David', N'Davis', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (45, 21, 0, 0, 0, N'Ethan', N'Adams', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (46, 21, 0, 0, 0, N'Kenneth', N'Simmons', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (47, 21, 0, 0, 0, N'Sid', N'Diggs', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (48, 22, 1, 0, 0, N'Felicity', N'Front', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (49, 22, 1, 0, 0, N'Oliver', N'Queen', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (50, 22, 1, 0, 0, N'Thea', N'Black', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (51, 23, 1, 0, 0, N'Sarah', N'Merlin', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (52, 23, 1, 0, 0, N'Tim', N'Young', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (53, 23, 1, 0, 0, N'Linda', N'Bone', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (54, 24, 1, 0, 0, N'Tommy', N'Mathis', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (55, 24, 1, 0, 0, N'Larry', N'Lance', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (56, 24, 1, 0, 0, N'Matthew', N'Malone', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (57, 25, 0, 0, 0, N'Roy', N'Table', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (58, 25, 0, 0, 0, N'Dale', N'Gold', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (59, 25, 0, 0, 0, N'Brileigh', N'Black', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (60, 26, 0, 0, 0, N'Trevor', N'Glass', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (61, 26, 0, 0, 0, N'Hunter', N'Lovett', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (62, 26, 0, 0, 0, N'Breanna', N'Divine', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (63, 27, 0, 0, 0, N'Cadence', N'Broom', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (64, 27, 0, 0, 0, N'Dayonna', N'Nutt', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (65, 27, 0, 0, 0, N'Jackson', N'Ryan', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (66, 28, 1, 0, 0, N'Elijah', N'James', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (67, 28, 1, 0, 0, N'Easton', N'Cole', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (68, 28, 1, 0, 0, N'Colton', N'Fan', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (69, 29, 1, 0, 0, N'Judy', N'South', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (70, 29, 1, 0, 0, N'Martha', N'Clark', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (71, 29, 1, 0, 0, N'Kelsey', N'Hay', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (72, 30, 1, 0, 0, N'Jessica', N'Brown', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (73, 30, 1, 0, 0, N'Megan', N'Baker', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (74, 30, 1, 0, 0, N'Pam', N'Parson', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (75, 31, 0, 0, 0, N'Allison', N'Jones', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (76, 31, 0, 0, 0, N'Angela', N'Eastep', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (77, 31, 0, 0, 0, N'Beth', N'King', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (78, 32, 0, 0, 0, N'Neil', N'Lindsey', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (79, 32, 0, 0, 0, N'Jill', N'Bland', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (80, 32, 0, 0, 0, N'Lucy', N'Sweet', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (81, 33, 0, 0, 0, N'Maddy', N'Tyler', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (82, 33, 0, 0, 0, N'Chris', N'Rock', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (83, 33, 0, 0, 0, N'Dawne', N'Taylor', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (84, 34, 0, 0, 0, N'Peggy', N'Prince', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (85, 34, 0, 0, 0, N'April', N'Ring', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (86, 34, 0, 0, 0, N'Slade', N'Thomas', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (87, 35, 0, 0, 0, N'Rachel', N'Green', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (88, 36, 0, 0, 0, N'Cindy', N'Carter', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (89, 36, 0, 0, 0, N'Shauna', N'Mathers', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (90, 36, 0, 0, 0, N'Timothy', N'Brown', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (91, 37, 0, 0, 0, N'Dexter', N'Morgan', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (92, 37, 0, 0, 0, N'Tracy', N'Curtain', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (93, 37, 0, 0, 0, N'Shane', N'Kittrell', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (94, 37, 0, 0, 0, N'Taylor', N'Mann', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (95, 38, 1, 0, 0, N'Robert', N'Black', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (96, 38, 1, 0, 0, N'Charles', N'King', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (97, 38, 1, 0, 0, N'Elise', N'Jones', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (98, 39, 1, 0, 0, N'Vicky', N'Apple', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (99, 39, 1, 0, 0, N'Robert', N'Rich', 0)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (100, 39, 1, 0, 0, N'Jasmine', N'Left', 1)
INSERT [dbo].[Students] ([StudentId], [HomeroomTeacherId], [IsAtSchool], [InTransit], [IsGoneTooLong], [FirstName], [LastName], [InHomeroom]) VALUES (101, 39, 1, 0, 0, N'Lawson', N'Loyd', 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (2, N'Mike', N'Lowe', 0, 1)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (3, N'Leslie', N'Santa', 0, 2)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (4, N'Sue', N'Intervention', 0, 3)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (5, N'Jessica', N'Smith', 1, 4)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (6, N'Tony', N'Romo', 0, 5)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (7, N'Susan', N'Wood', 0, 6)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (8, N'Julie', N'Savage', 0, 7)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (9, N'Laura', N'Lowe', 0, 8)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (10, N'Nichole', N'Paul', 0, 9)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (11, N'Melissa', N'Bridges', 0, 11)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (12, N'Rachel', N'Simmons', 0, 10)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (13, N'Kelly', N'Couch', 0, 12)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (14, N'Teacher', N'A', 1, 15)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (15, N'Teacher', N'B', 1, 16)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (16, N'Teacher', N'Cross', 1, 17)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (17, N'Teacher', N'D', 1, 18)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (18, N'Teacher', N'E', 1, 19)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (19, N'Teacher', N'F', 1, 20)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (20, N'Teacher', N'G', 1, 21)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (21, N'Teacher', N'H', 1, 22)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (22, N'Teacher', N'I', 1, 23)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (23, N'Teacher', N'J', 1, 24)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (24, N'Teacher', N'K', 1, 25)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (25, N'Teacher', N'L', 1, 26)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (26, N'Teacher', N'M', 1, 27)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (27, N'Teacher', N'N', 1, 28)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (28, N'Teacher', N'O', 1, 29)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (29, N'Teacher', N'P', 1, 30)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (30, N'Teacher', N'Q', 1, 31)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (31, N'Teacher', N'R', 1, 32)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (32, N'Teacher', N'S', 1, 33)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (33, N'Teacher', N'T', 1, 34)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (34, N'Teacher', N'U', 1, 35)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (35, N'Teacher', N'V', 1, 36)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (36, N'Teacher', N'W', 1, 37)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (37, N'Teacher', N'X', 1, 38)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (38, N'Teacher', N'Y', 1, 39)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (39, N'Teacher', N'Z', 1, 40)
INSERT [dbo].[Teachers] ([TeacherId], [FirstName], [LastName], [IsHomeroomTeacher], [LocationId]) VALUES (40, N'Kelly', N'Stoops', 1, 47)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
ALTER TABLE [dbo].[StudentLocations]  WITH CHECK ADD  CONSTRAINT [FK_StudentLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[StudentLocations] CHECK CONSTRAINT [FK_StudentLocations_Locations]
GO
ALTER TABLE [dbo].[StudentLocations]  WITH CHECK ADD  CONSTRAINT [FK_StudentLocations_StudentLocations] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[StudentLocations] CHECK CONSTRAINT [FK_StudentLocations_StudentLocations]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Teachers] FOREIGN KEY([HomeroomTeacherId])
REFERENCES [dbo].[Teachers] ([TeacherId])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Teachers]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Locations]
GO
USE [master]
GO
ALTER DATABASE [BackendCapstone] SET  READ_WRITE 
GO
