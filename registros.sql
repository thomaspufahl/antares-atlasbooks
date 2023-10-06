USE AtlasBooks
GO
--- BASE REGS
INSERT INTO [Role] 
([name], [description])
VALUES
('admin', 'full access');
GO

INSERT INTO [User]
(personalIdNumber, firstName, lastName, bornDate, phoneNumber, email, roleId)
VALUES
('11111111', 'admin', 'admin', '2000/01/01', '1111111111', 'admin@admin.com', (SELECT roleId FROM [Role] WHERE [name] = 'admin'));
GO
---

--- BRANCH
exec abInsBranch 1, 'BR1', 'Branch 1';
--- BRANCH

--- ROOM
--- S1
exec abInsRoom 1, 'R1', 'Room A', 1;
exec abInsRoom 1, 'R2', 'Room B', 1;
exec abInsRoom 1, 'R3', 'Room C', 1;
exec abInsRoom 1, 'R4', 'Room D', 1;
--- ROOM

--- SHELVING
--- S1
--- R1
exec abInsShelving 1, 'SV1', 'Shelving A', 1;
exec abInsShelving 1, 'SV2', 'Shelving B', 1;
exec abInsShelving 1, 'SV3', 'Shelving C', 1;
exec abInsShelving 1, 'SV4', 'Shelving D', 1;
exec abInsShelving 1, 'SV5', 'Shelving E', 1;
exec abInsShelving 1, 'SV6', 'Shelving F', 1;

--- R2
exec abInsShelving 1, 'SV7', 'Shelving A', 2;
exec abInsShelving 1, 'SV8', 'Shelving B', 2;
exec abInsShelving 1, 'SV9', 'Shelving C', 2;
exec abInsShelving 1, 'SV10', 'Shelving D', 2;
exec abInsShelving 1, 'SV11', 'Shelving E', 2;
exec abInsShelving 1, 'SV12', 'Shelving F', 2;

--- R3
exec abInsShelving 1, 'SV13', 'Shelving A', 3;
exec abInsShelving 1, 'SV14', 'Shelving B', 3;
exec abInsShelving 1, 'SV15', 'Shelving C', 3;
exec abInsShelving 1, 'SV16', 'Shelving D', 3;
exec abInsShelving 1, 'SV17', 'Shelving E', 3;
exec abInsShelving 1, 'SV18', 'Shelving F', 3;

--- R4
exec abInsShelving 1, 'SV19', 'Shelving A', 4;
exec abInsShelving 1, 'SV20', 'Shelving B', 4;
exec abInsShelving 1, 'SV21', 'Shelving C', 4;
exec abInsShelving 1, 'SV22', 'Shelving D', 4;
exec abInsShelving 1, 'SV23', 'Shelving E', 4;
exec abInsShelving 1, 'SV24', 'Shelving F', 4;
--- SHELVING

--- SHELF
--- S1
--- R1
--- SV1
exec abInsShelf 1, 'SF1', 'Shelf A', 1;
exec abInsShelf 1, 'SF2', 'Shelf B', 1;

--- SV2
exec abInsShelf 1, 'SF3', 'Shelf A', 2;
exec abInsShelf 1, 'SF4', 'Shelf B', 2;

--- SV3
exec abInsShelf 1, 'SF5', 'Shelf A', 3;
exec abInsShelf 1, 'SF6', 'Shelf B', 3;

--- SV4
exec abInsShelf 1, 'SF7', 'Shelf A', 4;
exec abInsShelf 1, 'SF8', 'Shelf B', 4;

--- SV5
exec abInsShelf 1, 'SF9', 'Shelf A', 5;
exec abInsShelf 1, 'SF10', 'Shelf B', 5;

--- SV6
exec abInsShelf 1, 'SF11', 'Shelf A', 6;
exec abInsShelf 1, 'SF12', 'Shelf B', 6;

--- R2
--- SV7
exec abInsShelf 1, 'SF13', 'Shelf A', 7;
exec abInsShelf 1, 'SF14', 'Shelf B', 7;

--- SV8
exec abInsShelf 1, 'SF15', 'Shelf A', 8;
exec abInsShelf 1, 'SF16', 'Shelf B', 8;

