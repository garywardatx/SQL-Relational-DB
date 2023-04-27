USE RC_Charter2;

/* Deletes table records from the database */
DELETE from Aircraft;
DELETE FROM AircraftModels;
DELETE FROM CharterSummary
DELETE FROM PilotRecords;
DELETE FROM PilotManifest;
DELETE FROM EmpLicensesAndCerts;
DELETE FROM LicensesAndCerts;
DELETE FROM TestResults;
DELETE FROM EmployeeTests;
DELETE FROM DestinationInfo;
DELETE FROM CharterSummary;
DELETE FROM CBill_PmntStatement;
DELETE FROM CharterBills;
DELETE FROM Revenue;
DELETE FROM Pmnt_RevStatement;
DELETE FROM Payments;
DELETE FROM CharterFlights;
DELETE FROM CrewManifest;
DELETE FROM Customers;
DELETE FROM Employees;


INSERT INTO AircraftModels 
(ModelName, TakeOffWeight)
VALUES ('SMALL PISTON', 8000),
	   ('SMALL PISTON-OLD', 8500),
	   ('LARGE JET-POWERED', 12500),
	   ('LARGE CARGO JET', 15500),
	   ('LARGE JET-OLD', 13000);

INSERT INTO Aircraft
(AircraftID, ModelId, LastServiceDate)
VALUES ('A001', 100,'04-30-2018'),
	   ('A002', 200, '04-30-2018'),
	   ('A003', 300, '04-29-2018'),
	   ('A004', 400, '04-28-2018'),
	   ('A005', 500, '04-27-2018');

INSERT INTO Employees
(EName, EmpEmail, EmpAddress)
VALUES ('Margaret Cho', 'mcho@rcc.com', '123 Haven St. Austin, TX'),
       ('Thomas Tanner', 'ttanner@rcc.com', '456 Rock Wall Ave, Houston, TX'),
	   ('Patrick Healey', 'phealey@rcc.com', '678 China Rd. Hampton, NH'),
	   ('Amy Richardson', 'arichardson@rcc.com', '899 Joy St. Portland, ME'),
	   ('Adam Hudson', 'ahudson@rcc.com', '57 Red Canyon Rd. Salt Lake City, UT'),
	   ('Rodney Williams', 'rwilliams@rcc.com', '287 Deer Meadow Rd. Wallingford WY'),
	   ('Jennifer Gray', 'jgray@rcc.com', '36 Hyatt St. Columbus Ohio'),
	   ('Petra Komorowski', 'pkomorowski@rcc.com', '62 Grunden Ave. Haverill MA'),
	   ('Franklin Knotts', 'fknotts@rcc.com', '412 Long Lake Dr. Chicago IL'),
	   ('Judy Dumont', 'jdumont@rcc.com', '2441 Douglas St. Unit 818 Knoxville, TN'),
	   ('Larry Underwood', 'lunderwood@rcc.com', '002 Libby St. San Bruno, CA'),
	   ('Karen Fuller', 'kfuller@rcc.com', '49 Abbot Kinney Ave. Portland, OR');

INSERT INTO PilotManifest
(PilotID, EmpID, EName)
VALUES ('P001', 1, 'Margaret Cho'),
	   ('P002', 2,'Thomas Tanner'),
	   ('P003', 3, 'Patrick Healey'),
	   ('P004', 4, 'Amy Richardson'),
	   ('P005', 5, 'Adam Hudson'),
	   ('P006', 6, 'Rodney Williams');
	   
INSERT INTO LicensesAndCerts
(LicenseCertID, LicenseCertDesc)
VALUES('COMM', 'Commercial License'),
	  ('ATP', 'Airline Transport Pilot'),
	  ('MED-1', 'Medical 1 License'),
	  ('MED-2', 'Medical 2 LIcense'),
	  ('INSTR', 'Instrument Rating'),
	  ('MEL', 'Multiengine Land Aircraft'),
	  ('LM', 'Loadmaster'),
	  ('FA', 'Flight Attendant');
	  	

