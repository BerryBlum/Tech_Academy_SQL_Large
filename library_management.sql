CREATE DATABASE db_library_management_system
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
	book_id INT PRIMARY KEY NOT NULL IDENTITY (5500,1),
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
	date_out VARCHAR(10) NOT NULL,
	date_due VARCHAR(10) NOT NULL
	);

CREATE TABLE tbl_book_copies
	(
	branch_id INT FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	book_id INT FOREIGN KEY REFERENCES tbl_books(book_id),
	number_of_copies INT NOT NULL
	);

GO


INSERT INTO tbl_library_branch(branch_name, branch_address) -- VARCHARS 50 and 60
	VALUES ('Central', '31010 Burned Down Pl, 00042'), ('Sharpstown', '223 Bloody Point Blvd, 10567'), ('Dullstown', '12121 Not So Sharp St, 42424'), ('External', '12345 Literally Anywhere Else Ave, 67890'); ---MIN 4 BRANCHES


INSERT INTO tbl_publisher(publisher_name, publisher_address, publisher_phone) -- VARCHARS 50 60 14
	VALUES ('We Have a Monopoly', '123 Suck It St, 11111', '000-000-0000');


INSERT INTO tbl_books(book_title) -- VARCAHR 50
	VALUES ('The Lost Tribe'), ('Pet Sematary'), ('Nineteen Eighty-Four'), ('Animal Farm'), ('The Shining'), ('Cujo'), ('The Girl with the Dragon Tattoo'),
	('The Girl Who Kicked the Hornet''s Nest'), ('The Girl Who Played with Fire'), ('Race Car Vehicle Dynamics'), ('Let the Right One In'), ('Eragon'), 
	('Spice and Wolf Anniversary Collector''s Edition'), ('One Piece, Vol. 1: Romance Dawn'), ('Wolf and Parchment: New Theory Spice & Wolf Vol. 1'), 
	('Inheritance'), ('Brisingr'), ('Eldest'), ('The Canal House'), ('Garfield Weighs In'), ('The Hitchhiker''s Guide to the Galaxy'); -- MIN 20 BOOKS


INSERT INTO tbl_book_authors(author_name) -- VARCHAR 20
	VALUES ('Stephen King'), ('Isuna Hasekura'), ('Jim Davis'), ('Douglas Adams'), ('William Milliken'), ('George Orwell'), ('Stieg Larsson'),
	('John Lindqvist'), ('Eiichiro Oda'), ('Christopher Paolini'), ('Mark Lee'); --MIN 10 AUTHORS


INSERT INTO tbl_borrower(borrower_name, borrower_address, borrower_phone) -- VARCHAR 50 60 14
	VALUES 
	('John Jackson', '76 Station Ave, 65432', '536-543-6702'), ('Jack Johnson', '1 1st St, 1111', '12-54-67-34-89'), ('Billy Jean', '222 2nd St, 22222', '853-124-2467'), 
	('Joan Jett', '1212 Blackheart Way, 7734', '752-568-2584'), ('Tori Black', '169 BJ Pl, 01369', ''), ('Jody Green', '3456 65 Pl, 54221', '833-736-7893'),
	('Miss Peacock', '1st Ave', '87-42-79-42-56'), ('Miss Scarlett', '443 Castle Pl, 2315', '86-25-86-97-99'), ('The Butler', '545 Fault Way, 23495', '23-23-45-76-87'), 
	('Hercule Poirot', 'Send a Telegraph', '12-12-12-54-34'), ('Mister Ratchet', '666 River Styx Way, 619', '744-888-8888'), ('HARRY POTTER', '00 Cupboard Ave, 00', 'Whats a phone?'), 
	('Spartacus', 'Sparta...possibly', 'Messenger?'), ('Vizzini', '1 INCONCEIVABLE WAY, 987', '111-111-1111'), 
	('Lisbeth Salander', 'UNKNOWN', '11-11-11-11-12'), ('Kalle Blumqvist', '346 ', '11-11-11-11-13'); -- MIN 8 BORROWERS


