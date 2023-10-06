USE AtlasBooks
GO

--- START INSERT
ALTER PROCEDURE abInsRole
	@editorUserId int,
	@name         varchar(50),
	@description  varchar(255)
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	INSERT INTO [Role] 
	([name], [description])
	VALUES
	(@name, @description)

	SELECT SCOPE_IDENTITY() as [identity]
END;
GO
--- END INSERT


--- START UPDATE
ALTER PROC abUpdRole
	@editorUserId int,
	@roleId       int,
	@name         varchar(50),
	@description  varchar(255)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM [Role] WHERE roleId = @roleId AND isActive = 0) RETURN; -- Evalua si el rol a editar se encuentra activo
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN; -- Evalua si el usuario es admin (tal usuario debe estar activo y tener un rol activo)
	
	UPDATE [Role] 
	SET
	[name] = @name,
	[description] = @description
	WHERE roleId = @roleId

	SELECT @roleId as [identity]
END;
GO
--- END UPDATE

--- START DELETE
ALTER PROC abDelRole
	@editorUserId int,
	@roleId int
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;
	IF EXISTS(SELECT 1 FROM [Role] WHERE roleId = @roleId AND isActive = 0) RETURN;

	UPDATE [Role] SET isActive = 0 WHERE roleId = @roleId

	SELECT @roleId as [identity]
END;
GO
--- END DELETE