INSERT INTO EmpLicensesAndCerts
(EmpID, LicenseCertID, DateEarned, DateExpires)
VALUES (1,'COMM', '03-23-17',NULL),
	   (1, 'ATP', '03-23-17', NULL),
	   (1, 'INSTR', '04-01-17', NULL),
	   (1, 'MEL', '04-01-17', NULL),
	   (1, 'MED-1', '01-28-18', '07-28-18'),
	   (1, 'MED-2', '01-28-18', '01-28-19'),
	   (2, 'COMM', '03-20-18', NULL),
	   (2, 'ATP', '03-20-18', NULL),
	   (2, 'INSTR', '03-20-18', NULL),
	   (2, 'MEL', '03-20-18', NULL),
	   (2, 'MED-1', '03-14-18', '09-14-18'),
	   (2, 'MED-2', '03-14-18', '03-14-19'),
	   (3, 'COMM', '04-03-18', NULL),
	   (3, 'ATP', '04-03-18', NULL),
	   (3, 'INSTR', '04-03-18', NULL),
	   (3, 'MEL', '04-03-18', NULL),
	   (3, 'MED-1', '02-08-18', '08-08-18'),
	   (3, 'MED-2', '02-02-18', '02-08-19'),
	   (4, 'COMM', '05-25-16', NULL),
	   (4, 'ATP', '05-25-16', NULL),
	   (4, 'INSTR', '05-25-16', NULL),
	   (4, 'MEL', '05-25-16', NULL),
	   (4, 'MED-1', '11-20-17', '05-20-18'),
	   (4, 'MED-2', '11-20-17', '11-20-18'),
	   (5, 'COMM', '04-28-18', NULL),
	   (5, 'ATP', '04-28-18', NULL),
	   (5, 'INSTR', '04-28-18', NULL),
	   (5, 'MEL', '04-28-18', NULL),
	   (5, 'MED-1', '03-17-18', '09-17-18'),
	   (5, 'MED-2', '03-17-18', '03-17-19'),
	   (6, 'COMM', '02-10-18', NULL),
	   (6, 'ATP', '02-10-18', NULL),
	   (6, 'INSTR', '02-10-18', NULL),
	   (6, 'MEL', '02-10-18', NULL),
	   (6, 'MED-1', '02-12-18', '08-12-18'),
	   (6, 'MED-2', '02-12-18', '02-12-19'),
	   (7, 'FA', '01-28-18', NULL),
	   (8, 'FA', '02-12-18', NULL),
	   (9, 'FA', '11-20-17', NULL),
	   (10, 'FA', '03-17-18', NULL),
	   (11, 'LM', '02-11-18',NULL),
	   (12, 'LM', '04-07-18', NULL);

INSERT INTO EmployeeTests
(TestID, TestDesc, TestFreq)
VALUES (001, 'Part 135 Flight Check', '12 MO'),
	   (002, 'Medical 01', '6 MO'),
	   (003, 'Medical 02', '12 MO'),
	   (004, 'Loadmaster Practical Exam','12 MO'),
	   (005, 'FA Practical EXAM', '12 MO'),
	   (006, 'Drug Test', 'RANDOM'),
	   (007, 'Ops Practical Exam', '12 MO'),
	   (008, 'Psychiatric Eval', '12 MO');

INSERT INTO TestResults
(EmpID, TestID, TestDate, TestResult)
VALUES (1, 002, '01-28-18', 'PASS'),
	   (1, 003, '01-28-18', 'PASS'),
	   (2, 002, '03-14-18', 'PASS'),
	   (2, 003, '03-14-18', 'PASS'),
	   (3, 002, '02-08-18', 'PASS'),
	   (3, 003, '02-08-18', 'PASS'),
	   (4, 002, '11-20-17', 'PASS'),
	   (4, 003, '11-20-17', 'PASS'),
	   (5, 002, '03-17-18', 'PASS'),
	   (5, 003, '03-17-18', 'PASS'),
	   (6, 002, '02-12-18', 'PASS'),
	   (6, 003, '02-12-18', 'PASS'),
	   (7, 006, '08-23-17', 'PASS'),
	   (10, 008, '10-11-17', 'PASS'),
	   (12, 004, '01-14-18', 'PASS');

INSERT INTO CrewManifest
(CmID, EmpID, RoleID, ModelName)
VALUES ('C001', 1, 'PILOT', 'SMALL PISTON'),
	   ('C002', 2, 'PILOT', 'SMALL PISTON OLD'),
	   ('C002', 11, 'FLIGHT ENGINEER', 'SMALL PISTON OLD'),
	   ('C003', 3, 'PILOT', 'LARGE JET POWERED'),
	   ('C003', 4, 'COPILOT', 'LARGE JET POWERED'),
	   ('C003', 7, 'FLIGHT ATTENDANT', 'LARGE JET POWERED'),
	   ('C003', 9, 'FLIGHT ATTENDANT', 'LARGE JET POWERED'),
	   ('C004', 5, 'PILOT', 'LARGE CARGO JET'),
	   ('C004', 6, 'COPILOT', 'LARGE CARGO JET');

