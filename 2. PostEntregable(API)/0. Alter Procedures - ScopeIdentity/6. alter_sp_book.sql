USE AtlasBooks
GO

--- START INSERT
ALTER PROCEDURE abInsBook
	@editorUserId int,
	@title		  varchar(100),
	@synopsis     varchar(255),
	@rating       decimal(3, 1),
	@sectionId    int
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;
	IF EXISTS(SELECT 1 FROM Section WHERE sectionId = @sectionId AND isActive = 0) RETURN;

	INSERT INTO Book 
	(title, synopsis, rating, sectionId)
	VALUES
	(@title, @synopsis, @rating, @sectionId)

	SELECT SCOPE_IDENTITY() as [identity]
END;
GO
--- END INSERT




--- START UPDATE
ALTER PROC abUpdBook
	@editorUserId int,
	@bookId       int,
	@title        varchar(100),
	@synopsis     varchar(255),
	@rating       decimal(3, 1),
	@isAvailable  bit
AS
BEGIN
	IF EXISTS(SELECT 1 FROM [Book] WHERE bookId = @bookId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Book 
	SET
	title = @title,
	synopsis = @synopsis,
	rating = @rating,
	isAvailable = @isAvailable
	WHERE bookId = @bookId

	SELECT @bookId as [identity]
END;
GO
--- END UPDATE



--- START DELETE
ALTER PROC abDelBook
	@editorUserId int,
	@bookId       int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM [Book] WHERE bookId = @bookId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Book SET isActive = 0 WHERE bookId = @bookId

	SELECT @bookId as [identity]
END;
GO
--- END DELETE