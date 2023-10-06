USE AtlasBooks
GO

--- START INSERT
ALTER PROCEDURE abInsShelf
	@editorUserId int,
	@shelfCode    varchar(10),
	@description  varchar(255),
	@shelvingId	  int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Shelving WHERE shelvingId = @shelvingId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	INSERT INTO Shelf
	(shelfCode, [description], shelvingId)
	VALUES
	(@shelfCode, @description, @shelvingId)

	SELECT SCOPE_IDENTITY() as [identity]
END;
GO
--- END INSERT




--- START UPDATE
ALTER PROC abUpdShelf
	@editorUserId int,
	@shelfId	  int,
	@shelfCode    varchar(10),
	@description  varchar(255)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Shelf WHERE shelfId = @shelfId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Shelf
	SET 
	shelfCode = @shelfCode,
	[description] = @description
	WHERE shelfId = @shelfId

	SELECT @shelfId as [identity]
END;
GO
--- END UPDATE



--- START DELETE
ALTER PROC abDelShelf
	@editorUserId int,
	@shelfId      int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Shelf WHERE shelfId = @shelfId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Shelf SET isActive = 0 WHERE shelfId = @shelfId

	SELECT @shelfId as [identity]
END;
GO
--- END DELETE