INSERT INTO Customers
(CName, CustEMail, CustAddress)
VALUES ('Ace Ventura', 'aventura@email.com', '356 Detective Rd, Miami FL'),
	   ('Crocodile Dundee', 'cdundee@email.com', '477 Wallabee Way, Sydney Australia'),
	   ('Indiana Jones', 'ijones@email.com', '527 Temple of Doom St. Universal Studios, CA'),
	   ('Darth Vader', 'dvader@email.com', '111 Death Star, A Galaxy Far Far Away');

INSERT INTO CharterFlights
(CmID, CustomerID, FlightDate, DepartureTime, ArrivalTime)
VALUES ('C001', 1, '05-01-2018', 0800, 1300),
	   ('C002', 2, '05-01-2018', 0900, 1400),
	   ('C003', 3, '05-01-2018', 1100, 1900),
	   ('C004', 4, '05-01-2018', 1200, 2200);

INSERT INTO DestinationInfo
(FromCity, ToCity, FlightID, CustomerID)
VALUES ('Portland, ME', 'Boise, ID', 1, 1),
	   ('Portland, ME', 'Charlotte, NC', 2, 2),
	   ('Portland, ME', 'Chicago, IL', 3, 3),
	   ('Portland, ME', 'San Diego, CA', 4, 4);

INSERT INTO PilotRecords
(PilotID, FlightID, RecordDate)
VALUES ('P001', 1, '05-01-2018'),
	   ('P002', 2, '05-01-2018'),
	   ('P003', 3, '05-01-2018'),
	   ('P004', 3, '05-01-2018'),
	   ('P005', 4, '05-01-2018'),
	   ('P006', 4, '05-01-2018');

INSERT INTO CharterSummary
(RecordID, SummaryDate)
VALUES (1, '05-01-2018'),
	   (2, '05-01-2018'),
	   (3, '05-01-2018'),
	   (4, '05-01-2018'),
	   (5, '05-01-2018'),
	   (6, '05-01-2018');

INSERT INTO CharterBills
(FlightID, CustomerID, FromCity, ToCity, DistanceFlown, WaitTime, CustReqs, CrewExpenses)
VALUES (1, 1, 'Portland, ME', 'Boise, ID', '2500 MI', '2 HRS', 3000.00, 1000.00),
	   (2, 2, 'Portland, ME', 'Charlotte, NC', '1000 MI', '1 HR', 2500.00, 2500.00),
	   (3, 3, 'Portland, ME', 'Chicago, IL', '1750 MI', '3 HRS', 5000.00, 5000.00),
	   (4, 4, 'Portland, ME', 'San Diego, CA', '3000 MI', '2.5 HRS', 7500.00, 4000.00 );

INSERT INTO CBill_PmntStatement
(BillID, CustomerID, BillAmount, PStatementDate)
VALUES (1, 1, 8500.00, '05-01-2018'),
	   (2, 2, 7000.00, '05-01-2018'),
	   (3, 3, 14750.00, '05-01-2018'),
	   (4, 4, 17000.00, '05-01-2018');

INSERT INTO Payments
(CustomerID, BillAmount, PaymentAmount, PaymentDate, CustBalance, NextPaymentDate)
VALUES (1, 8500.00, 5000.00, '05-01-2018', 3500.00, '06-01-2018'),
	   (2, 7000.00, 0, NULL, 7000.00, '06-01-2018'),
	   (3, 14750, 0, NULL, 14750.00, '06-01-2018'),
	   (4, 17000.00, 17000.00, '05-01-2018', 0, NULL);

INSERT INTO Pmnt_RevStatement
(PaymentID, RevAmount, RStatementDate)
VALUES (1, 5000.00, '05-01-2018'),
	   (2, 0, '05-01-2018'),
	   (3, 0, '05-01-2018'),
	   (4, 17000.00, '05-01-2018');

INSERT INTO Revenue
(PmntRevID, CustomerID, TotalRev)
VALUES (1, 1, 5000.00),
	   (2, 2, 0),
	   (3, 3, 0),
	   (4, 4, 17000.00);
