-- Insert mock data into Trainers Table
INSERT INTO Trainers (Name, Specialty) VALUES
('Jane Smith', 'Yoga'),
('Mark Johnson', 'Pilates'),
('Lisa Brown', 'HIIT'),
('Tom Wilson', 'CrossFit'),
('Emily Davis', 'Spin');

-- Insert mock data into Classes Table
INSERT INTO Classes (ClassName, TrainerID, Schedule, MaxParticipants) VALUES
('Morning Yoga', 1, 'Mon, Wed, Fri - 7AM', 20),
('Pilates Core', 2, 'Tue, Thu - 8AM', 15),
('HIIT Blast', 3, 'Mon, Wed - 6PM', 25),
('CrossFit Strength', 4, 'Fri - 7PM', 20),
('Spin Class', 5, 'Sat - 9AM', 30);

-- Insert mock data into Customers Table
INSERT INTO Customers (Name, Email, Phone) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890'),
('Jane Roe', 'jane.roe@example.com', '321-654-0987'),
('Alice Green', 'alice.green@example.com', '111-222-3333'),
('Bob White', 'bob.white@example.com', '444-555-6666'),
('Charlie Black', 'charlie.black@example.com', '777-888-9999');

-- Insert mock data into Bookings Table
INSERT INTO Bookings (CustomerID, ClassID, BookingDate) VALUES
(1, 1, '2023-10-01'),
(2, 2, '2023-10-02'),
(3, 3, '2023-10-03'),
(4, 4, '2023-10-04'),
(5, 5, '2023-10-05'),
(1, 2, '2023-10-06'),
(2, 3, '2023-10-07'),
(3, 4, '2023-10-08'),
(4, 5, '2023-10-09'),
(5, 1, '2023-10-10');

-- Insert mock data into Attendance Table
INSERT INTO Attendance (BookingID, AttendanceDate) VALUES
(1, '2023-10-01'),
(2, '2023-10-02'),
(3, '2023-10-03'),
(4, '2023-10-04'),
(5, '2023-10-05'),
(6, '2023-10-06'),
(7, '2023-10-07'),
(8, '2023-10-08'),
(9, '2023-10-09'),
(10, '2023-10-10');