CREATE DATABASE Library_Management_System
USE Library_Management_System

CREATE TABLE Library_Branch (
BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
BranchName VARCHAR(50) UNIQUE NOT NULL,
Address VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Publisher (
PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
Address VARCHAR (255) UNIQUE NOT NULL,
Phone VARCHAR (30) UNIQUE NOT NULL
);

CREATE TABLE Books (
BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
Title VARCHAR (255) NOT NULL,
PublisherName VARCHAR (100) NOT NULL CONSTRAINT PublisherName_Fkey FOREIGN KEY REFERENCES Publisher (PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Book_Authors (
BookID INT NOT NULL CONSTRAINT Book_Authors_Fkey FOREIGN KEY REFERENCES Books (BookID) ON UPDATE CASCADE ON DELETE CASCADE,
AuthorName VARCHAR (255) NOT NULL
);

CREATE TABLE Book_Copies (
BookID INT NOT NULL CONSTRAINT BookID_Book_Copies_Fkey FOREIGN KEY REFERENCES Books (BookID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT BranchID_Book_Copies_Fkey FOREIGN KEY REFERENCES Library_Branch (BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
Number_Of_Copies INT NOT NULL
);

CREATE TABLE Borrower (
CardNo INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
Name VARCHAR (100) NOT NULL,
Address VARCHAR (255) NOT NULL,
Phone VARCHAR (50) NOT NULL
);


CREATE TABLE Book_Loans (
BookID INT NOT NULL CONSTRAINT BookID_Book_Loans_Fkey FOREIGN KEY REFERENCES Books (BookID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT BranchID_Book_Loans_Fkey FOREIGN KEY REFERENCES Library_Branch (BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
CardNo INT NOT NULL CONSTRAINT CardNo_Book_Loans_Fkey FOREIGN KEY REFERENCES Borrower (CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
DateOut DATETIME2(6) NOT NULL,
DateDue DATETIME2(6) NOT NULL
);




INSERT INTO Library_Branch(BranchName, Address)
VALUES
('Sharpstown', '1345 Humming Birds Way Jacksonville, FL 32276'),
('Central', '58721 Big Branch rd Jacksonville, FL 36671'),
('Regency', '1267 Library St, Jacksonville, FL 32225'),
('Saint Johns','5681 Hemming Plaza Jacksonville, FL 42445')
;

INSERT INTO Publisher (PublisherName, Address, Phone)
VALUES
('Penguin Random House','3195 Sunrise Road Las Vagas NV 34312','702-821-4607'),
('Aladdin Paperbacks','435 Stone Lane Philadelphia PA 19108','610-410-8413'),
('Alfred A. Knopf','812 Poe Lane Kansas City KS 66215','215-668-7424'),
('Allen & Unwin','935 Park Street Oakland CA 94612','913-541-4959'),
('Cresset Press','1568 Owagner Lane Seattle WA 98101','913-909-4928'),
('Casemate Publishers ','1182 Apple Lane Peoria IL 61614','206-340-2622'),
('Carnegie Mellon University Press','949 Aviation Way Los Angeles CA 98812','206-738-1207'),
('D. Appleton & Company','2916 Morgan Street Pensacola FL 32514','309-206-7315'),
('Deseret Book','1576 Glenwood Avenue Independence OH 44131','847-886-8851'),
('Dorchester Publishing','954 Woodbridge Lane Detroit MI 48226','213-941-9023'),
('Dorling Kindersley','4725 Wolf Pen Road Oakland CA 94612','216-269-2798'),
('Dundurn Group','1665 Still Pastures Drive North Sumter SC 29150','803-469-2501'),
('Elloras Cave','4349 Willow Greene Drive AL 36728','843-870-4047'),
('Golden Cockerel Press','4585 Mutton Town Road Centralia WA 98531','334-225-4891'),
('Greenleaf Publishing Ltd','2131 Byers Lane Orland CA 95963','205-516-8511'),
('Hachette Book Group USA','886 Aspen Court Cambridge MA 02138','360-623-2443'),
('Harbor Mountain Press','62 Boundary Street Jacksonville FL 32216','530-865-5319'),
('Harcourt Trade Publishers','3334 Leo Street Westminster CO 80030','310-738-3606'),
('Harper & Row','2873 Stockert Hollow Road Renton WA 98055','617-349-4358'),
('John Lane','11 Winding Way Providence RI 02908','508-878-8067')
;

INSERT INTO Books (Title, PublisherName)
VALUES
('Enemy Of Eternity','John Lane'),
('The Lost Tribe','Harbor Mountain Press'),
('Soldiers With Money','Harper & Row'),
('Cats Of Silver','Harbor Mountain Press'),
('Invaders And Turtles','Hachette Book Group USA'),
('Turtles And Snakes','Greenleaf Publishing Ltd'),
('Wand Of The Forsaken','Golden Cockerel Press'),
('Surprise Of The Banished','Elloras Cave'),
('Right About The Nation','Dundurn Group'),
('Separated In The Nation','Dorling Kindersley'),
('Companion Without Honor','Dorchester Publishing'),
('Tortoise Of History','Deseret Book'),
('Bandits Of The Night','D. Appleton & Company'),
('Bandits Of The Ancients','Carnegie Mellon University Press'),
('Lions And Horses','Casemate Publishers'),
('Strangers And Blacksmiths','Cresset Press'),
('Scourge Without A Conscience','Allen & Unwin'),
('Inspiration With Immortality','Alfred A. Knopf'),
('Call To The Ashes','Aladdin Paperbacks'),
('Death At My Wife','Penguin Random House')
;



INSERT INTO Book_Authors (BookID, AuthorName)
VALUES
(1,'Adrien Browning'),
(2,'Stephan King'),
(3,'Miguel Goodwin'),
(4,'Diana Cannon'),
(5,'Gael Hansen'),
(6,'Skylar Lowe'),
(7,'Zackary Skinner'),
(8,'Trystan Anthony'),
(9,'Sloane Pollard'),
(10,'Marlee Frank'),
(11,'Charlie Price'),
(12,'Natalie Savage'),
(13,'Cindy Reyes'),
(14,'Jasiah Mata'),
(15,'Mercedes Atkins')
;

INSERT INTO Book_Copies (BookID, BranchID, Number_Of_Copies)
VALUES
(1,1,2),
(2,1,5),
(3,1,6),
(4,2,7),
(5,4,2),
(6,4,3),
(7,4,6),
(8,1,1),
(9,2,3),
(10,1,2),
(11,2,2),
(12,4,3),
(13,3,3),
(14,3,7),
(15,4,3),
(16,1,5),
(17,3,5),
(18,1,8),
(19,3,5),
(20,3,7)
;

INSERT INTO Book_Loans (BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
(1,1,1000,'05-12-18','05-17-18'),
(2,3,1000,'05-16-18','05-21-18'),
(11,2,1002,'05-11-18','05-16-18'),
(19,3,1011,'05-08-18','05-15-18'),
(20,3,1003,'05-1-18','05-6-18'),
(20,3,1008,'05-3-18','05-8-18'),
(12,4,1005,'05-2-18','05-7-18'),
(12,4,1001,'05-1-18','05-6-18'),
(19,3,1006,'05-16-18','05-21-18'),
(19,3,1001,'05-21-18','05-26-18'),
(12,4,1005,'05-23-18','05-28-18'),
(13,3,1000,'05-25-18','05-30-18'),
(14,3,1010,'05-27-18','06-02-18'),
(15,4,1008,'06-02-18','06-07-18'),
(16,1,1000,'06-12-18','06-17-18'),
(18,1,1011,'06-12-18','06-17-18'),
(18,1,1001,'06-12-18','06-17-18'),
(14,3,1001,'06-12-18','06-17-18'),
(15,4,1001,'06-15-18','06-20-18'),
(2,3,1002,'06-21-18','06-26-18'),
(3,1,1010,'06-22-18','06-27-18'),
(3,1,1008,'06-23-18','05-28-18'),
(4,2,1002,'06-24-18','06-29-18'),
(5,4,1004,'07-12-18','07-17-18'),
(5,4,1006,'07-12-18','07-17-18'),
(4,2,1010,'07-12-18','07-17-18'),
(6,4,1006,'07-12-18','07-17-18'),
(5,4,1007,'07-13-18','07-18-18'),
(11,2,1008,'07-18-18','07-23-18'),
(19,3,1003,'07-19-18','07-24-18'),
(11,2,1005,'07-19-18','07-24-18'),
(12,4,1005,'08-12-18','08-17-18'),
(9,2,1011,'08-12-18','08-17-18'),
(7,4,1000,'08-12-18','08-17-18'),
(7,4,1011,'08-14-18','08-19-18'),
(1,1,1009,'08-15-18','08-20-18'),
(5,4,1006,'08-17-18','08-23-18'),
(3,1,1004,'08-18-18','08-23-18'),
(4,2,1009,'08-20-18','08-25-18'),
(7,4,1011,'08-21-18','08-26-18'),
(5,4,1004,'08-23-18','08-28-18'),
(13,3,1006,'08-24-18','08-29-18'),
(15,4,1011,'09-1-18','09-6-18'),
(16,1,1010,'09-12-18','09-17-18'),
(17,3,1008,'09-12-18','09-17-18'),
(18,1,1007,'09-12-18','09-17-18'),
(19,3,1011,'09-13-18','09-18-18'),
(13,3,1004,'09-15-18','09-20-18'),
(8,1,1003,'09-18-18','09-23-18'),
(20,3,1001,'09-19-18','09-24-18')
;

INSERT INTO Borrower (Name,Address,Phone)
VALUES
('Arturo Keller','50 Grandrose Avenue 
Ridgecrest, CA 93555', '(468) 891-0826'),

('Jonas Madden','235 Third Lane 
Findlay, OH 45840', '(578) 336-5564'),

('Brent Dickerson','981 Pilgrim Lane 
Eastlake, OH 44095', '(965) 446-3684'),

('Ashanti Conrad', '3 East Birch Hill Street 
Austin, MN 55912', '(947) 694-9934'),

('Asia Friedman','9723 Gregory Drive 
Hastings, MN 55033', '(429) 556-9173'),

('Jake Turner', '14 Prairie Ave. 
Suitland, MD 20746', '(433) 651-5412'),

('Aria Knox ', '40 Canterbury St. 
Lilburn, GA 30047', '(699) 378-6378'),

('Caylee Mcbride','255 Rosewood St. 
Sidney, OH 45365', '(931) 906-6944'),

('Daphne Hardy','820 Church Road 
Melbourne, FL 32904', '(459) 751-9758'),

('Haley Dunlap','3 Hartford St. 
Williamsport, PA 17701', '(425) 306-9661'),

('Clayton Ray','463 Bayberry Rd. 
Navarre, FL 32566', '(792) 650-0387'),

('Josie King ', '40 Constitution St. 
Essex, MD 21221', '(230) 529-0589')
;
select * from Book_copies

select * from library_branch
select * from publisher
select * from books
select * from book_authors
select * from borrower



