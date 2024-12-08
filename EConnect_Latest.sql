USE [Econnect]
GO
/****** Object:  StoredProcedure [dbo].[GetLeadFieldLookup]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetLeadFieldLookup]
GO
/****** Object:  StoredProcedure [dbo].[GetLeadField]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetLeadField]
GO
/****** Object:  StoredProcedure [dbo].[GetLeadContactListByLeadId]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetLeadContactListByLeadId]
GO
/****** Object:  StoredProcedure [dbo].[GetLeadContactListByCompanyId]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetLeadContactListByCompanyId]
GO
/****** Object:  StoredProcedure [dbo].[GetEventListByCompanyId]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetEventListByCompanyId]
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicFields]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetDynamicFields]
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlTable]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetDynamicControlTable]
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlsGrid]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetDynamicControlsGrid]
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlPivotedLastInserted]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetDynamicControlPivotedLastInserted]
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlPivoted]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetDynamicControlPivoted]
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlByLeadId]    Script Date: 12-11-2024 14:35:00 ******/
DROP PROCEDURE [dbo].[GetDynamicControlByLeadId]
GO
ALTER TABLE [dbo].[Login] DROP CONSTRAINT [FK_Login_Company]
GO
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_Events_EventTypes]
GO
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_Events_Campuses]
GO
ALTER TABLE [dbo].[DynamicControls] DROP CONSTRAINT [fk_dynamiccontrols_companyid]
GO
ALTER TABLE [dbo].[Login] DROP CONSTRAINT [DF__Login__IsProcess__49C3F6B7]
GO
/****** Object:  Table [dbo].[ReferalSource]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferalSource]') AND type in (N'U'))
DROP TABLE [dbo].[ReferalSource]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type in (N'U'))
DROP TABLE [dbo].[Login]
GO
/****** Object:  Table [dbo].[LinkLeadContacts]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LinkLeadContacts]') AND type in (N'U'))
DROP TABLE [dbo].[LinkLeadContacts]
GO
/****** Object:  Table [dbo].[LeadStatus]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LeadStatus]') AND type in (N'U'))
DROP TABLE [dbo].[LeadStatus]
GO
/****** Object:  Table [dbo].[LeadContactList]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LeadContactList]') AND type in (N'U'))
DROP TABLE [dbo].[LeadContactList]
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes]') AND type in (N'U'))
DROP TABLE [dbo].[EventTypes]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events]') AND type in (N'U'))
DROP TABLE [dbo].[Events]
GO
/****** Object:  Table [dbo].[DynamicControlValues]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DynamicControlValues]') AND type in (N'U'))
DROP TABLE [dbo].[DynamicControlValues]
GO
/****** Object:  Table [dbo].[DynamicControls]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DynamicControls]') AND type in (N'U'))
DROP TABLE [dbo].[DynamicControls]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
DROP TABLE [dbo].[Company]
GO
/****** Object:  Table [dbo].[Campuses]    Script Date: 12-11-2024 14:35:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Campuses]') AND type in (N'U'))
DROP TABLE [dbo].[Campuses]
GO
/****** Object:  Schema [gsonDB]    Script Date: 12-11-2024 14:35:00 ******/
DROP SCHEMA [gsonDB]
GO
/****** Object:  Schema [Econnect]    Script Date: 12-11-2024 14:35:00 ******/
DROP SCHEMA [Econnect]
GO
USE [master]
GO
/****** Object:  Database [Econnect]    Script Date: 12-11-2024 14:35:00 ******/
DROP DATABASE [Econnect]
GO
/****** Object:  Database [Econnect]    Script Date: 12-11-2024 14:35:00 ******/
CREATE DATABASE [Econnect]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Econnect', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Econnect.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Econnect_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Econnect_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Econnect] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Econnect].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Econnect] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Econnect] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Econnect] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Econnect] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Econnect] SET ARITHABORT OFF 
GO
ALTER DATABASE [Econnect] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Econnect] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Econnect] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Econnect] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Econnect] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Econnect] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Econnect] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Econnect] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Econnect] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Econnect] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Econnect] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Econnect] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Econnect] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Econnect] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Econnect] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Econnect] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Econnect] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Econnect] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Econnect] SET  MULTI_USER 
GO
ALTER DATABASE [Econnect] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Econnect] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Econnect] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Econnect] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Econnect] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Econnect] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Econnect', N'ON'
GO
ALTER DATABASE [Econnect] SET QUERY_STORE = OFF
GO
USE [Econnect]
GO
/****** Object:  Schema [Econnect]    Script Date: 12-11-2024 14:35:00 ******/
CREATE SCHEMA [Econnect]
GO
/****** Object:  Schema [gsonDB]    Script Date: 12-11-2024 14:35:00 ******/
CREATE SCHEMA [gsonDB]
GO
/****** Object:  Table [dbo].[Campuses]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campuses](
	[CampusId] [int] IDENTITY(1,1) NOT NULL,
	[CampusName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CampusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyShortName] [varchar](30) NULL,
	[CompanyFullName] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsProcessed] [char](4) NULL,
 CONSTRAINT [pk_Company_CompanyID] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DynamicControls]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynamicControls](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ControlType] [varchar](50) NULL,
	[Label] [varchar](100) NULL,
	[Options] [varchar](max) NULL,
	[CompanyId] [int] NULL,
	[FieldSequence] [int] NULL,
	[IsDisplayInGrid] [bit] NULL,
	[ScreenName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DynamicControlValues]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynamicControlValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ControlId] [int] NULL,
	[Value] [varchar](max) NULL,
	[LeadId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[CampusId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[EventDate] [date] NOT NULL,
	[StartTime] [date] NOT NULL,
	[EndTime] [date] NOT NULL,
	[MaxNumber] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypes](
	[EventTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EventTypeName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeadContactList]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadContactList](
	[LeadContactListID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Gender] [nvarchar](100) NULL,
	[Salutation] [nvarchar](100) NULL,
	[Relationship] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[PostCode] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[MobilePhone] [nvarchar](100) NULL,
	[HomePhone] [nvarchar](100) NULL,
	[WorkPhone] [nvarchar](100) NULL,
	[ReceiveMail] [bit] NULL,
	[ReceiveEmail] [bit] NULL,
	[ReceiveSMS] [bit] NULL,
	[Alumni] [nvarchar](100) NULL,
	[GraduationYear] [nvarchar](100) NULL,
	[NameAtSchool] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[LeadContactListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeadStatus]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadStatus](
	[LeadStatusID] [int] IDENTITY(1,1) NOT NULL,
	[LeadStatus] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsProcessed] [bit] NULL,
 CONSTRAINT [pk_LeadStatus_LeadStatusID] PRIMARY KEY CLUSTERED 
(
	[LeadStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinkLeadContacts]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkLeadContacts](
	[LinkLeadContactId] [int] IDENTITY(1,1) NOT NULL,
	[LeadId] [int] NOT NULL,
	[ContactId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Login] [nvarchar](255) NULL,
	[LoginType] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[ShortName] [varchar](50) NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Demo] [bit] NULL,
	[NewProcess] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[IsProcessed] [char](4) NULL,
	[Password] [varchar](100) NULL,
 CONSTRAINT [PK_Login_LoginID_PropertID] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferalSource]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferalSource](
	[ReferalSourceID] [int] IDENTITY(1,1) NOT NULL,
	[ReferalSource] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsProcessed] [bit] NULL,
 CONSTRAINT [pk_ReferalSource_ID] PRIMARY KEY CLUSTERED 
(
	[ReferalSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Campuses] ON 
GO
INSERT [dbo].[Campuses] ([CampusId], [CampusName]) VALUES (1, N' Newman International Academy of Gibbins - NIAAG (7th -12th)')
GO
SET IDENTITY_INSERT [dbo].[Campuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyShortName], [CompanyFullName], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (1, N'Newman', N'Newman International Academy', 1, 0, 99999, CAST(N'2024-09-14T15:08:45.490' AS DateTime), 99999, CAST(N'2024-09-14T15:08:45.490' AS DateTime), N'INC ')
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyShortName], [CompanyFullName], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (2, N'Graceetta', N'GraceSoft', 1, 0, 9999, CAST(N'2024-09-14T15:08:45.490' AS DateTime), 999, CAST(N'2024-09-14T15:08:45.490' AS DateTime), N'INC ')
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyShortName], [CompanyFullName], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (3, N'admin', N'admin', 1, 0, 9999, CAST(N'2024-09-14T15:08:45.490' AS DateTime), 999, CAST(N'2024-09-14T15:08:45.490' AS DateTime), N'INC ')
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[DynamicControls] ON 
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (1, N'Dropdown', N'Select a Country', N'[{"Text":"USA","Value":"1"},{"Text":"India","Value":"2"},{"Text":"UK","Value":"3"}]', 3, NULL, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (2, N'TextBox', N'Enter your Name', NULL, 3, NULL, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (3, N'Checkbox', N'Agree to Terms', NULL, 3, NULL, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (4, N'RadioButton', N'Select Gender', N'[{"Text":"Male","Value":"M"},{"Text":"Female","Value":"F"}]', 3, NULL, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (5, N'TextBox', N'First Name', NULL, 1, 1, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (6, N'TextBox', N'Last Name', NULL, 1, 2, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (7, N'TextBox', N'Preferred Name', NULL, 1, 3, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (8, N'Date', N'Date Of Birth', NULL, 1, 4, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (9, N'RadioButton', N'Gender', N'[{"Text":"Male","Value":"M"},{"Text":"Female","Value":"F"}]', 1, 5, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (10, N'Dropdown', N'Religion', N'[{"Text":"Anglican","Value":"Anglican"},{"Text":"Buddhist","Value":"Buddhist"},{"Text":"Catholic","Value":"Catholic"}]', 1, 6, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (11, N'RadioButton', N'Family Connection', N'[{"Text":"Current Family","Value":"Current Family"},{"Text":"Previous Family","Value":"Previous Family"},{"Text":"New Family","Value":"New Family"}]', 1, 7, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (12, N'Dropdown', N'Current Grade Level', N'[{"Text":"Pre-K3","Value":"Pre-K3"},{"Text":"Pre-K4","Value":"Pre-K4"},{"Text":"Kindergarten","Value":"Kindergarten"},{"Text":"1st Grade","Value":"1st Grade"},{"Text":"2nd Grade","Value":"2nd Grade"},{"Text":"3rd Grade","Value":"3rd Grade"},{"Text":"4th Grade","Value":"4th Grade"},{"Text":"5th Grade","Value":"5th Grade"},{"Text":"6th Grade","Value":"6th Grade"},{"Text":"7th Grade","Value":"7th Grade"},{"Text":"8th Grade","Value":"8th Grade"},{"Text":"9th Grade","Value":"9th Grade"},{"Text":"10th Grade","Value":"10th Grade"},{"Text":"11th Grade","Value":"11th Grade"},{"Text":"12th Grade","Value":"12th Grade"},{"Text":"Unknown","Value":"Unknown"}]', 1, 8, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (13, N'Dropdown', N'Campus', N'[{"Text":"Newman International Academy of Arlington Fielder - NIAA (PK3 - 6th)","Value":"Newman International Academy of Arlington Fielder - NIAA (PK3 - 6th)"},{"Text":"Newman International Academy of Gibbins - NIAAG (7th -12th)","Value":"Newman International Academy of Gibbins - NIAAG (7th -12th)"},{"Text":"Newman International Academy of Cedar Hill Elementary - NICH Elem (PK - 6th)","Value":"Newman International Academy of Cedar Hill Elementary - NICH Elem (PK - 6th)"},{"Text":"Newman International Academy of Cedar Hill Secondary - NICH Sec( 7th- 12th)","Value":"Newman International Academy of Cedar Hill Secondary - NICH Sec( 7th- 12th)"},{"Text":"Newman International Academy of Mansfield - NIAM (K - 6th)","Value":"Newman International Academy of Mansfield - NIAM (K - 6th)"},{"Text":"Newman International Academy of Fort Worth - NIAFW (PK - 6th)","Value":"Newman International Academy of Fort Worth - NIAFW (PK - 6th)"},{"Text":"Newman International Academy Watauga (PK3 – 6th)","Value":"Newman International Academy Watauga (PK3 – 6th)"},{"Text":"Undecided","Value":"Undecided"}]', 1, 9, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (14, N'Dropdown', N'Seeking Enrollment in Grade Level', N'[{"Text":"Pre-K3","Value":"Pre-K3"},{"Text":"Pre-K4","Value":"Pre-K4"},{"Text":"Kindergarten","Value":"Kindergarten"},{"Text":"1st Grade","Value":"1st Grade"},{"Text":"2nd Grade","Value":"2nd Grade"},{"Text":"3rd Grade","Value":"3rd Grade"},{"Text":"4th Grade","Value":"4th Grade"},{"Text":"5th Grade","Value":"5th Grade"},{"Text":"6th Grade","Value":"6th Grade"},{"Text":"7th Grade","Value":"7th Grade"},{"Text":"8th Grade","Value":"8th Grade"},{"Text":"9th Grade","Value":"9th Grade"},{"Text":"10th Grade","Value":"10th Grade"},{"Text":"11th Grade","Value":"11th Grade"},{"Text":"12th Grade","Value":"12th Grade"},{"Text":"Unknown","Value":"Unknown"}]', 1, 10, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (15, N'Dropdown', N'Starting Year', N'[{"Text":"2022 - 2023","Value":"2022 - 2023"},{"Text":"2023 - 2024","Value":"2023 - 2024"},{"Text":"2024 - 2025","Value":"2024 - 2025"},{"Text":"2025 - 2026","Value":"2025 - 2026"}]', 1, 11, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (16, N'Dropdown', N'Enquiry Status', N'[{"Text":"Inquiry","Value":"Inquiry"},{"Text":"Warm Prospect","Value":"Warm Prospect"},{"Text":"Invite to Apply","Value":"Invite to Apply"},{"Text":"Application In Progress","Value":"Application In Progress"},{"Text":"Application Submitted","Value":"Application Submitted"},{"Text":"Application Marked as Eligible","Value":"Application Marked as Eligible"},{"Text":"Offer Pending","Value":"Offer Pending"},{"Text":"Waitlisted","Value":"Waitlisted"},{"Text":"Offer Accepted","Value":"Offer Accepted"},{"Text":"Enrollment In Progress","Value":"Enrollment In Progress"},{"Text":"Enrollment Submitted","Value":"Enrollment Submitted"},{"Text":"Enrollment Approved","Value":"Enrollment Approved"},{"Text":"School Declined","Value":"School Declined"},{"Text":"Family Declined","Value":"Family Declined"}]', 1, 12, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (17, N'TextBox', N'Notes', NULL, 1, 13, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (18, N'TextBox', N'First Name', NULL, 2, 1, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (19, N'TextBox', N'Last Name', NULL, 2, 2, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (20, N'TextBox', N'Title/Role', NULL, 2, 3, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (21, N'TextBox', N'Country Code', NULL, 2, 4, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (22, N'TextBox', N'Organisation Name', NULL, 2, 5, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (23, N'TextBox', N'Business Phone', NULL, 2, 6, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (24, N'TextBox', N'Email', NULL, 2, 7, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (25, N'TextBox', N'Cell Phone', NULL, 2, 8, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (26, N'TextBox', N'Home Phone', NULL, 2, 9, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (27, N'TextBox', N'FAX', NULL, 2, 10, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (28, N'Dropdown', N'Property Type', NULL, 2, 11, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (29, N'Dropdown', N'Referral Sources', NULL, 2, 12, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (30, N'TextBox', N'Billing Contacts
', NULL, 2, 13, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (31, N'TextBox', N'No. of Rooms', NULL, 2, 14, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (32, N'TextBox', N'Email2', NULL, 2, 15, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (33, N'Checkbox', N'Change to Customer', NULL, 2, 16, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (34, N'Checkbox', N'Send Mail', NULL, 2, 17, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (35, N'TextBox', N'Web Site', NULL, 2, 18, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (36, N'TextBox', N'Comments', NULL, 2, 19, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (37, N'Dropdown', N'Assign Lead', NULL, 2, 20, 0, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (38, N'Dropdown', N'Lead Status', N'[{"Text":"Inquiry","Value":"Inquiry"},{"Text":"Warm Prospect","Value":"Warm Prospect"},{"Text":"Invite to Apply","Value":"Invite to Apply"},{"Text":"Application In Progress","Value":"Application In Progress"},{"Text":"Application Submitted","Value":"Application Submitted"},{"Text":"Application Marked as Eligible","Value":"Application Marked as Eligible"},{"Text":"Offer Pending","Value":"Offer Pending"},{"Text":"Waitlisted","Value":"Waitlisted"},{"Text":"Offer Accepted","Value":"Offer Accepted"},{"Text":"Enrollment In Progress","Value":"Enrollment In Progress"},{"Text":"Enrollment Submitted","Value":"Enrollment Submitted"},{"Text":"Enrollment Approved","Value":"Enrollment Approved"},{"Text":"School Declined","Value":"School Declined"},{"Text":"Family Declined","Value":"Family Declined"}]', 2, 21, 1, N'Lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (43, N'Dropdown', N'Relationship', N'[{"Text":"Father","Value":"Father"},{"Text":"Mother","Value":"Mother"},{"Text":"Guardian","Value":"Guardian"},{"Text":"Uncle","Value":"Uncle"},{"Text":"Aunt","Value":"Aunt"},{"Text":"Grandparent","Value":"Grandparent"},{"Text":"Sibling","Value":"Sibling"},{"Text":"Unknown","Value":"Unknown"},{"Text":"Other...","Value":"Other..."}]', 1, 22, 0, N'contact')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (44, N'Dropdown', N'Salutation', N'[{"Text":"Mr.","Value":"Mr."},{"Text":"Ms.","Value":"Ms."},{"Text":"Mrs.","Value":"Mrs."},{"Text":"Dr.","Value":"Dr."},{"Text":"Prof.","Value":"Prof."}]', 1, 23, 0, N'contact')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (45, N'TextBox', N'First Name', N'[]', 1, 24, 0, N'contact')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (46, N'TextBox', N'Last Name', N'[]', 1, 25, 0, N'contact')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (47, N'Dropdown', N'Gender', N'[{"Text":"Male","Value":"Male"},{"Text":"Female","Value":"Female"}]', 1, 26, 0, N'contact')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (48, N'TextBox', N'Address', N'[]', 1, 27, 0, N'contact')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (49, N'TextBox', N'Email', N'[]', 1, 28, 0, N'contact')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (50, N'TextBox', N'Mobile', N'[]', 1, 29, 0, N'contact')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (51, N'Dropdown', N'Event Type', N'[{"Text":"Open Morning Tours","Value":"Open Morning Tours"},{"Text":"School Tour","Value":"School Tour"},{"Text":"Information Evening","Value":"Information Evening"},{"Text":"Open Day","Value":"Open Day"}]', 1, 30, 0, N'event')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (52, N'Dropdown', N'Campus', N'[{"Text":"Newman International Academy of Arlington Fielder - NIAA (PK3 - 6th)","Value":"Newman International Academy of Arlington Fielder - NIAA (PK3 - 6th)"},{"Text":"Newman International Academy of Gibbins - NIAAG (7th -12th)","Value":"Newman International Academy of Gibbins - NIAAG (7th -12th)"},{"Text":"Newman International Academy of Cedar Hill Elementary - NICH Elem (PK - 6th)","Value":"Newman International Academy of Cedar Hill Elementary - NICH Elem (PK - 6th)"},{"Text":"Newman International Academy of Cedar Hill Secondary - NICH Sec( 7th- 12th)","Value":"Newman International Academy of Cedar Hill Secondary - NICH Sec( 7th- 12th)"},{"Text":"Newman International Academy of Mansfield - NIAM (K - 6th)","Value":"Newman International Academy of Mansfield - NIAM (K - 6th)"},{"Text":"Newman International Academy of Fort Worth - NIAFW (PK - 6th)","Value":"Newman International Academy of Fort Worth - NIAFW (PK - 6th)"},{"Text":"Newman International Academy Watauga (PK3 \u2013 6th)","Value":"Newman International Academy Watauga (PK3 \u2013 6th)"},{"Text":"Undecided","Value":"Undecided"}]', 1, 31, 0, N'event')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (53, N'TextBox', N'Location', N'[]', 1, 32, 0, N'event')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (54, N'Date', N'Start Date', N'[]', 1, 33, 0, N'event')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (55, N'Date', N'End Date', N'[]', 1, 34, 0, N'event')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (56, N'TextBox', N'Max Number', N'[]', 1, 35, 0, N'event')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (57, N'TextBox', N'Description', N'[]', 1, 36, 0, N'event')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (59, N'Dropdown', N'test drop', N'[{"Text":"test1","Value":"test1"},{"Text":"test2","Value":"test2"},{"Text":"test3","Value":"test3"}]', 1, 37, 0, N'event')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (60, N'Date', N'Joining Date', N'[]', 1, 38, 0, N'lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (61, N'Checkbox', N'Interested', N'[]', 1, 39, 0, N'lead')
GO
INSERT [dbo].[DynamicControls] ([Id], [ControlType], [Label], [Options], [CompanyId], [FieldSequence], [IsDisplayInGrid], [ScreenName]) VALUES (62, N'Date', N'Webinar date', N'[]', 1, 40, 0, N'lead')
GO
SET IDENTITY_INSERT [dbo].[DynamicControls] OFF
GO
SET IDENTITY_INSERT [dbo].[DynamicControlValues] ON 
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (1, 43, N'Guardian', 1)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (2, 44, N'Dr.', 1)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (3, 45, N'asd', 1)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (4, 46, N'dvd', 1)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (5, 47, N'Female', 1)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (6, 48, N'testd', 1)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (7, 49, N'test@gmail.com', 1)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (8, 50, N'987654321', 1)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (9, 51, N'Open Morning Tours', 2)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (10, 52, N'Newman International Academy of Arlington Fielder - NIAA (PK3 - 6th)', 2)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (11, 53, N'test23ddd', 2)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (12, 54, N'2024-09-30T18:30:00.000Z', 2)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (13, 55, N'2024-10-09T18:30:00.000Z', 2)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (14, 56, N'1234', 2)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (15, 57, N'test', 2)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (16, 5, N'Amarjit singh', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (17, 6, N'singh', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (18, 7, N'amarjit', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (19, 8, N'2024-09-30T18:30:00.000Z', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (20, 9, N'M', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (21, 10, N'Buddhist', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (22, 11, N'Current Family', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (23, 12, N'Pre-K4', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (24, 13, N'Newman International Academy of Arlington Fielder - NIAA (PK3 - 6th)', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (25, 14, N'Kindergarten', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (26, 15, N'2022 - 2023', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (27, 16, N'Inquiry', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (28, 17, N'yes application submitted', 3)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (29, 43, N'Father', 4)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (30, 44, N'Ms.', 4)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (31, 45, N'test2', 4)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (32, 46, N'test4', 4)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (33, 47, N'Male', 4)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (34, 48, N'jb', 4)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (35, 49, N'knlh@hvbkj.com', 4)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (36, 50, N'2345678', 4)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (37, 43, N'Uncle', 5)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (38, 44, N'Mrs.', 5)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (39, 45, N'jyot', 5)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (40, 46, N'dfion', 5)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (41, 47, N'Female', 5)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (42, 48, N'jbkjb', 5)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (43, 49, N'jbjk@gmial.com', 5)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (44, 50, N'345678', 5)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (45, 43, N'Aunt', 6)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (46, 44, N'Mrs.', 6)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (47, 45, N'rgrgt', 6)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (48, 46, N'hjvjhb', 6)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (49, 47, N'Male', 6)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (50, 48, N'bbkj', 6)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (51, 49, N'kjbbk', 6)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (52, 50, N'11111111', 6)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (53, 43, N'Mother', 7)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (54, 44, N'Mrs.', 7)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (55, 45, N'gef', 7)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (56, 46, N'jhj', 7)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (57, 47, N'Male', 7)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (58, 48, N'jvbjkb', 7)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (59, 49, N'bkjbjk', 7)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (60, 50, N'45678', 7)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (61, 43, N'Mother', 8)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (62, 44, N'Mrs.', 8)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (63, 45, N'gefdveg', 8)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (64, 46, N'jhjwew', 8)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (65, 47, N'Male', 8)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (66, 48, N'jvbjkb', 8)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (67, 49, N'bkjbjk', 8)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (68, 50, N'45678', 8)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (69, 43, N'Mother', 9)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (70, 44, N'Mrs.', 9)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (71, 45, N'jhj', 9)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (72, 46, N'hj', 9)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (73, 47, N'Male', 9)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (74, 48, N'test', 9)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (75, 49, N'jjk', 9)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (76, 50, N'0987', 9)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (77, 43, N'Mother', 10)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (78, 44, N'Ms.', 10)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (79, 45, N'jbbj', 10)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (80, 46, N'bjb', 10)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (81, 47, N'Male', 10)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (82, 48, N'jkbkj', 10)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (83, 49, N'jkbbjk', 10)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (84, 50, N'45678', 10)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (85, 43, N'Guardian', 11)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (86, 44, N'Ms.', 11)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (87, 45, N'e', 11)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (88, 46, N'q', 11)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (89, 47, N'Male', 11)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (90, 48, N'jbj', 11)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (91, 49, N'jb', 11)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (92, 50, N'12', 11)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (93, 43, N'Mother', 12)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (94, 44, N'Ms.', 12)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (95, 45, N'jk', 12)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (96, 46, N'jkj', 12)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (97, 47, N'Male', 12)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (98, 48, N'k', 12)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (99, 49, N'test@gmail.com', 12)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (100, 50, N'987654321', 12)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (101, 43, N'Mother', 13)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (102, 44, N'Mrs.', 13)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (103, 45, N'gfnbff', 13)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (104, 46, N'fbdfb', 13)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (105, 47, N'Male', 13)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (106, 48, N'testd', 13)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (107, 49, N'test@gmail.com', 13)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (108, 50, N'45678', 13)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (109, 43, N'Father', 14)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (110, 44, N'Mr.', 14)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (111, 45, N'knjkn', 14)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (112, 46, N'knkn', 14)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (113, 47, N'Male', 14)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (114, 48, N'kjbnkjn', 14)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (115, 49, N'klnk', 14)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (116, 50, N'lnlk', 14)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (117, 43, N'Guardian', 15)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (118, 44, N'Dr.', 15)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (119, 45, N'ljkl', 15)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (120, 46, N'lk', 15)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (121, 47, N'Female', 15)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (122, 48, N'uiu', 15)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (123, 49, N'iui', 15)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (124, 50, N'ii', 15)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (125, 43, N'Mother', 16)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (126, 44, N'Ms.', 16)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (127, 45, N'nknkkkrrrrkkgg', 16)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (128, 46, N'nknk', 16)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (129, 47, N'Male', 16)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (130, 48, N'knlk', 16)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (131, 49, N'nklnkln', 16)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (132, 50, N'lknkl', 16)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (133, 43, N'Guardian', 17)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (134, 44, N'Dr.', 17)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (135, 45, N'pill', 17)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (136, 46, N'dfbf', 17)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (137, 47, N'Male', 17)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (138, 48, N'jb', 17)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (139, 49, N'tesqwt@gmail.com', 17)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (140, 50, N'35345', 17)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (141, 5, N'kkk', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (142, 6, N'kln', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (143, 7, N'kln', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (144, 8, N'2024-10-20T18:30:00.000Z', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (145, 9, N'M', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (146, 10, N'Catholic', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (147, 11, N'Current Family', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (148, 12, N'1st Grade', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (149, 13, N'Newman International Academy of Cedar Hill Elementary - NICH Elem (PK - 6th)', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (150, 14, N'1st Grade', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (151, 15, N'', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (152, 16, N'', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (153, 17, N'', 18)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (154, 43, N'Father', 19)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (155, 44, N'Ms.', 19)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (156, 45, N'test2', 19)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (157, 46, N'ee', 19)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (158, 47, N'Male', 19)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (159, 48, N'eeee', 19)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (160, 49, N'test@gmail.com', 19)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (161, 50, N'987654321', 19)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (162, 43, N'Father', 20)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (163, 44, N'Ms.', 20)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (164, 45, N'kill', 20)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (165, 46, N'ee', 20)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (166, 47, N'Male', 20)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (167, 48, N'eeee', 20)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (168, 49, N'test@gmail.com', 20)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (169, 50, N'987654321', 20)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (170, 43, N'Father', 21)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (171, 44, N'Ms.', 21)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (172, 45, N'jk', 21)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (173, 46, N'jk', 21)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (174, 47, N'Male', 21)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (175, 48, N'kj', 21)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (176, 49, N'jk', 21)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (177, 50, N'jk', 21)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (178, 43, N'Father', 22)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (179, 44, N'Ms.', 22)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (180, 45, N'jk', 22)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (181, 46, N'jk', 22)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (182, 47, N'Male', 22)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (183, 48, N'kj', 22)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (184, 49, N'jk', 22)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (185, 50, N'jk', 22)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (186, 5, N'test1010', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (187, 6, N'test', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (188, 7, N'test', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (189, 8, N'2024-10-07T18:30:00.000Z', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (190, 9, N'M', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (191, 10, N'Buddhist', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (192, 11, N'Current Family', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (193, 12, N'1st Grade', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (194, 13, N'Newman International Academy of Gibbins - NIAAG (7th -12th)', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (195, 14, N'Kindergarten', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (196, 15, N'2024 - 2025', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (197, 16, N'Warm Prospect', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (198, 17, N'yes application submitted', 23)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (199, 51, N'Information Evening', 24)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (200, 52, N'Newman International Academy of Cedar Hill Elementary - NICH Elem (PK - 6th)', 24)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (201, 53, N'dddd', 24)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (202, 54, N'2024-09-30T18:30:00.000Z', 24)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (203, 55, N'2024-10-14T18:30:00.000Z', 24)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (204, 56, N'uiu', 24)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (205, 57, N'iuiu', 24)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (206, 43, N'Aunt', 25)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (207, 44, N'Dr.', 25)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (208, 45, N'nomen im', 25)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (209, 46, N'nom', 25)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (210, 47, N'Male', 25)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (211, 48, N'testd', 25)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (212, 49, N'tesqwt@gmail.com', 25)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (213, 50, N'987654321', 25)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (214, 5, N'Test120as', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (215, 6, N'test12', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (216, 7, N'bjjb', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (217, 8, N'2024-10-09', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (218, 9, N'M', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (219, 10, N'Anglican', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (220, 11, N'Current Family', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (221, 12, N'10th Grade', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (222, 13, N'Newman International Academy of Arlington Fielder - NIAA (PK3 - 6th)', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (223, 14, N'8th Grade', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (224, 15, N'2023 - 2024', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (225, 16, N'Warm Prospect', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (226, 17, N'jkj', 26)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (227, 43, N'Mother', 27)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (228, 44, N'Ms.', 27)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (229, 45, N'ef', 27)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (230, 46, N'kjk', 27)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (231, 47, N'Male', 27)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (232, 48, N'kjj', 27)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (233, 49, N'jkjk', 27)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (234, 50, N'jk', 27)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (235, 43, N'Father', 28)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (236, 44, N'Mr.', 28)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (237, 45, N'12', 28)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (238, 46, N'12', 28)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (239, 47, N'Male', 28)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (240, 48, N'122', 28)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (241, 49, N'1', 28)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (242, 50, N'2', 28)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (243, 43, N'Mother', 29)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (244, 44, N'Ms.', 29)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (245, 45, N'dd12', 29)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (246, 46, N'dd', 29)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (247, 47, N'Male', 29)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (248, 48, N'test', 29)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (249, 49, N'tesqwt@gmail.com', 29)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (250, 50, N'456781', 29)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (251, 43, N'Mother', 30)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (252, 44, N'Ms.', 30)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (253, 45, N'Test1', 30)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (254, 46, N'test1', 30)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (255, 47, N'Female', 30)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (256, 48, N'ro', 30)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (257, 49, N's@s.com', 30)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (258, 50, N'3456789', 30)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (259, 5, N'Sanjay', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (260, 6, N'G', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (261, 7, N'Sanjay Gopalan', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (262, 8, N'1993-09-01', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (263, 9, N'M', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (264, 10, N'Buddhist', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (265, 11, N'New Family', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (266, 12, N'4th Grade', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (267, 13, N'Undecided', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (268, 14, N'Unknown', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (269, 15, N'2022 - 2023', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (270, 16, N'Invite to Apply', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (271, 17, N'Tester testing the fields', 31)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (272, 5, N'Gideon', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (273, 6, N'Test 23', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (274, 7, N'test', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (275, 8, N'2024-10-01', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (276, 9, N'M', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (277, 10, N'Catholic', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (278, 11, N'Current Family', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (279, 12, N'6th Grade', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (280, 13, N'Newman International Academy of Arlington Fielder - NIAA (PK3 - 6th)', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (281, 14, N'11th Grade', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (282, 15, N'2023 - 2024', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (283, 16, N'Enrollment Submitted', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (284, 17, N'tsest', 32)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (285, 43, N'Father', 33)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (286, 44, N'Ms.', 33)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (287, 45, N'Test900', 33)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (288, 46, N'09', 33)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (289, 47, N'Male', 33)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (290, 48, N'test', 33)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (291, 49, N'', 33)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (292, 50, N'', 33)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (293, 43, N'Father', 34)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (294, 44, N'Mr.', 34)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (295, 45, N'qwerty', 34)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (296, 46, N'test', 34)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (297, 47, N'Male', 34)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (298, 48, N'test', 34)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (299, 49, N'test@gmail.com', 34)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (300, 50, N'7887', 34)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (301, 51, N'Open Morning Tours', 35)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (302, 52, N'Newman International Academy of Arlington Fielder - NIAA (PK3 - 6th)', 35)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (303, 53, N'testevent USA', 35)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (304, 54, N'2024-10-11', 35)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (305, 55, N'2024-10-18', 35)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (306, 56, N'100', 35)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (307, 57, N'Test', 35)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (308, 5, N'Sanjay', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (309, 6, N'G', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (310, 7, N'Sanjay Gopalan', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (311, 8, N'1993-09-01', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (312, 9, N'M', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (313, 10, N'Buddhist', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (314, 11, N'New Family', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (315, 12, N'4th Grade', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (316, 13, N'Undecided', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (317, 14, N'Unknown', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (318, 15, N'2022 - 2023', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (319, 16, N'Invite to Apply', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (320, 17, N'Tester testing the field', 36)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (321, 5, N'Sanjay', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (322, 6, N'G', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (323, 7, N'Sanjay Gopalan', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (324, 8, N'1993-09-01', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (325, 9, N'M', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (326, 10, N'Buddhist', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (327, 11, N'New Family', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (328, 12, N'4th Grade', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (329, 13, N'Undecided', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (330, 14, N'Unknown', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (331, 15, N'2022 - 2023', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (332, 16, N'Invite to Apply', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (333, 17, N'Tester testing the field', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (334, 5, N'Sanjay', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (335, 6, N'G', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (336, 7, N'Sanjay Gopalan', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (337, 8, N'1993-09-01', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (338, 9, N'M', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (339, 10, N'Buddhist', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (340, 11, N'New Family', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (341, 12, N'4th Grade', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (342, 13, N'Undecided', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (343, 14, N'Unknown', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (344, 15, N'2022 - 2023', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (345, 16, N'Invite to Apply', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (346, 17, N'Tester testing the field', 37)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (347, 5, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (348, 6, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (349, 7, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (350, 8, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (351, 9, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (352, 10, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (353, 11, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (354, 12, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (355, 13, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (356, 14, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (357, 15, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (358, 16, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (359, 17, N'', 38)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (360, 5, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (361, 6, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (362, 7, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (363, 8, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (364, 9, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (365, 10, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (366, 11, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (367, 12, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (368, 13, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (369, 14, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (370, 15, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (371, 16, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (372, 17, N'', 39)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (373, 5, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (374, 6, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (375, 7, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (376, 8, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (377, 9, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (378, 10, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (379, 11, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (380, 12, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (381, 13, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (382, 14, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (383, 15, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (384, 16, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (385, 17, N'', 40)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (386, 5, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (387, 6, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (388, 7, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (389, 8, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (390, 9, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (391, 10, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (392, 11, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (393, 12, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (394, 13, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (395, 14, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (396, 15, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (397, 16, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (398, 17, N'', 41)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (399, 5, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (400, 6, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (401, 7, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (402, 8, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (403, 9, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (404, 10, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (405, 11, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (406, 12, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (407, 13, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (408, 14, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (409, 15, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (410, 16, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (411, 17, N'', 42)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (412, 43, N'Uncle', 43)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (413, 44, N'Mr.', 43)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (414, 45, N'Sanjay', 43)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (415, 46, N'G', 43)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (416, 47, N'Male', 43)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (417, 48, N'No 20. Perunthalaivar Kamarajar nagar', 43)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (418, 49, N'support4@gracesoft.com', 43)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (419, 50, N'9876543211', 43)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (420, 43, N'Other...', 44)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (421, 44, N'Mr.', 44)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (422, 45, N'Lad', 44)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (423, 46, N'Man', 44)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (424, 47, N'Male', 44)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (425, 48, N'', 44)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (426, 49, N'support@gracesoft.com', 44)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (427, 50, N'', 44)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (428, 51, N'Open Morning Tours', 45)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (429, 52, N'Newman International Academy Watauga (PK3 – 6th)', 45)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (430, 53, N'Chennai', 45)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (431, 54, N'2024-12-02', 45)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (432, 55, N'0004-12-03', 45)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (433, 56, N'3232', 45)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (434, 57, N'Tester testing this fields ` 1 '' "', 45)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (435, 59, N'test1', 45)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (436, 51, N'', 46)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (437, 52, N'', 46)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (438, 53, N'', 46)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (439, 54, N'', 46)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (440, 55, N'', 46)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (441, 56, N'', 46)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (442, 57, N'', 46)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (443, 59, N'', 46)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (444, 51, N'Information Evening', 47)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (445, 52, N'Undecided', 47)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (446, 53, N'Perungudi', 47)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (447, 54, N'', 47)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (448, 55, N'', 47)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (449, 56, N'987654312', 47)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (450, 57, N'', 47)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (451, 59, N'', 47)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (452, 18, N'Sanjay', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (453, 19, N'G', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (454, 20, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (455, 21, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (456, 22, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (457, 23, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (458, 24, N'support4@gracesoft.com', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (459, 25, N'9876543211', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (460, 26, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (461, 27, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (462, 28, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (463, 29, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (464, 30, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (465, 31, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (466, 32, N'support4@gracesoft.com', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (467, 33, N'false', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (468, 34, N'false', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (469, 35, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (470, 36, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (471, 37, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (472, 38, N'', 48)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (473, 5, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (474, 6, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (475, 7, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (476, 8, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (477, 9, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (478, 10, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (479, 11, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (480, 12, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (481, 13, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (482, 14, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (483, 15, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (484, 16, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (485, 17, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (486, 60, N'', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (487, 61, N'false', 49)
GO
INSERT [dbo].[DynamicControlValues] ([Id], [ControlId], [Value], [LeadId]) VALUES (488, 62, N'', 49)
GO
SET IDENTITY_INSERT [dbo].[DynamicControlValues] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 
GO
INSERT [dbo].[Events] ([EventId], [EventTypeId], [CampusId], [CompanyId], [Location], [EventDate], [StartTime], [EndTime], [MaxNumber], [Description]) VALUES (1, 1, 1, 1, N'Test', CAST(N'2024-09-14' AS Date), CAST(N'2024-09-14' AS Date), CAST(N'2024-09-14' AS Date), 1, N'Test')
GO
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[EventTypes] ON 
GO
INSERT [dbo].[EventTypes] ([EventTypeId], [EventTypeName]) VALUES (1, N'Open Morning Tours ')
GO
INSERT [dbo].[EventTypes] ([EventTypeId], [EventTypeName]) VALUES (2, N'School Tour')
GO
SET IDENTITY_INSERT [dbo].[EventTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[LeadContactList] ON 
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (1, 1, N'Ana soni', N'Borbolla', N'Female', N'Ms.', N'Mother', N'1008 Darlene ln', N'Arlington', N'Texas', NULL, N'ajascquez3@gmail.com', N'9876512345', N'', N'', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (4, 1, N'TEST', N'TEST', N'Male', N'Ms.', NULL, N'KNKN', N'NKNI', N'NKNI', NULL, N'NJN@JBJ.COIN', NULL, N'98', N'9', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (5, 1, N'jkjkj', N'jkbn', N'Male', N'Ms.', NULL, N'khjj', N'kk', N'knk', NULL, N'nknkn', NULL, N'88', N'8', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (6, 1, N'jnbklj', N'klnlk', N'Male', N'Dr.', NULL, N'jkkbg', N'nblknlk', N'nklnlk', NULL, N'jkbbj@jbj.com', NULL, N'4567', N'567', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (7, 1, N'nbjnk', N'nkn', N'Male', N'Ms.', NULL, N'mjbj', N'ilnkl', N'jbj', NULL, N'jbnkj@njk.com', NULL, N'5678', N'67', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (8, 1, N'nbjnk', N'nkn', N'Male', N'Ms.', NULL, N'mjbj', N'ilnkl', N'jbj', NULL, N'jbnkj@njk.com', NULL, N'5678', N'67', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (9, 1, N'knlkn', N'nlkn', N'Male', N'Ms.', NULL, N'jkbjk', N'bjbkj', N'bjbj', NULL, N'jbdjkef@BJDG.VCOM', NULL, N'5678', N'567', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (10, 1, N'jbjbj', N'bjbj', N'Male', N'Mr.', NULL, N'kjlnbkl', N'knkn', N'nkkn', NULL, N'jkbjkb', NULL, N'80099', N'90907', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (11, 1, N'bnkjn', N'nklnlkn', N'Female', N'Mrs.', NULL, N'jbb', N'klnnlk', N'nn', NULL, N'jbjk@bviub.com', NULL, N'5678', N'678', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (12, 1, N'bnkjn', N'nklnlkn', N'Female', N'Mrs.', NULL, N'jbb', N'klnnlk', N'nn', NULL, N'jbjk@bviub.com', NULL, N'5678', N'678', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (13, 1, N'1', N'tydty', N'Male', N'Mr.', NULL, N'jbj', N'bjhi', N'oihioh', NULL, N'7678@hgj.com', NULL, N'34567', N'456', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (14, 1, N'2', N'8bb', N'Male', N'Mr.', NULL, N'kbjbuk', N'jkbjkb', N'bjk', NULL, N'98', NULL, N'98', N'9', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (15, 1, N'3', N'3', N'Male', N'Mrs.', NULL, N'3', N'6', N'6', NULL, N'6', NULL, N'6', N'6', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (16, 1, N'6', N'6', N'Male', N'Dr.', NULL, N'6', N'6', N'6', NULL, N'6', NULL, N'6', N'6', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (17, 1, N'8', N'8', N'Male', N'Dr.', NULL, N'8', N'98', N'9', NULL, N'9', NULL, N'89', N'9', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (18, 1, N'Suman', N'sharma', N'Female', N'Mr.', NULL, N'jbjkb ', N'nj', N'hbjbn', NULL, N'text@gmial.com', NULL, N'456', N'567', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (19, 1, N'qwerty', N'gvthb', N'Male', N'Mr.', NULL, N'jkbkb', N'jknjn', N'768', NULL, N'jbnjb@bnj.com', NULL, N'34567', N'e3456', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (20, 1, N'qwerty', N'gvthb', N'Male', N'Mr.', NULL, N'jkbkb', N'jknjn', N'768', NULL, N'jbnjb@bnj.com', NULL, N'34567', N'e3456', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (21, 1, N'qwer12233', N'', N'Male', N'Mr.', NULL, N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (22, 1, N'jbkjj', N'bjkbjk', N'Male', N'Ms.', NULL, N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (23, 1, N'ddd', N'', N'', N'Mr.', NULL, N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (24, 1, N'rgerg', N'', N'Male', N'Ms.', NULL, N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (25, 1, N'hvkjbkj', N'jbkb', N'', N'Ms.', NULL, N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (26, 1, N'iui', N'uig', N'', N'Ms.', NULL, N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (27, 1, N'dhrt', N'rg4', N'', N'Dr.', NULL, N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (28, 1, N'jkj', N'jbkjbj', N'Male', N'Mr.', N'Father', N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (29, 1, N'', N'', N'', N'', N'', N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (30, 1, N'test', N'test', N'Male', N'Ms.', N'Father', N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (31, 1, N'vvV', N'DD', N'Male', N'Ms.', N'Mother', N'', N'D', N'D', NULL, N'D', NULL, N'1', N'1', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (32, 1, N'LKL', N'lk', N'Male', N'Mrs.', N'Mother', N'', N'', N'', NULL, N'', NULL, N'3456', N'4567', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (33, 1, N'hblj', N'jkbjk', N'Male', N'Mr.', N'Guardian', N'556', N'', N'', NULL, N'', NULL, N'3456', N'456', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (34, 1, N'gd', N'd', N'Female', N'Prof.', N'Guardian', N'', N'', N'', NULL, N'', NULL, N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (35, 1, N'kj', N'jk', N'Male', N'Ms.', N'Aunt', N'kj', N'kj', N'kj', NULL, N'kj', N'7', N'7', N'7', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (36, 1, N'test440', N'test440', N'Male', N'Ms.', N'Mother', N'440', N'440', N'440', NULL, N'4340', N'440', N'440', N'440', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (37, 1, N'fgh', N'fgh', N'Male', N'Prof.', N'Uncle', N'fgh', N'fgh', N'fgh', NULL, N'fgh', N'1234567', N'23456', N'456', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (38, 1, N'Ana', N'Borbolla', N'Female', N'Mrs', N'Father', N'1008 Darlene ln', N'Arlington', N'Texas', NULL, N'ajascquez3@gmail.com', N'8178910103', N'', N'', NULL, NULL, NULL, N'True', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (39, 1, N'Ana', N'Borbolla', N'Female', N'Ms.', N'Father', N'1008 Darlene ln', N'Arlington', N'Texas', NULL, N'ajascquez3@gmail.com', N'8178910103', N'109', N'109', NULL, NULL, NULL, N'True', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (40, 1, N'eodrl', N'jkbn', N'Male', N'Ms.', N'Father', N'khjj', N'kk', N'knk', NULL, N'nknkn@gmail.com', N'9872134500', N'88', N'8', NULL, NULL, NULL, N'Yes', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (41, 1, N'Soni sir', N's', N'Male', N'Dr.', N'Father', N'test', N'test', N'test', NULL, N'test@gmail.com', N'9876512345', N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
INSERT [dbo].[LeadContactList] ([LeadContactListID], [CompanyId], [FirstName], [LastName], [Gender], [Salutation], [Relationship], [Address], [City], [State], [PostCode], [Email], [MobilePhone], [HomePhone], [WorkPhone], [ReceiveMail], [ReceiveEmail], [ReceiveSMS], [Alumni], [GraduationYear], [NameAtSchool]) VALUES (42, 1, N'soni madam', N's', N'Male', N'Ms.', N'Mother', N'', N'', N'', NULL, N'test@gmail.com', N'1234512345', N'', N'', NULL, NULL, NULL, N'', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[LeadContactList] OFF
GO
SET IDENTITY_INSERT [dbo].[LeadStatus] ON 
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (1, N'Dead Lead', 1, 0, 99999, CAST(N'2024-09-15T22:55:32.867' AS DateTime), 99999, CAST(N'2024-09-15T22:55:32.867' AS DateTime), 0)
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (2, N'Active Lead', 1, 0, 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 0)
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (3, N'Waiting for Response', 1, 0, 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 0)
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (4, N'Hot', 1, 0, 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 0)
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (5, N'Customer', 1, 0, 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 0)
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (6, N'On Boarding', 1, 0, 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 0)
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (7, N'In Free Trials', 1, 0, 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 99999, CAST(N'2024-09-15T22:57:23.630' AS DateTime), 0)
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (8, N'Demo Completed', 1, 0, 99999, CAST(N'2024-09-15T22:57:23.633' AS DateTime), 99999, CAST(N'2024-09-15T22:57:23.633' AS DateTime), 0)
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (9, N'Qualified', 1, 0, 99999, CAST(N'2024-09-15T22:57:23.633' AS DateTime), 99999, CAST(N'2024-09-15T22:57:23.633' AS DateTime), 0)
GO
INSERT [dbo].[LeadStatus] ([LeadStatusID], [LeadStatus], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (10, N'Pre Qualify', 1, 0, 99999, CAST(N'2024-09-15T22:57:23.633' AS DateTime), 99999, CAST(N'2024-09-15T22:57:23.633' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[LeadStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[LinkLeadContacts] ON 
GO
INSERT [dbo].[LinkLeadContacts] ([LinkLeadContactId], [LeadId], [ContactId]) VALUES (1, 3, 1)
GO
INSERT [dbo].[LinkLeadContacts] ([LinkLeadContactId], [LeadId], [ContactId]) VALUES (2, 3, 5)
GO
INSERT [dbo].[LinkLeadContacts] ([LinkLeadContactId], [LeadId], [ContactId]) VALUES (3, 18, 17)
GO
INSERT [dbo].[LinkLeadContacts] ([LinkLeadContactId], [LeadId], [ContactId]) VALUES (4, 23, 22)
GO
INSERT [dbo].[LinkLeadContacts] ([LinkLeadContactId], [LeadId], [ContactId]) VALUES (5, 32, 30)
GO
SET IDENTITY_INSERT [dbo].[LinkLeadContacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON 
GO
INSERT [dbo].[Login] ([LoginId], [CompanyId], [Login], [LoginType], [EmailAddress], [ShortName], [ExpiryDate], [Demo], [NewProcess], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive], [IsDeleted], [IsProcessed], [Password]) VALUES (1, 1, N'SuperAdmin', N'Admin', N'superadmin@gracesoft.com', N'Newman', CAST(N'2050-12-31T00:00:00' AS SmallDateTime), 1, N'N/A', 99999, CAST(N'2024-09-14T15:14:07.950' AS DateTime), 99999, CAST(N'2024-09-14T15:14:07.950' AS DateTime), 1, 0, N'INC ', N'admin')
GO
INSERT [dbo].[Login] ([LoginId], [CompanyId], [Login], [LoginType], [EmailAddress], [ShortName], [ExpiryDate], [Demo], [NewProcess], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive], [IsDeleted], [IsProcessed], [Password]) VALUES (2, 2, N'GraceAdmin', N'Admin', N'superadmin@gracesoft.com', N'Graceetta', CAST(N'2050-12-31T00:00:00' AS SmallDateTime), 1, N'N/A', 99999, CAST(N'2024-09-14T15:14:07.950' AS DateTime), 99999, CAST(N'2024-09-14T15:14:07.950' AS DateTime), 1, 0, N'INC ', N'admin')
GO
INSERT [dbo].[Login] ([LoginId], [CompanyId], [Login], [LoginType], [EmailAddress], [ShortName], [ExpiryDate], [Demo], [NewProcess], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive], [IsDeleted], [IsProcessed], [Password]) VALUES (3, 3, N'admin', N'admin', N'superadmin@gracesoft.com', N'admin', CAST(N'2050-12-31T00:00:00' AS SmallDateTime), 1, N'N/A', NULL, CAST(N'2024-09-14T15:14:07.950' AS DateTime), NULL, CAST(N'2024-09-14T15:14:07.950' AS DateTime), 1, 0, N'INC ', N'admin')
GO
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
SET IDENTITY_INSERT [dbo].[ReferalSource] ON 
GO
INSERT [dbo].[ReferalSource] ([ReferalSourceID], [ReferalSource], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (1, N'Booking.com', 1, 0, 99999, CAST(N'2024-09-15T22:28:23.220' AS DateTime), 99999, CAST(N'2024-09-15T22:28:23.220' AS DateTime), 0)
GO
INSERT [dbo].[ReferalSource] ([ReferalSourceID], [ReferalSource], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (2, N'Expedia', 1, 0, 99999, CAST(N'2024-09-15T22:28:23.273' AS DateTime), 99999, CAST(N'2024-09-15T22:28:23.273' AS DateTime), 0)
GO
INSERT [dbo].[ReferalSource] ([ReferalSourceID], [ReferalSource], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (3, N'Website', 1, 0, 99999, CAST(N'2024-09-15T22:28:23.290' AS DateTime), 99999, CAST(N'2024-09-15T22:28:23.290' AS DateTime), 0)
GO
INSERT [dbo].[ReferalSource] ([ReferalSourceID], [ReferalSource], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (4, N'Phone Reservation', 1, 0, 99999, CAST(N'2024-09-15T22:28:23.290' AS DateTime), 99999, CAST(N'2024-09-15T22:28:23.290' AS DateTime), 0)
GO
INSERT [dbo].[ReferalSource] ([ReferalSourceID], [ReferalSource], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (5, N'Walk In Guest', 1, 0, 99999, CAST(N'2024-09-15T22:28:23.300' AS DateTime), 99999, CAST(N'2024-09-15T22:28:23.300' AS DateTime), 0)
GO
INSERT [dbo].[ReferalSource] ([ReferalSourceID], [ReferalSource], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (6, N'Colonel Male', 1, 0, 99999, CAST(N'2024-09-15T22:28:23.300' AS DateTime), 99999, CAST(N'2024-09-15T22:28:23.300' AS DateTime), 0)
GO
INSERT [dbo].[ReferalSource] ([ReferalSourceID], [ReferalSource], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (7, N'Chamber of Commerce', 1, 0, 99999, CAST(N'2024-09-15T22:28:23.303' AS DateTime), 99999, CAST(N'2024-09-15T22:28:23.303' AS DateTime), 0)
GO
INSERT [dbo].[ReferalSource] ([ReferalSourceID], [ReferalSource], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (8, N'AirBnB', 1, 0, 99999, CAST(N'2024-09-15T22:28:23.303' AS DateTime), 99999, CAST(N'2024-09-15T22:28:23.303' AS DateTime), 0)
GO
INSERT [dbo].[ReferalSource] ([ReferalSourceID], [ReferalSource], [IsActive], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsProcessed]) VALUES (9, N'Google', 1, 0, 99999, CAST(N'2024-09-15T22:28:23.307' AS DateTime), 99999, CAST(N'2024-09-15T22:28:23.307' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[ReferalSource] OFF
GO
ALTER TABLE [dbo].[Login] ADD  DEFAULT ('INC') FOR [IsProcessed]
GO
ALTER TABLE [dbo].[DynamicControls]  WITH CHECK ADD  CONSTRAINT [fk_dynamiccontrols_companyid] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[DynamicControls] CHECK CONSTRAINT [fk_dynamiccontrols_companyid]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Campuses] FOREIGN KEY([CampusId])
REFERENCES [dbo].[Campuses] ([CampusId])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Campuses]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventTypes] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventTypes] ([EventTypeId])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventTypes]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Company]
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlByLeadId]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDynamicControlByLeadId] 
    @CompanyId INT,
    @ScreenName VARCHAR(100),
    @LeadId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Dynamic SQL to generate column headers
    DECLARE @sql NVARCHAR(MAX);
    
    -- Generate the list of column headers dynamically from DynamicControls for the specified CompanyId
    SELECT @sql = STUFF((
        SELECT ', ' + QUOTENAME(Label)
        FROM DynamicControls
        WHERE CompanyId = @CompanyId AND ScreenName = @ScreenName
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '');

    -- Check if any columns were found
    IF @sql IS NULL
    BEGIN
        RAISERROR('No columns found for the specified condition.', 16, 1);
        RETURN;
    END

    -- Prepare LeadIdList
    DECLARE @LeadIdList NVARCHAR(MAX);

    SELECT @LeadIdList = STUFF((
        SELECT ', ' + CONVERT(VARCHAR(10), ContactId)
        FROM LinkLeadContacts
        WHERE LeadId = @LeadId
        FOR XML PATH('')), 1, 2, '');

    -- Check if any LeadIds were found
    IF @LeadIdList IS NULL
    BEGIN
        RAISERROR('No LeadIds found for the specified condition.', 16, 1);
        RETURN;
    END

    -- Create the pivoted query to return all rows
    SET @sql = '
        SELECT LeadId,' + @sql + '
        FROM (
            SELECT 
                dc.Label,
                dcv.Value,
                dcv.LeadId 
            FROM DynamicControlValues dcv
            JOIN DynamicControls dc ON dcv.ControlId = dc.Id
            WHERE dc.CompanyId = @CompanyId AND ScreenName = @ScreenName 
                AND dcv.LeadId IN (' + @LeadIdList + ')
        ) AS SourceTable
        PIVOT (
            MAX(Value)
            FOR Label IN (' + @sql + ')
        ) AS PivotTable
        ORDER BY LeadId DESC;
    ';

    -- Execute the dynamic SQL
    EXEC sp_executesql @sql, 
                       N'@CompanyId INT, @ScreenName VARCHAR(100)', 
                       @CompanyId, 
                       @ScreenName;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlPivoted]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDynamicControlPivoted] 
    @CompanyId INT, @ScreenName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Dynamic SQL to pivot the data
    DECLARE @sql NVARCHAR(MAX);

    -- Generate the list of column headers dynamically from DynamicControls for the specified CompanyId
    SELECT @sql = STUFF((
        SELECT ', ' + QUOTENAME(Label)
        FROM DynamicControls
        WHERE CompanyId = @CompanyId AND ScreenName = @ScreenName
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '');

    -- Check if any columns were found
    IF @sql IS NULL
    BEGIN
        -- Return empty result if no columns found
        RETURN;
    END

    -- Create the pivoted query to return all rows
    SET @sql = '
        SELECT LeadId,' + @sql + '
        FROM (
            SELECT 
                dc.Label,
                dcv.Value,
                dcv.LeadId 
            FROM DynamicControlValues dcv
            JOIN DynamicControls dc ON dcv.ControlId = dc.Id
            WHERE dc.CompanyId = @CompanyId AND ScreenName = @ScreenName
        ) AS SourceTable
        PIVOT (
            MAX(Value)
            FOR Label IN (' + @sql + ')
        ) AS PivotTable
        ORDER BY LeadId DESC;
    ';

    -- Execute the dynamic SQL
    EXEC sp_executesql @sql, 
                       N'@CompanyId INT, @ScreenName VARCHAR(100)', 
                       @CompanyId, 
                       @ScreenName;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlPivotedLastInserted]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetDynamicControlPivotedLastInserted] 
    @CompanyId INT,
    @ScreenName VARCHAR(100),
    @LeadId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Dynamic SQL to pivot the data
    DECLARE @sql NVARCHAR(MAX);
    
    -- Generate the list of column headers dynamically from DynamicControls for the specified CompanyId
    SELECT @sql = STUFF((
        SELECT ', ' + QUOTENAME(Label)
        FROM DynamicControls
        WHERE CompanyId = @CompanyId AND ScreenName = @ScreenName
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '');

    -- Check if any columns were found
    IF @sql IS NULL
    BEGIN
        -- Return empty result if no columns found
        RETURN;
    END

    -- Create the pivoted query to return all rows
    SET @sql = '
        SELECT LeadId,' + @sql + '
        FROM (
            SELECT 
                dc.Label,
                dcv.Value,
                dcv.LeadId 
            FROM DynamicControlValues dcv
            JOIN DynamicControls dc ON dcv.ControlId = dc.Id
            WHERE dc.CompanyId = @CompanyId AND ScreenName = @ScreenName AND dcv.LeadId = @LeadId
        ) AS SourceTable
        PIVOT (
            MAX(Value)
            FOR Label IN (' + @sql + ')
        ) AS PivotTable
        ORDER BY LeadId DESC;
    ';

    -- Execute the dynamic SQL
    EXEC sp_executesql @sql, 
                       N'@CompanyId INT, @ScreenName VARCHAR(100), @LeadId INT', 
                       @CompanyId, 
                       @ScreenName, 
                       @LeadId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlsGrid]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

--exec GetLeadContactListByCompanyId 1
-- =============================================
create PROCEDURE [dbo].[GetDynamicControlsGrid]
	-- Add the parameters for the stored procedure here
	(@CompanyId int,@screenname varchar(100))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from DynamicControls where [CompanyId] = @CompanyId and [ScreenName]=@screenname
END
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicControlTable]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDynamicControlTable]
AS
BEGIN
    SET NOCOUNT ON;

    -- Temporary table to store the results
    DECLARE @Results TABLE (
        ControlLabel NVARCHAR(255),
        ControlValue NVARCHAR(255)
    );

    -- Cursor to loop through each control in DynamicControls
    DECLARE @ControlId INT, @ControlType NVARCHAR(50), @ControlLabel NVARCHAR(255), @ControlValues NVARCHAR(MAX);

    DECLARE ControlCursor CURSOR FOR
    SELECT Id, ControlType, Label, Options
    FROM DynamicControls;

    OPEN ControlCursor;
    FETCH NEXT FROM ControlCursor INTO @ControlId, @ControlType, @ControlLabel, @ControlValues;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Insert control label and values into results
        INSERT INTO @Results (ControlLabel, ControlValue)
        SELECT @ControlLabel, CONVERT(NVARCHAR(255), value)
        FROM DynamicControlValues
        WHERE Id = @ControlId;

        FETCH NEXT FROM ControlCursor INTO @ControlId, @ControlType, @ControlLabel, @ControlValues;
    END

    CLOSE ControlCursor;
    DEALLOCATE ControlCursor;

    -- Select results to display as a table
    SELECT ControlLabel, ControlValue
    FROM @Results;
END
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicFields]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDynamicFields]
	
AS
BEGIN
	
	select * from DynamicControls

END
GO
/****** Object:  StoredProcedure [dbo].[GetEventListByCompanyId]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

--exec GetLeadContactListByCompanyId 1
-- =============================================
CREATE PROCEDURE [dbo].[GetEventListByCompanyId]
	-- Add the parameters for the stored procedure here
	(@CompanyId int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
    e.[EventId], e.[CampusId],e.[EventTypeId],
    et.[EventTypeName],
    c.[CampusName],
    co.[CompanyShortName],
    e.[Location],
    e.[EventDate],
    e.[StartTime],
    e.[EndTime],
    e.[MaxNumber],
    e.[Description]
FROM 
    [EConnect].[dbo].[Events] e
JOIN 
    [EConnect].[dbo].[EventTypes] et ON e.[EventTypeId] = et.[EventTypeId]
JOIN 
    [EConnect].[dbo].[Campuses] c ON e.[CampusId] = c.[CampusId]
JOIN 
    [EConnect].[dbo].[Company] co ON e.[CompanyId] = co.[CompanyId]
WHERE 
    co.[IsActive] = 1 
    AND co.[IsDeleted] = 0
    AND e.[CompanyId] = @CompanyId;  
END
GO
/****** Object:  StoredProcedure [dbo].[GetLeadContactListByCompanyId]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

--exec GetLeadContactListByCompanyId 1
-- =============================================
CREATE PROCEDURE [dbo].[GetLeadContactListByCompanyId]
	-- Add the parameters for the stored procedure here
	(@CompanyId int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LeadContactList where [CompanyId] = @CompanyId
END
GO
/****** Object:  StoredProcedure [dbo].[GetLeadContactListByLeadId]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetLeadContactListByLeadId]
(@LeadId int)
AS
BEGIN
		SELECT 
    --llc.[SNo],
	ROW_NUMBER() OVER (ORDER BY lcl.[LeadContactListID]) AS SNo,
    llc.[LeadId],
    lcl.[LeadContactListID],
    lcl.[Relationship],
    lcl.[CompanyId],
    lcl.[FirstName],
    lcl.[LastName],
    lcl.[Gender],
    lcl.[Salutation],
    lcl.[Address],
    lcl.[City],
    lcl.[State],
    lcl.[PostCode],
    lcl.[Email],
    lcl.[MobilePhone],
    lcl.[HomePhone],
    lcl.[WorkPhone],
    lcl.[ReceiveMail],
    lcl.[ReceiveEmail],
    lcl.[ReceiveSMS],
    lcl.[Alumni],
    lcl.[GraduationYear],
    lcl.[NameAtSchool]
FROM 
    [EConnect].[dbo].[LinkLeadContacts] llc
INNER JOIN 
    [EConnect].[dbo].[LeadContactList] lcl
ON 
    llc.[LinkLeadContactId] = lcl.[LeadContactListID]
WHERE 
    llc.[LeadId] = @LeadId; -- Replace @LeadId with the specific LeadId value you want to filter
		
END
GO
/****** Object:  StoredProcedure [dbo].[GetLeadField]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--exec  [dbo].[GetLeadField] 1

CREATE PROCEDURE [dbo].[GetLeadField]
(@CompanyId int)
AS
BEGIN
	  select *,(SELECT TOP 1 val.[field_value] FROM [dbo].[LeadField_value] val WHERE val.[LeadField_id] = fld.[LeadFieldId]) as [has_data] from LeadField fld WHERE [CompanyId] = @CompanyId union
	  select *,(SELECT TOP 1 val.[field_value] FROM [dbo].[LeadField_value] val WHERE val.[LeadField_id] = lft.[LeadFieldId]) as [has_data] from LeadFieldTypes lft WHERE [CompanyId] = @CompanyId
END;
GO
/****** Object:  StoredProcedure [dbo].[GetLeadFieldLookup]    Script Date: 12-11-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLeadFieldLookup]
(@CompanyId int)
AS
BEGIN
		
	 -- lookup data
		SELECT lkup.[LeadFieldLookupId] 
			  ,lkup.[LeadField_Id] 
			  ,lkup.[value]
			  ,lkup.[Sequence]
		  FROM [dbo].[LeadFieldLookup] lkup WITH(NOLOCK)
    INNER JOIN  [dbo].[LeadField] fld WITH(NOLOCK)
			ON lkup.[LeadField_Id]= fld.[LeadFieldId]
		  WHERE fld.[CompanyId] = @CompanyId
	  ORDER BY lkup.[LeadFieldLookupId], lkup.[Sequence], lkup.[value]	

		
END
GO
USE [master]
GO
ALTER DATABASE [Econnect] SET  READ_WRITE 
GO
