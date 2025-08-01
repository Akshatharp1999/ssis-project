USE [master]
GO
/****** Object:  Database [CustomerWarehouse]    Script Date: 6/6/2025 5:45:40 PM ******/
CREATE DATABASE [CustomerWarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerWarehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CustomerWarehouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CustomerWarehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CustomerWarehouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CustomerWarehouse] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerWarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerWarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerWarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerWarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerWarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerWarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [CustomerWarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerWarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerWarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerWarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerWarehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CustomerWarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CustomerWarehouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CustomerWarehouse', N'ON'
GO
ALTER DATABASE [CustomerWarehouse] SET QUERY_STORE = ON
GO
ALTER DATABASE [CustomerWarehouse] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[ADO NET Destination]    Script Date: 6/6/2025 5:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADO NET Destination](
	[countryid] [varchar](50) NULL,
	[countryname] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimcountry]    Script Date: 6/6/2025 5:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimcountry](
	[countryid] [int] NOT NULL,
	[countryname] [nvarchar](50) NULL,
	[isnew] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimproduct]    Script Date: 6/6/2025 5:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimproduct](
	[productid] [int] NOT NULL,
	[productname] [nvarchar](50) NULL,
	[createddate] [datetime] NULL,
	[expireddate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimsalesperson]    Script Date: 6/6/2025 5:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimsalesperson](
	[salespersonid] [int] NOT NULL,
	[salespersonname] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimstates]    Script Date: 6/6/2025 5:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimstates](
	[stateid] [int] NOT NULL,
	[statename] [nvarchar](50) NULL,
 CONSTRAINT [PK_dimstates] PRIMARY KEY CLUSTERED 
(
	[stateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factcustomer]    Script Date: 6/6/2025 5:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factcustomer](
	[customerCode] [nvarchar](50) NOT NULL,
	[customerName] [nvarchar](50) NULL,
	[CustomerAmount] [money] NULL,
	[Saledate] [datetime] NULL,
	[countrid_fk] [int] NULL,
	[statesid_fk] [int] NULL,
	[productid_fk] [int] NULL,
	[salespersonid_fk] [int] NULL,
 CONSTRAINT [PK_tblcustomer] PRIMARY KEY CLUSTERED 
(
	[customerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tnlcustomer]    Script Date: 6/6/2025 5:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tnlcustomer](
	[customerCode] [nvarchar](50) NOT NULL,
	[customerName] [nvarchar](50) NULL,
	[CustomerAmount] [money] NULL,
	[Saledate] [datetime] NULL,
 CONSTRAINT [PK_tnlcustomer] PRIMARY KEY CLUSTERED 
(
	[customerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[factcustomer]  WITH NOCHECK ADD  CONSTRAINT [FK_factcustomer_dimstates] FOREIGN KEY([statesid_fk])
REFERENCES [dbo].[dimstates] ([stateid])
GO
ALTER TABLE [dbo].[factcustomer] CHECK CONSTRAINT [FK_factcustomer_dimstates]
GO
USE [master]
GO
ALTER DATABASE [CustomerWarehouse] SET  READ_WRITE 
GO
