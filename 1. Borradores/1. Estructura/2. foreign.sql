USE AtlasBooks


IF OBJECT_ID('FK_Room_branchId') IS NOT NULL
	BEGIN
		ALTER TABLE Room
		DROP FK_Room_branchId
	END
GO
IF OBJECT_ID('FK_Shelving_roomId') IS NOT NULL
	BEGIN
		ALTER TABLE Shelving
		DROP FK_Shelving_roomId
	END
GO
IF OBJECT_ID('FK_Shelf_shelvingId') IS NOT NULL
	BEGIN
		ALTER TABLE Shelf
		DROP FK_Shelf_shelvingId
	END
GO
IF OBJECT_ID('FK_Section_shelfId') IS NOT NULL
	BEGIN
		ALTER TABLE Section
		DROP FK_Section_shelfId
	END
GO
IF OBJECT_ID('FK_Book_sectionId') IS NOT NULL
	BEGIN
		ALTER TABLE Book
		DROP FK_Book_sectionId
	END
GO


IF OBJECT_ID('FK_User_roleId') IS NOT NULL
	BEGIN
		ALTER TABLE [User]
		DROP FK_User_roleId
	END
GO
IF OBJECT_ID('FK_Loan_userId') IS NOT NULL
	BEGIN
		ALTER TABLE Loan
		DROP FK_Loan_userId
	END
GO
IF OBJECT_ID('FK_Loan_bookId') IS NOT NULL
	BEGIN
		ALTER TABLE Loan
		DROP FK_Loan_bookId
	END
GO


ALTER TABLE Room
ADD CONSTRAINT FK_Room_branchId
FOREIGN KEY(branchId) REFERENCES Branch (branchId)
GO


ALTER TABLE Shelving
ADD CONSTRAINT FK_Shelving_roomId
FOREIGN KEY(roomId) REFERENCES Room (roomId)
GO


ALTER TABLE Shelf
ADD CONSTRAINT FK_Shelf_shelvingId
FOREIGN KEY(shelvingId) REFERENCES Shelving (shelvingId)
GO


ALTER TABLE Section
ADD CONSTRAINT FK_Section_shelfId
FOREIGN KEY(shelfId) REFERENCES Shelf (shelfId)
GO


ALTER TABLE Book
ADD CONSTRAINT FK_Book_sectionId
FOREIGN KEY(sectionId) REFERENCES Section (sectionId)
GO



ALTER TABLE [User]
ADD CONSTRAINT FK_User_roleId
FOREIGN KEY(roleId) REFERENCES [Role] (roleId)
GO


ALTER TABLE Loan
ADD CONSTRAINT FK_Loan_userId
FOREIGN KEY(userId) REFERENCES [User] (userId)
GO

ALTER TABLE Loan
ADD CONSTRAINT FK_Loan_bookId
FOREIGN KEY(bookId) REFERENCES [Book] (bookId)
GO

exec sp_helpconstraint Loan
GO
