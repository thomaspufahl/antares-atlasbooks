USE master
GO
IF OBJECT_ID('AtlasBooks') IS NOT NULL
    DROP DATABASE AtlasBooks
GO
CREATE DATABASE AtlasBooks
GO

USE AtlasBooks
GO

IF OBJECT_ID('Branch') IS NOT NULL
    DROP TABLE Branch
GO
IF OBJECT_ID('Room') IS NOT NULL
    DROP TABLE Room
GO
IF OBJECT_ID('Shelving') IS NOT NULL
    DROP TABLE Shelving
GO
IF OBJECT_ID('Shelf') IS NOT NULL
    DROP TABLE Shelf
GO
IF OBJECT_ID('Section') IS NOT NULL
    DROP TABLE Section
GO
IF OBJECT_ID('Book') IS NOT NULL
    DROP TABLE Book
GO
IF OBJECT_ID('Role') IS NOT NULL
    DROP TABLE [Role]
GO
IF OBJECT_ID('User') IS NOT NULL
    DROP TABLE [User]
GO
IF OBJECT_ID('Loan') IS NOT NULL
    DROP TABLE Loan
GO


CREATE TABLE [Branch]
(
    branchId      int identity (1,1) not null,
    branchCode    varchar(10)        not null,
    description   varchar(255)       not null,
    createdAt     datetime           not null,
    modifiedAt    datetime           not null,
    isActive      bit                not null,
)
GO
CREATE TABLE [Room]
(
    roomId        int identity (1,1) not null,
    roomCode      varchar(10)        not null,
    [description] varchar(255)       not null,
    branchId      int                not null,
    createdAt     datetime           not null,
    modifiedAt    datetime           not null,
    isActive      bit                not null,
)
CREATE TABLE [Shelving]
(
    shelvingId    int identity (1,1) not null,
    shelvingCode  varchar(10)        not null,
    [description] varchar(255)       not null,
    roomId        int                not null,
    createdAt     datetime           not null,
    modifiedAt    datetime           not null,
    isActive      bit                not null,
)
GO
CREATE TABLE [Shelf]
(
    shelfId       int identity (1,1) not null,
    shelfCode     varchar(10)        not null,
    [description] varchar(255)       not null,
    shelvingId    int                not null,
    createdAt     datetime           not null,
    modifiedAt    datetime           not null,
    isActive      bit                not null,
)
GO
CREATE TABLE [Section]
(
    sectionId     int identity (1,1) not null,
    sectionCode   varchar(10)        not null,
    [description] varchar(255)       not null,
    shelfId       int                not null,
    createdAt     datetime           not null,
    modifiedAt    datetime           not null,
    isActive      bit                not null,
)
GO
CREATE TABLE [Book]
(
    bookId      int identity (1,1) not null,
    title       varchar(100)       not null,
    synopsis    varchar(255)       not null,
    rating      decimal(3, 1)      not null,
    sectionId   int                not null,
    isAvailable bit                not null,
    createdAt   datetime           not null,
    modifiedAt  datetime           not null,
    isActive    bit                not null,
)
GO
CREATE TABLE [Role]
(
    roleId        int identity (1,1) not null,
    [name]        varchar(50)        not null,
    [description] varchar(255)       not null,
    createdAt     datetime           not null,
    modifiedAt    datetime           not null,
    isActive      bit                not null,
)
GO
CREATE TABLE [User]
(
    userId           int identity (1,1) not null,
    personalIdNumber varchar(20)        not null,
    firstName        varchar(50)        not null,
    lastName         varchar(50)        not null,
    bornDate         date               not null,
    phoneNumber      varchar(15)        not null,
    email            varchar(100)       not null,
    roleId           int                not null,
    isLoanFree       bit                not null,
    createdAt        datetime           not null,
    modifiedAt       datetime           not null,
    isActive         bit                not null,
)
GO
CREATE TABLE [Loan]
(
    loanId     int identity (1,1) not null,
    loanDate   datetime           not null,
    returnDate datetime           not null,
    userId     int                not null,
	bookId	   int				  not null,
    createdAt  datetime           not null,
    modifiedAt datetime           not null,
    isActive   bit                not null,
)
GO

exec sp_tables @table_owner ='dbo'
GO