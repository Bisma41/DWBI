
USE [Lab 06];

-- Insert Sample Data
-- Populate Time Table
INSERT INTO Time (Date) VALUES 
    ('1997-01-01'), ('1997-02-01'), ('1997-03-01'), 
    ('1997-04-01'), ('1997-05-01'), ('1997-06-01');

-- Populate Country Table
INSERT INTO Country (CountryName) VALUES 
    ('USA'), ('Canada'), ('Germany'), ('UK');

-- Populate Customer Table
INSERT INTO Customer (CustomerName, State, CountryKey) VALUES 
    ('Customer A', 'California', 1),
    ('Customer B', 'Ontario', 2),
    ('Customer C', 'Bavaria', 3),
    ('Customer D', 'London', 4);

-- Populate Employee Table
INSERT INTO Employee (EmployeeName, ManagerKey) VALUES 
    ('Alice', NULL),   -- Alice has no manager
    ('Bob', 1),        -- Bob reports to Alice
    ('Charlie', 1),    -- Charlie also reports to Alice
    ('Dave', 2);       -- Dave reports to Bob

-- Populate ProductCategory Table
INSERT INTO ProductCategory (CategoryName) VALUES 
    ('Beverages'), ('Condiments'), ('Confections');

-- Populate Product Table
INSERT INTO Product (ProductName, CategoryKey) VALUES 
    ('Chai', 1),                   -- Beverages
    ('Aniseed Syrup', 1),          -- Beverages
    ('Chef Anton''s Gumbo Mix', 2), -- Condiments
    ('Chocolate', 3);              -- Confections

-- Populate Sales Table
INSERT INTO Sales (CustomerKey, EmployeeKey, ProductKey, TimeKey, Amount, Discount) VALUES 
    (1, 1, 1, 1, 1200.50, 50.00),   -- Sales by Alice to Customer A for Chai
    (2, 2, 2, 2, 1500.00, 100.00),  -- Sales by Bob to Customer B for Aniseed Syrup
    (3, 3, 3, 3, 2100.75, 75.00),   -- Sales by Charlie to Customer C for Gumbo Mix
    (4, 1, 4, 4, 1800.25, 50.00),   -- Sales by Alice to Customer D for Chocolate
    (2, 3, 1, 5, 1300.00, 60.00),   -- Sales by Charlie to Customer B for Chai
    (1, 2, 3, 6, 1600.00, 80.00);   -- Sales by Bob to Customer A for Gumbo Mix
