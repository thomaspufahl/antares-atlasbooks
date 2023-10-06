USE AtlasBooks
GO

--- START INSERT
ALTER PROCEDURE abInsUser
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

	SELECT SCOPE_IDENTITY() as [identity]
END;
GO
--- END INSERT

--- START UPDATE
ALTER PROC abUpdUser
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

	SELECT @userId as [identity]
END;
GO
--- END UPDATE



--- START DELETE
ALTER PROC abDelUser
	@editorUserId int,
	@userId		  int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM [User] WHERE userId = @userId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE [User] SET isActive = 0 WHERE userId = @userId

	SELECT @userId as [identity]
END;
GO
--- END DELETE