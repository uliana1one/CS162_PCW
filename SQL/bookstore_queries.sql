
-- 1. Retrieve all books along with their author's name
SELECT Books.Title, Authors.Name AS Author, Books.Price
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;

-- 2. Find books that are out of stock
SELECT Books.Title, Authors.Name AS Author
FROM Books
JOIN Inventory ON Books.BookID = Inventory.BookID
JOIN Authors ON Books.AuthorID = Authors.AuthorID
WHERE Inventory.Stock = 0;

-- 3. List all customers who placed orders in the past month
SELECT Customers.Name, Customers.Email, Orders.OrderDate
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate >= DATE('now', '-30 days');

-- 4. Get the total revenue from all orders
SELECT SUM(Orders.TotalAmount) AS TotalRevenue
FROM Orders;

-- 5. List all the books in a specific order with their quantities and total cost
SELECT Books.Title, OrderItems.Quantity, OrderItems.Quantity * OrderItems.Price AS TotalCost
FROM OrderItems
JOIN Books ON OrderItems.BookID = Books.BookID
WHERE OrderItems.OrderID = 1;  -- Replace 1 with the actual OrderID you want to check