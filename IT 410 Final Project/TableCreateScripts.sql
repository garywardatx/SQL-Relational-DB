USE RC_Charter2;

/* Drop tables from the database */

-- ORDER MATTERS
DROP TABLE EmpLicensesAndCerts;
DROP TABLE LicensesAndCerts;
DROP TABLE TestResults;
DROP TABLE EmployeeTests;
DROP TABLE CharterSummary;
DROP TABLE PilotRecords;
DROP TABLE PilotManifest;
DROP TABLE DestinationInfo;
DROP TABLE Revenue;
DROP TABLE Pmnt_RevStatement;
DROP TABLE Payments;
DROP TABLE CBill_PmntStatement;
DROP TABLE CharterBills;
DROP TABLE CharterFlights;
DROP TABLE CrewManifest;
DROP TABLE Employees;
DROP TABLE Aircraft;
DROP TABLE AircraftModels;
DROP TABLE Customers;


CREATE TABLE Customers(
	CustomerID INT IDENTITY (1,1) PRIMARY KEY,
	CName varchar(30),
	CustEMail varchar(30),
	CustAddress varchar(50)
	);

CREATE TABLE AircraftModels(
	ModelID INT IDENTITY (100,100) PRIMARY KEY,
	ModelName varchar(30),
	TakeOffWeight INT
	);

CREATE TABLE Aircraft(
	AircraftID varchar(4) not null PRIMARY KEY,
	ModelID int,
	LastServiceDate DATE,
	CONSTRAINT FK_ModelID FOREIGN KEY (ModelID) REFERENCES AircraftModels(ModelID)
	);

CREATE TABLE Employees(
	EmpID INT IDENTITY (1,1) PRIMARY KEY,
	EName varchar(30),
	EmpEmail varchar(30),
	EmpAddress varchar(50)
	);

CREATE TABLE PilotManifest(
	PilotID varchar(4) not null PRIMARY KEY,
	EmpID int,
	EName varchar(30),
	CONSTRAINT FK_EmpID FOREIGN KEY (EmpID) REFERENCES EMPLOYEES (EmpID)
	);

CREATE TABLE LicensesAndCerts(
	LicenseCertID varchar(10) not null PRIMARY KEY,
	LicenseCertDesc varchar(100),
	);

CREATE TABLE EmpLicensesAndCerts(
	ELC_ID int IDENTITY (1, 1),
	EmpID int,
	LicenseCertID varchar(10),
	DateEarned DATE,
	DateExpires DATE,
	PRIMARY KEY (ELC_ID, EmpID, LicenseCertID),
	CONSTRAINT FK_LC FOREIGN KEY (LicenseCertID) REFERENCES LicensesAndCerts (LicenseCertID),
	CONSTRAINT FK_ELCID FOREIGN KEY (EmpID) REFERENCES Employees (EmpID)
	);

CREATE TABLE EmployeeTests(
	TestID varchar(4) not null PRIMARY KEY,
	TestDesc varchar(100),
	TestFreq varchar(50)
	);

CREATE TABLE TestResults(
	EmpID int,
	TestID varchar(4),
	TestDate Date,
	TestResult varchar(4),
	PRIMARY KEY (EmpID, TestID),
	CONSTRAINT FK_TestID FOREIGN KEY (TestID) REFERENCES EmployeeTests (TestID),
	CONSTRAINT FK_ETRID FOREIGN KEY (EmpID) REFERENCES Employees (EmpID)
	);

CREATE TABLE CrewManifest(
	CmID varchar(4) not null,
	EmpID int,
	RoleID varchar(25),
	ModelName varchar(30),
	PRIMARY KEY (CmID, EmpID),
	CONSTRAINT FK_EmpID4 FOREIGN KEY (EmpID) REFERENCES EMPLOYEES (EmpID),
	);

CREATE TABLE CharterFlights(
	FlightID INT IDENTITY (1,1) PRIMARY KEY,
	CmID varchar(4),
	CustomerID int,
	FlightDate DATE,
	DepartureTime varchar(4),
	ArrivalTime varchar(4),
	CONSTRAINT FK_CID1 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
	);

CREATE TABLE DestinationInfo(
	FromCity varchar(20),
	ToCity varchar(20),
	FlightID int,
	CustomerID int,
	PRIMARY KEY (FromCity, ToCity),
	CONSTRAINT FK_FID1 FOREIGN KEY (FlightID) REFERENCES CharterFlights (FlightID),
	CONSTRAINT FK_CID2 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
	);

CREATE TABLE PilotRecords(
	RecordID INT IDENTITY (1,1) not null PRIMARY KEY,
	PilotID varchar(4),
	FlightID int,
	RecordDate DATE,
	CONSTRAINT FK_PilotID FOREIGN KEY (PilotID) REFERENCES PilotManifest (PilotID),
	CONSTRAINT FK_FID2 FOREIGN KEY (FlightID) REFERENCES CharterFlights (FlightID)
	);

CREATE TABLE CharterSummary(
	SummaryID INT IDENTITY (1,1) PRIMARY KEY,
	RecordID int,
	SummaryDate DATE,
	CONSTRAINT FK_RID FOREIGN KEY (RecordID) REFERENCES PilotRecords (RecordID)
	);

CREATE TABLE CharterBills(
	BillID INT IDENTITY(1,1) PRIMARY KEY,
	FlightID int,
	CustomerID int,
	FromCity varchar(20),
	ToCity varchar(20),
	DistanceFlown varchar(10),
	WaitTime varchar(10),
	CustReqs decimal(12,2),
	CrewExpenses decimal(12,2),
	CONSTRAINT FK_FID3 FOREIGN KEY (FlightID) REFERENCES CharterFlights (FlightID),
	CONSTRAINT FK_CID3 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
	);

CREATE TABLE CBill_PmntStatement(
	CBill_PmntID INT IDENTITY (1,1) PRIMARY KEY,
	BillID int,
	CustomerID int,
	BillAmount decimal (12,2),
	PStatementDate DATE,
	CONSTRAINT FK_BID FOREIGN KEY (BillID) REFERENCES CharterBills (BillID),
	CONSTRAINT FK_CID_BillS FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
	);

CREATE TABLE Payments(
	PaymentID INT IDENTITY (1,1) PRIMARY KEY,
	CustomerID int,
	BillAmount decimal(12,2),
	PaymentAmount decimal(12,2),
	PaymentDate DATE,
	CustBalance decimal(12,2),
	NextPaymentDate DATE,
	CONSTRAINT FK_CID4 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
	);

CREATE TABLE Pmnt_RevStatement(
	PmntRevID INT IDENTITY (1,1) PRIMARY KEY,
	PaymentID int,
	RevAmount decimal(12,2),
	RStatementDate DATE,
	CONSTRAINT FK_PaymentID FOREIGN KEY (PaymentID) REFERENCES Payments (PaymentID)
	);

CREATE TABLE Revenue(
	RevenueID INT IDENTITY (1,1) PRIMARY KEY,
	PmntRevID int,
	CustomerID int,
	TotalRev decimal(12,2),
	CONSTRAINT FK_PRID FOREIGN KEY (PmntRevID) REFERENCES Pmnt_RevStatement (PmntRevID),
	CONSTRAINT FK_CID5 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
	);