--- SV9
exec abInsShelf 1, 'SF17', 'Shelf A', 9;
exec abInsShelf 1, 'SF18', 'Shelf B', 9;

--- SV10
exec abInsShelf 1, 'SF19', 'Shelf A', 10;
exec abInsShelf 1, 'SF20', 'Shelf B', 10;

--- SV11
exec abInsShelf 1, 'SF21', 'Shelf A', 11;
exec abInsShelf 1, 'SF22', 'Shelf B', 11;

--- SV12
exec abInsShelf 1, 'SF23', 'Shelf A', 12;
exec abInsShelf 1, 'SF24', 'Shelf B', 12;

--- R3
--- SV13
exec abInsShelf 1, 'SF25', 'Shelf A', 13;
exec abInsShelf 1, 'SF26', 'Shelf B', 13;

--- SV14
exec abInsShelf 1, 'SF27', 'Shelf A', 14;
exec abInsShelf 1, 'SF28', 'Shelf B', 14;

--- SV15
exec abInsShelf 1, 'SF29', 'Shelf A', 15;
exec abInsShelf 1, 'SF30', 'Shelf B', 15;

--- SV16
exec abInsShelf 1, 'SF31', 'Shelf A', 16;
exec abInsShelf 1, 'SF32', 'Shelf B', 16;

--- SV17
exec abInsShelf 1, 'SF33', 'Shelf A', 17;
exec abInsShelf 1, 'SF34', 'Shelf B', 17;

--- SV18
exec abInsShelf 1, 'SF35', 'Shelf A', 18;
exec abInsShelf 1, 'SF36', 'Shelf B', 18;

--- R4
--- SV19
exec abInsShelf 1, 'SF37', 'Shelf A', 19;
exec abInsShelf 1, 'SF38', 'Shelf B', 19;

--- SV20
exec abInsShelf 1, 'SF39', 'Shelf A', 20;
exec abInsShelf 1, 'SF40', 'Shelf B', 20;

--- SV21
exec abInsShelf 1, 'SF41', 'Shelf A', 21;
exec abInsShelf 1, 'SF42', 'Shelf B', 21;

--- SV22
exec abInsShelf 1, 'SF43', 'Shelf A', 22;
exec abInsShelf 1, 'SF44', 'Shelf B', 22;

--- SV23
exec abInsShelf 1, 'SF45', 'Shelf A', 23;
exec abInsShelf 1, 'SF46', 'Shelf B', 23;

--- SV24
exec abInsShelf 1, 'SF47', 'Shelf A', 24;
exec abInsShelf 1, 'SF48', 'Shelf B', 24;
--- SHELF

--- SECTION
-- S1
-- R1
-- SF1
exec abInsSection 1, 'S1', 'Section A', 1;
exec abInsSection 1, 'S2', 'Section B', 1;

-- SF2
exec abInsSection 1, 'S3', 'Section A', 2;
exec abInsSection 1, 'S4', 'Section B', 2;

-- SF3
exec abInsSection 1, 'S5', 'Section A', 3;
exec abInsSection 1, 'S6', 'Section B', 3;

-- SF4
exec abInsSection 1, 'S7', 'Section A', 4;
exec abInsSection 1, 'S8', 'Section B', 4;

-- SF5
exec abInsSection 1, 'S9', 'Section A', 5;
exec abInsSection 1, 'S10', 'Section B', 5;

-- SF6
exec abInsSection 1, 'S11', 'Section A', 6;
exec abInsSection 1, 'S12', 'Section B', 6;

-- SF7
exec abInsSection 1, 'S13', 'Section A', 7;
exec abInsSection 1, 'S14', 'Section B', 7;

-- SF8
exec abInsSection 1, 'S15', 'Section A', 8;
exec abInsSection 1, 'S16', 'Section B', 8;

-- SF9
exec abInsSection 1, 'S17', 'Section A', 9;
exec abInsSection 1, 'S18', 'Section B', 9;

-- SF10
exec abInsSection 1, 'S19', 'Section A', 10;
exec abInsSection 1, 'S20', 'Section B', 10;

-- SF11
exec abInsSection 1, 'S21', 'Section A', 11;
exec abInsSection 1, 'S22', 'Section B', 11;

-- SF12
exec abInsSection 1, 'S23', 'Section A', 12;
exec abInsSection 1, 'S24', 'Section B', 12;

