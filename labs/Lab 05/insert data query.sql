-- Insert into Continent
INSERT INTO Continent (ContinentKey, ContinentName) VALUES (1, 'Asia');

-- Insert into Country
INSERT INTO Country (CountryKey, CountryName, CountryCode, CountryCapital, Population, Subdivision, ContinentKey) 
VALUES (1, 'Pakistan', 'PAK', 'Islamabad', 220000000, 'Province', 1);

-- Insert into State
INSERT INTO State (StateKey, StateName, EnglishStateName, StateType, StateCode, StateCapital, RegionName, RegionCode, CountryKey) 
VALUES (1, 'Punjab', 'Punjab', 'Province', 'PB', 'Lahore', 'North', 'N', 1);

-- Insert into City
INSERT INTO City (CityKey, CityName, StateKey, CountryKey) 
VALUES (1, 'Lahore', 1, 1);

-- Insert into Category
INSERT INTO Category (CategoryKey, CategoryName, Description) 
VALUES (1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales');

-- Insert into Product
INSERT INTO Product (ProductKey, ProductName, QuantityPerUnit, UnitPrice, Discontinued, CategoryKey) 
VALUES (1, 'Chai', '10 boxes x 20 bags', 18.00, 0, 1);

-- Insert into Supplier
INSERT INTO Supplier (SupplierKey, CompanyName, Address, PostalCode, CityKey) 
VALUES (1, 'Exotic Liquids', '49 Gilbert St.', 'EC1A 4SD', 1);

-- Insert into Customer
INSERT INTO Customer (CustomerKey, CustomerID, CompanyName, Address, PostalCode, CityKey) 
VALUES (1, 'ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', '12209', 1);

-- Insert into Employee
INSERT INTO Employee (EmployeeKey, FirstName, LastName, Title, BirthDate, HireDate, Address, City, Region, PostalCode, Country, SupervisorKey) 
VALUES (1, 'Nancy', 'Davolio', 'Sales Representative', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.', 'Seattle', 'WA', '98122', 'USA', NULL);

-- Insert into Time
INSERT INTO Time (TimeKey, Date, DayNbWeek, DayNameWeek, DayNbMonth, DayNbYear, WeekNbYear, MonthNumber, MonthName, Quarter, Semester, Year) 
VALUES (1, '2024-11-01', 5, 'Friday', 1, 306, 44, 11, 'November', 4, 2, 2024);

-- Insert into Sales
INSERT INTO Sales (CustomerKey, EmployeeKey, OrderDateKey, DueDateKey, ShippedDateKey, ProductKey, SupplierKey, ShipperKey, OrderNo, OrderLineNo, UnitPrice, Quantity, Discount, SalesAmount, Freight)
VALUES (1, 1, 1, 1, 1, 1, 1, 1, 10248, 1, 18.00, 10, 0.00, 180.00, 32.38);
