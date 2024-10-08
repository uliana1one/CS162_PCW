PRAGMA foreign_keys = ON;



-- Users table to store user data
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories table for income/expense categories
CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL,
    category_type TEXT CHECK(category_type IN ('income', 'expense')) NOT NULL
);

-- Income table to store income details
CREATE TABLE Income (
    income_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    amount REAL NOT NULL,
    source TEXT,
    income_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Expense table to store expense details
CREATE TABLE Expenses (
    expense_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    amount REAL NOT NULL,
    description TEXT,
    expense_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Budgets table to store user budgets for specific categories
CREATE TABLE Budgets (
    budget_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    budget_amount REAL NOT NULL,
    budget_period TEXT CHECK(budget_period IN ('monthly', 'weekly', 'yearly')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Transactions summary table (optional for reports or dashboard views)
CREATE VIEW TransactionSummary AS
SELECT user_id,
       SUM(CASE WHEN category_type = 'income' THEN amount ELSE 0 END) AS total_income,
       SUM(CASE WHEN category_type = 'expense' THEN amount ELSE 0 END) AS total_expenses
FROM (
    SELECT user_id, category_id, amount, 'income' AS category_type FROM Income
    UNION ALL
    SELECT user_id, category_id, amount, 'expense' AS category_type FROM Expenses
) AS Transactions
GROUP BY user_id;