-- R2
-- SF13
exec abInsSection 1, 'S25', 'Section A', 13;
exec abInsSection 1, 'S26', 'Section B', 13;

-- SF14
exec abInsSection 1, 'S27', 'Section A', 14;
exec abInsSection 1, 'S28', 'Section B', 14;

-- SF15
exec abInsSection 1, 'S29', 'Section A', 15;
exec abInsSection 1, 'S30', 'Section B', 15;

-- SF16
exec abInsSection 1, 'S31', 'Section A', 16;
exec abInsSection 1, 'S32', 'Section B', 16;

-- SF17
exec abInsSection 1, 'S33', 'Section A', 17;
exec abInsSection 1, 'S34', 'Section B', 17;

-- SF18
exec abInsSection 1, 'S35', 'Section A', 18;
exec abInsSection 1, 'S36', 'Section B', 18;

-- SF19
exec abInsSection 1, 'S37', 'Section A', 19;
exec abInsSection 1, 'S38', 'Section B', 19;

-- SF20
exec abInsSection 1, 'S39', 'Section A', 20;
exec abInsSection 1, 'S40', 'Section B', 20;

-- SF21
exec abInsSection 1, 'S41', 'Section A', 21;
exec abInsSection 1, 'S42', 'Section B', 21;

-- SF22
exec abInsSection 1, 'S43', 'Section A', 22;
exec abInsSection 1, 'S44', 'Section B', 22;

-- SF23
exec abInsSection 1, 'S45', 'Section A', 23;
exec abInsSection 1, 'S46', 'Section B', 23;

-- SF24
exec abInsSection 1, 'S47', 'Section A', 24;
exec abInsSection 1, 'S48', 'Section B', 24;

-- R3
-- SF25
exec abInsSection 1, 'S49', 'Section A', 25;
exec abInsSection 1, 'S50', 'Section B', 25;

-- SF26
exec abInsSection 1, 'S51', 'Section A', 26;
exec abInsSection 1, 'S52', 'Section B', 26;

-- SF27
exec abInsSection 1, 'S53', 'Section A', 27;
exec abInsSection 1, 'S54', 'Section B', 27;

-- SF28
exec abInsSection 1, 'S55', 'Section A', 28;
exec abInsSection 1, 'S56', 'Section B', 28;

-- SF29
exec abInsSection 1, 'S57', 'Section A', 29;
exec abInsSection 1, 'S58', 'Section B', 29;

-- SF30
exec abInsSection 1, 'S59', 'Section A', 30;
exec abInsSection 1, 'S60', 'Section B', 30;

-- SF31
exec abInsSection 1, 'S61', 'Section A', 31;
exec abInsSection 1, 'S62', 'Section B', 31;

-- SF32
exec abInsSection 1, 'S63', 'Section A', 32;
exec abInsSection 1, 'S64', 'Section B', 32;

-- SF33
exec abInsSection 1, 'S65', 'Section A', 33;
exec abInsSection 1, 'S66', 'Section B', 33;

-- SF34
exec abInsSection 1, 'S67', 'Section A', 34;
exec abInsSection 1, 'S68', 'Section B', 34;

-- SF35
exec abInsSection 1, 'S69', 'Section A', 35;
exec abInsSection 1, 'S70', 'Section B', 35;

-- SF36
exec abInsSection 1, 'S71', 'Section A', 36;
exec abInsSection 1, 'S72', 'Section B', 36;

-- R4
-- SF37
exec abInsSection 1, 'S73', 'Section A', 37;
exec abInsSection 1, 'S74', 'Section B', 37;

-- SF38
exec abInsSection 1, 'S75', 'Section A', 38;
exec abInsSection 1, 'S76', 'Section B', 38;

-- SF39
exec abInsSection 1, 'S77', 'Section A', 39;
exec abInsSection 1, 'S78', 'Section B', 39;

-- SF40
exec abInsSection 1, 'S79', 'Section A', 40;
exec abInsSection 1, 'S80', 'Section B', 40;

-- SF41
exec abInsSection 1, 'S81', 'Section A', 41;
exec abInsSection 1, 'S82', 'Section B', 41;

