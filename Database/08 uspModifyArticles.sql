-- =============================================
-- Author:		Bernal Fernandes Rojas
-- Create date: 22/09/2013
-- Description:	Update Articles
-- =============================================
USE [SShoesDB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uspModifyArticles]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [uspModifyArticles]
GO
USE [SShoesDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [uspModifyArticles] 
(
	@pArticleId INT,
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
                           
				UPDATE [utbArticles]
				SET Name = @pName
					,[Description] = @pDescription
					,Price = @pPrice
					,Total_in_self = @pTotal_in_self
					,Total_in_vault = @pTotal_in_vault
					,StoreId = @pStoreId
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
GO











