USE AtlasBooks
GO

--- START INSERT
ALTER PROCEDURE abInsLoan
	@editorUserId int,
	@returnDate   datetime,
	@userId       int,
	@bookId       int
AS
BEGIN
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;
	IF EXISTS(SELECT 1 FROM [User] WHERE userId = @userId AND isActive = 0) RETURN;
	IF EXISTS(SELECT 1 FROM [Book] WHERE bookId = @bookId AND isActive = 0) RETURN;

	SET DATEFORMAT ymd;

	INSERT INTO [Loan] 
	(returnDate, userId, bookId)
	VALUES
	(@returnDate, @userId, @bookId)

	SELECT SCOPE_IDENTITY() as [identity]
END;
GO
--- END INSERT




--- START UPDATE
ALTER PROC abUpdLoan
	@editorUserId int,
	@loanId       int,
	@returnDate   datetime
AS
BEGIN
	IF EXISTS(SELECT 1 FROM [Loan] WHERE loanId = @loanId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;

	UPDATE [Loan] 
	SET
	returnDate = @returnDate
	WHERE loanId = @loanId

	SELECT @loanId as [identity]
END;
GO
--- END UPDATE



--- START DELETE
ALTER PROC abDelLoan
	@editorUserId int,
	@loanId       int
AS
BEGIN
	IF EXISTS(SELECT 1 FROM [Loan] WHERE loanId = @loanId AND isActive = 0) RETURN;
	IF (dbo.isAdmin(@editorUserId) = 0) RETURN;
	

	UPDATE [Loan] SET isActive = 0 WHERE loanId = @loanId

	SELECT @loanId as [identity]
END;
GO
--- END DELETE