-- SF42
exec abInsSection 1, 'S83', 'Section A', 42;
exec abInsSection 1, 'S84', 'Section B', 42;

-- SF43
exec abInsSection 1, 'S85', 'Section A', 43;
exec abInsSection 1, 'S86', 'Section B', 43;

-- SF44
exec abInsSection 1, 'S87', 'Section A', 44;
exec abInsSection 1, 'S88', 'Section B', 44;

-- SF45
exec abInsSection 1, 'S89', 'Section A', 45;
exec abInsSection 1, 'S90', 'Section B', 45;

-- SF46
exec abInsSection 1, 'S91', 'Section A', 46;
exec abInsSection 1, 'S92', 'Section B', 46;

-- SF47
exec abInsSection 1, 'S93', 'Section A', 47;
exec abInsSection 1, 'S94', 'Section B', 47;

-- SF48
exec abInsSection 1, 'S95', 'Section A', 48;
exec abInsSection 1, 'S96', 'Section B', 48;

--- SECTION

--- BOOK
exec abInsBook 1, 'The Innovators', 'How a Group of Hackers, Geniuses, and Geeks Created the Digital Revolution', 4.6, 1;
exec abInsBook 1, 'Steve Jobs', 'The Exclusive Biography', 2.5, 27;
exec abInsBook 1, 'The Soul of a New Machine', 'Reflections on the Computer Age', 4.5, 43;
exec abInsBook 1, 'The Code Book', 'The Science of Secrecy from Ancient Egypt to Quantum Cryptography', 7.4, 4;
exec abInsBook 1, 'The Phoenix Project', 'A Novel About IT, DevOps, and Helping Your Business Win', 8.3, 45;
exec abInsBook 1, 'Clean Code', 'A Handbook of Agile Software Craftsmanship', 5.2, 65;
exec abInsBook 1, 'The Design of Everyday Things', 'Revised and Expanded Edition', 4.1, 79;
exec abInsBook 1, 'Sapiens', 'A Brief History of Humankind', 6.2, 8;
exec abInsBook 1, 'The Lean Startup', 'How Todays Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses', 7.1, 9;
exec abInsBook 1, 'The Pragmatic Programmer', 'Your Journey to Mastery', 4.2, 30;
exec abInsBook 1, 'The C Programming Language', 'Created C and Unix', 3.3, 42;
exec abInsBook 1, 'The Art of Computer Programming', '4 volumes', 4.4, 76;
exec abInsBook 1, 'Hackers', 'Heroes of the Computer Revolution', 1.5, 13;
exec abInsBook 1, 'The Cathedral & the Bazaar', 'Musings on Linux and Open Source by an Accidental Revolutionary', 2.6, 72;
exec abInsBook 1, 'The Shallows', 'What the Internet Is Doing to Our Brains', 3.7, 89;
exec abInsBook 1, 'The Singularity Is Near', 'When Humans Transcend Biology', 4.2, 92;
exec abInsBook 1, 'The Big Switch', 'Rewiring the World, from Edison to Google', 5.6, 17;
exec abInsBook 1, 'The Second Machine Age', 'Work, Progress, and Prosperity in a Time of Brilliant Technologies', 6.8, 87;
exec abInsBook 1, 'The Industries of the Future', 'How the Next Decade of Innovation Will Transform Our Lives', 7.9, 19;
exec abInsBook 1, 'Digital Minimalism"', 'Choosing a Focused Life in a Noisy World', 8.1, 20;
exec abInsBook 1, 'The Cathedral & the Bazaar', 'Musings on Linux and Open Source by an Accidental Revolutionary', 2.6, 72;
exec abInsBook 1, 'The Phoenix Project', 'A Novel About IT, DevOps, and Helping Your Business Win', 8.3, 5;
exec abInsBook 1, 'The Industries of the Future', 'How the Next Decade of Innovation Will Transform Our Lives', 7.9, 19;
exec abInsBook 1, 'The Art of Computer Programming', '4 volumes', 4.4, 76;
exec abInsBook 1, 'Steve Jobs', 'The Exclusive Biography', 2.5, 27;
exec abInsBook 1, 'The Lean Startup', 'How Todays Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses', 7.1, 9;
exec abInsBook 1, 'Hackers', 'Heroes of the Computer Revolution', 1.5, 13;
exec abInsBook 1, 'Clean Code', 'A Handbook of Agile Software Craftsmanship', 5.2, 6;
exec abInsBook 1, 'The Innovators', 'How a Group of Hackers, Geniuses, and Geeks Created the Digital Revolution', 4.6, 1;
exec abInsBook 1, 'The Innovators', 'How a Group of Hackers, Geniuses, and Geeks Created the Digital Revolution', 4.6, 1;
--- BOOK

