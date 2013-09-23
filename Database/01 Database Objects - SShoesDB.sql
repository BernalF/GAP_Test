USE [SShoesDB]
GO
/****** Object:  ForeignKey [FK_utbArticles_utbStores]    Script Date: 09/22/2013 16:01:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_utbArticles_utbStores]') AND parent_object_id = OBJECT_ID(N'[dbo].[utbArticles]'))
ALTER TABLE [dbo].[utbArticles] DROP CONSTRAINT [FK_utbArticles_utbStores]
GO
/****** Object:  StoredProcedure [dbo].[uspGetArticles]    Script Date: 09/22/2013 16:01:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetArticles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetArticles]
GO
/****** Object:  StoredProcedure [dbo].[uspAddOrModifyArticles]    Script Date: 09/22/2013 16:01:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspAddOrModifyArticles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspAddOrModifyArticles]
GO
/****** Object:  StoredProcedure [dbo].[uspDelArticles]    Script Date: 09/22/2013 16:01:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspDelArticles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspDelArticles]
GO
/****** Object:  StoredProcedure [dbo].[uspDelStores]    Script Date: 09/22/2013 16:01:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspDelStores]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspDelStores]
GO
/****** Object:  StoredProcedure [dbo].[uspAddOrModifyStores]    Script Date: 09/22/2013 16:01:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspAddOrModifyStores]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspAddOrModifyStores]
GO
/****** Object:  StoredProcedure [dbo].[uspGetStores]    Script Date: 09/22/2013 16:01:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetStores]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetStores]
GO
/****** Object:  Table [dbo].[utbArticles]    Script Date: 09/22/2013 16:01:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_utbArticles_utbStores]') AND parent_object_id = OBJECT_ID(N'[dbo].[utbArticles]'))
ALTER TABLE [dbo].[utbArticles] DROP CONSTRAINT [FK_utbArticles_utbStores]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[utbArticles]') AND type in (N'U'))
DROP TABLE [dbo].[utbArticles]
GO
/****** Object:  Table [dbo].[utbStores]    Script Date: 09/22/2013 16:01:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[utbStores]') AND type in (N'U'))
DROP TABLE [dbo].[utbStores]
GO
/****** Object:  Table [dbo].[utbStores]    Script Date: 09/22/2013 16:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[utbStores]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[utbStores](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Address] [varchar](max) NULL,
 CONSTRAINT [PK_utbStores] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[utbArticles]    Script Date: 09/22/2013 16:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[utbArticles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[utbArticles](
	[ArticleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Description] [varchar](max) NULL,
	[Price] [money] NULL,
	[Total_in_self] [int] NULL,
	[Total_in_vault] [int] NULL,
	[StoreId] [int] NOT NULL,
 CONSTRAINT [PK_utbArticles] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[uspGetStores]    Script Date: 09/22/2013 16:01:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetStores]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[uspGetStores] 
	@pStoreId INT = NULL
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT
		 StoreId
		,Name
		,[Address]      
    FROM [utbStores]
    WHERE (@pStoreId IS NULL OR StoreId = @pStoreId)		
    
    SET NOCOUNT OFF;
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[uspAddOrModifyStores]    Script Date: 09/22/2013 16:01:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspAddOrModifyStores]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[uspAddOrModifyStores] 
(
	@pStoreId INT = NULL,
	@pName VARCHAR(30),
	@pAddress VARCHAR(MAX)	
)
AS
BEGIN
	
	SET NOCOUNT ON
    SET XACT_ABORT ON
    
    BEGIN TRY
			DECLARE @lErrorMessage NVARCHAR(4000)
            DECLARE @lErrorSeverity INT
            DECLARE @lErrorState INT
            DECLARE @lLocalTran BIT = 0                        	
            
            IF @@TRANCOUNT = 0 
                BEGIN
                    BEGIN TRANSACTION
                    SET @lLocalTran = 1
                END 
                        
            IF @pStoreId IS NULL
			BEGIN
				INSERT INTO [utbStores]
					   (Name
						,[Address])
				 VALUES
					   (@pName						
						,@pAddress)
			END
			ELSE
			BEGIN
				UPDATE [utbStores]
				SET Name = @pName
					,[Address] = @pAddress
				WHERE StoreId = @pStoreId
			END
            
            IF ( @@trancount > 0
                 AND @lLocalTran = 1
               ) 
                BEGIN
                    COMMIT TRANSACTION
                END            
            
    END TRY
    BEGIN CATCH
            IF ( @@trancount > 0
                 AND XACT_STATE() <> 0
               ) 
                BEGIN
                    ROLLBACK TRANSACTION
                END
            SELECT  @lErrorMessage = ERROR_MESSAGE() ,
                    @lErrorSeverity = ERROR_SEVERITY() ,
                    @lErrorState = ERROR_STATE()      
 
            RAISERROR (@lErrorMessage, @lErrorSeverity, @lErrorState);
        END CATCH
    END
    SET NOCOUNT OFF
    SET XACT_ABORT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[uspDelStores]    Script Date: 09/22/2013 16:01:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspDelStores]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[uspDelStores] 
(
	@pStoreId INT
)
AS
BEGIN
	
	SET NOCOUNT ON
    SET XACT_ABORT ON
    
    BEGIN TRY
			DECLARE @lErrorMessage NVARCHAR(4000)
            DECLARE @lErrorSeverity INT
            DECLARE @lErrorState INT
            DECLARE @lLocalTran BIT = 0                        	
            
            IF @@TRANCOUNT = 0 
                BEGIN
                    BEGIN TRANSACTION
                    SET @lLocalTran = 1
                END 
                        
            	DELETE FROM [utbStores]
				WHERE StoreId = @pStoreId
            
            IF ( @@trancount > 0
                 AND @lLocalTran = 1
               ) 
                BEGIN
                    COMMIT TRANSACTION
                END            
            
    END TRY
    BEGIN CATCH
            IF ( @@trancount > 0
                 AND XACT_STATE() <> 0
               ) 
                BEGIN
                    ROLLBACK TRANSACTION
                END
            SELECT  @lErrorMessage = ERROR_MESSAGE() ,
                    @lErrorSeverity = ERROR_SEVERITY() ,
                    @lErrorState = ERROR_STATE()      
 
            RAISERROR (@lErrorMessage, @lErrorSeverity, @lErrorState);
        END CATCH
    END
    SET NOCOUNT OFF
    SET XACT_ABORT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[uspDelArticles]    Script Date: 09/22/2013 16:01:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspDelArticles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[uspDelArticles] 
(
	@pArticleId INT
)
AS
BEGIN
	
	SET NOCOUNT ON
    SET XACT_ABORT ON
    
    BEGIN TRY
			DECLARE @lErrorMessage NVARCHAR(4000)
            DECLARE @lErrorSeverity INT
            DECLARE @lErrorState INT
            DECLARE @lLocalTran BIT = 0                        	
            
            IF @@TRANCOUNT = 0 
                BEGIN
                    BEGIN TRANSACTION
                    SET @lLocalTran = 1
                END 
                        
            	DELETE FROM [utbArticles]
				WHERE ArticleId = @pArticleId
            
            IF ( @@trancount > 0
                 AND @lLocalTran = 1
               ) 
                BEGIN
                    COMMIT TRANSACTION
                END            
            
    END TRY
    BEGIN CATCH
            IF ( @@trancount > 0
                 AND XACT_STATE() <> 0
               ) 
                BEGIN
                    ROLLBACK TRANSACTION
                END
            SELECT  @lErrorMessage = ERROR_MESSAGE() ,
                    @lErrorSeverity = ERROR_SEVERITY() ,
                    @lErrorState = ERROR_STATE()      
 
            RAISERROR (@lErrorMessage, @lErrorSeverity, @lErrorState);
        END CATCH
    END
    SET NOCOUNT OFF
    SET XACT_ABORT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[uspAddOrModifyArticles]    Script Date: 09/22/2013 16:01:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspAddOrModifyArticles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Bernal Fernandes Rojas
-- Create date: 22/09/2013
-- Description:	Insert or update Articles
-- =============================================
CREATE PROCEDURE [dbo].[uspAddOrModifyArticles] 
(
	@pArticleId INT = NULL,
	@pName VARCHAR(30),
	@pDescription VARCHAR(MAX),
	@pPrice MONEY,
	@pTotal_in_self INT,
	@pTotal_in_vault INT,
	@pStoreId INT
)
AS
BEGIN
	
	SET NOCOUNT ON
    SET XACT_ABORT ON
    
    BEGIN TRY
			DECLARE @lErrorMessage NVARCHAR(4000)
            DECLARE @lErrorSeverity INT
            DECLARE @lErrorState INT
            DECLARE @lLocalTran BIT = 0                        	
            
            IF @@TRANCOUNT = 0 
                BEGIN
                    BEGIN TRANSACTION
                    SET @lLocalTran = 1
                END 
                        
            IF @pArticleId IS NULL
			BEGIN
				INSERT INTO [utbArticles]
					   (Name
						,[Description]
						,Price
						,Total_in_self
						,Total_in_vault
						,StoreId)
				 VALUES
					   (@pName
						,@pDescription
						,@pPrice
						,@pTotal_in_self
						,@pTotal_in_vault
						,@pStoreId)
			END
			ELSE
			BEGIN
				UPDATE [utbArticles]
				SET Name = @pName
					,[Description] = @pDescription
					,Price = @pPrice
					,Total_in_self = @pTotal_in_self
					,Total_in_vault = @pTotal_in_vault
					,StoreId = @pStoreId
				WHERE ArticleId = @pArticleId
			END
            
            IF ( @@trancount > 0
                 AND @lLocalTran = 1
               ) 
                BEGIN
                    COMMIT TRANSACTION
                END
            
            
    END TRY
    BEGIN CATCH
            IF ( @@trancount > 0
                 AND XACT_STATE() <> 0
               ) 
                BEGIN
                    ROLLBACK TRANSACTION
                END
            SELECT  @lErrorMessage = ERROR_MESSAGE() ,
                    @lErrorSeverity = ERROR_SEVERITY() ,
                    @lErrorState = ERROR_STATE()      
 
            RAISERROR (@lErrorMessage, @lErrorSeverity, @lErrorState);
        END CATCH
    END
    SET NOCOUNT OFF
    SET XACT_ABORT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetArticles]    Script Date: 09/22/2013 16:01:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetArticles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Bernal Fernandes Rojas
-- Create date: 22/09/2013
-- Description: Retrieve Articles
-- =============================================
CREATE PROCEDURE [dbo].[uspGetArticles] 
	@pArticleId INT = NULL
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT
		 ArticleId
		,Name
		,[Description]
		,Price
		,Total_in_self
		,Total_in_vault
		,StoreId        
    FROM [utbArticles]
    WHERE (@pArticleId IS NULL OR ArticleId = @pArticleId)
			
    
    SET NOCOUNT OFF;
END
' 
END
GO
/****** Object:  ForeignKey [FK_utbArticles_utbStores]    Script Date: 09/22/2013 16:01:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_utbArticles_utbStores]') AND parent_object_id = OBJECT_ID(N'[dbo].[utbArticles]'))
ALTER TABLE [dbo].[utbArticles]  WITH CHECK ADD  CONSTRAINT [FK_utbArticles_utbStores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[utbStores] ([StoreId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_utbArticles_utbStores]') AND parent_object_id = OBJECT_ID(N'[dbo].[utbArticles]'))
ALTER TABLE [dbo].[utbArticles] CHECK CONSTRAINT [FK_utbArticles_utbStores]
GO
