-- =============================================
-- Author:		Bernal Fernandes Rojas
-- Create date: 22/09/2013
-- Description: Remove Stores
-- =============================================
USE [SShoesDB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uspDelStores]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [uspDelStores]
GO

USE [SShoesDB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [uspDelStores] 
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
GO











