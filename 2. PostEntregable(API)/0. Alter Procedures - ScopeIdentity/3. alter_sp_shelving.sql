USE AtlasBooks
GO

--- START INSERT
ALTER PROCEDURE abInsShelving
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

	SELECT SCOPE_IDENTITY() as [identity]
END
GO
--- END INSERT




--- START UPDATE
ALTER PROC abUpdShelving
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

	SELECT @shelvingId as [identity]
END;
GO
--- END UPDATE



--- START DELETE
ALTER PROC abDelShelving
	@editorUserId int,
	@shelvingId   int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Shelving WHERE shelvingId = @shelvingId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Shelving SET isActive = 0 WHERE shelvingId = @shelvingId

	SELECT @shelvingId as [identity]
END;
GO
--- END DELETE