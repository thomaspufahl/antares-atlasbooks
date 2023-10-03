USE AtlasBooks
GO

--- START INSERT
IF OBJECT_ID('abInsBranch') IS NOT NULL
	DROP PROC abInsBranch
GO

CREATE PROC abInsBranch
	@editorUserId int,
	@branchCode   varchar(10),
	@description  varchar(255)
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	INSERT INTO Branch 
	(branchCode, description)
	VALUES
	(@branchCode, @description)

END;
GO
--- END INSERT




--- START UPDATE
IF OBJECT_ID('abUpdBranch') IS NOT NULL
	DROP PROC abUpdBranch
GO

CREATE PROC abUpdBranch
	@editorUserId int,
	@branchId     int,
	@branchCode   varchar(10),
	@description  varchar(255)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Branch WHERE branchId = @branchId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Branch 
	SET 
	branchCode = @branchCode,
	description = @description
	WHERE branchId = @branchId

END;
GO
--- END UPDATE



--- START DELETE
IF OBJECT_ID('abDelBranch') IS NOT NULL
	DROP PROC abDelBranch
GO

CREATE PROC abDelBranch
	@editorUserId int,
	@branchId     int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Branch WHERE branchId = @branchId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Branch SET isActive = 0 WHERE branchId = @branchId;

END;
GO
--- END DELETE


--- START GET
IF OBJECT_ID('abGetBranch') IS NOT NULL
	DROP PROC abGetBranch
GO

CREATE PROC abGetBranch
	@editorUserId int,
	@getAll       bit = 0
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 1 AND @getAll = 1)
		BEGIN
			SELECT * FROM Branch
			RETURN;			
		END

	SELECT * FROM Branch WHERE isActive <> 0
END
GO
--- END GET