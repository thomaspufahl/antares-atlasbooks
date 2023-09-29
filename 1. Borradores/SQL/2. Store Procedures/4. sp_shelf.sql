USE AtlasBooks
GO

--- START INSERT
IF OBJECT_ID('abInsShelf') IS NOT NULL
	DROP PROC abInsShelf
GO

CREATE PROCEDURE abInsShelf
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
END;
GO
--- END INSERT




--- START UPDATE
IF OBJECT_ID('abUpdShelf') IS NOT NULL
	DROP PROC abUpdShelf
GO

CREATE PROC abUpdShelf
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

END;
GO
--- END UPDATE



--- START DELETE
IF OBJECT_ID('abDelShelf') IS NOT NULL
	DROP PROC abDelShelf
GO

CREATE PROC abDelShelf
	@editorUserId int,
	@shelfId      int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Shelf WHERE shelfId = @shelfId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Shelf SET isActive = 0 WHERE shelfId = @shelfId

END;
GO
--- END DELETE

--- START GET
IF OBJECT_ID('abGetShelf') IS NOT NULL
	DROP PROC abGetShelf
GO

CREATE PROC abGetShelf
	@editorUserId int,
	@getAll       bit = 0
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 1 AND @getAll = 1)
		BEGIN
			SELECT * FROM Shelf
			RETURN;			
		END

	SELECT * FROM Shelf WHERE isActive <> 0
END
GO
--- END GET