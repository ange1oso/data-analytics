-- #1 Create a single query to list the product id, product name, unit price and category 
-- name of all products. Order by category name and within that, by product name
USE northwind;
-- 'p' is the nickname for the Products table
-- 'c' is the nickname for the Categories table
SELECT p.productID, p.productname, p.unitprice, c.categoryname
FROM products AS p
JOIN categories AS c ON p.categoryid = c.categoryid
ORDER BY c.categoryname, p.productname;
-- #2 Create a single query to list the product id, product name, unit price and supplier 
-- name of all products that cost more than $75. Order by product name
USE northwind;
SELECT p.productid, p.productname, p.unitprice, s.companyname AS suppliername
FROM products AS p
JOIN suppliers AS s ON p.supplierid = s.supplierid
WHERE p.unitprice > 75
ORDER BY p.productname;
-- #3 Create a single query to list the product id, product name, unit price, 
-- category name, and supplier name of all products. Order by product name.
USE northwind;
SELECT p.productid, p.productname, p.unitprice, c.categoryname, s.companyname AS suppliername
FROM products AS p
JOIN categories AS c ON p.categoryid = c.categoryid
JOIN suppliers AS s ON p.supplierid = s.supplierid
ORDER BY p.productname;
-- #4 Create a single query to list the order id, ship name, ship address, 
-- and shipping company name of every order that shipped to Germany. 
-- Assign the shipping company name the alias ‘Shipper.’ 
-- Order by the name of the shipper, then the name of who it shipped to.
USE northwind;
SELECT o.orderid, o.shipname, o.shipaddress, o.shipcountry, s.companyname AS Shipper
FROM orders AS o
JOIN shippers AS s ON o.shipvia = s.shipperid
WHERE o.shipcountry = 'Germany'
ORDER BY Shipper, o.shipname;
-- #5 Start from the same query as above (#4), but omit OrderID and add logic to group by
-- ship name, with a count of how many orders were shipped for that ship name
USE northwind;
SELECT o.shipname, s.companyname AS shipper, COUNT(*) AS ordercount
FROM orders AS o
JOIN shippers AS s ON o.shipvia = s.shipperid
WHERE o.shipcountry = 'Germany'
GROUP BY o.shipname, s.companyname
ORDER BY o.shipname; 
-- #6 Create a single query to list the order id, order date, ship name, ship address of all
-- orders that included Sasquatch Ale.
USE northwind;
SELECT o.orderid, o.orderdate, o.shipname, o.shipaddress, p.productname
FROM orders AS o
JOIN `Order Details` AS od ON o.orderid = od.orderid
JOIN products AS p ON od.productid = p.productid
WHERE p.productname = 'Sasquatch Ale'; 
