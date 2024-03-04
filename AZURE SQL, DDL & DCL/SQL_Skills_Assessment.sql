SELECT TOP 5 c.CategoryName, SUM(od.Quantity) AS TotalQuantity
FROM Categories AS c
JOIN Products AS p ON c.CategoryID = p.CategoryID
JOIN OrderDetails AS od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY TotalQuantity DESC;

SELECT YEAR(o.OrderDate) AS OrderYear, ROUND(AVG(od.UnitPrice * od.Quantity * (1 - od.Discount)),2) AS AvgOrderValue
FROM Orders  AS o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate)
ORDER BY OrderYear;

SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalRevenue DESC;

SELECT p.ProductName, s.CompanyName AS SupplierName
FROM Products  AS p
JOIN Suppliers AS s ON p.SupplierID = s.SupplierID
WHERE p.Discontinued = 1
ORDER BY SupplierName, ProductName;

SELECT o.OrderID, DATEDIFF(day, o.OrderDate, o.ShippedDate) AS NumDaysToShip
FROM Orders AS o
WHERE o.ShippedDate IS NOT NULL;

SELECT c.ContactName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE (SELECT COUNT(*) FROM Orders WHERE CustomerID = c.CustomerID) > 20
ORDER BY c.ContactName, o.OrderDate; 

SELECT r.RegionDescription, YEAR(o.OrderDate) AS OrderYear, ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),2) AS TotalSales
FROM Region AS r
JOIN Territories AS t ON r.RegionID = t.RegionID
JOIN EmployeeTerritories AS et ON t.TerritoryID = et.TerritoryID
JOIN Employees AS e ON et.EmployeeID = e.EmployeeID
JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails AS od ON o.OrderID = od.OrderID
GROUP BY r.RegionDescription, YEAR(o.OrderDate)
ORDER BY r.RegionDescription, OrderYear;

SELECT c.CategoryName, p.ProductName, SUM(od.Quantity) AS TotalUnitsSold
FROM Categories AS c
JOIN Products AS p ON c.CategoryID = p.CategoryID
JOIN OrderDetails AS od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName, p.ProductName
ORDER BY c.CategoryName ASC,TotalUnitsSold ASC;


