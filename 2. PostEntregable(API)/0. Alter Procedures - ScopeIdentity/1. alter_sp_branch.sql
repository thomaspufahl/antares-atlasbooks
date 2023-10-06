USE AtlasBooks
GO

--- START INSERT
ALTER PROC abInsBranch
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

	SELECT SCOPE_IDENTITY() as [identity]
END;
GO
--- END INSERT


--- START UPDATE
ALTER PROC abUpdBranch
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

	SELECT @branchId as [identity]
END;
GO
--- END UPDATE



--- START DELETE
ALTER PROC abDelBranch
	@editorUserId int,
	@branchId     int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Branch WHERE branchId = @branchId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Branch SET isActive = 0 WHERE branchId = @branchId;

	SELECT @branchId as [identity]
END;
GO
--- END DELETE