INSERT INTO tbl_book_loans(card_number, date_out, date_due) -- INT VARCHAR 10 10
	VALUES 
	( 12345678, '10-10-1010', '10-98-2019'), ( 12345678, '10-10-1011', '10-98-2020'), ( 12345678, '11-23-1009', '10-98-2020'),
	( 12345678, '11-23-1009', '10-98-2020'), ( 12345678, '09-02-1080', '10-98-2020'), ( 12345678, '09-14-1009', '10-98-2020'),
	( 22345678, '01-21-1001', '01-01-0001'), ( 22345678, '01-25-1001', '11-23-1009'), ( 22345678, '01-01-1001', '07-05-2039'),
	( 22345678, '01-19-1001', '03-90-5079'), ( 22345678, '01-30-1001', '01-01-0001'), ( 22345678, '01-01-1001', '11-23-1009'),
	( 22345678, '01-17-1001', '05-24-2097'), ( 22345678, '01-06-1001', '03-52-7632'), ( 22345678, '02-13-1011', '03-52-7632'),
	( 32345678, '10-98-2019', '07-05-2039'), ( 32345678, '10-98-2019', '01-01-0001'), ( 32345678, '03-52-7632', '07-05-2039'), 
	( 32345678, '03-52-7632', '10-10-1010'), ( 32345678, '03-90-5079', '05-24-2097'), ( 32345678, '07-05-2039', '10-10-1010'),
	( 32345678, '03-52-7632', '03-90-5079'), ( 32345678, '01-06-1001', '05-24-2097'), ( 32345678, '03-52-7632', '03-90-5079'),
	( 42345678, '01-30-1001', '05-24-2097'), ( 42345678, '10-98-2019', '05-24-2097'), ( 42345678, '03-90-5079', '01-01-0001'),
	( 42345678, '01-01-0001', '05-24-2097'), ( 42345678, '03-52-7632', '04-08-1079'), ( 42345678, '03-52-7632', '07-05-2039'),
	( 42345678, '03-52-7632', '07-05-2039'), ( 42345678, '01-25-0100', '05-24-2097'), ( 42345678, '11-23-1009', '10-10-1010'),
	( 42345678, '11-23-1009', '05-24-2097'), ( 52345678, '05-24-2097', '10-10-1010'), ( 52345678, '03-90-5079', '05-24-2097'), 
	( 52345678, '03-52-7632', '07-05-2039'), ( 52345678, '11-23-1009', '03-90-5079'), ( 52345678, '05-24-2097', '01-25-0100'),
	( 52345678, '01-01-0001', '03-90-5079'), ( 52345678, '03-90-5079', '01-25-0100'), ( 62345678, '03-52-7632', '01-01-0001'),
	( 62345678, '01-30-1001', '04-20-2097'), ( 62345678, '01-25-0100', '04-08-1073'), ( 62345678, '03-52-7632', '15-65-2970'), 
	( 62345678, '03-52-7632', '03-90-5079'), ( 62345678, '03-90-5079', '04-08-1072'), ( 62345678, 'BANANANANA', '01-01-0001'),
	( 62345678, '10-10-1010', '05-24-2097'), ( 62345678, '01-30-1001', '15-65-2970'), ( 62345678, '15-65-2970', '15-65-2970'),
	( 62345678, '03-52-7632', '15-65-2970'), ( 62345678, '01-01-0001', '15-65-2970'), ( 72345678, '01-06-1001', '01-30-1001'), 
	( 82345678, '10-98-2019', '05-24-2097'), ( 92345678, '15-65-2970', '10-98-2019'), ( 02345678, '15-65-2970', '05-24-2097'),
	( 00234561, '01-06-1001', '15-65-2970'), ( 87294532, '01-01-0001', '15-65-2970'), ( 94769104, '01-06-1001', '01-30-1001'),
	( 32467842, '03-52-7632', '05-24-2097'), ( 26056435, '03-52-7632', '01-01-0001'), ( 23450387, '10-98-2019', '03-52-7632'); --MIN 50 LOANS OUT


INSERT INTO tbl_book_copies(number_of_copies) -- INT
	VALUES( 0 ), ( 1 ), ( 2 ),( 3 ), ( 4 ), ( 5 ); --MIN 2 COPIES OF EACH

GO

SELECT * FROM tbl_borrower