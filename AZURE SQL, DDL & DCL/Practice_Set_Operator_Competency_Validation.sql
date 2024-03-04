SELECT DISTINCT City FROM Customers
UNION
SELECT DISTINCT City FROM Suppliers;

SELECT COUNT(*) FROM (
    SELECT DISTINCT Country FROM Customers
    UNION
    SELECT DISTINCT Country FROM Suppliers
) AS CombinedCountries;

SELECT DISTINCT Country FROM Customers
INTERSECT
SELECT DISTINCT Country FROM Suppliers;

SELECT DISTINCT EmployeeID, OrderID FROM Orders
WHERE Freight >= 100;

SELECT DISTINCT EmployeeID FROM Orders
WHERE Freight >= 100
UNION
SELECT DISTINCT EmployeeID FROM Orders
WHERE Freight <= 50;

SELECT DISTINCT EmployeeID FROM Orders
WHERE Freight >= 100 OR Freight <= 50;

SELECT DISTINCT EmployeeID, ShipVia FROM Orders
WHERE ShipVia = 1
EXCEPT
SELECT DISTINCT EmployeeID, ShipVia FROM Orders
WHERE ShipVia = 4;

SELECT DISTINCT CategoryID, UnitPrice FROM Products
WHERE UnitPrice >= 20
INTERSECT
SELECT DISTINCT CategoryID, UnitPrice FROM Products
WHERE UnitPrice < 10;

SELECT DISTINCT CategoryID FROM Products
WHERE UnitPrice >= 20
INTERSECT
SELECT DISTINCT CategoryID FROM Products
WHERE UnitPrice < 10;

SELECT DISTINCT CategoryID FROM Products
WHERE UnitPrice >= 20
EXCEPT
SELECT DISTINCT CategoryID FROM Products
WHERE UnitPrice < 10;

SELECT COUNT(*) FROM (
    SELECT DISTINCT SupplierID FROM Suppliers
    WHERE Country = 'USA'
    EXCEPT
    SELECT DISTINCT SupplierID FROM Suppliers
    WHERE Country = 'UK'
) AS UniqueSuppliers;