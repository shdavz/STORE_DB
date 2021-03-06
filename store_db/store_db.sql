USE [master]
GO
/****** Object:  Database [store_db]    Script Date: 08.10.2017 22:43:03 ******/
CREATE DATABASE [store_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'store_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\store_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'store_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\store_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 102400KB )
GO
ALTER DATABASE [store_db] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [store_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [store_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [store_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [store_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [store_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [store_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [store_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [store_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [store_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [store_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [store_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [store_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [store_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [store_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [store_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [store_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [store_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [store_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [store_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [store_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [store_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [store_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [store_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [store_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [store_db] SET  MULTI_USER 
GO
ALTER DATABASE [store_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [store_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [store_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [store_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [store_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'store_db', N'ON'
GO
ALTER DATABASE [store_db] SET QUERY_STORE = OFF
GO
USE [store_db]
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
USE [store_db]
GO
/****** Object:  Schema [dim]    Script Date: 08.10.2017 22:43:03 ******/
CREATE SCHEMA [dim]
GO
/****** Object:  Schema [doc]    Script Date: 08.10.2017 22:43:03 ******/
CREATE SCHEMA [doc]
GO
/****** Object:  Table [dim].[brands]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [pk_brands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[categories]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [pk_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[cities]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[id_country] [int] NOT NULL,
 CONSTRAINT [pk_cities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[countries]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [pk_countries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[customers]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[id_type_cutomer] [int] NOT NULL,
	[phone] [nvarchar](1) NOT NULL,
	[email] [nvarchar](1) NOT NULL,
	[id_country] [int] NOT NULL,
	[id_city] [int] NOT NULL,
	[street] [nvarchar](500) NOT NULL,
	[building] [nvarchar](10) NOT NULL,
	[job_area] [nvarchar](500) NULL,
 CONSTRAINT [pk_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[price_lists]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[price_lists](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_type_prices] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[date_from] [datetime] NOT NULL,
	[date_to] [datetime] NOT NULL,
	[price] [decimal](15, 2) NOT NULL,
 CONSTRAINT [pk_price_lists] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[producers]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[producers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [pk_producers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[products]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[id_base_measure] [int] NOT NULL,
	[id_type_product] [int] NOT NULL,
	[id_category] [int] NOT NULL,
	[id_brand] [int] NOT NULL,
	[id_producer] [int] NOT NULL,
 CONSTRAINT [pk_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[stores]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[stores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[id_type_store] [int] NOT NULL,
	[id_country] [int] NOT NULL,
	[id_city] [int] NOT NULL,
	[street] [nvarchar](500) NOT NULL,
	[building] [nvarchar](20) NOT NULL,
 CONSTRAINT [pk_stores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[type_prices]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[type_prices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [pk_type_prices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[types_product]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[types_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [pk_types_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[types_store]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[types_store](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [pk_types_store] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[types_unit]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[types_unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [pk_types_unit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[types_сustomer]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[types_сustomer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [pk_types_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dim].[units_of_measure]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim].[units_of_measure](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[id_type] [int] NOT NULL,
	[coef] [decimal](15, 3) NOT NULL,
	[weight] [decimal](15, 3) NOT NULL,
 CONSTRAINT [pk_units_of_measure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [doc].[orders_headers]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [doc].[orders_headers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[store_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [pk_orders_headers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [doc].[orders_row]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [doc].[orders_row](
	[id_order_num] [bigint] NOT NULL,
	[id_product] [int] NOT NULL,
	[id_unit_of_measure] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[price] [decimal](15, 2) NOT NULL,
	[id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_orders_row]    Script Date: 08.10.2017 22:43:03 ******/
CREATE CLUSTERED INDEX [ix_orders_row] ON [doc].[orders_row]
(
	[id_product] ASC,
	[id_order_num] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [doc].[receivables_headers]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [doc].[receivables_headers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[store_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [pk_receivables_headers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [doc].[receivables_row]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [doc].[receivables_row](
	[id_receivales_num] [bigint] NOT NULL,
	[id_product] [int] NOT NULL,
	[id_unit_of_measure] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[price] [decimal](15, 2) NOT NULL,
	[id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_receivables_row]    Script Date: 08.10.2017 22:43:03 ******/
CREATE CLUSTERED INDEX [ix_receivables_row] ON [doc].[receivables_row]
(
	[id_product] ASC,
	[id_receivales_num] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [doc].[sales_headers]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [doc].[sales_headers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[store_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [pk_sales_headers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [doc].[sales_row]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [doc].[sales_row](
	[id_order_num] [bigint] NOT NULL,
	[id_product] [int] NOT NULL,
	[id_unit_of_measure] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[price] [decimal](15, 2) NOT NULL,
	[id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_sales_row]    Script Date: 08.10.2017 22:43:03 ******/
CREATE CLUSTERED INDEX [ix_sales_row] ON [doc].[sales_row]
(
	[id_product] ASC,
	[id_order_num] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [doc].[stocks]    Script Date: 08.10.2017 22:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [doc].[stocks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[id_store] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[base_qty] [decimal](15, 3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_stocks]    Script Date: 08.10.2017 22:43:03 ******/
CREATE CLUSTERED INDEX [ix_stocks] ON [doc].[stocks]
(
	[date] ASC,
	[id_store] ASC,
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dim].[cities]  WITH CHECK ADD  CONSTRAINT [fk_cities_countries] FOREIGN KEY([id_country])
REFERENCES [dim].[countries] ([id])
GO
ALTER TABLE [dim].[cities] CHECK CONSTRAINT [fk_cities_countries]
GO
ALTER TABLE [dim].[customers]  WITH CHECK ADD  CONSTRAINT [fk_customers_cities] FOREIGN KEY([id_city])
REFERENCES [dim].[cities] ([id])
GO
ALTER TABLE [dim].[customers] CHECK CONSTRAINT [fk_customers_cities]
GO
ALTER TABLE [dim].[customers]  WITH CHECK ADD  CONSTRAINT [fk_customers_countries] FOREIGN KEY([id_country])
REFERENCES [dim].[countries] ([id])
GO
ALTER TABLE [dim].[customers] CHECK CONSTRAINT [fk_customers_countries]
GO
ALTER TABLE [dim].[customers]  WITH CHECK ADD  CONSTRAINT [fk_customers_types_сustomer] FOREIGN KEY([id_type_cutomer])
REFERENCES [dim].[types_сustomer] ([id])
GO
ALTER TABLE [dim].[customers] CHECK CONSTRAINT [fk_customers_types_сustomer]
GO
ALTER TABLE [dim].[price_lists]  WITH CHECK ADD  CONSTRAINT [fk_price_lists_products] FOREIGN KEY([id_product])
REFERENCES [dim].[products] ([id])
GO
ALTER TABLE [dim].[price_lists] CHECK CONSTRAINT [fk_price_lists_products]
GO
ALTER TABLE [dim].[price_lists]  WITH CHECK ADD  CONSTRAINT [fk_price_lists_type_prices] FOREIGN KEY([id_type_prices])
REFERENCES [dim].[type_prices] ([id])
GO
ALTER TABLE [dim].[price_lists] CHECK CONSTRAINT [fk_price_lists_type_prices]
GO
ALTER TABLE [dim].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_brands] FOREIGN KEY([id_brand])
REFERENCES [dim].[brands] ([id])
GO
ALTER TABLE [dim].[products] CHECK CONSTRAINT [fk_products_brands]
GO
ALTER TABLE [dim].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_categories] FOREIGN KEY([id_category])
REFERENCES [dim].[categories] ([id])
GO
ALTER TABLE [dim].[products] CHECK CONSTRAINT [fk_products_categories]
GO
ALTER TABLE [dim].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_producers] FOREIGN KEY([id_producer])
REFERENCES [dim].[producers] ([id])
GO
ALTER TABLE [dim].[products] CHECK CONSTRAINT [fk_products_producers]
GO
ALTER TABLE [dim].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_types_product] FOREIGN KEY([id_type_product])
REFERENCES [dim].[types_product] ([id])
GO
ALTER TABLE [dim].[products] CHECK CONSTRAINT [fk_products_types_product]
GO
ALTER TABLE [dim].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_units_of_measure] FOREIGN KEY([id_base_measure])
REFERENCES [dim].[units_of_measure] ([id])
GO
ALTER TABLE [dim].[products] CHECK CONSTRAINT [fk_products_units_of_measure]
GO
ALTER TABLE [dim].[stores]  WITH CHECK ADD  CONSTRAINT [fk_stores_cities] FOREIGN KEY([id_city])
REFERENCES [dim].[cities] ([id])
GO
ALTER TABLE [dim].[stores] CHECK CONSTRAINT [fk_stores_cities]
GO
ALTER TABLE [dim].[stores]  WITH CHECK ADD  CONSTRAINT [fk_stores_countries] FOREIGN KEY([id_country])
REFERENCES [dim].[countries] ([id])
GO
ALTER TABLE [dim].[stores] CHECK CONSTRAINT [fk_stores_countries]
GO
ALTER TABLE [dim].[stores]  WITH CHECK ADD  CONSTRAINT [fk_stores_types_store] FOREIGN KEY([id_type_store])
REFERENCES [dim].[types_store] ([id])
GO
ALTER TABLE [dim].[stores] CHECK CONSTRAINT [fk_stores_types_store]
GO
ALTER TABLE [dim].[units_of_measure]  WITH CHECK ADD  CONSTRAINT [fk_units_of_measure_types_unit] FOREIGN KEY([id_type])
REFERENCES [dim].[types_unit] ([id])
GO
ALTER TABLE [dim].[units_of_measure] CHECK CONSTRAINT [fk_units_of_measure_types_unit]
GO
ALTER TABLE [doc].[orders_headers]  WITH CHECK ADD  CONSTRAINT [fk_orders_headers_customers] FOREIGN KEY([customer_id])
REFERENCES [dim].[customers] ([id])
GO
ALTER TABLE [doc].[orders_headers] CHECK CONSTRAINT [fk_orders_headers_customers]
GO
ALTER TABLE [doc].[orders_headers]  WITH CHECK ADD  CONSTRAINT [fk_orders_headers_stores] FOREIGN KEY([store_id])
REFERENCES [dim].[stores] ([id])
GO
ALTER TABLE [doc].[orders_headers] CHECK CONSTRAINT [fk_orders_headers_stores]
GO
ALTER TABLE [doc].[orders_row]  WITH CHECK ADD  CONSTRAINT [fk_orders_row_products] FOREIGN KEY([id_product])
REFERENCES [dim].[products] ([id])
GO
ALTER TABLE [doc].[orders_row] CHECK CONSTRAINT [fk_orders_row_products]
GO
ALTER TABLE [doc].[orders_row]  WITH CHECK ADD  CONSTRAINT [fk_orders_row_units_of_measure] FOREIGN KEY([id_unit_of_measure])
REFERENCES [dim].[units_of_measure] ([id])
GO
ALTER TABLE [doc].[orders_row] CHECK CONSTRAINT [fk_orders_row_units_of_measure]
GO
ALTER TABLE [doc].[receivables_headers]  WITH CHECK ADD  CONSTRAINT [fk_receivables_headers_customers] FOREIGN KEY([customer_id])
REFERENCES [dim].[customers] ([id])
GO
ALTER TABLE [doc].[receivables_headers] CHECK CONSTRAINT [fk_receivables_headers_customers]
GO
ALTER TABLE [doc].[receivables_headers]  WITH CHECK ADD  CONSTRAINT [fk_receivables_headers_stores] FOREIGN KEY([store_id])
REFERENCES [dim].[stores] ([id])
GO
ALTER TABLE [doc].[receivables_headers] CHECK CONSTRAINT [fk_receivables_headers_stores]
GO
ALTER TABLE [doc].[receivables_row]  WITH CHECK ADD  CONSTRAINT [fk_receivables_row_products] FOREIGN KEY([id_product])
REFERENCES [dim].[products] ([id])
GO
ALTER TABLE [doc].[receivables_row] CHECK CONSTRAINT [fk_receivables_row_products]
GO
ALTER TABLE [doc].[receivables_row]  WITH CHECK ADD  CONSTRAINT [fk_receivables_row_units_of_measure] FOREIGN KEY([id_unit_of_measure])
REFERENCES [dim].[units_of_measure] ([id])
GO
ALTER TABLE [doc].[receivables_row] CHECK CONSTRAINT [fk_receivables_row_units_of_measure]
GO
ALTER TABLE [doc].[sales_headers]  WITH CHECK ADD  CONSTRAINT [fk_sales_headers_customers] FOREIGN KEY([customer_id])
REFERENCES [dim].[customers] ([id])
GO
ALTER TABLE [doc].[sales_headers] CHECK CONSTRAINT [fk_sales_headers_customers]
GO
ALTER TABLE [doc].[sales_headers]  WITH CHECK ADD  CONSTRAINT [fk_sales_headers_stores] FOREIGN KEY([store_id])
REFERENCES [dim].[stores] ([id])
GO
ALTER TABLE [doc].[sales_headers] CHECK CONSTRAINT [fk_sales_headers_stores]
GO
ALTER TABLE [doc].[sales_row]  WITH CHECK ADD  CONSTRAINT [fk_sales_row_products] FOREIGN KEY([id_product])
REFERENCES [dim].[products] ([id])
GO
ALTER TABLE [doc].[sales_row] CHECK CONSTRAINT [fk_sales_row_products]
GO
ALTER TABLE [doc].[sales_row]  WITH CHECK ADD  CONSTRAINT [fk_sales_row_units_of_measure] FOREIGN KEY([id_unit_of_measure])
REFERENCES [dim].[units_of_measure] ([id])
GO
ALTER TABLE [doc].[sales_row] CHECK CONSTRAINT [fk_sales_row_units_of_measure]
GO
USE [master]
GO
ALTER DATABASE [store_db] SET  READ_WRITE 
GO
