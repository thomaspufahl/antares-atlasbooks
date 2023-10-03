USE AtlasBooks
GO

--- START return the difference between today and returnDate
IF OBJECT_ID('getLoanDateDiff') IS NOT NULL
	DROP FUNCTION getLoanDateDiff
GO

CREATE FUNCTION getLoanDateDiff (@loanId INT)
RETURNS INT
AS
BEGIN
	DECLARE @returnDate DATETIME = (SELECT returnDate FROM Loan WHERE loanId = @loanId)

	RETURN datediff(day, getdate(), @returnDate);
END
GO
--- END return the difference between today and returnDate