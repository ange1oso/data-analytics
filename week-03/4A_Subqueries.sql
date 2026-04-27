-- #1 What is the product name(s) of the most expensive products? 
-- HINT: Find the max price in a subquery and then use that value to find products whose price equals that value. 
USE northwind;
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products);
-- A: Cte de Blaye at $263.5
-- #2 What is the product name(s) and categories of the least expensive products? 
-- HINT: Find the min price in a subquery and then use that in your more complex query that joins products with categories.
USE northwind;
SELECT p.productname, c.categoryname
FROM products AS p
JOIN categories AS c ON p.categoryid = c.categoryid
WHERE p.unitprice = (SELECT MIN(unitprice) FROM products);
-- A: Geitost and Dairy Products
-- #3 What is the order id, shipping name and shipping address of all orders shipped via "Federal Shipping"? 
-- HINT: Find the shipper id of "Federal Shipping" in a subquery and then use that value to find the orders that used that shipper.
USE northwind;
SELECT orderid, shipname, shipaddress
FROM orders
WHERE shipvia = (SELECT shipperid FROM shippers WHERE companyname = 'Federal Shipping');
-- #4 What are the order ids of the orders that included "Sasquatch Ale"? 
-- HINT: Find the product id of "Sasquatch Ale" in a subquery and then 
-- use that value to find the matching orders from the order details table.
USE northwind;
SELECT orderid
FROM `Order Details`
WHERE productid = (SELECT productid FROM products WHERE productname = 'Sasquatch Ale');
-- #5 What is the name of the employee that sold order 10266?
-- HINT:Find the employee id for order 10266 in a subquery and then use that value to find the employee's name from the employees table.
USE northwind;
SELECT firstname, lastname
FROM employees
WHERE employeeid = (SELECT employeeid FROM orders WHERE orderid = 10266);
-- Janet Leverling
-- #6 What is the name of the customer that bought order 10266?
USE northwind;
SELECT companyname
FROM customers
WHERE customerid = (SELECT customerid FROM orders WHERE orderID = 10266);
-- Wartian Herkku