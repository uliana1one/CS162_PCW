Explanation of the Finance Schema:

    Schema Structure

        1.	Users
    Stores user credentials and information.
        •	Fields: user_id, username, password, email, created_at
        2.	Categories
    Contains income and expense categories.
        •	Fields: category_id, category_name, category_type
        3.	Income
    Tracks user income details.
        •	Fields: income_id, user_id, category_id, amount, source, income_date
        4.	Expenses
    Logs user expenses with descriptions.
        •	Fields: expense_id, user_id, category_id, amount, description, expense_date
        5.	Budgets
    Defines budgets for each user by category and period.
        •	Fields: budget_id, user_id, category_id, budget_amount, budget_period, created_at
        6.	TransactionSummary (View)
    Aggregates total income and total expenses for each user.
        •	Fields: user_id, total_income, total_expenses

    Sample Data

        •	Users: Example users (john_doe, jane_smith).
        •	Categories: Includes sample income (Salary, Freelance) and expenses (Groceries, Rent).
        •	Income: Entries for both users with various sources.
        •	Expenses: Example spending records by category.
        •	Budgets: Monthly budgets for users’ spending categories.

Usage

    This database can be used for:

        •	Tracking Transactions: Logging income and expenses per user and category.
        •	Budget Monitoring: Setting and monitoring category-specific budgets.
        •	Generating Reports: Calculating total income, expenses, and budget performance.
        •	Financial Analysis: Queries for tracking user net income, budget overruns, and more.

Sample Queries for Finance Database

    1. Get Total Income for a Specific User

    This query calculates the total income for a specific user, using their user_id.

    SELECT SUM(amount) AS total_income
    FROM Income
    WHERE user_id = 1; -- Replace 1 with the actual user ID

    2. Get Total Expenses for a Specific User

    This query calculates the total expenses for a specific user.

    SELECT SUM(amount) AS total_expenses
    FROM Expenses
    WHERE user_id = 1; -- Replace 1 with the actual user ID

    3. Get Expenses for a Specific Category

    This query retrieves all expenses for a user in a specific category (e.g., “Groceries”).

    SELECT Expenses.amount, Expenses.description, Expenses.expense_date
    FROM Expenses
    JOIN Categories ON Expenses.category_id = Categories.category_id
    WHERE Categories.category_name = 'Groceries' AND Expenses.user_id = 1; -- Replace with the category name and user ID

    4. Check Remaining Budget for a User in a Specific Category

    This query calculates the remaining budget for a user in a specific category by subtracting the total expenses from the budget amount.

    SELECT (Budgets.budget_amount - IFNULL(SUM(Expenses.amount), 0)) AS remaining_budget
    FROM Budgets
    LEFT JOIN Expenses ON Budgets.category_id = Expenses.category_id AND Budgets.user_id = Expenses.user_id
    WHERE Budgets.user_id = 1 AND Budgets.category_id = (SELECT category_id FROM Categories WHERE category_name = 'Groceries');

    5. Get a List of Income and Expenses for a Specific Month

    This query retrieves all income and expenses for a user in a specific month (e.g., October 2024).

    -- Income for a specific month
    SELECT 'Income' AS type, amount, income_date
    FROM Income
    WHERE strftime('%Y-%m', income_date) = '2024-10' AND user_id = 1

    UNION

    -- Expenses for a specific month
    SELECT 'Expense' AS type, amount, expense_date
    FROM Expenses
    WHERE strftime('%Y-%m', expense_date) = '2024-10' AND user_id = 1;

    6. List All Categories with Their Total Expenses for a Specific User

    This query lists all categories along with the total expenses for each category for a given user.

    SELECT Categories.category_name, SUM(Expenses.amount) AS total_expenses
    FROM Categories
    JOIN Expenses ON Categories.category_id = Expenses.category_id
    WHERE Expenses.user_id = 1 -- Replace 1 with the actual user ID
    GROUP BY Categories.category_name;

Explanation of the Recipies Schema:

	1.	Users: Stores user information, including their username, email, and password.
	2.	Ingredients: Stores the ingredients for recipes.
	3.	Recipes: Contains recipe details like the name, description, instructions, cooking time, and servings.
	4.	RecipeIngredients: Links recipes to their ingredients, including the quantity needed for each ingredient.
	5.	DietaryPreferences: Stores users’ dietary preferences such as vegetarian, vegan, gluten-free, etc.
	6.	MealPlans: Allows users to schedule specific recipes for breakfast, lunch, dinner, or snacks on particular days.
	7.	Favorites: Stores users’ favorite recipes.

How This Database Works:

	•	Users can:
	•	Add dietary preferences to help filter recipes.
	•	Schedule meals using the MealPlans table.
	•	Favorite recipes they enjoy for easy future reference.
	•	Recipes and Ingredients are connected through the RecipeIngredients table, allowing for flexibility when adding new recipes with various ingredients.
	•	Meal Planning allows users to plan their meals for specific dates and meal types (breakfast, lunch, dinner, snack), enabling structured meal preparation.

Example Queries:

	    1.	Get all recipes for a user’s dietary preference:

    SELECT Recipes.recipe_name, Recipes.description 
    FROM Recipes
    JOIN RecipeIngredients ON Recipes.recipe_id = RecipeIngredients.recipe_id
    JOIN DietaryPreferences ON DietaryPreferences.user_id = 1
    WHERE DietaryPreferences.preference_name = 'vegetarian';


	    2.	Get meal plan for a user on a particular day:

    SELECT Recipes.recipe_name, MealPlans.meal_type
    FROM MealPlans
    JOIN Recipes ON MealPlans.recipe_id = Recipes.recipe_id
    WHERE MealPlans.user_id = 1 AND MealPlans.meal_date = '2024-10-08';


        3.	Get all ingredients for a specific recipe:

    SELECT Ingredients.name, RecipeIngredients.quantity
    FROM Ingredients
    JOIN RecipeIngredients ON Ingredients.ingredient_id = RecipeIngredients.ingredient_id
    WHERE RecipeIngredients.recipe_id = 2; -- Garlic Pasta

         4. Get All Recipes Favorited by a Specific User

    This query returns all recipes that a specific user has marked as favorites.

    SELECT Recipes.recipe_name, Recipes.description
    FROM Recipes
    JOIN Favorites ON Recipes.recipe_id = Favorites.recipe_id
    WHERE Favorites.user_id = 1; -- Replace 1 with the desired user's ID

        5. Find Recipes with a Specific Ingredient

    This query returns all recipes that include a specific ingredient (e.g., “Garlic”).

    SELECT Recipes.recipe_name, Recipes.description
    FROM Recipes
    JOIN RecipeIngredients ON Recipes.recipe_id = RecipeIngredients.recipe_id
    JOIN Ingredients ON RecipeIngredients.ingredient_id = Ingredients.ingredient_id
    WHERE Ingredients.name = 'Garlic';


