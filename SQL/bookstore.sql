-- Authors Table
CREATE TABLE Authors (
    AuthorID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Bio TEXT
);

-- Books Table
CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    AuthorID INTEGER,
    ISBN TEXT UNIQUE,
    Price REAL NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Inventory Table
CREATE TABLE Inventory (
    BookID INTEGER PRIMARY KEY,
    Stock INTEGER NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Customers Table
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    Phone TEXT,
    Address TEXT
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER,
    OrderDate DATE NOT NULL,
    TotalAmount REAL NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INTEGER PRIMARY KEY AUTOINCREMENT,
    OrderID INTEGER,
    BookID INTEGER,
    Quantity INTEGER NOT NULL,
    Price REAL NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);