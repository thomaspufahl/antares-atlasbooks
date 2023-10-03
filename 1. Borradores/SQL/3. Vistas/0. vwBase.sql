USE AtlasBooks
GO
--- CAMBIAR NOMBRE
--- START Book with active regs
IF OBJECT_ID('abVwBook') IS NOT NULL
	DROP VIEW abVwBook;
GO

CREATE VIEW abVwBook
AS
SELECT b.bookId, b.title, b.synopsis, b.rating, b.sectionId, b.isAvailable
FROM Book b
WHERE b.isActive <> 0
GO
--- END Book with active regs

--- START Book location code
IF OBJECT_ID('abVwBookLocationCode') IS NOT NULL
	DROP VIEW abVwBookLocationCode;
GO

CREATE VIEW abVwBookLocationCode
AS
SELECT b.bookId, br.branchCode, r.roomCode, sv.shelvingCode, sf.shelfCode, s.sectionCode
FROM abVwBook as b
INNER JOIN Section s   ON b.sectionId = s.sectionId     AND s.isActive  <> 0
INNER JOIN Shelf sf    ON s.shelfId = sf.shelfId        AND sf.isActive <> 0
INNER JOIN Shelving sv ON sf.shelvingId = sv.shelvingId AND sv.isActive <> 0
INNER JOIN Room r      ON sv.roomId = r.roomId          AND r.isActive  <> 0
INNER JOIN Branch br   ON r.branchId = br.branchId      AND br.isActive <> 0
GO
--- END Book location code


--- START Book location information
IF OBJECT_ID('abVwBookLocation') IS NOT NULL
	DROP VIEW abVwBookLocation;
GO

CREATE VIEW abVwBookLocation
AS
SELECT b.bookId, b.title, br.[description] as branch, r.[description] as room, sv.[description] as shelving, sf.[description] as shelf, s.[description] as section
FROM abVwBook as b
INNER JOIN Section s   ON b.sectionId = s.sectionId     AND s.isActive  <> 0
INNER JOIN Shelf sf    ON s.shelfId = sf.shelfId        AND sf.isActive <> 0
INNER JOIN Shelving sv ON sf.shelvingId = sv.shelvingId AND sv.isActive <> 0
INNER JOIN Room r      ON sv.roomId = r.roomId          AND r.isActive  <> 0
INNER JOIN Branch br   ON r.branchId = br.branchId      AND br.isActive <> 0
GO
--- END Book location information


--- START Book status information
IF OBJECT_ID('abVwBookStatus') IS NOT NULL
	DROP VIEW abVwBookStatus;
GO

CREATE VIEW abVwBookStatus
AS
SELECT b.bookId, b.title, b.synopsis, b.rating, [status] = 
CASE b.isAvailable
	WHEN 1 THEN 'available'
	WHEN 0 THEN 'not available'
	ELSE 'error'
END
FROM abVwBook b
GO
--- END Book status information

--- START Book when isAvailable is true
IF OBJECT_ID('abVwBookAvailable') IS NOT NULL
	DROP VIEW abVwBookAvailable;
GO

CREATE VIEW abVwBookAvailable
AS
SELECT b.bookId, b.title, b.synopsis, b.rating, b.[status]
FROM abVwBookStatus b
WHERE b.[status] LIKE 'available'
GO
--- END Book when isAvailable is true

--- START Book when isAvailable is false
IF OBJECT_ID('abVwBookNotAvailable') IS NOT NULL
	DROP VIEW abVwBookNotAvailable;
GO

CREATE VIEW abVwBookNotAvailable
AS
SELECT b.bookId, b.title, b.synopsis, b.rating, b.[status]
FROM abVwBookStatus b
WHERE b.[status] LIKE 'not available'
GO
--- END Book when isAvailable is false


--- START User with active regs
IF OBJECT_ID('abVwUser') IS NOT NULL
	DROP VIEW abVwUser;
GO

