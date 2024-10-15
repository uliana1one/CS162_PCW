-- Trainers Table
CREATE TABLE Trainers (
    TrainerID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Specialty TEXT
);

-- Classes Table
CREATE TABLE Classes (
    ClassID INTEGER PRIMARY KEY AUTOINCREMENT,
    ClassName TEXT NOT NULL,
    TrainerID INTEGER,
    Schedule TEXT NOT NULL,
    MaxParticipants INTEGER NOT NULL,
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)
);

-- Customers Table
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    Phone TEXT
);

-- Bookings Table
CREATE TABLE Bookings (
    BookingID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER,
    ClassID INTEGER,
    BookingDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- Attendance Table
CREATE TABLE Attendance (
    AttendanceID INTEGER PRIMARY KEY AUTOINCREMENT,
    BookingID INTEGER,
    AttendanceDate DATE NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);