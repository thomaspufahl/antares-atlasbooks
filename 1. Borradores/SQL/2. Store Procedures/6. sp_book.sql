USE AtlasBooks
GO

--- START INSERT
IF OBJECT_ID('abInsBook') IS NOT NULL
	DROP PROC abInsBook
GO

CREATE PROCEDURE abInsBook
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

END;
GO
--- END INSERT




--- START UPDATE
IF OBJECT_ID('abUpdBook') IS NOT NULL
	DROP PROC abUpdBook
GO

CREATE PROC abUpdBook
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

END;
GO
--- END UPDATE



--- START DELETE
IF OBJECT_ID('abDelBook') IS NOT NULL
	DROP PROC abDelBook
GO

CREATE PROC abDelBook
	@editorUserId int,
	@bookId       int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM [Book] WHERE bookId = @bookId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Book SET isActive = 0 WHERE bookId = @bookId

END;
GO
--- END DELETE

--- START GET
IF OBJECT_ID('abGetBook') IS NOT NULL
	DROP PROC abGetBook
GO

CREATE PROC abGetBook
	@editorUserId int,
	@getAll       bit = 0
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 1 AND @getAll = 1)
		BEGIN
			SELECT * FROM Book
			RETURN;			
		END

	SELECT * FROM Book WHERE isActive <> 0
END
GO
--- END GET