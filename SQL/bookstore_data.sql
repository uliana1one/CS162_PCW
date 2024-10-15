-- Insert mock data into Authors Table
INSERT INTO Authors (Name, Bio) VALUES
('George Orwell', 'British writer, best known for his novels 1984 and Animal Farm.'),
('J.K. Rowling', 'British author, famous for writing the Harry Potter series.'),
('F. Scott Fitzgerald', 'American novelist and short story writer, author of The Great Gatsby.'),
('Mark Twain', 'American author and humorist, known for Adventures of Huckleberry Finn.'),
('J.R.R. Tolkien', 'English writer, poet, and philologist, author of The Lord of the Rings.');

-- Insert mock data into Books Table
INSERT INTO Books (Title, AuthorID, ISBN, Price) VALUES
('1984', 1, '1234567890123', 15.99),
('Animal Farm', 1, '1234567890456', 9.99),
('Harry Potter and the Philosopher''s Stone', 2, '9876543210123', 25.99),
('Harry Potter and the Chamber of Secrets', 2, '9876543210456', 27.99),
('The Great Gatsby', 3, '5647382910123', 13.99),
('Adventures of Huckleberry Finn', 4, '8765432190123', 19.99),
('The Lord of the Rings', 5, '2345678910123', 35.99),
('The Hobbit', 5, '2345678910456', 22.99);

-- Insert mock data into Inventory Table
INSERT INTO Inventory (BookID, Stock) VALUES
(1, 50),
(2, 100),
(3, 30),
(4, 25),
(5, 75),
(6, 45),
(7, 20),
(8, 60);

-- Insert mock data into Customers Table
INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, City A'),
('Jane Smith', 'jane.smith@example.com', '321-654-0987', '456 Oak St, City B'),
('Alice Johnson', 'alice.j@example.com', '987-654-3210', '789 Pine St, City C'),
('Bob White', 'bob.white@example.com', '555-123-4567', '101 Maple St, City D'),
('Charlie Black', 'charlie.black@example.com', '444-987-6543', '202 Birch St, City E');

-- Insert mock data into Orders Table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2023-10-01', 31.98),
(2, '2023-10-02', 25.99),
(3, '2023-10-03', 35.99),
(4, '2023-10-04', 19.99),
(5, '2023-10-05', 45.98);

-- Insert mock data into OrderItems Table
INSERT INTO OrderItems (OrderID, BookID, Quantity, Price) VALUES
(1, 1, 1, 15.99),
(1, 2, 1, 9.99),
(2, 3, 1, 25.99),
(3, 7, 1, 35.99),
(4, 6, 1, 19.99),
(5, 4, 1, 27.99),
(5, 8, 1, 22.99);