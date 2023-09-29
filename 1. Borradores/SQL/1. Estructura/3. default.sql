USE AtlasBooks

--- BRANCH
IF OBJECT_ID('DF_Branch_createdAt') IS NOT NULL
	BEGIN
		ALTER TABLE Branch
		DROP DF_Branch_createdAt
	END
GO

IF OBJECT_ID('DF_Branch_modifiedAt') IS NOT NULL
	BEGIN
		ALTER TABLE Branch
		DROP DF_Branch_modifiedAt
	END
GO

IF OBJECT_ID('DF_Branch_isActive') IS NOT NULL
	BEGIN
		ALTER TABLE Branch
		DROP DF_Branch_isActive
	END
GO
--- BRANCH


--- ROOM
IF OBJECT_ID('DF_Room_createdAt') IS NOT NULL
	BEGIN
		ALTER TABLE Room
		DROP DF_Room_createdAt
	END
GO

IF OBJECT_ID('DF_Room_modifiedAt') IS NOT NULL
	BEGIN
		ALTER TABLE Room
		DROP DF_Room_modifiedAt
	END
GO

IF OBJECT_ID('DF_Room_isActive') IS NOT NULL
	BEGIN
		ALTER TABLE Room
		DROP DF_Room_isActive
	END
GO
--- ROOM


--- SHELVING
IF OBJECT_ID('DF_Shelving_createdAt') IS NOT NULL
	BEGIN
		ALTER TABLE Shelving
		DROP DF_Shelving_createdAt
	END
GO

IF OBJECT_ID('DF_Shelving_modifiedAt') IS NOT NULL
	BEGIN
		ALTER TABLE Shelving
		DROP DF_Shelving_modifiedAt
	END
GO

IF OBJECT_ID('DF_Shelving_isActive') IS NOT NULL
	BEGIN
		ALTER TABLE Shelving
		DROP DF_Shelving_isActive
	END
GO
--- SHELVING



--- SHELF
IF OBJECT_ID('DF_Shelf_createdAt') IS NOT NULL
	BEGIN
		ALTER TABLE Shelf
		DROP DF_Shelf_createdAt
	END
GO

IF OBJECT_ID('DF_Shelf_modifiedAt') IS NOT NULL
	BEGIN
		ALTER TABLE Shelf
		DROP DF_Shelf_modifiedAt
	END
GO

IF OBJECT_ID('DF_Shelf_isActive') IS NOT NULL
	BEGIN
		ALTER TABLE Shelf
		DROP DF_Shelf_isActive
	END
GO
--- SHELF


--- SECTION
IF OBJECT_ID('DF_Section_createdAt') IS NOT NULL
	BEGIN
		ALTER TABLE Section
		DROP DF_Section_createdAt
	END
GO

IF OBJECT_ID('DF_Section_modifiedAt') IS NOT NULL
	BEGIN
		ALTER TABLE Section
		DROP DF_Section_modifiedAt
	END
GO

IF OBJECT_ID('DF_Section_isActive') IS NOT NULL
	BEGIN
		ALTER TABLE Section
		DROP DF_Section_isActive
	END
GO
--- SECTION


--- BOOK
IF OBJECT_ID('DF_Book_rating') IS NOT NULL
	BEGIN
		ALTER TABLE Book
		DROP DF_Book_rating
	END
GO

IF OBJECT_ID('DF_Book_createdAt') IS NOT NULL
	BEGIN
		ALTER TABLE Book
		DROP DF_Book_createdAt
	END
GO

IF OBJECT_ID('DF_Book_modifiedAt') IS NOT NULL
	BEGIN
		ALTER TABLE Book
		DROP DF_Book_modifiedAt
	END
GO

IF OBJECT_ID('DF_Book_isActive') IS NOT NULL
	BEGIN
		ALTER TABLE Book
		DROP DF_Book_isActive
	END
GO

IF OBJECT_ID('DF_Book_isAvailable') IS NOT NULL
	BEGIN
		ALTER TABLE Book
		DROP DF_Book_isAvailable
	END
GO
--- BOOK

--- ROLE
IF OBJECT_ID('DF_Role_createdAt') IS NOT NULL
	BEGIN
		ALTER TABLE [Role]
		DROP DF_Role_createdAt
	END
GO

IF OBJECT_ID('DF_Role_modifiedAt') IS NOT NULL
	BEGIN
		ALTER TABLE [Role]
		DROP DF_Role_modifiedAt
	END
GO

IF OBJECT_ID('DF_Role_isActive') IS NOT NULL
	BEGIN
		ALTER TABLE [Role]
		DROP DF_Role_isActive
	END
GO
--- ROLE

--- USER
IF OBJECT_ID('DF_User_createdAt') IS NOT NULL
	BEGIN
		ALTER TABLE [User]
		DROP DF_User_createdAt
	END
GO

IF OBJECT_ID('DF_User_modifiedAt') IS NOT NULL
	BEGIN
		ALTER TABLE [User]
		DROP DF_User_modifiedAt
	END
GO

IF OBJECT_ID('DF_User_isActive') IS NOT NULL
	BEGIN
		ALTER TABLE [User]
		DROP DF_User_isActive
	END
GO

IF OBJECT_ID('DF_User_isLoanFree') IS NOT NULL
	BEGIN
		ALTER TABLE [User]
		DROP DF_User_isLoanFree
	END
GO
--- USER

--- LOAN
IF OBJECT_ID('DF_Loan_createdAt') IS NOT NULL
	BEGIN
		ALTER TABLE Loan
		DROP DF_Loan_createdAt
	END
