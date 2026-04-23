
-- #1 Write a query to list the product id, product name, and unit price of every product that Northwind sells.
USE northwind;
SELECT ProductID, ProductName, UnitPrice
FROM products;
-- #2 Write a query to identify the products where the unit price is $7.50 or less
USE northwind;
SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE UnitPrice <= 7.50;
-- #3 What are the products that we carry where we have no units on hand, but 1 or more units are on backorder.
SELECT ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder
FROM products
WHERE UnitsInStock = 0
AND UnitsOnOrder >= 1 
-- A: Only one product, productID: 31 
-- #4 Examine the products table: How does it identify the type (category) of each item sold? Where can you find a list of all categories? 
-- Write a set of queries to answer these questions, ending with a query that creates a list of all the seafood items we carry
SELECT *
FROM products
-- The products table uses a categoryID to distinguish the products
SELECT * 
FROM categories
-- You can find all of the categories by querying the categories table. 
SELECT * 
FROM products 
WHERE categoryid = 8
-- 12 seafood products were listed.
-- #5 How do you know what supplier each product comes from? Where can you find info on suppliers?
-- Write a set of queries to find the specific identifier for "Tokyo Traders" and then find all products from that supplier
SELECT *
FROM products
WHERE supplierid = 4
-- Each product has a supplierID. You can find more information about the supplier, listed under the suppliers table. There are 3 products from Tokyo Traders.
-- #6 How many employees work at northwind? What employees have "manager" somewhere in their job title?
SELECT *
FROM employees
WHERE title LIKE '%manager%'
-- 9 employees work at Northwind. There is 1 employee with manager in their title. 