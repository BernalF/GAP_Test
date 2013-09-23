-- =============================================
-- Author:		Bernal Fernandes Rojas
-- Create date: 22/09/2013
-- Description: Retrieve Articles
-- =============================================
USE [SShoesDB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uspGetArticles]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [uspGetArticles]
GO
USE [SShoesDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [uspGetArticles] 
	@pArticleId INT = NULL
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT
		 ArticleId
		,a.Name
		,[Description]
		,Price
		,Total_in_self
		,Total_in_vault
		,s.StoreId        
		,s.Name StoreName
    FROM [utbArticles] a
    INNER JOIN [utbStores] s ON a.StoreId = s.StoreId    
    WHERE (@pArticleId IS NULL OR ArticleId = @pArticleId)		
    
    SET NOCOUNT OFF;
END
GO
