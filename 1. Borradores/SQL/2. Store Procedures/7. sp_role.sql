USE AtlasBooks
GO

--- START INSERT
IF OBJECT_ID('abInsRole') IS NOT NULL
	DROP PROC abInsRole
GO

CREATE PROCEDURE abInsRole
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

END;
GO
--- END INSERT


--- START UPDATE
IF OBJECT_ID('abUpdRole') IS NOT NULL
	DROP PROC abUpdRole
GO

CREATE PROC abUpdRole
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
END;
GO
--- END UPDATE

--- START DELETE
IF OBJECT_ID('abDelRole') IS NOT NULL
	DROP PROC abDelRole
GO

CREATE PROC abDelRole
	@editorUserId int,
	@roleId int
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;
	IF EXISTS(SELECT 1 FROM [Role] WHERE roleId = @roleId AND isActive = 0) RETURN;

	UPDATE [Role] SET isActive = 0 WHERE roleId = @roleId

END;
GO
--- END DELETE

--- START GET
IF OBJECT_ID('abGetRole') IS NOT NULL
	DROP PROC abGetRole
GO

CREATE PROC abGetRole
	@editorUserId int,
	@getAll       bit = 0
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 1 AND @getAll = 1)
		BEGIN
			SELECT * FROM [Role]
			RETURN;			
		END

	SELECT * FROM [Role] WHERE isActive <> 0
END
GO
--- END GET