USE [CES_Crawl_Dev]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/25/2020 10:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](250) NOT NULL,
	[CategoryUrl] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[ParentId] [nvarchar](50) NULL,
	[SiteId] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[IdWeb] [bigint] NOT NULL,
 CONSTRAINT [PK__Category__19093A0B9C998E89] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryKeyword]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryKeyword](
	[CategoryId] [int] NULL,
	[CategoryUrl] [nvarchar](1000) NULL,
	[Keyword] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategorySub]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategorySub](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategorySiteId] [nvarchar](50) NULL,
	[CategoryName] [nvarchar](255) NULL,
	[SiteId] [int] NOT NULL,
	[CategoryUrl] [nvarchar](1000) NULL,
	[Parent] [nvarchar](50) NULL,
	[ParentId] [nvarchar](50) NULL,
	[Level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[License]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[License](
	[LicenseId] [int] IDENTITY(1,1) NOT NULL,
	[License] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[ExpriesDate] [datetime2](7) NULL,
 CONSTRAINT [PK_License] PRIMARY KEY CLUSTERED 
(
	[LicenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [varchar](50) NULL,
	[Name] [nvarchar](1000) NULL,
	[Price] [bigint] NULL,
	[CreatedProductDate] [datetime] NULL,
	[Quantity] [bigint] NULL,
	[CategoryId] [int] NULL,
	[QuantitySold] [bigint] NULL,
	[CommentCount] [bigint] NULL,
	[Discount] [varchar](20) NULL,
	[VariableJson] [nvarchar](max) NULL,
	[Url] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__Product__3214EC07C1F56118] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerAccount]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerAccount](
	[SellerAccountID] [bigint] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Password] [nvarchar](1000) NULL,
	[Cookie] [nvarchar](max) NULL,
	[LicenseId] [int] NULL,
 CONSTRAINT [PK_SellerAccount] PRIMARY KEY CLUSTERED 
(
	[SellerAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerProductInfo]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerProductInfo](
	[SkuId] [bigint] NOT NULL,
	[ItemId] [bigint] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[DiscountPriceFormatted] [nvarchar](100) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[QueueDate] [datetime] NULL,
	[IsRunned] [bit] NOT NULL,
	[SellerAccountID] [bigint] NOT NULL,
	[Type] [int] NULL,
	[LicenseId] [int] NULL,
 CONSTRAINT [PK_SellerProductInfo] PRIMARY KEY CLUSTERED 
(
	[SkuId] ASC,
	[ItemId] ASC,
	[SellerAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site](
	[SiteId] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [varchar](36) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[UpdatedDate] [date] NULL,
	[Password] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[License] ADD  CONSTRAINT [DF_License_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Price__173876EA]  DEFAULT (NULL) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Created__182C9B23]  DEFAULT (NULL) FOR [CreatedProductDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Quantit__1920BF5C]  DEFAULT (NULL) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Categor__1A14E395]  DEFAULT (NULL) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Quantit__1B0907CE]  DEFAULT (NULL) FOR [QuantitySold]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Comment__1BFD2C07]  DEFAULT (NULL) FOR [CommentCount]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Discoun__1CF15040]  DEFAULT (NULL) FOR [Discount]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Variabl__1DE57479]  DEFAULT (NULL) FOR [VariableJson]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Url__1ED998B2]  DEFAULT (NULL) FOR [Url]
