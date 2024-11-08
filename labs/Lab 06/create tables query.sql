CREATE TABLE Time (
    TimeKey INT PRIMARY KEY IDENTITY(1,1),
    Date DATE NOT NULL,
    Year AS YEAR(Date),
    Month AS MONTH(Date),
    Day AS DAY(Date)
);

CREATE TABLE Country (
    CountryKey INT PRIMARY KEY IDENTITY(1,1),
    CountryName VARCHAR(50) NOT NULL
);

CREATE TABLE Customer (
    CustomerKey INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    State VARCHAR(50),
    CountryKey INT,
    FOREIGN KEY (CountryKey) REFERENCES Country(CountryKey)
);

CREATE TABLE Employee (
    EmployeeKey INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    ManagerKey INT,
    FOREIGN KEY (ManagerKey) REFERENCES Employee(EmployeeKey)
);

CREATE TABLE ProductCategory (
    CategoryKey INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50)
);

CREATE TABLE Product (
    ProductKey INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    CategoryKey INT,
    FOREIGN KEY (CategoryKey) REFERENCES ProductCategory(CategoryKey)
);

CREATE TABLE Sales (
    SalesKey INT PRIMARY KEY IDENTITY(1,1),
    CustomerKey INT,
    EmployeeKey INT,
    ProductKey INT,
    TimeKey INT,
    Amount DECIMAL(10, 2),
    Discount DECIMAL(10, 2),
    FOREIGN KEY (CustomerKey) REFERENCES Customer(CustomerKey),
    FOREIGN KEY (EmployeeKey) REFERENCES Employee(EmployeeKey),
    FOREIGN KEY (ProductKey) REFERENCES Product(ProductKey),
    FOREIGN KEY (TimeKey) REFERENCES Time(TimeKey)
);
