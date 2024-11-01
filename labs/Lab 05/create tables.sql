-- Table: Continent
CREATE TABLE Continent (
    ContinentKey INT PRIMARY KEY,
    ContinentName VARCHAR(50)
);

-- Table: Country
CREATE TABLE Country (
    CountryKey INT PRIMARY KEY,
    CountryName VARCHAR(100),
    CountryCode CHAR(3),
    CountryCapital VARCHAR(100),
    Population INT,
    Subdivision VARCHAR(50),
    ContinentKey INT,
    FOREIGN KEY (ContinentKey) REFERENCES Continent(ContinentKey)
);

-- Table: State
CREATE TABLE State (
    StateKey INT PRIMARY KEY,
    StateName VARCHAR(100),
    EnglishStateName VARCHAR(100),
    StateType VARCHAR(50),
    StateCode CHAR(2),
    StateCapital VARCHAR(100),
    RegionName VARCHAR(50),
    RegionCode CHAR(2),
    CountryKey INT,
    FOREIGN KEY (CountryKey) REFERENCES Country(CountryKey)
);

-- Table: City
CREATE TABLE City (
    CityKey INT PRIMARY KEY,
    CityName VARCHAR(100),
    StateKey INT,
    CountryKey INT,
    FOREIGN KEY (StateKey) REFERENCES State(StateKey),
    FOREIGN KEY (CountryKey) REFERENCES Country(CountryKey)
);

-- Table: Category
CREATE TABLE Category (
    CategoryKey INT PRIMARY KEY,
    CategoryName VARCHAR(50),
    Description TEXT
);

-- Table: Product
CREATE TABLE Product (
    ProductKey INT PRIMARY KEY,
    ProductName VARCHAR(100),
    QuantityPerUnit VARCHAR(50),
    UnitPrice DECIMAL(10, 2),
    Discontinued BIT,
    CategoryKey INT,
    FOREIGN KEY (CategoryKey) REFERENCES Category(CategoryKey)
);

-- Table: Supplier
CREATE TABLE Supplier (
    SupplierKey INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Address VARCHAR(100),
    PostalCode VARCHAR(20),
    CityKey INT,
    FOREIGN KEY (CityKey) REFERENCES City(CityKey)
);

-- Table: Shipper
CREATE TABLE Shipper (
    ShipperKey INT PRIMARY KEY,
    CompanyName VARCHAR(100)
);

-- Table: Customer
CREATE TABLE Customer (
    CustomerKey INT PRIMARY KEY,
    CustomerID CHAR(5) UNIQUE,
    CompanyName VARCHAR(100),
    Address VARCHAR(100),
    PostalCode VARCHAR(20),
    CityKey INT,
    FOREIGN KEY (CityKey) REFERENCES City(CityKey)
);

-- Table: Employee
CREATE TABLE Employee (
    EmployeeKey INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Title VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Address VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    SupervisorKey INT,
    FOREIGN KEY (SupervisorKey) REFERENCES Employee(EmployeeKey)
);

-- Table: Territories
CREATE TABLE Territories (
    EmployeeKey INT,
    CityKey INT,
    PRIMARY KEY (EmployeeKey, CityKey),
    FOREIGN KEY (EmployeeKey) REFERENCES Employee(EmployeeKey),
    FOREIGN KEY (CityKey) REFERENCES City(CityKey)
);

-- Table: Time
CREATE TABLE Time (
    TimeKey INT PRIMARY KEY,
    Date DATE UNIQUE,
    DayNbWeek INT,
    DayNameWeek VARCHAR(10),
    DayNbMonth INT,
    DayNbYear INT,
    WeekNbYear INT,
    MonthNumber INT,
    MonthName VARCHAR(15),
    Quarter INT,
    Semester INT,
    Year INT
);

-- Table: Sales (Fact Table)
CREATE TABLE Sales (
    CustomerKey INT,
    EmployeeKey INT,
    OrderDateKey INT,
    DueDateKey INT,
    ShippedDateKey INT,
    ProductKey INT,
    SupplierKey INT,
    ShipperKey INT,
    OrderNo INT,
    OrderLineNo INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    SalesAmount DECIMAL(10, 2),
    Freight DECIMAL(10, 2),
    PRIMARY KEY (OrderNo, OrderLineNo),
    FOREIGN KEY (CustomerKey) REFERENCES Customer(CustomerKey),
    FOREIGN KEY (EmployeeKey) REFERENCES Employee(EmployeeKey),
    FOREIGN KEY (OrderDateKey) REFERENCES Time(TimeKey),
    FOREIGN KEY (DueDateKey) REFERENCES Time(TimeKey),
    FOREIGN KEY (ShippedDateKey) REFERENCES Time(TimeKey),
    FOREIGN KEY (ProductKey) REFERENCES Product(ProductKey),
    FOREIGN KEY (SupplierKey) REFERENCES Supplier(SupplierKey),
    FOREIGN KEY (ShipperKey) REFERENCES Shipper(ShipperKey)
);
