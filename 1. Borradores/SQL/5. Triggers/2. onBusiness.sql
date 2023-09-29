USE AtlasBooks
GO

--- On book update
IF OBJECT_ID('abOnUpdBook') IS NOT NULL
	DROP TRIGGER abOnUpdBook
GO

CREATE TRIGGER abOnUpdBook
ON Book
FOR UPDATE
AS
	IF UPDATE(isAvailable)
		BEGIN
			DECLARE @isAvailable BIT = (SELECT isAvailable FROM inserted)

			IF (@isAvailable = 1)
				BEGIN					
					DECLARE @bookId INT = (SELECT bookId FROM inserted)
					DECLARE @updLoanId INT = (SELECT loanId FROM abVwLoanStatus WHERE bookId = @bookId AND ([STATUS] LIKE 'in progress' OR [STATUS] LIKE 'return day'))
					DECLARE @updUserId INT = (SELECT userId FROM abVwLoanStatus WHERE bookId = @bookId AND ([STATUS] LIKE 'in progress' OR [STATUS] LIKE 'return day'))

					UPDATE Loan SET returnDate = CAST(getdate() as datetime) WHERE loanId = @updLoanId
					UPDATE [User] SET isLoanFree = 1 WHERE userId = @updUserId
				END
		END
GO
--- On book update

--- On loan insert
IF OBJECT_ID('abOnInsLoan') IS NOT NULL
	DROP TRIGGER abOnInsLoan
GO

CREATE TRIGGER abOnInsLoan
ON Loan
FOR INSERT
AS
	DECLARE @insUserId INT = (SELECT userId FROM inserted);
	DECLARE @insBookId INT = (SELECT bookId FROM inserted);

	IF (NOT dbo.isBookAvailable(@insBookId) = 1)
		BEGIN
			raiserror('book not available', 16, 1)
			rollback transaction
			RETURN
		END

	IF (NOT dbo.isLoanFree(@insUserId) = 1)
		BEGIN
			raiserror('user has an active loan', 16, 1)
			rollback transaction
			RETURN
		END

	UPDATE Book SET isAvailable = 0 WHERE bookId = @insBookId
	UPDATE [User] SET isLoanFree = 0 WHERE userId = @insUserId
GO
--- On loan insert
