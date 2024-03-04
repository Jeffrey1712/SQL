CREATE VIEW TopSellingProducts AS
SELECT TOP 10 p.ProductID, p.ProductName, c.CategoryName, SUM(od.Quantity) AS TotalQuantity, ROUND(SUM(od.UnitPrice * od.Quantity * ( 1 - od.discount)),2) AS TotalRevenue
FROM Products AS p
JOIN OrderDetails  AS od ON p.ProductID = od.ProductID
JOIN Categories AS c ON p.CategoryID = c.CategoryID
GROUP BY p.ProductID, p.ProductName, c.CategoryName
ORDER BY TotalRevenue DESC;

SELECT *
FROM TopSellingProducts; 

GRANT SELECT, INSERT, DELETE ON TopSellingProducts TO SalesManager;

CREATE VIEW EmployeeTotalSales AS
SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM Employees AS e
JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails AS od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;

SELECT *
FROM EmployeeTotalSales;


CREATE VIEW CustomerTotalPurchases AS
SELECT c.CustomerID, c.CompanyName, SUM(od.UnitPrice * od.Quantity) AS TotalPurchases
FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID
JOIN OrderDetails AS od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName;

SELECT *
FROM CustomerTotalPurchases;

REVOKE INSERT, DELETE ON CustomerTotalPurchases FROM CustomerServiceManager;



