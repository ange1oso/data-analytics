-- Angel S. Osorio
-- Brand: Diageo 
-- Project: Iowa Liquor Database Queries
-- #1 Create a list of all transactions for your chosen [Category/Vendor] that took place in
-- the last quarter of 2014, sorted by the total sale amount from highest to lowest.
-- (Strength: Identifying high-volume peak periods)
SELECT *
-- COUNT(*) AS total_transaction_count , if I wanted to count all transactions for Q4 2014
FROM sales 
WHERE vendor LIKE '%Diageo%' 
  AND date BETWEEN '2014-10-01' AND '2014-12-31'
  ORDER BY total DESC
 -- 68,320 sales for Diageo in Q4 2014
 -- Summing the total revenue for Diageo in Q4 2014
SELECT SUM(total) ::money AS total_revenue
FROM sales 
WHERE vendor LIKE '%Diageo%' 
  AND date BETWEEN '2014-10-01' AND '2014-12-31';
 -- $12,637,297.04 in total sales revenue for Q4 2014
 -- #2 Which transactions for your [Category/Vendor] had a bottle quantity greater than 12?
-- Display the date, store number, item description, and total amount.
-- (Strength: Identifying bulk buyers or wholesale-style transactions)
SELECT date, store, description, total
FROM sales
WHERE vendor LIKE 'Diageo%'
	AND date BETWEEN '2014-10-01' AND '2014-12-31'
	AND bottle_qty > 12
	ORDER BY total 
-- 6780 sales with a bottle quantity greater than 12
--#3 Find all products in the products_table whose item_description contains a specific
-- keyword (e.g., 'Limited', 'Spiced'). What categories do they belong to?
-- (Opportunity: Identifying niche product variants).
SELECT *
FROM sales
WHERE vendor LIKE 'Diageo%'
	AND date BETWEEN '2014-10-01' AND '2014-12-31'
	AND description LIKE 'Crown%'
	ORDER BY total DESC;
-- 9,399 Crown Royal sales in Q4 2014
-- 64,156 total sales in database
-- 56,251 total sales in 2014-01-01>2014-12-31 
-- last crown transac. was on 2014-12-09
-- 7,905 total sales in 2015-01-01>2015-02-26
-- #4 What is the total sales revenue and the average bottle price (btl_price) for
-- your chosen Vendor?
-- (Strength/Baseline: Establishing the financial footprint).
SELECT vendor,COUNT(*) AS total_transactions,
SUM(total::money) AS total_revenue, 
ROUND(AVG(btl_price::numeric), 2) AS avg_bottle_price,
SUM(bottle_qty) AS total_bottles_sold
FROM sales
WHERE vendor LIKE '%Diageo%'
 AND date BETWEEN '2015-01-01' AND '2015-12-31'
GROUP BY vendor
-- In 2014, the average bottle price was $17.66, 4,377,475 total bottles sold
-- and 457,033 total transactions
-- In 2015, the average bottle price was $18, 490,413 bottles sold, 54,054 transactions.
-- #5 How many transactions were recorded for each specific item description within your
-- chosen vendor? Which specific product is the most frequently purchased?
-- (Strength: Identifying your "hero" product).
SELECT description,
    COUNT(*) AS total_transactions,
    SUM(bottle_qty) AS total_bottles_sold,
    SUM(total::money) AS total_revenue,
    ROUND(AVG(btl_price::numeric), 2) AS avg_bottle_price
FROM sales
WHERE vendor LIKE '%Diageo%'
  AND date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY description
ORDER BY total_revenue DESC;
-- In 2014, Seagrams 7 Crown BI Whiskey was the most sold product(35,474 transactions)
-- Most revenue was Captain Morgan with $12,307,709.53 
-- In 2015, "Seagrams" again had 4,103 transactions. 
-- Most revenue was Captain Morgan with $1,465,042.72
-- #6 Which store generated the highest total revenue for your vendor?
-- Which generated the lowest (but still greater than zero)?
-- (Strength vs. Weakness: Identifying your best and worst retail partners).
SELECT s.store, st.name AS store_name, st.store_address,
    COUNT(*) AS total_transactions,
    SUM(s.bottle_qty) AS total_bottles_sold,
    SUM(s.total::money) AS total_revenue, 
	ROUND(AVG(s.btl_price::numeric), 2) AS avg_bottle_price
FROM sales AS s
LEFT JOIN stores AS st ON s.store = st.store
WHERE s.vendor LIKE '%Diageo%'
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY s.store, st.name, st.store_address
ORDER BY total_revenue ASC
LIMIT 10
-- Highest revenue goes to store #2633 (Hy-Vee #3/Bdi/Des Moines) with $2,933,981.25,
-- $21.49 AVG bottle price, and 4,609 transactions 
-- Lowest revenue, store #4946 (Byron Supermarket)with $11.03, $11.03 AVG bottle, and 1 transaction. 
-- #7 What is the total revenue for every vendor within your chosen [Category]? 
-- sorted from highest to lowest?
-- (Threat: Identifying your top competitors in that space).
-- All category names for Diageo vendor
SELECT DISTINCT category, category_name
FROM sales
WHERE vendor LIKE '%Diageo%'
ORDER BY category_name;
-- Total Revenue per category
SELECT 
    category AS category_ID,
    category_name,
    SUM(total::money) AS total_revenue
FROM sales
WHERE vendor LIKE '%Diageo%'
  AND date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY category, category_name
ORDER BY total_revenue DESC;
-- Revenue per vendor in Spiced Rum
SELECT vendor, category_name,
    COUNT(*) AS total_transactions,
    SUM(bottle_qty) AS total_bottles_sold,
    SUM(total::money) AS total_revenue,
    ROUND(AVG(btl_price::numeric), 2)   AS avg_bottle_price
FROM sales
WHERE category = '1062310'
  AND date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY vendor, category_name
ORDER BY total_revenue DESC;
-- #8 Which stores had total sales revenue for your vendor exceeding $2,000?
-- (Hint: Use HAVING to filter aggregated store totals).
-- (Strength: Pinpointing high-performing retail locations).
SELECT s.store, st.name AS store_name, st.store_address, s.county_number, s.county,
    COUNT(*) AS total_transactions,
    SUM(s.bottle_qty) AS total_bottles_sold,
    SUM(s.total::money) AS total_revenue,
    ROUND(AVG(s.btl_price::numeric), 2) AS avg_bottle_price
FROM sales AS s
LEFT JOIN stores AS st ON s.store = st.store
WHERE s.vendor LIKE '%Diageo%'
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY s.store, st.name, st.store_address, s.county_number, s.county
HAVING SUM(s.total::numeric) > 2000
ORDER BY total_revenue DESC;
--  1,255 stores qualify in 2014. 
-- Top 3 Counties in 2014: Polk, Dallas, Linn
