USE AtlasBooks
GO

--- START Branch modifiedAt
IF OBJECT_ID('abOnUpdBranch') IS NOT NULL
	DROP TRIGGER abOnUpdBranch
GO

CREATE TRIGGER abOnUpdBranch
ON Branch
FOR UPDATE
AS
	UPDATE Branch SET modifiedAt = GETDATE() WHERE branchId = (SELECT branchId FROM INSERTED)
GO
--- END Branch modifiedAt


--- START Room modifiedAt
IF OBJECT_ID('abOnUpdRoom') IS NOT NULL
	DROP TRIGGER abOnUpdRoom
GO

CREATE TRIGGER abOnUpdRoom
ON Room
FOR UPDATE
AS
	UPDATE Room SET modifiedAt = GETDATE() WHERE roomId = (SELECT roomId FROM INSERTED)
GO
--- END Room modifiedAt


--- START Shelving modifiedAt
IF OBJECT_ID('abOnUpdShelving') IS NOT NULL
	DROP TRIGGER abOnUpdShelving
GO

CREATE TRIGGER abOnUpdShelving
ON Shelving
FOR UPDATE
AS
	UPDATE Shelving SET modifiedAt = GETDATE() WHERE shelvingId = (SELECT shelvingId FROM INSERTED)
GO
--- END Shelving modifiedAt


--- START Shelf modifiedAt
IF OBJECT_ID('abOnUpdShelf') IS NOT NULL
	DROP TRIGGER abOnUpdShelf
GO

CREATE TRIGGER abOnUpdShelf
ON Shelf
FOR UPDATE
AS
	UPDATE Shelf SET modifiedAt = GETDATE() WHERE shelfId = (SELECT shelfId FROM INSERTED)
GO
--- END Shelf modifiedAt

--- START Section modifiedAt
IF OBJECT_ID('abOnUpdSection') IS NOT NULL
	DROP TRIGGER abOnUpdSection
GO

CREATE TRIGGER abOnUpdSection
ON Section
FOR UPDATE
AS
	UPDATE Section SET modifiedAt = GETDATE() WHERE sectionId = (SELECT sectionId FROM INSERTED)
GO
--- END Section modifiedAt

--- START Book modifiedAt
IF OBJECT_ID('abOnUpdBook') IS NOT NULL
	DROP TRIGGER abOnUpdBook
GO

CREATE TRIGGER abOnUpdBook
ON Book
FOR UPDATE
AS
	UPDATE Book SET modifiedAt = GETDATE() WHERE bookId = (SELECT bookId FROM INSERTED)
GO
--- END Book modifiedAt

--- START Role modifiedAt
IF OBJECT_ID('abOnUpdRole') IS NOT NULL
	DROP TRIGGER abOnUpdRole
GO

CREATE TRIGGER abOnUpdRole
ON [Role]
FOR UPDATE
AS
	UPDATE [Role] SET modifiedAt = GETDATE() WHERE roleId = (SELECT roleId FROM INSERTED)
GO
--- END Role modifiedAt

--- START User modifiedAt
IF OBJECT_ID('abOnUpdUser') IS NOT NULL
	DROP TRIGGER abOnUpdUser
GO

CREATE TRIGGER abOnUpdUser
ON [User]
FOR UPDATE
AS
	UPDATE [User] SET modifiedAt = GETDATE() WHERE userId = (SELECT userId FROM INSERTED)
GO
--- END User modifiedAt


--- START Loan modifiedAt
IF OBJECT_ID('abOnUpdLoan') IS NOT NULL
	DROP TRIGGER abOnUpdLoan
GO

CREATE TRIGGER abOnUpdLoan
ON Loan
FOR UPDATE
AS
	UPDATE Loan SET modifiedAt = GETDATE() WHERE loanId = (SELECT loanId FROM INSERTED)
GO
--- END Loan modifiedAt