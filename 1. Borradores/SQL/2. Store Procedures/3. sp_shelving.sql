USE AtlasBooks
GO

--- START INSERT
IF OBJECT_ID('abInsShelving') IS NOT NULL
	DROP PROC abInsShelving
GO

CREATE PROCEDURE abInsShelving
	@editorUserId int,
	@shelvingCode varchar(10),
	@description  varchar(255),
	@roomId		  int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Room WHERE roomId = @roomId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	INSERT INTO Shelving 
	(shelvingCode, [description], roomId)
	VALUES
	(@shelvingCode, @description, @roomId)
END
GO
--- END INSERT




--- START UPDATE
IF OBJECT_ID('abUpdShelving') IS NOT NULL
	DROP PROC abUpdShelving
GO

CREATE PROC abUpdShelving
	@editorUserId int,
	@shelvingId	  int,
	@shelvingCode varchar(10),
	@description  varchar(255)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Shelving WHERE shelvingId = @shelvingId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Shelving
	SET 
	shelvingCode = @shelvingCode,
	[description] = @description 
	WHERE shelvingId = @shelvingId

END;
GO
--- END UPDATE



--- START DELETE
IF OBJECT_ID('abDelShelving') IS NOT NULL
	DROP PROC abDelShelving
GO

CREATE PROC abDelShelving
	@editorUserId int,
	@shelvingId   int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Shelving WHERE shelvingId = @shelvingId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Shelving SET isActive = 0 WHERE shelvingId = @shelvingId
END;
GO
--- END DELETE

--- START GET
IF OBJECT_ID('abGetShelving') IS NOT NULL
	DROP PROC abGetShelving
GO

CREATE PROC abGetShelving
	@editorUserId int,
	@getAll       bit = 0
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 1 AND @getAll = 1)
		BEGIN
			SELECT * FROM Shelving
			RETURN;			
		END

	SELECT * FROM Shelving WHERE isActive <> 0
END
GO
--- END GET