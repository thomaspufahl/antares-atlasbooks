USE AtlasBooks
GO

IF OBJECT_ID('isAdmin') IS NOT NULL
	DROP FUNCTION isAdmin;
GO

CREATE FUNCTION isAdmin (@userId INT)
RETURNS BIT
AS
BEGIN

	DECLARE @isAdmin BIT = 0;

	IF EXISTS (
		SELECT 1
		FROM [User] U 
		INNER JOIN [Role] R 
		ON U.roleId = R.roleId AND R.isActive <> 0 AND U.isActive <> 0
		WHERE U.userId = @userId AND ((LOWER(R.[name]) = 'admin') OR (LOWER(R.[name]) = 'administrator') OR (LOWER(R.[name]) = 'adm'))
	) SET @isAdmin = 1;
	
	RETURN @isAdmin;
END;
GO