GO

IF OBJECT_ID('DF_Loan_modifiedAt') IS NOT NULL
	BEGIN
		ALTER TABLE Loan
		DROP DF_Loan_modifiedAt
	END
GO

IF OBJECT_ID('DF_Loan_isActive') IS NOT NULL
	BEGIN
		ALTER TABLE Loan
		DROP DF_Loan_isActive
	END
GO

IF OBJECT_ID('DF_Loan_loanDate') IS NOT NULL
	BEGIN
		ALTER TABLE Loan
		DROP DF_Loan_loanDate
	END
GO
--- LOAN

--- ALTER BRANCH
ALTER TABLE Branch
ADD CONSTRAINT DF_Branch_createdAt
DEFAULT getdate() FOR createdAt
GO

ALTER TABLE Branch
ADD CONSTRAINT DF_Branch_modifiedAt
DEFAULT getdate() FOR modifiedAt
GO

ALTER TABLE Branch
ADD CONSTRAINT DF_Branch_isActive
DEFAULT 1 FOR isActive
GO
--- ALTER BRANCH

--- ALTER ROOM
ALTER TABLE Room
ADD CONSTRAINT DF_Room_createdAt
DEFAULT getdate() FOR createdAt
GO

ALTER TABLE Room
ADD CONSTRAINT DF_Room_modifiedAt
DEFAULT getdate() FOR modifiedAt
GO

ALTER TABLE Room
ADD CONSTRAINT DF_Room_isActive
DEFAULT 1 FOR isActive
GO
--- ALTER ROOM

--- ALTER SHELVING
ALTER TABLE Shelving
ADD CONSTRAINT DF_Shelving_createdAt
DEFAULT getdate() FOR createdAt
GO

ALTER TABLE Shelving
ADD CONSTRAINT DF_Shelving_modifiedAt
DEFAULT getdate() FOR modifiedAt
GO

ALTER TABLE Shelving
ADD CONSTRAINT DF_Shelving_isActive
DEFAULT 1 FOR isActive
GO
--- ALTER SHELVING

--- ALTER SHELF
ALTER TABLE Shelf
ADD CONSTRAINT DF_Shelf_createdAt
DEFAULT getdate() FOR createdAt
GO

ALTER TABLE Shelf
ADD CONSTRAINT DF_Shelf_modifiedAt
DEFAULT getdate() FOR modifiedAt
GO

ALTER TABLE Shelf
ADD CONSTRAINT DF_Shelf_isActive
DEFAULT 1 FOR isActive
GO
--- ALTER SHELF

--- ALTER SECTION
ALTER TABLE Section
ADD CONSTRAINT DF_Section_createdAt
DEFAULT getdate() FOR createdAt
GO

ALTER TABLE Section
ADD CONSTRAINT DF_Section_modifiedAt
DEFAULT getdate() FOR modifiedAt
GO

ALTER TABLE Section
ADD CONSTRAINT DF_Section_isActive
DEFAULT 1 FOR isActive
GO
--- ALTER SECTION

--- ALTER BOOK
ALTER TABLE Book
ADD CONSTRAINT DF_Book_rating 
DEFAULT 0 FOR rating
GO

ALTER TABLE Book
ADD CONSTRAINT DF_Book_createdAt
DEFAULT getdate() FOR createdAt
GO

ALTER TABLE Book
ADD CONSTRAINT DF_Book_modifiedAt
DEFAULT getdate() FOR modifiedAt
GO

ALTER TABLE Book
ADD CONSTRAINT DF_Book_isActive
DEFAULT 1 FOR isActive
GO

ALTER TABLE Book
ADD CONSTRAINT DF_Book_isAvailable
DEFAULT 1 FOR isAvailable
GO
--- ALTER BOOK

--- ALTER ROLE
ALTER TABLE [Role]
ADD CONSTRAINT DF_Role_createdAt
DEFAULT getdate() FOR createdAt
GO

ALTER TABLE [Role]
ADD CONSTRAINT DF_Role_modifiedAt
DEFAULT getdate() FOR modifiedAt
GO

ALTER TABLE [Role]
ADD CONSTRAINT DF_Role_isActive
DEFAULT 1 FOR isActive
GO
--- ALTER ROLE

--- ALTER USER
ALTER TABLE [User]
ADD CONSTRAINT DF_User_createdAt
DEFAULT getdate() FOR createdAt
GO

ALTER TABLE [User]
ADD CONSTRAINT DF_User_modifiedAt
DEFAULT getdate() FOR modifiedAt
GO

ALTER TABLE [User]
ADD CONSTRAINT DF_User_isActive
DEFAULT 1 FOR isActive
GO

ALTER TABLE [User]
ADD CONSTRAINT DF_User_isLoanFree
DEFAULT 1 FOR isLoanFree
GO
--- ALTER USER

--- ALTER LOAN
ALTER TABLE Loan
ADD CONSTRAINT DF_Loan_createdAt
DEFAULT getdate() FOR createdAt
GO

ALTER TABLE Loan
ADD CONSTRAINT DF_Loan_modifiedAt
DEFAULT getdate() FOR modifiedAt
GO

ALTER TABLE Loan
ADD CONSTRAINT DF_Loan_isActive
DEFAULT 1 FOR isActive
GO

ALTER TABLE Loan
ADD CONSTRAINT DF_Loan_loanDate
DEFAULT getdate() FOR loanDate
GO
--- ALTER LOAN