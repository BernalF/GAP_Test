-- =============================================
-- Author:		Bernal Fernandes Rojas
-- Create date: 22/09/2013
-- Description: Retrieve Stores
-- =============================================
USE [SShoesDB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uspGetStores]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [uspGetStores]
GO
USE [SShoesDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [uspGetStores] 
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
GO
