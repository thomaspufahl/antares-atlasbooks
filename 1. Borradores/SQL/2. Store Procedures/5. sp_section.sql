USE AtlasBooks
GO

--- START INSERT
IF OBJECT_ID('abInsSection') IS NOT NULL
	DROP PROC abInsSection
GO

CREATE PROCEDURE abInsSection
	@editorUserId int,
	@sectionCode  varchar(10),
	@description  varchar(255),
	@shelfId	  int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Shelf WHERE shelfId = @shelfId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN

	INSERT INTO Section 
	(sectionCode, [description], shelfId)
	VALUES
	(@sectionCode, @description, @shelfId)
END;
GO
--- END INSERT




--- START UPDATE
IF OBJECT_ID('abUpdSection') IS NOT NULL
	DROP PROC abUpdSection
GO

CREATE PROC abUpdSection
	@editorUserId int,
	@sectionId    int,
	@sectionCode  varchar(10),
	@description  varchar(255)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Section WHERE sectionId = @sectionId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Section
	SET 
	sectionCode = @sectionCode,
	[description] = @description
	WHERE sectionId = @sectionId

END;
GO
--- END UPDATE



--- START DELETE
IF OBJECT_ID('abDelSection') IS NOT NULL
	DROP PROC abDelSection
GO

CREATE PROC abDelSection
	@editorUserId int,
	@sectionId    int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Section WHERE sectionId = @sectionId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Section SET isActive = 0 WHERE sectionId = @sectionId

END;
GO
--- END DELETE

--- START GET
IF OBJECT_ID('abGetSection') IS NOT NULL
	DROP PROC abGetSection
GO

CREATE PROC abGetSection
	@editorUserId int,
	@getAll       bit = 0
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 1 AND @getAll = 1)
		BEGIN
			SELECT * FROM Section
			RETURN;			
		END

	SELECT * FROM Section WHERE isActive <> 0
END
GO
--- END GET