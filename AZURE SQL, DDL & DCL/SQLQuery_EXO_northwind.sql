CREATE TABLE CustomerFeedback (
  FeedbackID INT PRIMARY KEY,
  CustomerID INT NOT NULL,
  FeedbackText NVARCHAR(1000) NOT NULL,
  FeedbackDate DATETIME NOT NULL
);

SELECT TOP(10) *
FROM CustomerFeedback;

ALTER TABLE Products
ADD CategoryID INT;

ALTER TABLE Customers
ALTER COLUMN CompanyName NVARCHAR(100) NOT NULL;

ALTER TABLE Orders
ALTER COLUMN ShipCity NVARCHAR(100) NOT NULL;

CREATE TABLE OrderItems (
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  UnitPrice DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (OrderID, ProductID)
);

SELECT TOP(10) *
FROM OrderItems;

ALTER TABLE OrderItems
ADD CONSTRAINT CK_OrderItems_Quantity CHECK (Quantity > 0);

ALTER TABLE OrderItems
ALTER COLUMN UnitPrice DECIMAL(10,2) NOT NULL;

ALTER TABLE Customers
ADD PhoneNumber VARCHAR;

ALTER TABLE Customers
ADD CONSTRAINT CK_Customers_PhoneNumber
CHECK (PhoneNumber LIKE '%[0-9()-]%' AND LEN(PhoneNumber) >= 10 AND LEN(PhoneNumber) <= 20);

CREATE TABLE EmployeeSales (
   EmployeeID INT NOT NULL,
   OrderID INT NOT NULL,
   SalesAmount DECIMAL(10,2) NOT NULL,
   PRIMARY KEY (EmployeeID, OrderID),
   CONSTRAINT FK_EmployeeSales_Employee FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
   CONSTRAINT FK_EmployeeSales_Orders FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

ALTER TABLE EmployeeSales
ADD CONSTRAINT CK_EmployeeSales_SalesAmount CHECK (SalesAmount > 0);

ALTER TABLE Products
DROP CONSTRAINT DF_Products_Discontinued ;
ALTER TABLE Products
DROP COLUMN Discontinued;

ALTER TABLE CustomerFeedback
ADD CONSTRAINT CK_CustomerFeedback_FeedbackDate DATETIME NOT NULL;

ALTER TABLE CustomerFeedback
ALTER COLUMN FeedbackDate DATETIME NOT NULL;

ALTER TABLE OrderItems
ADD CONSTRAINT FK_OrderItems_Products
FOREIGN KEY (ProductID) REFERENCES Products (ProductID);

