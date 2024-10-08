-- Insert users
INSERT INTO Users (username, email, password) 
VALUES ('john_doe', 'john@example.com', 'password123'),
       ('jane_smith', 'jane@example.com', 'password456');

-- Insert ingredients
INSERT INTO Ingredients (name)
VALUES ('Chicken Breast'),
       ('Olive Oil'),
       ('Garlic'),
       ('Onion'),
       ('Salt'),
       ('Pepper'),
       ('Broccoli'),
       ('Pasta');

-- Insert recipes
INSERT INTO Recipes (recipe_name, description, instructions, cooking_time, servings)
VALUES ('Grilled Chicken with Broccoli', 'A healthy grilled chicken dish served with steamed broccoli.', 'Grill the chicken breast, steam the broccoli, and serve together.', 30, 2),
       ('Garlic Pasta', 'Simple pasta dish with garlic and olive oil.', 'Boil the pasta, sauté garlic in olive oil, and mix together.', 20, 4);

-- Insert recipe ingredients
INSERT INTO RecipeIngredients (recipe_id, ingredient_id, quantity)
VALUES (1, 1, '2 pieces'), -- Grilled Chicken recipe uses 2 Chicken Breasts
       (1, 7, '1 head'), -- Grilled Chicken recipe uses 1 head of Broccoli
       (1, 5, '1 tsp'), -- Grilled Chicken uses 1 tsp Salt
       (1, 6, '1/2 tsp'), -- Grilled Chicken uses 1/2 tsp Pepper
       (2, 4, '1 bulb'), -- Garlic Pasta uses 1 bulb of Garlic
       (2, 2, '2 tbsp'), -- Garlic Pasta uses 2 tbsp Olive Oil
       (2, 8, '400g'), -- Garlic Pasta uses 400g Pasta
       (2, 5, '1 tsp'), -- Garlic Pasta uses 1 tsp Salt
       (2, 6, '1/2 tsp'); -- Garlic Pasta uses 1/2 tsp Pepper

-- Insert dietary preferences
INSERT INTO DietaryPreferences (user_id, preference_name)
VALUES (1, 'vegetarian'),
       (2, 'gluten-free');

-- Insert meal plans
INSERT INTO MealPlans (user_id, recipe_id, meal_type, meal_date)
VALUES (1, 2, 'dinner', '2024-10-08'),
       (2, 1, 'lunch', '2024-10-09');

-- Insert favorite recipes
INSERT INTO Favorites (user_id, recipe_id)
VALUES (1, 2), -- John Doe favorites Garlic Pasta
       (2, 1); -- Jane Smith favorites Grilled Chicken with Broccoli