--- ROLE
exec abInsRole 1, 'user', 'user access';
exec abInsRole 1, 'guest', 'guest access';
--- ROLE

--- USER
exec abInsUser 1, '123456789', 'John', 'Doe', '1990/01/01', '123-456-7890', 'johndoe@example.com', 2
exec abInsUser 1, '987654321', 'Jane', 'Smith', '2005/02/02', '987-654-3210', 'janesmith@example.com', 2
exec abInsUser 1, '456789123', 'Michael', 'Johnson', '1985/03/03', '456-789-1230', 'michaeljohnson@example.com', 2
exec abInsUser 1, '321654987', 'Emily', 'Brown', '1992/04/04', '321-654-9870', 'emilybrown@example.com', 2
exec abInsUser 1, '789123456', 'David', 'Taylor', '1988/05/05', '789-123-4560', 'davidtaylor@example.com', 2
exec abInsUser 1, '654987321', 'Sarah', 'Miller', '1993/06/06', '654-987-3210', 'sarahmiller@example.com', 2
exec abInsUser 1, '987123654', 'Daniel', 'Anderson', '1987/07/07', '987-123-6540', 'danielanderson@example.com', 2
exec abInsUser 1, '456321789', 'Olivia', 'Wilson', '1996/08/08', '456-321-7890', 'oliviawilson@example.com', 2
exec abInsUser 1, '321789654', 'James', 'Martinez', '1989/09/09', '321-789-6540', 'jamesmartinez@example.com', 2
exec abInsUser 1, '789456123', 'Sophia', 'Lopez', '1991/10/10', '789-456-1230', 'sophialopez@example.com', 2
exec abInsUser 1, '654321987', 'William', 'Harris', '1986/11/11', '654-321-9870', 'williamharris@example.com', 2
exec abInsUser 1, '123789456', 'Ava', 'Garcia', '1994/12/12', '123-789-4560', 'avagarcia@example.com', 2
exec abInsUser 1, '987456321', 'Benjamin', 'Lee', '1997/01/01', '987-456-3210', 'benjaminlee@example.com', 2
exec abInsUser 1, '456123789', 'Mia', 'Clark', '1984/02/02', '456-123-7890', 'miaclark@example.com', 2
exec abInsUser 1, '321456987', 'Joseph', 'Lewis', '1998/03/03', '321-456-9870', 'josephlewis@example.com', 2
exec abInsUser 1, '789987123', 'Charlotte', 'Walker', '1983/04/04', '789-987-1230', 'charlottewalker@example.com', 2
exec abInsUser 1, '654321456', 'Harper', 'Young', '1999/05/05', '654-321-4560', 'harperyoung@example.com', 2
exec abInsUser 1, '123789987', 'Sebastian', 'Hall', '2003/06/06', '123-789-9870', 'sebastianhall@example.com', 2
exec abInsUser 1, '987654322', 'Amelia', 'Allen', '2004/07/07', '987-654-3211', 'ameliaallen@example.com', 2
exec abInsUser 1, '456123790', 'Ethan', 'King', '2008/08/08', '456-123-7891', 'ethanking@example.com', 2
--- USER

--- LOAN
exec abInsLoan 1, '2023/10/10', 1, 1;
exec abInsLoan 1, '2023/10/08', 2, 2;
exec abInsLoan 1, '2023/10/01', 3, 3;
exec abInsLoan 1, '2023/10/07', 4, 4;
exec abInsLoan 1, '2023/10/06', 5, 5;
exec abInsLoan 1, '2023/10/02', 6, 6;
exec abInsLoan 1, '2023/10/03', 7, 7;
exec abInsLoan 1, '2023/10/02', 8, 8;
exec abInsLoan 1, '2023/10/09', 9, 9;
exec abInsLoan 1, '2023/10/05', 10, 10;
--- LOAN