CREATE VIEW abVwUser
AS
SELECT u.userId, r.roleId, r.[name] as [role], u.personalIdNumber, u.firstName, u.lastName, u.bornDate, u.phoneNumber, u.email, u.isLoanFree
FROM [User] u
INNER JOIN [Role] R ON r.roleId = u.roleId AND r.isActive <> 0
WHERE u.isActive <> 0
GO
--- END User with active regs


--- START User status information
IF OBJECT_ID('abVwUserStatus') IS NOT NULL
	DROP VIEW abVwUserStatus;
GO

CREATE VIEW abVwUserStatus
AS
SELECT userId, [role], personalIdNumber, firstName, lastName, bornDate, phoneNumber, email, [status] =
CASE isLoanFree
	WHEN 1 THEN 'loan free'
	WHEN 0 THEN 'loan in progress'
END
FROM abVwUser
GO
--- END User status information


--- START User available
IF OBJECT_ID('abVwUserAvailable') IS NOT NULL
	DROP VIEW abVwUserAvailable;
GO

CREATE VIEW abVwUserAvailable
AS
SELECT u.userId, u.[role], u.personalIdNumber, u.firstName, u.lastName, u.bornDate, u.phoneNumber, u.email, u.[status]
FROM abVwUserStatus u
WHERE u.[status] LIKE 'loan free'
GO
--- END User available

--- START User not available
IF OBJECT_ID('abVwUserNotAvailable') IS NOT NULL
	DROP VIEW abVwUserNotAvailable;
GO

CREATE VIEW abVwUserNotAvailable
AS
SELECT u.userId, u.[role], u.personalIdNumber, u.firstName, u.lastName, u.bornDate, u.phoneNumber, u.email, u.[status]
FROM abVwUserStatus u
WHERE [status] LIKE 'loan in progress'
GO
--- END User not available




--- START Loan with active regs
IF OBJECT_ID('abVwLoan') IS NOT NULL
	DROP VIEW abVwLoan
GO

CREATE VIEW abVwLoan
AS
SELECT l.loanId, l.loanDate, l.returnDate, l.bookId, l.userId
FROM Loan l
WHERE l.isActive <> 0
GO
--- END Loan with active regs

--- START Loan status information
IF OBJECT_ID('abVwLoanStatus') IS NOT NULL
	DROP VIEW abVwLoanStatus
GO
--- CREAR FUNCION PARA LAS FECHAS
CREATE VIEW abVwLoanStatus
AS
SELECT 
l.loanId,
[status] = 
CASE
	WHEN l.returnDate > getdate() THEN 'in progress'
	WHEN l.returnDate = getdate() THEN 'return day'
	WHEN l.returnDate < getdate() THEN 'expired'
END,
b.bookId, 
b.title as bookTitle, 
b.[status] as bookStatus, 
u.userId, 
u.personalIdNumber, 
u.firstName +space(1)+u.lastName as fullName,
u.[status] as userStatus
FROM abVwLoan l
INNER JOIN abVwBookStatus b ON b.bookId = l.bookId
INNER JOIN abVwUserStatus u ON u.userId = l.userId
GO
--- END Loan status information


--- START Loan in progress
IF OBJECT_ID('abVwLoanInProgress') IS NOT NULL
	DROP VIEW abVwLoanInProgress
GO

CREATE VIEW abVwLoanInProgress
AS
SELECT l.loanId, l.[status], l.bookId, l.bookTitle, l.bookStatus, l.userId, l.personalIdNumber, l.fullName
FROM abVwLoanStatus l
WHERE l.[status] LIKE 'in progress'
GO
--- END Loan in progress

--- START Loan in progress
IF OBJECT_ID('abVwLoanExpired') IS NOT NULL
	DROP VIEW abVwLoanExpired
GO

CREATE VIEW abVwLoanExpired
AS
SELECT l.loanId, l.[status], l.bookId, l.bookTitle, l.bookStatus, l.userId, l.personalIdNumber, l.fullName
FROM abVwLoanStatus l
WHERE l.[status] LIKE 'expired'
GO
--- END Loan in progress
