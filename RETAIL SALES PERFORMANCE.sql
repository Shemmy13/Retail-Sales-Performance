CREATE DATABASE RETAIL_SALES_PERFORMANCE
USE RETAIL_SALES_PERFORMANCE

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    Region VARCHAR(50),
    SignupDate DATE
)

INSERT INTO Customers VALUES
(1,'John Smith','Consumer','North','2022-01-15'),
(2,'Mary Johnson','Consumer','South','2022-02-10'),
(3,'David Brown','Corporate','East','2022-03-05'),
(4,'Sarah Wilson','Consumer','West','2022-04-12'),
(5,'ABC Ltd','Corporate','North','2022-05-20'),
(6,'Global Corp','Corporate','South','2022-06-01'),
(7,'James Taylor','Consumer','East','2022-07-14'),
(8,'Sophia White','Consumer','West','2022-08-22'),
(9,'Prime Inc','Corporate','North','2022-09-11'),
(10,'Elite LLC','Corporate','South','2022-10-05'),
(11,'Daniel Green','Consumer','East','2022-11-18'),
(12,'Emma Scott','Consumer','West','2022-12-01'),
(13,'Summit Co','Corporate','North','2023-01-10'),
(14,'Vision Ltd','Corporate','South','2023-02-14'),
(15,'Michael King','Consumer','East','2023-03-19'),
(16,'Olivia Adams','Consumer','West','2023-04-25'),
(17,'Bright Corp','Corporate','North','2023-05-30'),
(18,'Dynamic LLC','Corporate','South','2023-06-15'),
(19,'Ethan Hall','Consumer','East','2023-07-20'),
(20,'Isabella Young','Consumer','West','2023-08-05')
INSERT INTO Customers VALUES
(21,'Liam Carter','Consumer','North','2023-09-10'),
(22,'Ava Martinez','Consumer','South','2023-09-15'),
(23,'NextGen Ltd','Corporate','East','2023-09-20'),
(24,'Noah Anderson','Consumer','West','2023-10-01'),
(25,'Skyline Corp','Corporate','North','2023-10-05'),
(26,'Mia Thompson','Consumer','South','2023-10-12'),
(27,'Vertex LLC','Corporate','East','2023-10-18'),
(28,'Lucas Moore','Consumer','West','2023-11-02'),
(29,'Pinnacle Inc','Corporate','North','2023-11-10'),
(30,'Amelia Jackson','Consumer','South','2023-11-15'),
(31,'LogiTech Solutions','Corporate','East','2023-11-20'),
(32,'Elijah Martin','Consumer','West','2023-12-01'),
(33,'Quantum Corp','Corporate','North','2023-12-05'),
(34,'Harper Lee','Consumer','South','2023-12-10'),
(35,'FutureWave Ltd','Corporate','East','2023-12-18'),
(36,'Benjamin Clark','Consumer','West','2024-01-03'),
(37,'Nova Industries','Corporate','North','2024-01-08'),
(38,'Charlotte Lewis','Consumer','South','2024-01-15'),
(39,'Apex Group','Corporate','East','2024-01-20'),
(40,'Henry Walker','Consumer','West','2024-02-01'),
(41,'Titan Holdings','Corporate','North','2024-02-06'),
(42,'Evelyn Hall','Consumer','South','2024-02-14'),
(43,'Summit Edge Ltd','Corporate','East','2024-02-20'),
(44,'Alexander Young','Consumer','West','2024-03-01'),
(45,'BluePeak Corp','Corporate','North','2024-03-06'),
(46,'Scarlett Allen','Consumer','South','2024-03-12'),
(47,'PrimeAxis LLC','Corporate','East','2024-03-18'),
(48,'Daniel Wright','Consumer','West','2024-04-01'),
(49,'Crestline Inc','Corporate','North','2024-04-07'),
(50,'Lily Scott','Consumer','South','2024-04-15')
SELECT * FROM Customers

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    CostPrice DECIMAL(10,2)
)