GO
ALTER TABLE [dbo].[SellerProductInfo] ADD  CONSTRAINT [DF_SellerProductInfo_IsRunned]  DEFAULT ((0)) FOR [IsRunned]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (NULL) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (NULL) FOR [Password]
GO
/****** Object:  StoredProcedure [dbo].[spChangeStatusSellerProduct]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spChangeStatusSellerProduct]
	@ItemId BIGINT,
	@SkuId BIGINT,
	@Status BIT,
	@LicenseId INT
AS 
BEGIN
	UPDATE SellerProductInfo SET IsRunned = @Status
	WHERE ItemId = @ItemId AND SkuId = @Skuid  AND LicenseId = @LicenseId
END;
GO
/****** Object:  StoredProcedure [dbo].[spCheckCategory]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCheckCategory](@siteId INT)
AS 
BEGIN 
	SELECT COUNT(1) AS COUNT FROM Category WHERE SiteId = @siteId;
END;
GO
/****** Object:  StoredProcedure [dbo].[spCheckCategorySub]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCheckCategorySub](@siteId INT)
AS 
BEGIN 
	SELECT COUNT(1) AS COUNT FROM CategorySub WHERE SiteId = @siteId;
END;
GO
/****** Object:  StoredProcedure [dbo].[spCheckExistProducts]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCheckExistProducts]
	@ProductIds StringListType READONLY
AS
BEGIN
	SELECT p.ProductId FROM dbo.Product p 
	JOIN @ProductIds pis ON p.ProductId = pis.Item  
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckLicense]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCheckLicense] 
	@License NVARCHAR(MAX)
AS
BEGIN
	DECLARE @licenseId INT = 0;
	SELECT @licenseId = L.LicenseId FROM License L WHERE L.License = @License AND L.ExpriesDate > GETUTCDATE() AND L.IsDeleted = 0
	RETURN @licenseId
END
/*
	declare @a int
	exec @a = spCheckLicense 'GdBY5hYIcaEDy2QQc+yk6yOMAiXzwHcc21llowf5qbcPFh5MTEmAig==1'
	select @a
*/
GO
/****** Object:  StoredProcedure [dbo].[spCheckQueue]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCheckQueue]
	@LicenseId INT
AS 
BEGIN
	SELECT SkuId	
		, ItemId	
		, Title	
		, DiscountPriceFormatted	
		, ImageUrl	
		, QueueDate	
		, IsRunned	
		, SellerAccountID
		, Type
		, (
			SELECT
			SellerAccountID	
			, Account	
			, Name	
			, Password	
			, Cookie
			FROM SellerAccount 
			WHERE SellerAccountID = SP.SellerAccountID
			FOR JSON PATH
		) AS SellerAccount
	FROM SellerProductInfo SP WITH(NOLOCK)
	WHERE QueueDate < GETUTCDATE() AND IsRunned = 0 AND LicenseId = @LicenseId
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetCategoriesByID]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetCategoriesByID]
	@CategoriID		NVARCHAR(MAX)
	, @ReturnValue	INT  = 0 OUTPUT
AS
BEGIN
	DECLARE @siteName		NVARCHAR(MAX)
	DECLARE @siteid			BIGINT
	DECLARE @currentLevel	INT
	DECLARE @maxLevel		INT
	
	SELECT @siteName		= LEFT(@CategoriID, 4)
	SELECT @siteid			= S.SiteId 
								FROM	Site S					WITH(NOLOCK) 
								WHERE	S.SiteName LIKE '%'+@siteName+'%'
	SELECT @currentLevel	= C.Level		
								FROM	Category C				WITH(NOLOCK)
								WHERE	C.CategoryId = @CategoriID
	SELECT @maxLevel		= MAX(C.Level) 
								FROM	Category C				WITH(NOLOCK) 
								WHERE	C.SiteId = @siteid

	IF (@currentLevel < @maxLevel)
	BEGIN
		SELECT *
		INTO	#categorytemp
		FROM	Category C			WITH(NOLOCK)
		WHERE	C.SiteId = @siteid

		SELECT *
		INTO	#subcategorytemp
		FROM	#categorytemp C			
		WHERE	C.ParentId = @CategoriID
		
		SELECT C.Id
				, C.CategoryId
				, C.CategoryName
				, C.SiteId
				, C.CategoryUrl
				, C.ImageUrl
				, C.ParentId
				, C.Level
				, C.IdWeb
		INTO		#subsubcategorytemp
		FROM		#categorytemp C			
		INNER JOIN	#subcategorytemp S
		ON			C.CategoryId	= S.CategoryId
	
		SELECT C.Id
				, C.CategoryId
				, C.CategoryName
				, C.SiteId
				, C.CategoryUrl
				, C.ImageUrl
				, C.ParentId
				, C.Level
				, C.IdWeb
		INTO		#subsubsubcategorytemp
		FROM		#categorytemp C		
		INNER JOIN	#subsubcategorytemp S
		ON			C.ParentId	= S.CategoryId
		
		SELECT * FROM #subcategorytemp S
		UNION
		SELECT * FROM #subsubcategorytemp S
		UNION
		SELECT * FROM #subsubsubcategorytemp S

		SELECT @ReturnValue = 1
		RETURN @ReturnValue
	END
	ELSE
	BEGIN
		SELECT @ReturnValue = -1
		RETURN @ReturnValue
	END
END
/*
DECLARE @CategoriID NVARCHAR(MAX) = 'tikiC1_1815'
		, @ReturnValue	INT
EXECUTE spGetCategoriesByID
	@CategoriID		= @CategoriID
	, @ReturnValue	= @ReturnValue OUT
SELECT @ReturnValue
*/
GO
/****** Object:  StoredProcedure [dbo].[spGetSellerAccount]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetSellerAccount] 
	@LicenseId INT = 0
AS 
BEGIN
   SELECT SellerAccountID, Account, Name, Password, Cookie, LicenseId
   FROM dbo.SellerAccount
   WHERE LicenseId = @LicenseId
END
/*
	exec spGetSellerAccount 1
*/
GO
/****** Object:  StoredProcedure [dbo].[spGetSubCategoryById]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Phuong
-- Create date: 26/12/2019
-- Description:	GetSubCategory
-- =============================================
CREATE PROC [dbo].[spGetSubCategoryById]
	@CategoriID NVARCHAR(100) = NULL
AS
BEGIN
	DECLARE @siteName		NVARCHAR(MAX)
	DECLARE @siteid			BIGINT
	DECLARE @currentLevel	INT
	DECLARE @maxLevel		INT
	
	SELECT @siteName		= LEFT(@CategoriID, 4)
	SELECT @siteid			= S.SiteId 
								FROM	Site S					WITH(NOLOCK) 
								WHERE	S.SiteName LIKE '%'+@siteName+'%'
	SELECT @currentLevel	= C.Level		
								FROM	Category C				WITH(NOLOCK)
								WHERE	C.CategorySiteId = @CategoriID
	SELECT @maxLevel		= MAX(C.Level) 
								FROM	Category C				WITH(NOLOCK) 
								WHERE	C.SiteId = @siteid

	SELECT *
	INTO	#categorytemp
	FROM	Category C			WITH(NOLOCK)
	WHERE	C.SiteId = @siteid
	AND		C.Level = @currentLevel + 1

	SELECT C.Parent
	INTO	#categoryCheckParent
	FROM	Category C			WITH(NOLOCK)
	WHERE	C.Level = @currentLevel + 2
	GROUP BY Parent

	if(@CategoriID IS NOT NULL AND @CategoriID <> '')
		select CategoryId
				, CategorySiteId
				, CategoryName
				, SiteId
				, CategoryUrl
				, CT.Parent
				, ParentId
				, Level
				, IdWeb
				, CASE WHEN CP.Parent IS NOT NULL THEN 1 
				ELSE 0 
				END IsParent
		from #categorytemp CT
		LEFT JOIN #categoryCheckParent CP
		ON CT.CategorySiteId = CP.Parent
		WHERE CT.Parent = @CategoriID;
	else
		select * from Category WHERE Level = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertCategories]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spInsertCategories](@category CategoryType READONLY)
AS 
BEGIN
	MERGE dbo.Category AS t
	USING @category AS s
	ON s.CategoryUrl = t.CategoryUrl
	WHEN NOT MATCHED BY TARGET
	   THEN INSERT(CategorySiteId ,
          CategoryName ,
          SiteId ,
          CategoryUrl ,
          Parent) VALUES (s.CategorySiteId,s.CategoryName, s.SiteId, s.CategoryUrl, s.Parent);
	
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertCategoriesByJson_Lazada]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[spInsertCategoriesByJson_Lazada]
	@JsonTmp NVARCHAR(MAX)
AS
BEGIN
	DECLARE @category			NVARCHAR(MAX)
	DECLARE @subcategory		NVARCHAR(MAX)
	DECLARE @subsubcategory		NVARCHAR(MAX)
	DECLARE @subsubsubcategory	NVARCHAR(MAX)
	
	SELECT @category				= T.category
			, @subcategory			= T.subcategory
			, @subsubcategory		= T.subsubcategory
			, @subsubsubcategory	= T.subsubsubcategory
	FROM OPENJSON(@JsonTmp)
	WITH(
		category				NVARCHAR(MAX) AS JSON
		, subcategory			NVARCHAR(MAX) AS JSON
		, subsubcategory		NVARCHAR(MAX) AS JSON
		, subsubsubcategory		NVARCHAR(MAX) AS JSON
	) T

	IF(OBJECT_ID('tempdb..#categorytemp')) IS NOT NULL
		DROP TABLE #categorytemp
	CREATE TABLE #categorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #categorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@category)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subcategorytemp')) IS NOT NULL
		DROP TABLE #subcategorytemp
	CREATE TABLE #subcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subsubcategorytemp')) IS NOT NULL
		DROP TABLE #subsubcategorytemp
	CREATE TABLE #subsubcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subsubcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subsubcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subsubsubcategorytemp')) IS NOT NULL
		DROP TABLE #subsubsubcategorytemp
	CREATE TABLE #subsubsubcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subsubsubcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subsubsubcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	SELECT * FROM #categorytemp C
	SELECT * FROM #subcategorytemp S
	SELECT * FROM #subsubcategorytemp S
	SELECT * FROM #subsubsubcategorytemp S

	--DECLARE @siteid BIGINT
	--SELECT @siteid = S.SiteId FROM Site S WHERE S.SiteName = 'Lazada'

	--INSERT INTO Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT 'lazadaC1_'+ CAST(C.ID AS NVARCHAR(MAX))
	--		, C.NAME
	--		, @siteid
	--		, C.URL
	--		, 0
	--		, 1
	--		, C.ID
	--FROM #categorytemp C

	--INSERT INTO Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT 'lazadaC2_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 2
	--		, S.ID
	--FROM #subcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 1
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid
		
	--INSERT Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT  'lazadaC3_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 3
	--		, S.ID
	--FROM #subsubcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 2
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid

	--INSERT Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT  'lazadaC4_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 4
	--		, S.ID
	--FROM #subsubsubcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 3
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid
END
/*
DECLARE @JsonTmp NVARCHAR(MAX) = '{}'
EXECUTE spInsertCategoriesByJson_Lazada
@JsonTmp = @JsonTmp
*/
GO
/****** Object:  StoredProcedure [dbo].[spInsertCategoriesByJson_Sendo]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[spInsertCategoriesByJson_Sendo]
	@JsonTmp NVARCHAR(MAX)
AS
BEGIN
	DECLARE @category			NVARCHAR(MAX)
	DECLARE @subcategory		NVARCHAR(MAX)
	DECLARE @subsubcategory		NVARCHAR(MAX)
	DECLARE @subsubsubcategory	NVARCHAR(MAX)
	
	SELECT @category				= T.category
			, @subcategory			= T.subcategory
			, @subsubcategory		= T.subsubcategory
			, @subsubsubcategory	= T.subsubsubcategory
	FROM OPENJSON(@JsonTmp)
	WITH(
		category				NVARCHAR(MAX) AS JSON
		, subcategory			NVARCHAR(MAX) AS JSON
		, subsubcategory		NVARCHAR(MAX) AS JSON
		, subsubsubcategory		NVARCHAR(MAX) AS JSON
	) T

	IF(OBJECT_ID('tempdb..#categorytemp')) IS NOT NULL
		DROP TABLE #categorytemp
	CREATE TABLE #categorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #categorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@category)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subcategorytemp')) IS NOT NULL
		DROP TABLE #subcategorytemp
	CREATE TABLE #subcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subsubcategorytemp')) IS NOT NULL
		DROP TABLE #subsubcategorytemp
	CREATE TABLE #subsubcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subsubcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subsubcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subsubsubcategorytemp')) IS NOT NULL
		DROP TABLE #subsubsubcategorytemp
	CREATE TABLE #subsubsubcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subsubsubcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subsubsubcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	SELECT * FROM #categorytemp C
	SELECT * FROM #subcategorytemp S
	SELECT * FROM #subsubcategorytemp S
	SELECT * FROM #subsubsubcategorytemp S

	--DECLARE @siteid BIGINT
	--SELECT @siteid = S.SiteId FROM Site S WHERE S.SiteName = 'Sendo'

	--INSERT INTO Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT 'sendoC1_'+ CAST(C.ID AS NVARCHAR(MAX))
	--		, C.NAME
	--		, @siteid
	--		, C.URL
	--		, 0
	--		, 1
	--		, C.ID
	--FROM #categorytemp C

	--INSERT INTO Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT 'sendoC2_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 2
	--		, S.ID
	--FROM #subcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 1
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid
		
	--INSERT Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT  'sendoC3_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 3
	--		, S.ID
	--FROM #subsubcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 2
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid


	--INSERT Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT  'sendoC4_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 4
	--		, S.ID
	--FROM #subsubsubcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 3
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid

END
/*
DECLARE @JsonTmp NVARCHAR(MAX) = '{}'
EXECUTE spInsertCategoriesByJson_Sendo
@JsonTmp = @JsonTmp
*/
GO
/****** Object:  StoredProcedure [dbo].[spInsertCategoriesByJson_Shopee]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[spInsertCategoriesByJson_Shopee]
	@JsonTmp NVARCHAR(MAX)
AS
BEGIN
	DECLARE @category			NVARCHAR(MAX)
	DECLARE @subcategory		NVARCHAR(MAX)
	DECLARE @subsubcategory		NVARCHAR(MAX)
	DECLARE @subsubsubcategory	NVARCHAR(MAX)
	
	SELECT @category				= T.category
			, @subcategory			= T.subcategory
			, @subsubcategory		= T.subsubcategory
			, @subsubsubcategory	= T.subsubsubcategory
	FROM OPENJSON(@JsonTmp)
	WITH(
		category				NVARCHAR(MAX) AS JSON
		, subcategory			NVARCHAR(MAX) AS JSON
		, subsubcategory		NVARCHAR(MAX) AS JSON
		, subsubsubcategory		NVARCHAR(MAX) AS JSON
	) T

	IF(OBJECT_ID('tempdb..#categorytemp')) IS NOT NULL
		DROP TABLE #categorytemp
	CREATE TABLE #categorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #categorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@category)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subcategorytemp')) IS NOT NULL
		DROP TABLE #subcategorytemp
	CREATE TABLE #subcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subsubcategorytemp')) IS NOT NULL
		DROP TABLE #subsubcategorytemp
	CREATE TABLE #subsubcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subsubcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subsubcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subsubsubcategorytemp')) IS NOT NULL
		DROP TABLE #subsubsubcategorytemp
	CREATE TABLE #subsubsubcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subsubsubcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subsubsubcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	SELECT * FROM #categorytemp C
	SELECT * FROM #subcategorytemp S
	SELECT * FROM #subsubcategorytemp S
	SELECT * FROM #subsubsubcategorytemp S

	--DECLARE @siteid BIGINT
	--SELECT @siteid = S.SiteId FROM Site S WHERE S.SiteName = 'Shopee'

	--INSERT INTO Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT 'shopeeC1_'+ CAST(C.ID AS NVARCHAR(MAX))
	--		, C.NAME
	--		, @siteid
	--		, C.URL
	--		, 0
	--		, 1
	--		, C.ID
	--FROM #categorytemp C

	--INSERT INTO Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT 'shopeeC2_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 2
	--		, S.ID
	--FROM #subcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 1
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid
		
	--INSERT Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT  'shopeeC3_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 3
	--		, S.ID
	--FROM #subsubcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 2
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid

	--INSERT Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT  'shopeeC4_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 4
	--		, S.ID
	--FROM #subsubsubcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 3
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid

END
/*
DECLARE @JsonTmp NVARCHAR(MAX) = '{}'
EXECUTE spInsertCategoriesByJson_Shopee
@JsonTmp = @JsonTmp
*/
GO
/****** Object:  StoredProcedure [dbo].[spInsertCategoriesByJson_Tiki]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[spInsertCategoriesByJson_Tiki]
	@JsonTmp NVARCHAR(MAX)
AS
BEGIN
	DECLARE @category			NVARCHAR(MAX)
	DECLARE @subcategory		NVARCHAR(MAX)
	DECLARE @subsubcategory		NVARCHAR(MAX)
	DECLARE @subsubsubcategory	NVARCHAR(MAX)
	
	SELECT @category				= T.category
			, @subcategory			= T.subcategory
			, @subsubcategory		= T.subsubcategory
			, @subsubsubcategory	= T.subsubsubcategory
	FROM OPENJSON(@JsonTmp)
	WITH(
		category				NVARCHAR(MAX) AS JSON
		, subcategory			NVARCHAR(MAX) AS JSON
		, subsubcategory		NVARCHAR(MAX) AS JSON
		, subsubsubcategory		NVARCHAR(MAX) AS JSON
	) T

	IF(OBJECT_ID('tempdb..#categorytemp')) IS NOT NULL
		DROP TABLE #categorytemp
	CREATE TABLE #categorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #categorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@category)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subcategorytemp')) IS NOT NULL
		DROP TABLE #subcategorytemp
	CREATE TABLE #subcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subsubcategorytemp')) IS NOT NULL
		DROP TABLE #subsubcategorytemp
	CREATE TABLE #subsubcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subsubcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subsubcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	IF(OBJECT_ID('tempdb..#subsubsubcategorytemp')) IS NOT NULL
		DROP TABLE #subsubsubcategorytemp
	CREATE TABLE #subsubsubcategorytemp(
		ID			BIGINT
		, [NAME]	NVARCHAR(MAX)
		, PARENT	BIGINT
		, [URL]		NVARCHAR(MAX)
		, [LEVEL]	INT
	)
	INSERT INTO #subsubsubcategorytemp
	(
		ID,
		NAME,
		PARENT,
		URL,
		LEVEL
	)
	SELECT T.id
			, T.name
			, T.parent
			, T.url
			, T.level
	FROM OPENJSON(@subsubsubcategory)
	WITH(
		id			BIGINT
		,name		NVARCHAR(MAX)
		,parent		BIGINT
		,url		NVARCHAR(MAX)
		,level		INT
	) T

	SELECT * FROM #categorytemp C
	SELECT * FROM #subcategorytemp S
	SELECT * FROM #subsubcategorytemp S
	SELECT * FROM #subsubsubcategorytemp S

	--DECLARE @siteid BIGINT
	--SELECT @siteid = S.SiteId FROM Site S WHERE S.SiteName = 'Tiki'

	--INSERT INTO Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT 'tikiC1_'+ CAST(C.ID AS NVARCHAR(MAX))
	--		, C.NAME
	--		, @siteid
	--		, C.URL
	--		, 0
	--		, 1
	--		, C.ID
	--FROM #categorytemp C

	--INSERT INTO Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT 'tikiC2_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 2
	--		, S.ID
	--FROM #subcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 1
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid
		
	--INSERT Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT  'tikiC3_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 3
	--		, S.ID
	--FROM #subsubcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 2
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid

	--INSERT Category
	--(
	--    CategorySiteId,
	--    CategoryName,
	--    SiteId,
	--    CategoryUrl,
	--    Parent,
	--    Level,
	--    IdWeb
	--)
	--SELECT  'tikiC4_'+ CAST(S.ID AS NVARCHAR(MAX))
	--		, S.NAME
	--		, @siteid
	--		, S.URL
	--		, C.CategorySiteId
	--		, 4
	--		, S.ID
	--FROM #subsubsubcategorytemp S
	--INNER JOIN Category C
	--ON C.Level = 3
	--AND C.IdWeb = S.PARENT
	--AND C.SiteId = @siteid
END
/*
DECLARE @JsonTmp NVARCHAR(MAX) = '{}'
EXECUTE spInsertCategoriesByJson_Tiki
@JsonTmp = @JsonTmp
*/
GO
/****** Object:  StoredProcedure [dbo].[spInsertCategorieSub]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spInsertCategorieSub](@category CategorySubType READONLY)
AS 
BEGIN
	MERGE dbo.CategorySub AS t
	USING @category AS s
	ON s.CategoryUrl = t.CategoryUrl
	WHEN NOT MATCHED BY TARGET
	   THEN INSERT(CategorySiteId ,
          CategoryName ,
          SiteId ,
          CategoryUrl ,
          Parent, ParentId, Level) VALUES (s.CategorySiteId,s.CategoryName, s.SiteId, s.CategoryUrl, s.Parent, s.ParentId, s.Level);
	
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertCategoryKeyword]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertCategoryKeyword]
	@categoryKeywords CategoryKeywordType READONLY
AS
BEGIN
	IF OBJECT_ID('tempdb..#categoryTemp') IS NOT NULL
    DROP TABLE #categoryTemp
	
	SELECT 
		c.CategoryId,
		ck.CategoryUrl,
		ck.Keyword
	INTO #categoryTemp
	FROM @categoryKeywords ck
	JOIN dbo.Category c ON c.CategoryUrl = ck.CategoryUrl

	MERGE dbo.CategoryKeyword AS t
	USING #categoryTemp AS s
	ON t.CategoryId = s.CategoryId AND t.Keyword = s.Keyword
	WHEN NOT MATCHED BY TARGET
	THEN INSERT(CategoryId, CategoryUrl, Keyword)
		VALUES  
		( 
			s.CategoryId,
			s.CategoryUrl,
			s.Keyword	
		);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertProducts]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spInsertProducts](@Products ProductType READONLY)
AS
BEGIN
	IF OBJECT_ID('tempdb..#productTemp') IS NOT NULL
    DROP TABLE #productTemp

	SELECT ProductId,
		Name ,
		Price ,
		CreatedProductDate ,
		Quantity ,
		c.CategoryId ,
		QuantitySold ,
		CommentCount ,
		Discount ,
		VariableJson ,
		Url
	INTO #productTemp
	FROM @Products p
	JOIN dbo.Category c ON c.CategoryUrl = p.CategoryUrl;

	MERGE dbo.Product AS t
	USING #productTemp AS s
	ON t.ProductId = s.ProductId
	WHEN NOT MATCHED
	THEN INSERT(  ProductId ,
		          Name ,
		          Price ,
		          CreatedProductDate ,
		          Quantity ,
		          CategoryId ,
		          QuantitySold ,
		          CommentCount ,
		          Discount ,
		          VariableJson ,
		          Url ,
		          CreatedDate
		        )
		VALUES  ( s.ProductId,
		          s.Name ,
		          s.Price, 
		          s.CreatedProductDate , 
		          s.Quantity ,
		          s.CategoryId ,
		          s.QuantitySold , 
		          s.CommentCount , 
		          s.Discount ,
		          s.VariableJson ,
		          s.Url ,
		          GETUTCDATE()
		        )
	WHEN MATCHED AND t.CategoryId = s.CategoryId THEN UPDATE SET t.Name = s.Name, t.Price = s.Price, 
	t.Quantity = s.Quantity, t.QuantitySold = s.QuantitySold,
	t.CommentCount = s.CommentCount, t.Discount = s.Discount,
	t.VariableJson = s.VariableJson, t.Url = s.Url, t.UpdatedDate = GETUTCDATE();


	WITH cte AS (
		SELECT 
			Id,
			ProductId,
			ROW_NUMBER() OVER (
				PARTITION BY 
					ProductId
				ORDER BY 
					ProductId
			) row_num
			FROM 
			Product
	)
	DELETE FROM cte
	WHERE row_num > 1;
END
/*
DECLARE @ProductType ProductType
INSERT INTO @ProductType
        ( ProductId ,
          Name ,
          Price ,
          CreatedProductDate ,
          Quantity ,
          CategoryUrl ,
          QuantitySold ,
          CommentCount ,
          Discount ,
          VariableJson ,
          Url
        )
VALUES 
('sendo13572120',N'Combo 10 quần lót nữ cotton nhiều màu GiAO NGẪU NHIÊN',139000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/dam/',36,8,2,NULL,'https://www.sendo.vn/product-n-13572120.html'),
('sendo24200766',N'áo crop top tay dài cut out vai Mã: AK2123 - ĐEN',175000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/dam/',0,0,'2',NULL,'https://www.sendo.vn/product-n-24200766.html'),
('sendo24201315',N'áo len kiểu crop top tay bồng Mã: AK2437 - TRẮNG',200000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/set-trang-phuc/',0,0,'2',NULL,'https://www.sendo.vn/product-n-24201315.html'),
('sendo22477560',N'[XEM HÀNG KHI NHẬN] ÁO KHOÁC LEN CÚC NGỌC',99000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/set-trang-phuc/',13,4,'29',NULL,'https://www.sendo.vn/product-n-22477560.html'),
('sendo23006857',N'bộ thể thao nữ có mũ màu hồng fs',280000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/set-trang-phuc/',262,64,'0',NULL,'https://www.sendo.vn/product-n-23006857.html'),
('sendo23006064',N'váy hoodie in chú chó hot dog fs',135000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/dam/',23,7,'0',NULL,'https://www.sendo.vn/product-n-23006064.html'),
('sendo13991573',N'Set Đồ lót nữ kèm áo choàng _SB07',225000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/dam/',1,0,'5',NULL,'https://www.sendo.vn/product-n-13991573.html'),
('sendo11605704',N'Set Đồ lót nữ kèm áo choàng_SB04',180000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/dam/',56,10,'5',NULL,'https://www.sendo.vn/product-n-11605704.html'),
('sendo9166474',N'QUẦN SỌC CARÔ',120000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/dam/',9,2,'0',NULL,'https://www.sendo.vn/product-n-9166474.html'),
('sendo12039463',N'ÁO HOODIE CAO CẤP',210000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/dam/',3,0,'0',NULL,'https://www.sendo.vn/product-n-12039463.html'),
('sendo11605702413',N'Set Đồ lót nữ kèm áo choàng_SB04',180000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/ao-nu/',56,10,'5',NULL,'https://www.sendo.vn/product-n-11605704.html'),
('sendo916647411',N'QUẦN SỌC CARÔ',120000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/ao-nu/',9,2,'0',NULL,'https://www.sendo.vn/product-n-9166474.html'),
('sendo1203946311',N'ÁO HOODIE CAO CẤP',210000,'2019-12-01 09:14:12.957',NULL,'https://sendo.vn/thoi-trang-nu/ao-nu/',3,0,'0',NULL,'https://www.sendo.vn/product-n-12039463.html');

EXEC dbo.spInsertProducts @Products = @ProductType

*/
GO
/****** Object:  StoredProcedure [dbo].[spInsSellerAccounts]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spInsSellerAccounts]
	@JInput NVARCHAR(MAX),
	@LicenseId INT = 0
AS 
BEGIN

	
	BEGIN TRAN
	BEGIN TRY
	IF(OBJECT_ID('tempdb..#accountTable')) IS NOT NULL
		DROP TABLE #accountTable
	CREATE TABLE #accountTable(
		Account NVARCHAR (100),
		Name NVARCHAR (100),
		Password NVARCHAR (1000),
		Cookie NVARCHAR (MAX)
	)

	INSERT INTO #accountTable
	SELECT I.Account, I.Name, I.Password, I.Cookie FROM OPENJSON(@JInput) A
	CROSS APPLY OPENJSON(A.value)
	WITH (
		Account [NVARCHAR] (100),
		Name [NVARCHAR] (100),
		Password [NVARCHAR] (1000),
		Cookie [NVARCHAR] (MAX)
	) I
    
	MERGE [SellerAccount] AS t
	USING #accountTable AS s
	ON t.Account = s.Account AND t.LicenseId = @LicenseId
	WHEN NOT MATCHED BY TARGET 
	THEN INSERT (
		Account,
		Name,
		Password,
		Cookie,
		LicenseId
	) 
	VALUES (
		s.Account,
		s.Name,
		s.Password,
		s.Cookie,
		@LicenseId
	)
	WHEN MATCHED 
	THEN UPDATE SET t.Password = s.Password, t.Name = s.Name, t.Cookie = s.Cookie;

	COMMIT TRAN
	END TRY
	BEGIN CATCH

	ROLLBACK TRAN
	END CATCH
END;

/*
DECLARE @JInput NVARCHAR(MAX) = '
[ 
   { 
      "SellerAccountID":0,
      "Account":"ntuan8x@gmail.com",
      "Name":"Do Choi PC (Hà Nội)",
      "Password":"j0zhsCVLPnBueTltp32VJA==",
      "Cookie":"JSID=1bbf731507b49a90a54e0e00b41cd950;TID=09ba0d2d73a15e4dbd4d381a3f1d75f9;CSRFT=e37e36e83738e;"
   },
   { 
      "SellerAccountID":0,
      "Account":"sale@remach.vn",
      "Name":"Remach - Rẻ Mà Chất",
      "Password":"REE5IYGAZhXtyWTZF9ofXw==",
      "Cookie":"JSID=1d4d0750d64af7bac5e4333a098a61a4;TID=6bcedd0cf76e24038bcea6349e065023;CSRFT=ee593530e3ee3;"
   }
]
' 
EXEC spInsSellerAccounts @JInput
*/
GO
/****** Object:  StoredProcedure [dbo].[spInsSellerProductInfos]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spInsSellerProductInfos]
	@JInput NVARCHAR(MAX)
AS 
BEGIN

	
	BEGIN TRAN
	BEGIN TRY
	IF(OBJECT_ID('tempdb..#productTable')) IS NOT NULL
		DROP TABLE #productTable
	CREATE TABLE #productTable(
		SkuId	bigint	
		, ItemId	bigint	
		, Title	nvarchar(MAX)	
		, DiscountPriceFormatted	nvarchar(100)	
		, ImageUrl	nvarchar(MAX)	
		, QueueDate	datetime	
		, SellerAccountID BIGINT
		, Type	INT
		, LicenseId INT
	)

	INSERT INTO #productTable
	SELECT T.SkuId, T.ItemId, T.Title, T.DiscountPriceFormatted, T.ImageUrl, T.QueueDate, SA.SellerAccountID , T.Type, T.LicenseId FROM 
	SellerAccount SA
	JOIN 
		(SELECT I.SkuId, I.ItemId, I.Title, I.DiscountPriceFormatted, I.ImageUrl, I.QueueDate , I.SellerAccount, I.Type, I.LicenseId
		FROM OPENJSON(@JInput) A
		CROSS APPLY OPENJSON(A.value)
		WITH (
			SkuId	[bigint]	
			, ItemId	[bigint]	
			, Title	[nvarchar](MAX)	
			, DiscountPriceFormatted	[nvarchar](100)	
			, ImageUrl	[nvarchar](MAX)	
			, QueueDate	[datetime]	
			, SellerAccount [NVARCHAR](100)
			, Type [int]
			, LicenseId [int]
		) I) T
	ON SA.Account = T.SellerAccount AND SA.LicenseId = T.LicenseId
    
	MERGE SellerProductInfo AS t
	USING #productTable AS s
	ON s.SkuId = t.SkuId AND s.ItemId = t.ItemId AND s.SellerAccountID = t.SellerAccountID
	WHEN NOT MATCHED BY TARGET 
	THEN INSERT (
		SkuId	
		, ItemId	
		, Title	
		, DiscountPriceFormatted	
		, ImageUrl	
		, QueueDate	
		, SellerAccountID
		, Type
		, LicenseId
	) 
	VALUES (
		s.SkuId,
		s.ItemId,
		s.Title,
		s.DiscountPriceFormatted,
		s.ImageUrl,
		s.QueueDate,
		s.SellerAccountID,
		s.Type,
		s.LicenseId
	)
	WHEN MATCHED 
	THEN UPDATE SET t.Title	 = s.Title	, t.QueueDate = s.QueueDate, t.ImageUrl = s.ImageUrl, t.DiscountPriceFormatted = s.DiscountPriceFormatted, t.Type = s.Type;

	COMMIT TRAN;
	RETURN 1;
	END TRY
	BEGIN CATCH

	ROLLBACK TRAN
	RETURN 0;
	END CATCH
END;

/*
DECLARE @JInput NVARCHAR(MAX) = N'
[ 
   { 
      "SkuId":707454266,
      "ItemId":407772749,
      "Title":"Loa bluetooth 3in1 loa bluetooth đồng hồ báo thức, nhiệt độ, loa âm thanh siêu hay, bass trầm ấm, pin trâu Có thể làm gương soi trang điểm tương thích với mọi hệ điều hành iOs android loa bluetooth mini gia re Amoi G5",
      "DiscountPriceFormatted":"152.845 ₫",
      "ImageUrl":"//vn-live-01.slatic.net/p/4458c8fd8949dd2f4e7637f90efe6f8b.jpg",
      "QueueDate":null,
      "IsRunned":false,
      "SellerAccountID":null,
      "SellerAccount":"ntuan8x@gmail.com"
   },
   { 
      "SkuId":707134453,
      "ItemId":407688233,
      "Title":"Tay Cầm Quay Phim,Tay Cầm Chống Rung Cho Điện Thoại, Gimbal Cầm Tay Chống Rung, 3-Asix Handheld Gimbal H4 Cho Điện Thoại IOS, Android Hoạt Động Hoàn Hảo Với Điện Thoại Di Động Để Chụp Ảnh Quay Video Cực Ổn Định Và Mượt Mà",
      "DiscountPriceFormatted":"955.000 ₫",
      "ImageUrl":"//vn-live-01.slatic.net/p/1923e19f773b28b056e1b7009bf6eb49.jpg",
      "QueueDate":null,
      "IsRunned":false,
      "SellerAccountID":null,
      "SellerAccount":"ntuan8x@gmail.com"
   }
]
' 
EXEC spInsSellerProductInfos @JInput

truncate table SellerProductInfo
*/
GO
/****** Object:  StoredProcedure [dbo].[spUpdateSellerProductInfo]    Script Date: 3/25/2020 10:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spUpdateSellerProductInfo]
	@JInput NVARCHAR(MAX)
AS
BEGIN
	DECLARE 
		@SkuId	bigint
		, @ItemId	bigint
		, @Title	nvarchar(MAX)	
		, @DiscountPriceFormatted	nvarchar(100)	
		, @ImageUrl	nvarchar(MAX)	
		, @QueueDate	datetime	
		, @SellerAccount NVARCHAR(100)

	BEGIN TRY
	
	SELECT @SkuId=T.SkuId,
		@ItemId=T.ItemId, 
		@Title = T.Title, 
		@DiscountPriceFormatted = T.DiscountPriceFormatted, 
		@ImageUrl = T.ImageUrl, 
		@QueueDate = T.QueueDate 
	FROM OPENJSON(@JInput)
	WITH (
		SkuId	[bigint]	
		, ItemId	[bigint]	
		, Title	[nvarchar](MAX)	
		, DiscountPriceFormatted	[nvarchar](100)	
		, ImageUrl	[nvarchar](MAX)	
		, QueueDate	[datetime]	
		, SellerAccount [NVARCHAR](100)
	) T

	UPDATE SellerProductInfo 
	SET Title = @Title, DiscountPriceFormatted = @DiscountPriceFormatted, ImageUrl = @ImageUrl, QueueDate = @QueueDate
	WHERE ItemId = @ItemId AND SkuId = @SkuId
	RETURN 1
	END TRY
	BEGIN CATCH
		RETURN 0
	END CATCH
END;

/*
DECLARE @JInput NVARCHAR(MAX) = N'
   { 
      "SkuId":707134453,
      "ItemId":407688233,
      "Title":"Tay Cầm Quay Phim,Tay Cầm Chống Rung Cho Điện Thoại, Gimbal Cầm Tay Chống Rung, 3-Asix Handheld Gimbal H4 Cho Điện Thoại IOS, Android Hoạt Động Hoàn Hảo Với Điện Thoại Di Động Để Chụp Ảnh Quay Video Cực Ổn Định Và Mượt Mà",
      "DiscountPriceFormatted":"955.000 ₫",
      "ImageUrl":"//vn-live-01.slatic.net/p/1923e19f773b28b056e1b7009bf6eb49.jpg",
      "QueueDate":null,
      "IsRunned":false,
      "SellerAccountID":null,
      "SellerAccount":"ntuan8x@gmail.com"
   }
' 
EXEC spUpdateSellerProductInfo @JInput

select * from SellerProductInfo
*/
GO
