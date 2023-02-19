DROP DATABASE IF EXISTS TravelAgency;
CREATE DATABASE TravelAgency

USE TravelAgency;

DROP TABLE IF EXISTS DimClients;
CREATE TABLE DimClients
(
	ClientId		INT IDENTITY(1,1),
	FirstName		NVARCHAR(50) NOT NULL,
	LastName		NVARCHAR(50) NOT NULL,
	TypeClient		NVARCHAR(15),
	Passport		NVARCHAR(25) NOT NULL UNIQUE,
	PhoneNumber		VARCHAR(20) ,
	Adress			NVARCHAR(150),
	Birthdate		Date,
    CONSTRAINT PK_ClientId_DimClients PRIMARY KEY (ClientId),
	CONSTRAINT UQ_Passport_DimClients UNIQUE (Passport)
);

DROP TABLE IF EXISTS DimManagers;
CREATE TABLE DimManagers
(
	ManagerId		INT IDENTITY(1,1),
	FirstName		NVARCHAR(50) NOT NULL,
	LastName		NVARCHAR(50) NOT NULL,
	Position		NVARCHAR(50),
	Passport		NVARCHAR(25) NOT NULL UNIQUE,
	PhoneNumber		VARCHAR(20) ,
	Email			NVARCHAR(25),
	Territory		NVARCHAR(50),
    CONSTRAINT PK_ManagerId_DimManager PRIMARY KEY (ManagerId),
	CONSTRAINT UQ_Passport_DimManages UNIQUE (Passport)
);

DROP TABLE IF EXISTS DimHotels;
CREATE TABLE DimHotels
(
	HotelId		    INT IDENTITY(1,1),
	HotelName		NVARCHAR(50) NOT NULL,
	HotelType		NVARCHAR(15),
	Country			NVARCHAR(25) NOT NULL,
	City			NVARCHAR(25) NOT NULL,
	Adress			NVARCHAR(150),
	LocationType	NVARCHAR(15),
	RoomType		NVARCHAR(15),
	FoodType		NVARCHAR(15),
	Price			MONEY ,
    CONSTRAINT PK_HotelId_DimHotels PRIMARY KEY (HotelId),
	CONSTRAINT CK_Price_DimHotels CHECK(Price>=0)
);
ALTER TABLE DimHotels 
ADD CONSTRAINT DF_Price_DimHotels DEFAULT ((0)) FOR Price;

DROP TABLE IF EXISTS DimAirFlight;
CREATE TABLE DimAirFlight
(
	AviaId		    INT IDENTITY(1,1),
	Departure		DATETIME NOT NULL,
	CityDeparture	NVARCHAR(25) NOT NULL,
	Arrival			DATETIME NOT NULL,
	CityArival		NVARCHAR(25) NOT NULL,
	Baggage			NVARCHAR(10),
	FlightNumber	NVARCHAR(10),
    CONSTRAINT PK_AviaId_DimAirFlight PRIMARY KEY (AviaId),
);

DROP TABLE IF EXISTS FctSales;
CREATE TABLE FctSales
(
   SalesId		    INT IDENTITY(1,1),
   ClientId		    INT,
   ManagerId	    INT,
   HotelId		    INT,
   AviaId		    INT,
   SalesDate		DATE NOT NULL,
   StartDate		DATE NOT NULL,
   EndDate			DATE NOT NULL,
   Discount			INT,
   Price			MONEY,
   CONSTRAINT PK_SalesId_FctSales PRIMARY KEY (SalesId),
   CONSTRAINT CK_Price_FctSales CHECK(Price>=0),
   CONSTRAINT CK_Discount_FctSales CHECK(Discount>=0),
   CONSTRAINT FK_ClientId_FctSales  FOREIGN KEY (ClientId) REFERENCES DimClients(ClientId) 
   ON UPDATE CASCADE 
   ON DELETE CASCADE ,
   CONSTRAINT FK_ManagerId_FctSales FOREIGN KEY (ManagerId) REFERENCES DimManagers(ManagerId)
   ON UPDATE CASCADE 
   ON DELETE CASCADE ,
   CONSTRAINT FK_HotelId_FctSales   FOREIGN KEY (HotelId) REFERENCES DimHotels(HotelId)
   ON UPDATE CASCADE 
   ON DELETE CASCADE ,
   CONSTRAINT FK_AviaId_FctSales  FOREIGN KEY (AviaId) REFERENCES DimAirFlight(AviaId)
   ON UPDATE CASCADE 
   ON DELETE CASCADE ,
)

ALTER TABLE FctSales 
ADD CONSTRAINT DF_Price_FctSales DEFAULT 0 FOR Price;
ALTER TABLE FctSales
ADD CONSTRAINT DF_Discount_FctSales DEFAULT 0 FOR Discount;