INSERT INTO Products VALUES
(116,'iPhone','Tech','Phones',720),
(117,'TabX','Tech','Phones',310),
(118,'Samsumg','Tech','Phones',950),
(119,'DeskPro','Furniture','Chairs',280),
(120,'ChairX','Furniture','Chairs',140),
(121,'Asus','Tech','Phones',190),
(122,'Motorola','Tech','Phones',45),
(123,'Xiaomi','Tech','Phones',30),
(124,'Sofa8','Furniture','Chairs',820),
(125,'ShelfX','Furniture','Chairs',170)

SELECT * FROM Products

CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY,
    SalespersonName VARCHAR(100),
    Team VARCHAR(50),
    HireDate DATE
)

INSERT INTO Salespersons VALUES
(201,'Michael Adams','North','2021-06-01'),
(202,'Sarah Lee','South','2020-09-15'),
(203,'David Brown','South','2022-02-20'),
(204,'Emily Clark','North','2021-11-05'),
(205,'James Carter','North','2022-08-14'),
(206,'Sophia Turner','South','2021-04-18')

SELECT * FROM Salespersons

CREATE TABLE DateTable (
    Date DATE PRIMARY KEY,
    Year INT,
    Month VARCHAR(20),
    MonthNo INT,
    Quarter VARCHAR(5)
)

DECLARE @StartDate DATE = '2023-01-01';
DECLARE @EndDate DATE = '2024-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO DateTable
    SELECT 
        @StartDate,
        YEAR(@StartDate),
        DATENAME(MONTH,@StartDate),
        MONTH(@StartDate),
        'Q' + CAST(DATEPART(QUARTER,@StartDate) AS VARCHAR);

    SET @StartDate = DATEADD(DAY,1,@StartDate);
END

select * from DateTable


CREATE TABLE Sales (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    ShipDate DATE,
    CustomerID INT,
    ProductID INT,
    SalespersonID INT,
    Quantity INT,
    SalesAmount DECIMAL(12,2),
    Discount DECIMAL(10,2),

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID)
)



DECLARE @Counter INT = 1;

WHILE @Counter <= 120
BEGIN
    -- Pick a random existing CustomerID
    DECLARE @CustomerID INT;
    SELECT TOP 1 @CustomerID = CustomerID FROM Customers ORDER BY NEWID();

    -- Pick a random existing ProductID
    DECLARE @ProductID INT;
    SELECT TOP 1 @ProductID = ProductID FROM Products ORDER BY NEWID();

    -- Pick a random existing SalespersonID
    DECLARE @SalespersonID INT;
    SELECT TOP 1 @SalespersonID = SalespersonID FROM Salespersons ORDER BY NEWID();

    -- Random Quantity between 1-5
    DECLARE @Quantity INT = FLOOR(RAND()*5)+1;

    -- Random Order Date between 2023-01-01 and 2024-12-31
    DECLARE @OrderDate DATE = DATEADD(DAY,FLOOR(RAND()*730),'2023-01-01');

    -- Ship Date 1-5 days after OrderDate
    DECLARE @ShipDate DATE = DATEADD(DAY,FLOOR(RAND()*5)+1,@OrderDate);

    -- Get Product CostPrice
    DECLARE @CostPrice DECIMAL(10,2);
    SELECT @CostPrice = CostPrice FROM Products WHERE ProductID = @ProductID;

    -- Calculate SalesAmount with random markup 0%-50%
    DECLARE @SalesAmount DECIMAL(12,2) = @CostPrice * @Quantity * (1 + RAND()*0.5);

    -- Calculate Discount between 0%-10% of SalesAmount
    DECLARE @Discount DECIMAL(12,2) = @SalesAmount * (RAND()*0.1);

    -- Insert into Sales table
    INSERT INTO Sales
    VALUES (
        1000 + @Counter,   -- OrderID
        @OrderDate,
        @ShipDate,
        @CustomerID,
        @ProductID,
        @SalespersonID,
        @Quantity,
        @SalesAmount,
        @Discount
    )

    -- Increment counter
    SET @Counter = @Counter + 1;
END

SELECT * FROM Sales

