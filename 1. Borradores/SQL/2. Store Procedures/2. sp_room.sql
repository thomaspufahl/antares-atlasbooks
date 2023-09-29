USE AtlasBooks
GO

--- START INSERT
IF OBJECT_ID('abInsRoom') IS NOT NULL
	DROP PROC abInsRoom
GO

-- PASAR A CAMEL CASE

CREATE PROCEDURE abInsRoom
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
END;
GO
--- END INSERT




--- START UPDATE
IF OBJECT_ID('abUpdRoom') IS NOT NULL
	DROP PROC abUpdRoom
GO

CREATE PROC abUpdRoom
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

END;
GO
--- END UPDATE



--- START DELETE
IF OBJECT_ID('abDelRoom') IS NOT NULL
	DROP PROC abDelRoom
GO

CREATE PROC abDelRoom
	@editorUserId int,
	@roomId       int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Room WHERE roomId = @roomId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Room SET isActive = 0 WHERE roomId = @roomId

END;
GO
--- END DELETE

--- START GET
IF OBJECT_ID('abGetRoom') IS NOT NULL
	DROP PROC abGetRoom
GO

CREATE PROC abGetRoom
	@editorUserId int,
	@getAll       bit = 0
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 1 AND @getAll = 1)
		BEGIN
			SELECT * FROM Room
			RETURN;			
		END

	SELECT * FROM Room WHERE isActive <> 0
END
GO
--- END GET