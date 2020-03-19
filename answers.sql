-- create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color.
-- id should be an auto-incrementing id/primary key - Use type: SERIAL
CREATE TABLE person
(person_id SERIAL PRIMARY KEY,
 name VARCHAR(150) NOT NULL,
 age INT NOT NULL,height FLOAT NOT NULL,
 city VARCHAR(200) NOT NULL,
 favorite_color VARCHAR(200) );

-- Add 5 different people into the person database. Remember to not include the person_id because it should auto-increment.
INSERT INTO person
(name, age, height, city, favorite_color)
VALUES
('Alex', 22, 1.65, 'Dallas', 'Black'),
('Janaya', 30, 1.60, 'Road Island', 'Red'),
('Sam', 25, 1.95, 'Dallas-DFW', 'Green'),
('Alana', 20, 1.58, 'Somewhere in Alabama', 'Purple'),
('Gio', 26, 1.68, 'Los Angels', 'Yellow')

-- List all the people in the person table by height from tallest to shortest.
SELECT * FROM person ORDER BY height DESC;

-- List all the people in the person table by height from shortest to tallest.
SELECT * FROM person ORDER BY height ASC;

-- List all the people in the person table by age from oldest to youngest.
SELECT * FROM person ORDER BY age DESC;

-- List all the people in the person table older than age 18.
SELECT * FROM person WHERE age > 18;

-- List all the people in the person table that are exactly 20.
SELECT * FROM person WHERE age = 20;

-- List all the people in the person table that are less than 20 and older than 30.
SELECT * FROM person WHERE age < 20 OR age > 30;

-- List all the people in the person table that are not 27 (Use not equals).
SELECT * FROM person WHERE age != 27;

-- List all the people in the person table where their favorite color is not Red.
SELECT * FROM person WHERE favorite_color != 'Red';

-- List all the people in the person table where their favorite color is not Red and is not Blue.
SELECT * FROM person WHERE favorite_color != 'Red' AND favorite_color != 'Blue';

-- List all the people in the person table where their favorite color is Orange or Green.
SELECT * FROM person WHERE favorite_color = 'Orange' OR favorite_color = 'Green';

-- List all the people in the person table where their favorite color is Orange, Green or Blue (use IN).
SELECT * FROM person WHERE favorite_color IN ( 'Orange', 'Green', 'Blue' );

-- List all the people in the person table where their favorite color is yellow or purple (use IN).
SELECT * FROM person WHERE favorite_color IN ( 'yellow', 'purple' );

-- ********************************************************************

-- create a table called orders that records: order_id, person_id, product_name, product_price, quantity.

CREATE TABLE orders (
 order_id SERIAL PRIMARY KEY,
 person_id INT,
 product_name  VARCHAR(200) NOT NULL,
 product_price NUMERIC NOT NULL,
 quantity INT NOT NULL
)

-- Add 5 orders to the orders table.
    -- Make orders for at least two different people.
    -- person_id should be different for different people.

INSERT INTO orders (
  person_id,
  product_name,
  product_price,
  quantity
)
VALUES 
 (0 , 'milk', 4.75 ,2 ),
 (1 , 'Chocolate', 1.25, 1),
 (2 , 'bananas', 2.01, 3),
 (3, 'cheese', 3.80, 5),
 (4, 'beens', 4.33, 3)

-- Select all the records from the orders table.
SELECT * FROM orders;
-- Calculate the total number of products ordered.
SELECT SUM(quantity) FROM orders
-- Calculate the total order price.
SELECT SUM(product_price * quantity) FROM orders
-- Calculate the total order price by a single person_id.
-- The value of person_id depends on what IDs you used. Use a valid ID from your table
SELECT SUM(product_price * quantity) FROM orders WHERE person_id = 0

-- ********************************************************************

-- Add 3 new artists to the artist table. ( It's already created )
INSERT INTO artist (name)
VALUES
 ('Kiril'),
 ('Anton'),
 ('David')
-- Select 10 artists in reverse alphabetical order.
SELECT * FROM artist ORDER BY name DESC LIMIT 10
-- Select 5 artists in alphabetical order.
SELECT * FROM artist ORDER BY name ASC LIMIT 5
-- Select all artists that start with the word 'Black'.
SELECT * FROM artist WHERE name LIKE 'Black%'
-- Select all artists that contain the word 'Black'.
SELECT * FROM artist WHERE name LIKE '%Black%'

-- ********************************************************************

-- List all employee first and last names only that live in Calgary.
SELECT first_name, last_name FROM employee WHERE city = 'Calgary'
-- Find the birthdate for the youngest employee.
SELECT MAX(birth_date) from employee
-- Find the birthdate for the oldest employee.
SELECT MIN(birth_date) from employee
-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
-- You will need to query the employee table to find the Id for Nancy Edwards
SELECT * FROM employee WHERE reports_to = 2
-- Count how many people live in Lethbridge.
SELECT COUNT(*) FROM employee WHERE city = 'Lethbridge'

-- ********************************************************************

-- Count how many orders were made from the USA.
SELECT COUNT(*) FROM invoice WHERE billing_country = 'USA'
-- Find the largest order total amount.
SELECT MAX(total) FROM invoice
-- Find the smallest order total amount.
SELECT MIN(total) FROM invoice
-- Find all orders bigger than $5.
SELECT * FROM invoice WHERE total > 5
-- Count how many orders were smaller than $5.
SELECT COUNT(*) FROM invoice WHERE total < 5
-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*) FROM invoice WHERE billing_state IN ('CA','TX','AZ')
-- Get the average total of the orders.
SELECT AVG(total) FROM invoice
-- Get the total sum of the orders.
SELECT SUM(total) FROM invoice


