-- Insert sample users
INSERT INTO Users (username, password, email) 
VALUES ('john_doe', 'password123', 'john@example.com'),
       ('jane_smith', 'password456', 'jane@example.com');

-- Insert sample categories (both income and expense categories)
INSERT INTO Categories (category_name, category_type)
VALUES ('Salary', 'income'),
       ('Freelance', 'income'),
       ('Groceries', 'expense'),
       ('Rent', 'expense'),
       ('Entertainment', 'expense');

-- Insert sample income for users
INSERT INTO Income (user_id, category_id, amount, source, income_date)
VALUES (1, 1, 5000.00, 'Full-time Job', '2024-10-01'),
       (1, 2, 800.00, 'Freelance Project', '2024-10-02'),
       (2, 1, 4500.00, 'Full-time Job', '2024-09-30'),
       (2, 2, 1000.00, 'Consulting', '2024-09-28');

-- Insert sample expenses for users
INSERT INTO Expenses (user_id, category_id, amount, description, expense_date)
VALUES (1, 3, 150.00, 'Grocery Store', '2024-10-02'),
       (1, 4, 1200.00, 'October Rent', '2024-10-01'),
       (1, 5, 50.00, 'Movie Night', '2024-10-03'),
       (2, 3, 200.00, 'Supermarket', '2024-09-29'),
       (2, 4, 1000.00, 'September Rent', '2024-09-30'),
       (2, 5, 75.00, 'Concert', '2024-09-25');

-- Insert sample budgets for users
INSERT INTO Budgets (user_id, category_id, budget_amount, budget_period)
VALUES (1, 3, 500.00, 'monthly'), -- Budget for Groceries
       (1, 4, 1200.00, 'monthly'), -- Budget for Rent
       (1, 5, 100.00, 'monthly'), -- Budget for Entertainment
       (2, 3, 450.00, 'monthly'), -- Budget for Groceries
       (2, 4, 1000.00, 'monthly'); -- Budget for Rent