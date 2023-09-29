USE AtlasBooks

IF OBJECT_ID('UQ_Branch_branchCode') IS NOT NULL
	BEGIN
		ALTER TABLE Branch
		DROP UQ_Branch_branchCode
	END
GO

IF OBJECT_ID('UQ_Room_roomCode') IS NOT NULL
	BEGIN
		ALTER TABLE Room
		DROP UQ_Room_roomCode
	END
GO

IF OBJECT_ID('UQ_Shelving_shelvingCode') IS NOT NULL
	BEGIN
		ALTER TABLE Shelving
		DROP UQ_Shelving_shelvingCode
	END
GO

IF OBJECT_ID('UQ_Shelf_shelfCode') IS NOT NULL
	BEGIN
		ALTER TABLE Shelf
		DROP UQ_Shelf_shelfCode
	END
GO

IF OBJECT_ID('UQ_Section_sectionCode') IS NOT NULL
	BEGIN
		ALTER TABLE Section
		DROP UQ_Section_sectionCode
	END
GO


IF OBJECT_ID('UQ_Role_name') IS NOT NULL
	BEGIN
		ALTER TABLE [Role]
		DROP UQ_Role_name
	END
GO

IF OBJECT_ID('UQ_User_email') IS NOT NULL
	BEGIN
		ALTER TABLE [User]
		DROP UQ_User_email
	END
GO

IF OBJECT_ID('UQ_User_phoneNumber') IS NOT NULL
	BEGIN
		ALTER TABLE [User]
		DROP UQ_User_phoneNumber
	END
GO

IF OBJECT_ID('UQ_User_personalIdNumber') IS NOT NULL
	BEGIN
		ALTER TABLE [User]
		DROP UQ_User_personalIdNumber
	END
GO


ALTER TABLE Branch
ADD CONSTRAINT UQ_Branch_branchCode
UNIQUE (branchCode)

ALTER TABLE Room
ADD CONSTRAINT UQ_Room_roomCode
UNIQUE (roomCode)

ALTER TABLE Shelving
ADD CONSTRAINT UQ_Shelving_shelvingCode
UNIQUE (shelvingCode)

ALTER TABLE Shelf
ADD CONSTRAINT UQ_Shelf_shelfCode
UNIQUE (shelfCode)

ALTER TABLE Section
ADD CONSTRAINT UQ_Section_sectionCode
UNIQUE (sectionCode)


ALTER TABLE [Role]
ADD CONSTRAINT UQ_Role_name
UNIQUE (name)


ALTER TABLE [User]
ADD CONSTRAINT UQ_User_email
UNIQUE (email)

ALTER TABLE [User]
ADD CONSTRAINT UQ_User_phoneNumber
UNIQUE (phoneNumber)

ALTER TABLE [User]
ADD CONSTRAINT UQ_User_UQ_User_personalIdNumber
UNIQUE (personalIdNumber)