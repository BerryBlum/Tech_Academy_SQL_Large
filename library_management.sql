USE DATABASE db_library_management_system

DROP TABLE tbl_book_authors, tbl_book_copies, tbl_book_loans, tbl_books, tbl_borrower, tbl_library_branch, tbl_publisher
GO

CREATE TABLE tbl_library_branch
	(
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(60) NOT NULL
	);

CREATE TABLE tbl_publisher
	(
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(60) NOT NULL,
	publisher_phone VARCHAR(14) NOT NULL
	);

CREATE TABLE tbl_books
	(
	book_id INT PRIMARY KEY IDENTITY (5500,1),
	book_title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) FOREIGN KEY REFERENCES tbl_publisher(publisher_name)
	);

CREATE TABLE tbl_book_authors
	(
	book_id INT FOREIGN KEY REFERENCES tbl_books(book_id),
	author_name VARCHAR(20)
	);

CREATE TABLE tbl_borrower
	(
	card_number INT PRIMARY KEY NOT NULL IDENTITY(2000,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(60) NOT NULL,
	borrower_phone VARCHAR(14) NOT NULL
	);

CREATE TABLE tbl_book_loans
	(
	branch_id INT FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	book_id INT FOREIGN KEY REFERENCES tbl_books(book_id),
	card_number INT NOT NULL,
	date_out VARCHAR(10),
	date_due VARCHAR(10)
	);

CREATE TABLE tbl_book_copies
	(
	branch_id INT FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	book_id INT FOREIGN KEY REFERENCES tbl_books(book_id),
	number_of_copies INT
	);

GO


INSERT INTO tbl_library_branch(branch_name, branch_address) -- VARCHARS 50 and 60
	VALUES ('Central', '31010 Burned Down Pl, 00042'), ('Sharpstown', '223 Bloody Point Blvd, 10567'), 
	('Dullstown', '12121 Not So Sharp St, 42424'), ('External', '12345 Literally Anywhere Else Ave, 67890'); ---MIN 4 BRANCHES


INSERT INTO tbl_publisher(publisher_name, publisher_address, publisher_phone) -- VARCHARS 50 60 14
	VALUES ('We Have a Monopoly', '123 Suck It St, 11111', '000-000-0000');


INSERT INTO tbl_books(book_title, publisher_name) -- VARCAHR 50
	VALUES ('The Lost Tribe', 'We Have a Monopoly'), ('Pet Sematary', 'We Have a Monopoly'), ('Nineteen Eighty-Four', 'We Have a Monopoly'),
	('Animal Farm', 'We Have a Monopoly'), ('The Shining', 'We Have a Monopoly'), ('Cujo', 'We Have a Monopoly'), ('The Girl with the Dragon Tattoo', 'We Have a Monopoly'),
	('The Girl Who Kicked the Hornet''s Nest', 'We Have a Monopoly'), ('The Girl Who Played with Fire', 'We Have a Monopoly'), ('Race Car Vehicle Dynamics', 'We Have a Monopoly'),
	('Let the Right One In', 'We Have a Monopoly'), ('Eragon', 'We Have a Monopoly'), ('Spice and Wolf Anniversary Collector''s Edition', 'We Have a Monopoly'),
	('One Piece, Vol. 1: Romance Dawn', 'We Have a Monopoly'), ('Wolf and Parchment: New Theory Spice & Wolf Vol. 1', 'We Have a Monopoly'), 
	('Inheritance', 'We Have a Monopoly'), ('Brisingr', 'We Have a Monopoly'), ('Eldest', 'We Have a Monopoly'), ('The Canal House', 'We Have a Monopoly'), 
	('Garfield Weighs In', 'We Have a Monopoly'), ('The Hitchhiker''s Guide to the Galaxy', 'We Have a Monopoly'); -- MIN 20 BOOKS + PUBLISHER NAME


INSERT INTO tbl_book_authors(book_id, author_name) -- VARCHAR 20
	VALUES (5501, 'Stephen King'), (5504, 'Stephen King'), (5505, 'Stephen King'), (5512, 'Isuna Hasekura'), (5514, 'Isuna Hasekura'),
	(5519, 'Jim Davis'), (5520, 'Douglas Adams'), (5509, 'William Milliken'), (5502, 'George Orwell'), (5503, 'George Orwell'), (5506, 'Stieg Larsson'), 
	(5507, 'Stieg Larsson'), (5508, 'Stieg Larsson'), (5510, 'John Lindqvist'), (5513, 'Eiichiro Oda'), (5511, 'Christopher Paolini'), (5515, 'Christopher Paolini'), 
	(5516, 'Christopher Paolini'), (5517, 'Christopher Paolini'), (5500, 'Mark Lee'), (5518, 'Mark Lee'); --MIN 10 AUTHORS


INSERT INTO tbl_borrower(borrower_name, borrower_address, borrower_phone) -- VARCHAR 50 60 14
	VALUES 
	('John Jackson', '76 Station Ave, 65432', '536-543-6702'), ('Jack Johnson', '1 1st St, 1111', '12-54-67-34-89'), ('Billy Jean', '222 2nd St, 22222', '853-124-2467'), 
	('Joan Jett', '1212 Blackheart Way, 7734', '752-568-2584'), ('Tori Black', '169 BJ Pl, 01369', ''), ('Jody Green', '3456 65 Pl, 54221', '833-736-7893'),
	('Miss Peacock', '1st Ave', '87-42-79-42-56'), ('Miss Scarlett', '443 Castle Pl, 2315', '86-25-86-97-99'), ('The Butler', '545 Fault Way, 23495', '23-23-45-76-87'), 
	('Hercule Poirot', 'Send a Telegraph', '12-12-12-54-34'), ('Mister Ratchet', '666 River Styx Way, 619', '744-888-8888'), ('HARRY POTTER', '00 Cupboard Ave, 00', 'Whats a phone?'), 
	('Spartacus', 'Sparta...possibly', 'Messenger?'), ('Vizzini', '1 INCONCEIVABLE WAY, 987', '111-111-1111'), 
	('Lisbeth Salander', 'UNKNOWN', '11-11-11-11-12'), ('Kalle Blumqvist', '346 ', '11-11-11-11-13'); -- MIN 8 BORROWERS


INSERT INTO tbl_book_loans(branch_id, book_id, card_number, date_out, date_due) -- INT VARCHAR 10 10
	VALUES 
	( 2, 5517, 2000, '10-10-1010', '10-24-2019'), ( 2, 5513, 2000, '10-10-1011', '10-09-2020'), ( 2, 5508, 2000, '11-23-1009', '10-16-2020'),
	( 2, 5500, 2000, '11-23-1009', '10-15-2020'), ( 2, 5515, 2000, '09-02-1080', '10-23-2018'), ( 2, 5518, 2000, '09-14-1009', '10-15-2020'),
	( 1, 5504, 2001, '01-21-1001', '01-01-0001'), ( 1, 5517, 2001, '01-25-1001', '11-23-1009'), ( 1, 5502, 2001, '01-01-1001', '07-05-2039'),
	( 1, 5500, 2001, '01-19-1001', '03-12-5079'), ( 1, 5508, 2001, '01-30-1001', '01-01-0001'), ( 1, 5509, 2001, '01-01-1001', '11-23-1009'),
	( 1, 5515, 2001, '01-17-1001', '05-24-2097'), ( 1, 5510, 2001, '01-06-1001', '03-14-7632'), ( 1, 5520, 2001, '02-13-1011', '03-02-7632'),
	( 3, 5508, 2002, '10-14-2019', '07-05-2039'), ( 3, 5507, 2002, '10-12-2019', '01-01-0001'), ( 3, 5501, 2002, '03-21-7632', '07-05-2039'), 
	( 3, 5515, 2002, '03-16-7632', '10-10-1010'), ( 3, 5505, 2002, '03-30-5079', '05-24-2097'), ( 3, 5509, 2002, '07-05-2039', '10-10-1010'),
	( 3, 5511, 2002, '03-18-7632', '03-05-5079'), ( 3, 5500, 2002, '01-06-1001', '05-24-2097'), ( 3, 5520, 2002, '03-24-7632', '03-09-5079'),
	( 4, 5500, 2003, '01-30-1001', '05-24-2097'), ( 4, 5508, 2003, '10-09-2019', '05-24-2097'), ( 4, 5507, 2003, '03-06-5079', '01-01-0001'),
	( 4, 5520, 2003, '01-01-0001', '05-24-2097'), ( 4, 5510, 2003, '03-05-7632', '04-08-1079'), ( 4, 5506, 2003, '03-27-7632', '07-05-2039'),
	( 4, 5509, 2003, '03-03-7632', '07-05-2039'), ( 4, 5514, 2003, '01-25-0100', '05-24-2097'), ( 4, 5508, 2003, '11-23-1009', '10-10-1010'),
	( 4, 5514, 2003, '11-23-1009', '05-24-2097'), ( 1, 5509, 2004, '05-24-2097', '10-10-1010'), ( 1, 5515, 2004, '03-09-5079', '05-24-2097'), 
	( 1, 5500, 2004, '03-06-7632', '07-05-2039'), ( 1, 5517, 2004, '11-23-1009', '03-12-5079'), ( 1, 5509, 2004, '05-24-2097', '01-25-0100'),
	( 1, 5508, 2004, '01-01-0001', '03-16-5079'), ( 1, 5504, 2004, '03-19-5079', '01-25-0100'), ( 4, 5510, 2005, '03-26-7632', '01-01-0001'),
	( 4, 5500, 2005, '01-30-1001', '04-20-2097'), ( 4, 5518, 2005, '01-25-0100', '04-08-1073'), ( 4, 5500, 2005, '03-17-7632', '11-23-2970'), 
	( 4, 5516, 2005, '03-16-7632', '03-24-5079'), ( 4, 5507, 2005, '03-26-5079', '10-23-2018'), ( 4, 5513, 2005, '02-13-2098', '01-01-0001'),
	( 4, 5500, 2005, '10-10-1010', '05-24-2097'), ( 4, 5517, 2005, '01-30-1001', '12-08-2970'), ( 4, 5515, 2005, '10-13-2970', '12-65-2970'),
	( 4, 5511, 2005, '03-25-7632', '12-12-2970'), ( 4, 5519, 2005, '01-01-0001', '11-65-2970'), ( 2, 5500, 2006, '01-06-1001', '01-30-1001'), 
	( 1, 5500, 2007, '10-12-2019', '05-24-2097'), ( 2, 5520, 2008, '11-19-2970', '10-07-2019'), ( 1, 5505, 2009, '11-17-2970', '05-24-2097'),
	( 4, 5509, 2010, '01-06-1001', '11-19-2970'), ( 2, 5500, 2011, '01-01-0001', '12-06-2970'), ( 1, 5517, 2012, '01-06-1001', '01-30-1001'),
	( 1, 5509, 2013, '03-12-7632', '05-24-2097'), ( 3, 5515, 2014, '03-27-7632', '01-01-0001'), ( NULL, NULL, 2015, NULL, NULL); --MIN 50 LOANS OUT


INSERT INTO tbl_book_copies(branch_id, book_id, number_of_copies) -- INT
	VALUES(1, 5500, 2), (1, 5501, 2), (1, 5502, 2), (1, 5509, 6000), (1, 5503, 2), (1, 5504, 3), (1, 5505, 2), (1, 5506, 1), (1, 5507, 2), (1, 5508, 2),
	(1, 5510, 2), (1, 5511, 1), (1, 5512, 2), (1, 5513, 4), (2, 5500, 5), (2, 5505, 1), (2, 5506, 6), (2, 5507, 2), (2, 5508, 3), (2, 5510, 75), (2, 5511, 9),
	(2, 5512, 2), (2, 5513, 2), (2, 5514, 2), (2, 5515, 2), (2, 5516, 300), (2, 5517, 2), (2, 5518, 2), (2, 5519, 1), (2, 5520, 42), (2, 5503, 2), (3, 5510, 2),
	(3, 5511, 2), (3, 5512, 2), (3, 5513, 13), (3, 5514, 3), (3, 5515, 2), (3, 5516, 2), (3, 5517, 2), (3, 5517, 2), (3, 5518, 2), (3, 5520, 42), (3, 5502, 2), 
	(3, 5503, 12), (3, 5504, 2), (3, 5505, 2), (3, 5506, 2), (3, 5507, 2), (4, 5508, 2), (4, 5500, 2), (4, 5511, 13), (4, 5503, 2), (4, 5504, 2), (4, 5505, 2),
	(4, 5506, 123), (4, 5507, 2), (4, 5514, 1), (4, 5516, 2490), (4, 5517, 63), (4, 5518, 2), (4, 5519, 2), (4, 5520, 42), (4, 5502, 2), (4, 5510, 2), (4, 5503, 1); --MIN 2 COPIES OF EACH

GO

SELECT * FROM tbl_library_branch
GO

SELECT * FROM tbl_publisher
GO

SELECT * FROM tbl_books
GO

SELECT * FROM tbl_book_authors
GO

SELECT * FROM tbl_borrower
GO

SELECT * FROM tbl_book_copies
WHERE book_id = 5500
GO

SELECT * FROM tbl_book_loans
GO


--PROBLEM 1

SELECT
a1.number_of_copies AS 'Copies', a2.branch_name AS 'Location', a3.book_title AS 'Title'
FROM tbl_book_copies a1
INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.branch_id
INNER JOIN tbl_books a3 ON a3.book_id = a1.book_id
WHERE book_title = 'The Lost Tribe' AND a1.branch_id = 2
GO

-- PROBLEM 2

SELECT
a1.number_of_copies AS 'Copies', a2.branch_name AS 'Location', a3.book_title AS 'Title'
FROM tbl_book_copies a1
RIGHT OUTER JOIN tbl_library_branch a2 ON a2.branch_id = a1.branch_id
INNER JOIN tbl_books a3 ON a3.book_id = a1.book_id
WHERE book_title = 'The Lost Tribe'
GO

--PROBLEM 3

SELECT
a1.borrower_name AS 'Alias'
FROM tbl_borrower a1
INNER JOIN tbl_book_loans a2 ON a2.card_number = a1.card_number
WHERE book_id IS NULL
GO

-- PROBLEM 4
SELECT
a1.branch_name AS 'Branch', a2.date_due AS 'Due', a3.book_title AS 'Title', a4.borrower_name AS 'Who', a4.borrower_address AS 'Where'
FROM tbl_library_branch a1
INNER JOIN tbl_book_loans a2 ON a2.branch_id = a1.branch_id
INNER JOIN tbl_books a3 ON a3.book_id = a2.book_id
INNER JOIN tbl_borrower a4 ON a4.card_number = a2.card_number
WHERE a1.branch_name = 'Sharpstown' AND ((a2.date_due) = (SELECT CONVERT(VARCHAR, GETDATE(), 110)))
GO

-- PROBLEM 5
SELECT
COUNT(a1.branch_id) AS 'Number of Books Out', a2.branch_name AS 'Location'
FROM tbl_book_loans a1
INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.branch_id
GROUP BY branch_name
GO
-- PROBLEM 6

SELECT
COUNT(a1.card_number) AS 'Number of Books Out', a2.borrower_name AS 'Alias', a2.borrower_address AS 'Location'
FROM tbl_book_loans a1
INNER JOIN tbl_borrower a2 ON a2.card_number = a1.card_number
GROUP BY borrower_address, borrower_name
HAVING COUNT(a1.card_number) > 5
GO

 --PROBLEM 7

SELECT
a1.book_title AS 'Book Title', a2.number_of_copies AS 'Copies', a3.branch_name AS 'Location'
FROM tbl_books a1
INNER JOIN tbl_book_copies a2 ON a2.book_id = a1.book_id
INNER JOIN tbl_library_branch a3 ON a3.branch_id = a2.branch_id
INNER JOIN tbl_book_authors a4 ON a4.book_id = a1.book_id
WHERE a3.branch_name = 'Central' AND a4.author_name = 'Stephen King'
GO
