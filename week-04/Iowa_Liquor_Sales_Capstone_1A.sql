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
-- 9399 Crown Royal sales in Q4 2014