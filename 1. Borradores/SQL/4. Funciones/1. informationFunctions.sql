USE AtlasBooks
GO

--- START get book availability
IF OBJECT_ID('isBookAvailable') IS NOT NULL
	DROP FUNCTION isBookAvailable
GO

CREATE FUNCTION isBookAvailable (@bookId INT)
RETURNS BIT
AS
BEGIN
	RETURN (SELECT isAvailable FROM abVwBook WHERE bookId = @bookId);
END
GO
--- END get book availability


--- START return true when user have a loan
IF OBJECT_ID('isLoanFree') IS NOT NULL
	DROP FUNCTION isLoanFree
GO

CREATE FUNCTION isLoanFree (@userId INT)
RETURNS BIT
AS
BEGIN
	RETURN (SELECT isLoanFree FROM abVwUser WHERE userId = @userId)
END
GO
--- END return true when user have a loan


--- START return the book location from bookId
IF OBJECT_ID('getBookLocation') IS NOT NULL
	DROP FUNCTION getBookLocation
GO

CREATE FUNCTION getBookLocation (@bookId INT)
RETURNS TABLE
AS
	RETURN (SELECT * FROM abVwBookLocation WHERE bookId = @bookId);
GO
--- END return the book location from bookId