USE AtlasBooks;
GO

--- START abGetVwBookLocation
IF OBJECT_ID('abGetVwBookLocation') IS NOT NULL
	DROP PROC abGetVwBookLocation
GO

CREATE PROC abGetVwBookLocation
AS
BEGIN
	SELECT * FROM abVwBookLocation
END
GO
--- END abGetVwBookLocation

--- START abGetVwBookStatus
IF OBJECT_ID('abGetVwBookStatus') IS NOT NULL
	DROP PROC abGetVwBookStatus
GO

CREATE PROC abGetVwBookStatus
AS
BEGIN
	SELECT * FROM abVwBookStatus
END
GO
--- END abGetVwBookStatus

--- START abGetVwUserStatus
IF OBJECT_ID('abGetVwUserStatus') IS NOT NULL
	DROP PROC abGetVwUserStatus
GO

CREATE PROC abGetVwUserStatus
AS
BEGIN
	SELECT * FROM abVwUserStatus
END
GO
--- END abGetVwUserStatus

--- START abGetVwLoanStatus
IF OBJECT_ID('abGetVwLoanStatus') IS NOT NULL
	DROP PROC abGetVwLoanStatus
GO

CREATE PROC abGetVwLoanStatus
AS
BEGIN
	SELECT * FROM abVwLoanStatus
END
GO
--- END abGetVwLoanStatus