USE AtlasBooks
GO

--- START INSERT
ALTER PROCEDURE abInsRoom
	@editorUserId int,
	@roomCode     varchar(10),
	@description  varchar(255),
	@branchId     int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Branch WHERE branchId = @branchId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	INSERT INTO Room 
	(roomCode, [description], branchId)
	VALUES
	(@roomCode, @description, @branchId)

	SELECT SCOPE_IDENTITY() as [identity]
END;
GO
--- END INSERT




--- START UPDATE
ALTER PROC abUpdRoom
	@editorUserId int,
	@roomId		  int,
	@roomCode	  varchar(10),
	@description  varchar(255)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Room WHERE roomId = @roomId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Room 
	SET 
	roomCode = @roomCode,
	[description] = @description
	WHERE roomId = @roomId

	SELECT @roomId as [identity]
END;
GO
--- END UPDATE



--- START DELETE
ALTER PROC abDelRoom
	@editorUserId int,
	@roomId       int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Room WHERE roomId = @roomId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Room SET isActive = 0 WHERE roomId = @roomId

	SELECT @roomId as [identity]
END;
GO
--- END DELETE