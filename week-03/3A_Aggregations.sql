-- #1 Write a query to find the price of the cheapest item that Northwind sells. Then write a
-- second query to find the name of the product that has that price.
USE northwind;
SELECT MIN(unitprice) AS cheapestprice
FROM products;
USE northwind;
SELECT productname
FROM products
WHERE unitprice = 2.5;
-- Cheapest is 2.5 and name is Geitost
-- #2 Write a query to find the average price of all items that Northwind sells
USE northwind;
SELECT CONCAT('$',ROUND(AVG(unitprice), 2)) AS averageprice
FROM products;
-- Avg price is $28.87 
-- #3 Write a query to find the price of the most expensive item that Northwind sells. Then
-- write a second query to find the name of the product with that price, plus the name of
-- the supplier for that product
USE northwind;
SELECT MAX(unipPrice)
FROM products;
SELECT p.productname, s.companyname AS suppliername
FROM products AS p
JOIN suppliers AS s ON p.supplierid = s.supplierid
WHERE p.unitprice = 263.50;
-- #4 Write a query to find total monthly payroll (the sum of all the employees’ monthly salaries)
USE northwind;
SELECT SUM(salary) AS totalmonthlypayroll
FROM employees;
-- #5 Write a query to identify the highest salary and the lowest salary amounts which any
-- employee makes. (Just the amounts, not the specific employees!)
USE northwind;
SELECT MAX(salary) AS highestsalary, MIN(salary) AS lowestsalary
FROM employees;
-- #6 write a query to find the name and supplier ID of each supplier and the number of
-- items they supply. Hint: Join is your friend here
USE northwind;
SELECT s.supplierid, s.companyname, COUNT(p.productid) AS numberofitems
FROM suppliers AS s
JOIN products AS p ON s.supplierid = p.supplierid
GROUP BY s.supplierid, s.companyname
ORDER BY s.supplierid;
-- #7 Write a query to find the list of all category names and the average price for items in each category
USE northwind;
SELECT c.categoryname, ROUND(AVG(p.unitprice),2) AS averageprice
FROM categories AS c
JOIN products AS p ON c.categoryid = p.categoryid
GROUP BY c.categoryname
ORDER BY c.categoryname;
-- #8 Write a query to find, for all suppliers that provide at least 5 items to Northwind, what
-- is the name of each supplier and the number of items they supply
USE northwind;
SELECT s.companyName, COUNT(p.productid) AS numberofitems
FROM suppliers AS s
JOIN products AS p ON s.supplierid = p.supplierid
GROUP BY s.companyname
HAVING COUNT(p.productid) >= 5;
-- Pavlova and 5 items. Plutzer and 5 tiems.
-- #9 Write a query to list products currently in inventory by the product id, product name,
-- and inventory value (calculated by multiplying unit price by the number of units on
-- hand). Sort the results in descending order by value. If two or more have the same
-- value, order by product name. If a product is not in stock, leave it off the list.
USE northwind;
SELECT productid, productname, ROUND((unitprice * unitsinstock), 2) AS inventoryvalue
FROM products
WHERE unitsinstock > 0
ORDER BY inventoryvalue DESC, productname ASC;
