USE [master]
GO
/****** Object:  Database [MTRSadodb]    Script Date: 15-08-2024 8.39.34 PM ******/
CREATE DATABASE [MTRSadodb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MTRSadodb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MTRSadodb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MTRSadodb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MTRSadodb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MTRSadodb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MTRSadodb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MTRSadodb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MTRSadodb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MTRSadodb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MTRSadodb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MTRSadodb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MTRSadodb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MTRSadodb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MTRSadodb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MTRSadodb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MTRSadodb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MTRSadodb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MTRSadodb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MTRSadodb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MTRSadodb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MTRSadodb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MTRSadodb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MTRSadodb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MTRSadodb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MTRSadodb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MTRSadodb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MTRSadodb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MTRSadodb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MTRSadodb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MTRSadodb] SET  MULTI_USER 
GO
ALTER DATABASE [MTRSadodb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MTRSadodb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MTRSadodb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MTRSadodb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MTRSadodb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MTRSadodb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MTRSadodb] SET QUERY_STORE = ON
GO
ALTER DATABASE [MTRSadodb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MTRSadodb]
GO
/****** Object:  Table [dbo].[Department_mast]    Script Date: 15-08-2024 8.39.36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_mast](
	[Department_id] [int] IDENTITY(1,1) NOT NULL,
	[Department_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_master]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_master](
	[Item_id] [int] IDENTITY(1,1) NOT NULL,
	[Item_name] [varchar](100) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Rate] [decimal](10, 2) NULL,
	[Balance_quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_Transaction]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Transaction](
	[Transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[Item_id] [int] NOT NULL,
	[Transaction_date] [datetime] NOT NULL,
	[Department_id] [int] NULL,
	[Vendor_id] [int] NULL,
	[Quantity] [int] NOT NULL,
	[TransType] [nvarchar](99) NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](55) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor_mast]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor_mast](
	[Vendor_id] [int] IDENTITY(1,1) NOT NULL,
	[Vendor_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Vendor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Item_Transaction]  WITH CHECK ADD FOREIGN KEY([Department_id])
REFERENCES [dbo].[Department_mast] ([Department_id])
GO
ALTER TABLE [dbo].[Item_Transaction]  WITH CHECK ADD FOREIGN KEY([Item_id])
REFERENCES [dbo].[Item_master] ([Item_id])
GO
ALTER TABLE [dbo].[Item_Transaction]  WITH CHECK ADD FOREIGN KEY([Vendor_id])
REFERENCES [dbo].[Vendor_mast] ([Vendor_id])
GO
/****** Object:  StoredProcedure [dbo].[Ddl_Category]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Procedure [dbo].[Ddl_Category]
(
  @id int =null
)
as
begin
select * from tblCategory
end
GO
/****** Object:  StoredProcedure [dbo].[ddl_depart]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Procedure [dbo].[ddl_depart] 
(
  @Department_id int =null
)
as
begin
select * from Department_mast
end
GO
/****** Object:  StoredProcedure [dbo].[ddl_Vendor]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 Create Procedure [dbo].[ddl_Vendor]  
(
  @Vendor_id int =null
)
as
begin
select * from Vendor_mast
end
GO
/****** Object:  StoredProcedure [dbo].[ddlItemQty_f]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[ddlItemQty_f]
 (
 @Item_id int=null
 ) 
as  
begin  
select * from Item_master  where Item_id=@Item_id
end 
GO
/****** Object:  StoredProcedure [dbo].[Delete_Transaction]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Transaction]
(
@Transaction_id int
)
as
begin
delete from Item_Transaction  where Transaction_id=@Transaction_id
end
GO
/****** Object:  StoredProcedure [dbo].[Department_Delete]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Department_Delete]
(
@Department_id int
)
as
delete from Department_mast where Department_id=@Department_id
return
GO
/****** Object:  StoredProcedure [dbo].[Department_Detail]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Department_Detail]

as
begin
select * from Department_mast
end
GO
/****** Object:  StoredProcedure [dbo].[Department_Edit]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Department_Edit]
(
@Department_id int
)
  as begin
  select * from Department_mast where Department_id=@Department_id
  end
GO
/****** Object:  StoredProcedure [dbo].[Department_Listt]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Department_Listt]
  as begin
  select *from Department_mast
  end
GO
/****** Object:  StoredProcedure [dbo].[Department_Save]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Department_Save]
(
    @Department_id INT,
    @Department_name VARCHAR(99)   
)
AS
BEGIN
    -- Check if an item with the given ID already exists
    IF EXISTS (SELECT * FROM Department_mast WHERE Department_id = @Department_id)
    BEGIN
        -- If it exists, update the existing record
        UPDATE Department_mast
        SET
            Department_name = @Department_name
           
        WHERE Department_id = @Department_id
    END
    ELSE
    BEGIN
        -- If it does not exist, insert a new record
        INSERT INTO Department_mast
        (Department_name)
        VALUES
        (@Department_name)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Edit_Transaction]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Transaction]
(
@Transaction_id int
)
  as 
  begin
  select * from Item_Transaction where Transaction_id =@Transaction_id
  end
GO
/****** Object:  StoredProcedure [dbo].[IssueReport]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[IssueReport]  
as
begin
select D.Item_name,B.Department_name,A.Quantity,D.Rate,A.Transaction_date
from Item_Transaction A
left join Department_mast B on A.Department_id=B.Department_id
left join Item_master D on A.Item_id=D.Item_id
where A.TransType ='issue'
ORDER BY B.Department_name, A.Transaction_date
end
GO
/****** Object:  StoredProcedure [dbo].[Item_Details]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Item_Details]
(@Item_id int)
as
begin
select * from Item_master where Item_id=@Item_id;
end;
GO
/****** Object:  StoredProcedure [dbo].[ItemQty_Namef]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[ItemQty_Namef]    
 (  
 @Item_id int=null  
 )   
as    
begin    
select * from Item_master 
end    
GO
/****** Object:  StoredProcedure [dbo].[PurchaseReport]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[PurchaseReport]  
as
begin
select D.Item_name,C.Vendor_name ,A.Quantity,D.Rate, A.Transaction_date
from Item_Transaction A
left join Vendor_mast C on A.Vendor_id=C.Vendor_id
left join Item_master D on A.Item_id=D.Item_id
where A.TransType ='purchase'
ORDER BY C.Vendor_name, A.Transaction_date
end
GO
/****** Object:  StoredProcedure [dbo].[SaveItem]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveItem]
(
    @Item_id INT,
    @Item_name VARCHAR(99),
    @Category VARCHAR(99),
    @Rate DECIMAL(10, 2),
    @Balance_quantity INT
)
AS
BEGIN
    -- Check if an item with the given ID already exists
    IF EXISTS (SELECT * FROM Item_master WHERE Item_id = @Item_id)
    BEGIN
        -- If it exists, update the existing record
        UPDATE Item_master
        SET
            Item_name = @Item_name,
            Category = @Category,
            Rate = @Rate,
            Balance_quantity = @Balance_quantity
        WHERE Item_id = @Item_id
    END
    ELSE
    BEGIN
        -- If it does not exist, insert a new record
        INSERT INTO Item_master
        (Item_name, Category, Rate, Balance_quantity)
        VALUES
        (@Item_name, @Category, @Rate, @Balance_quantity)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteItem]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[SP_DeleteItem]
(
@Item_id int
)
as
begin
delete from Item_master where Item_id=@Item_id
end
GO
/****** Object:  StoredProcedure [dbo].[SP_EditItem]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SP_EditItem]
(
@Item_id int
)
  as
  begin
  select * from Item_master where Item_id=@Item_id
  end
GO
/****** Object:  StoredProcedure [dbo].[SP_Item_List]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[SP_Item_List]
  as 
  begin
  select * from Item_master
  end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Report]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Report]
as
begin
select A.Transaction_id,A.Transaction_date,A.Quantity,D.Balance_quantity,A.TransType,B.Department_name,C.Vendor_name,D.Item_name from Item_Transaction A
left join Department_mast B on A.Department_id=B.Department_id
left join Vendor_mast C on A.Vendor_id=C.Vendor_id
left join Item_master D on A.Item_id=D.Item_id

end;
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveItem]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SaveItem]
(
    @Item_id INT,
    @Item_name VARCHAR(99),
    @Category VARCHAR(99),
    @Rate DECIMAL(10, 2),
    @Balance_quantity INT
)
AS
BEGIN
    -- Check if an item with the given ID already exists
    IF EXISTS (SELECT 1 FROM Item_master WHERE Item_id = @Item_id)
    BEGIN
        -- If it exists, update the existing record
        UPDATE Item_master
        SET
            Item_name = @Item_name,
            Category = @Category,
            Rate = @Rate,
            Balance_quantity = @Balance_quantity
        WHERE Item_id = @Item_id
    END
    ELSE
    BEGIN
        -- If it does not exist, insert a new record
        INSERT INTO Item_master
        (Item_name, Category, Rate, Balance_quantity)
        VALUES
        (@Item_name, @Category, @Rate, @Balance_quantity)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Trans_Save]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Trans_Save]  
(    
    @Transaction_id INT,      
    @Item_id INT,        
    @Transaction_date DATETIME,          
    @Department_id INT,          
    @Vendor_id INT,          
    @Quantity INT,
    @ItemQtyTotal INT,
    @TransType NVARCHAR(55),
    @Balance_quantity INT                               
)    
AS 
BEGIN
    IF EXISTS (SELECT * FROM Item_Transaction WHERE Transaction_id = @Transaction_id)
    BEGIN
        UPDATE Item_Transaction 
        SET Item_id = @Item_id,
            TransType = @TransType,
            Quantity = @Quantity,
            Transaction_date = @Transaction_date 
        WHERE Transaction_id = @Transaction_id;
    END
    ELSE     
    BEGIN
        INSERT INTO Item_Transaction (Item_id, Transaction_date, Department_id, Vendor_id, Quantity, TransType)    
        VALUES (@Item_id, @Transaction_date, @Department_id, @Vendor_id, @Quantity, @TransType);

        UPDATE Item_master 
        SET Balance_quantity = @ItemQtyTotal 
        WHERE Item_id = @Item_id;  
    END  
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_List]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Transaction_List]
  as
  begin
 -- select *, D.Balance_quantity from Item_Transaction A 
	--left join Item_master D on A.Item_id=D.Item_id
--	select A.Transaction_id,A.Transaction_date,A.Quantity,D.Balance_quantity,A.TransType,
--B.Department_id,C.Vendor_name,D.Item_id
select A.Transaction_id,A.Transaction_date,A.Quantity,D.Balance_quantity,A.TransType,
B.Department_name,C.Vendor_name,D.Item_name

from Item_Transaction A
left join Department_mast B on A.Department_id=B.Department_id
left join Vendor_mast C on A.Vendor_id=C.Vendor_id
left join Item_master D on A.Item_id=D.Item_id
  end
GO
/****** Object:  StoredProcedure [dbo].[Transaction_List1]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Transaction_List1]
  as
  begin
    
select A.Transaction_date,A.Quantity,D.Balance_quantity,A.TransType,
B.Department_name,C.Vendor_name,D.Item_name 

from Item_Transaction A
left join Department_mast B on A.Department_id=B.Department_id
left join Vendor_mast C on A.Vendor_id=C.Vendor_id
left join Item_master D on A.Item_id=D.Item_id
  end
GO
/****** Object:  StoredProcedure [dbo].[Vendor_Delete]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[Vendor_Delete]
(
@Vendor_id int
)
as
delete from Vendor_mast where Vendor_id=@Vendor_id
return
GO
/****** Object:  StoredProcedure [dbo].[Vendor_Details]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Vendor_Details]

(@Vendor_id int)
as
begin
select * from Vendor_mast where Vendor_id=@Vendor_id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Vendor_Edit]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Procedure [dbo].[Vendor_Edit]
(
@Vendor_id int
)
  as begin
  select * from Vendor_mast where Vendor_id=@Vendor_id
  end
GO
/****** Object:  StoredProcedure [dbo].[Vendor_List]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Vendor_List]
  as begin
  select * from Vendor_mast
  end
GO
/****** Object:  StoredProcedure [dbo].[Vendor_Save]    Script Date: 15-08-2024 8.39.37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Vendor_Save]
(
    @Vendor_id INT,
    @Vendor_name VARCHAR(99)   
)
AS
BEGIN
 IF EXISTS (SELECT * FROM Vendor_mast WHERE Vendor_name = @Vendor_name)
    BEGIN
        -- ItemDescr already exists, do nothing or handle as needed
        PRINT 'Vendor Name already Register, not inserting duplicate value.';
    END
    ELSE
    BEGIN
    -- Check if an item with the given ID already exists
    IF EXISTS (SELECT * FROM Vendor_mast WHERE Vendor_id = @Vendor_id)
    BEGIN
        -- If it exists, update the existing record
        UPDATE Vendor_mast
        SET
            Vendor_name = @Vendor_name
           
        WHERE Vendor_id = @Vendor_id
    END
    ELSE
    BEGIN
        -- If it does not exist, insert a new record
        INSERT INTO Vendor_mast
        (Vendor_name)
        VALUES
        (@Vendor_name)
    END
END
End
GO
USE [master]
GO
ALTER DATABASE [MTRSadodb] SET  READ_WRITE 
GO
