USE AtlasBooks
GO

--- START INSERT
ALTER PROCEDURE abInsSection
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

	SELECT SCOPE_IDENTITY() as [identity]
END;
GO
--- END INSERT




--- START UPDATE
ALTER PROC abUpdSection
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

	SELECT @sectionId as [identity]
END;
GO
--- END UPDATE



--- START DELETE
ALTER PROC abDelSection
	@editorUserId int,
	@sectionId    int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Section WHERE sectionId = @sectionId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE Section SET isActive = 0 WHERE sectionId = @sectionId

	SELECT @sectionId as [identity]
END;
GO
--- END DELETE