

-- 1. Retrieve all fitness classes along with their trainer's name and schedule
SELECT Classes.ClassName, Trainers.Name AS Trainer, Classes.Schedule
FROM Classes
JOIN Trainers ON Classes.TrainerID = Trainers.TrainerID;

-- 2. Find all bookings for a specific customer
SELECT Classes.ClassName, Bookings.BookingDate, Classes.Schedule
FROM Bookings
JOIN Classes ON Bookings.ClassID = Classes.ClassID
JOIN Customers ON Bookings.CustomerID = Customers.CustomerID
WHERE Customers.CustomerID = 1;  -- Replace 1 with the actual CustomerID

-- 3. List all customers who attended a specific class
SELECT Customers.Name, Attendance.AttendanceDate
FROM Attendance
JOIN Bookings ON Attendance.BookingID = Bookings.BookingID
JOIN Customers ON Bookings.CustomerID = Customers.CustomerID
WHERE Bookings.ClassID = 1;  -- Replace 1 with the actual ClassID

-- 4. Get the total number of bookings for each class
SELECT Classes.ClassName, COUNT(Bookings.BookingID) AS TotalBookings
FROM Classes
JOIN Bookings ON Classes.ClassID = Bookings.ClassID
GROUP BY Classes.ClassID;

-- 5. Find the schedule and available slots for classes with remaining capacity
SELECT Classes.ClassName, Classes.Schedule, 
       (Classes.MaxParticipants - COUNT(Bookings.BookingID)) AS AvailableSlots
FROM Classes
LEFT JOIN Bookings ON Classes.ClassID = Bookings.ClassID
GROUP BY Classes.ClassID
HAVING AvailableSlots > 0;
``​⬤