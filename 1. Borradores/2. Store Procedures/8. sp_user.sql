USE AtlasBooks
GO

--- START INSERT
IF OBJECT_ID('abInsUser') IS NOT NULL
	DROP PROC abInsUser
GO


CREATE PROCEDURE abInsUser
	@editorUserId	  int,
	@personalIdNumber varchar(20),
	@firstName        varchar(50),
	@lastName         varchar(50),
	@bornDate		  date,
	@phoneNumber      varchar(15),
	@email            varchar(100),
	@roleId			  int
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;
	IF EXISTS(SELECT 1 FROM [Role] WHERE roleId = @roleId AND isActive = 0) RETURN;

	SET DATEFORMAT ymd;

	INSERT INTO [User] 
	(personalIdNumber, firstName, lastName, bornDate, phoneNumber, email, roleId)
	VALUES
	(@personalIdNumber, @firstName, @lastName, @bornDate, @phoneNumber, @email, @roleId)

END;
GO
--- END INSERT

--- START UPDATE
IF OBJECT_ID('abUpdUser') IS NOT NULL
	DROP PROC abUpdUser
GO

CREATE PROC abUpdUser
	@editorUserId	  int,
	@userId		      int,
	@personalIdNumber varchar(20),
	@firstName        varchar(50),
	@lastName         varchar(50),
	@bornDate		  date,
	@phoneNumber      varchar(15),
	@email            varchar(100),
	@roleId			  int,
	@isLoanFree	      bit
AS
BEGIN
	IF EXISTS(SELECT 1 FROM [User] WHERE userId = @userId AND isActive = 0) RETURN;

	
	IF (dbo.isAdmin(@editorUserId) = 0)
		BEGIN
			IF (@editorUserId <> @userId) RETURN;
			SET @roleId = (SELECT roleId FROM [User] WHERE userId = @userId)		
			SET @isLoanFree = (SELECT isLoanFree FROM [User] WHERE userId = @userId)
		END
	ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM [Role] WHERE roleId = @roleId AND isActive = 0) RETURN
		END
		
	UPDATE [User] 
	SET
	personalIdNumber = @personalIdNumber,
	firstName = @firstName,
	lastName = @lastName,
	bornDate = @bornDate,
	phoneNumber = @phoneNumber,
	email = @email,
	roleId = @roleId,
	isLoanFree = @isLoanFree
	WHERE userId = @userId

END;
GO
--- END UPDATE



--- START DELETE
IF OBJECT_ID('abDelUser') IS NOT NULL
	DROP PROC abDelUser
GO

CREATE PROC abDelUser
	@editorUserId int,
	@userId		  int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM [User] WHERE userId = @userId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE [User] SET isActive = 0 WHERE userId = @userId

END;
GO
--- END DELETE

--- START GET
IF OBJECT_ID('abGetUser') IS NOT NULL
	DROP PROC abGetUser
GO

CREATE PROC abGetUser
	@editorUserId int,
	@getAll       bit = 0
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 1 AND @getAll = 1)
		BEGIN
			SELECT * FROM [User]
			RETURN;			
		END

	SELECT * FROM [User] WHERE isActive <> 0
END
GO
--- END GET