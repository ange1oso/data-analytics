-- Angel S. Osorio
-- Brand: Diageo 
-- Project: Iowa Liquor Database Queries
-- #1 Create a list of all transactions for your chosen Vendor that took place in
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
SELECT date, store AS store_num, description, total AS total_amount
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
AND date BETWEEN '2015-01-01' AND '2015-12-31'
	AND description LIKE 'Crown%'
	ORDER BY date DESC;
-- 9,399 Crown Royal sales in Q4 2014
-- 64,156 total sales. 56,251 in 2014-01-01>2014-12-3. 7,905 in 2015-01-01>2015-02-26
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
-- Most bottles sold 685,201 of Captain Morgan
-- Most revenue was Captain Morgan with $12,307,709.53
-- 6 Variations of Captain Morgan Rum
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
ORDER BY total_revenue DESC
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
SELECT category AS category_ID, category_name,
    SUM(total::money) AS total_revenue
FROM sales
WHERE vendor LIKE '%Diageo%'
  AND date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY category, category_name
ORDER BY total_revenue DESC;
-- Top 3 categories for Diageo in total revenue: 
-- Spiced Rum $21,801,690.48 , Canadian Whiskies $14,677,374.45 , 80 proof vodka $8,689,907.87
-- over $45 million in total revenue for 2014 in Iowa. Bird eye view
-- Almost half of that comes from Spiced Rum.
-- Revenue per vendor in Spiced Rum, etc.
SELECT vendor, category_name,
    COUNT(*) AS total_transactions,
    SUM(bottle_qty) AS total_bottles_sold,
    SUM(total::money) AS total_revenue,
    ROUND(AVG(btl_price::numeric), 2)   AS avg_bottle_price
FROM sales
WHERE category = '1062310' 
-- 1062200 Puerto Rico & virgin islands, 1062310 Spiced Rum, 1062300 Flavored Rum
  AND date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY vendor, category_name
ORDER BY total_revenue DESC;
-- Total Revenue per vendor in Spiced Rum:
-- Diageo $21,801,690.48 , Heaven Hill $3,690,515.27
-- Diageo makes 5x more than it's next competitor. Monopoly.
-- Total Revenue per vendor in Puerto Rico:
-- Bacardi USA biggest competitor with $6,789,296.58 rev
-- Luxco St Louis is 2nd with $2,876,411.12 rev
-- Diageo only scrapes in $532,451.35 in total revenue. Bacardi makes 10x. Luxco makes 5x
-- Total Revenue per vendor in Flavored Rum:
-- Pernod Ricard with $3,718,889.70 rev
-- Bacardi 2nd with $2,395,836.03 rev
-- Jim Beam 3rd with $537,825.30 rev 
-- Diageo close in 4th with $441,450.60 rev
--#8 Which stores had total sales revenue for your vendor exceeding $2,000?
-- (Hint: Use HAVING to filter aggregated store totals).
-- (Strength: Pinpointing high-performing retail locations).
SELECT s.store, st.name AS store_name, st.store_address, s.county_number, s.county,
    COUNT(*) AS total_transactions,
    SUM(s.bottle_qty) AS total_bottles_sold,
    SUM(s.total::money) AS total_revenue,
    ROUND(AVG(s.btl_price::numeric), 2) AS avg_bottle_price
FROM sales AS s
JOIN stores AS st ON s.store = st.store
WHERE s.vendor LIKE '%Diageo%'
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY s.store, st.name, st.store_address, s.county_number, s.county
HAVING SUM(s.total::numeric) > 2000
ORDER BY total_revenue DESC;
-- 1252 stores. 1255 with county column
-- Top 3 counties in 2014: Polk, Dallas, Linn
-- #9 Find all sales records where the category_name is either your chosen category
-- or a closely related competitor category (e.g., 'VODKA 80 PROOF' vs 'IMPORTED VODKA').
-- (Threat: Comparing performance against direct substitutes).
-- Spiced Rum vs categories by revenue
SELECT category, category_name,
    COUNT(*)AS total_transactions,
    SUM(total::money) AS total_revenue
FROM sales
WHERE category IN ('1062310', '1062300', '1062200', '1062100')
  AND date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY category, category_name
ORDER BY total_revenue DESC;
-- Spiced Rum as a category, dominates with $28,261,863.71 in total revenue and 146,947 transactions
-- Spiced Rum vs categories by total bottles sold and avg bottle price
SELECT category, category_name,
    COUNT(*) AS total_transactions,
    SUM(bottle_qty) AS total_bottles_sold,
    SUM(total::money) AS total_revenue,
    ROUND(AVG(btl_price::numeric), 2) AS avg_bottle_price
FROM sales
WHERE category IN ('1062310', '1062300', '1062200', '1062100')
  AND date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY category, category_name
ORDER BY total_revenue DESC;
-- Spiced Rum with 1,863,381 bottles sold and an average of 14.33 per bottle
-- Revenue per Vendor grouped by Category
SELECT category_name, vendor, COUNT(*) AS total_transactions,
    SUM(bottle_qty) AS total_bottles_sold,
    SUM(total::money) AS total_revenue,
    ROUND(AVG(btl_price::numeric), 2)   AS avg_bottle_price
FROM sales
WHERE category IN ('1062310', '1062300', '1062200', '1062100')
  AND date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY category_name, vendor
ORDER BY category_name, total_revenue DESC;
-- Query shows all categories + vendor by total revenue
-- Diageo vs Vendors per Category (revenue and avg)
SELECT
    CASE 
        WHEN vendor LIKE '%Diageo%' THEN 'Diageo Americas'
        ELSE 'All Other Vendors'
    END AS vendor_group, category_name,
    COUNT(*) AS total_transactions,
    SUM(bottle_qty) AS total_bottles_sold,
    SUM(total::money) AS total_revenue,
    ROUND(AVG(btl_price::numeric), 2) AS avg_bottle_price
FROM sales
WHERE category IN ('1062310', '1062300', '1062200', '1062100')
  AND date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY vendor_group, category_name
ORDER BY category_name, total_revenue DESC;
-- Diageo dominates the Spiced Rum market in Iowa with $21,801,690.48 in total revenue
-- Compared to all other vendors in SPiced Rum with only $6,460,173.23 in total revenue
-- Diageo sells at least 3x more than the competition in Spiced Rum, at least in Iowa for fiscal year 2014.
-- #10 List all transactions where the state bottle cost was between $10 and $20 for your vendor
-- (Opportunity: Analyzing performance in the "mid-tier" price bracket).
SELECT date, s.store, st.name AS store_name, s.county, s.description AS product_name,
    s.category_name, s.bottle_qty, s.state_btl_cost::numeric, s.btl_price,
    s.total::money AS total_revenue
FROM sales AS s
JOIN stores AS st ON s.store = st.store
WHERE s.vendor LIKE '%Diageo%'
  AND s.state_btl_cost::numeric BETWEEN 10 AND 20
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
ORDER BY s.total::numeric DESC;
-- 186,259 total transactions with state bottle cost of $10-$20
-- Aggregates total transactions lists from last prompt
SELECT
    s.description AS product_name, s.category_name,
    ROUND(MIN(s.state_btl_cost::numeric), 2)  AS min_btl_cost,
    ROUND(MAX(s.state_btl_cost::numeric), 2)  AS max_btl_cost,
    ROUND(AVG(s.state_btl_cost::numeric), 2)  AS avg_btl_cost,
    COUNT(*) AS total_transactions,
    SUM(s.bottle_qty) AS total_bottles_sold,
    SUM(s.total::money) AS total_revenue,
    ROUND(AVG(s.btl_price::numeric), 2) AS avg_bottle_price
FROM sales AS s
WHERE s.vendor LIKE '%Diageo%'
  AND s.state_btl_cost::numeric BETWEEN 10 AND 20
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY s.description, s.category_name
ORDER BY total_revenue DESC;
-- 102 rows in query
-- #11 Write a query that displays each store's total sales for your [Category/Vendor]
-- along with the store's name and address from the stores_table.
-- (Strength: Mapping your physical sales footprint).
SELECT s.store, st.name AS store_name, st.store_address, s.county, s.county_number,
    COUNT(*) AS total_transactions,
    SUM(s.bottle_qty) AS total_bottles_sold,
    SUM(s.total::money) AS total_revenue,
    ROUND(AVG(s.btl_price::numeric), 2) AS avg_bottle_price
FROM sales AS s
JOIN stores AS st ON s.store = st.store
WHERE s.vendor LIKE '%Diageo%'
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY s.store, st.name, st.store_address, s.county, s.county_number
ORDER BY total_revenue DESC;
-- Diageo products were sold in 1319 stores in Iowa for 2014.
-- With the best store, #2633, it had $2,933,981.25 in total revenue, and residing in Des Moines. 
-- #12 For each sale in your [Category], display the transaction date, total amount,
-- and the population of the county where the sale occurred by joining with counties_table.
-- (Opportunity: Correlating sales volume with population density).
SELECT s.date, s.store, s.county, c.population, s.description AS product_name,
    s.bottle_qty, s.btl_price, s.total::money AS total_revenue
FROM sales AS s
JOIN counties AS c ON s.county = c.county
WHERE s.category = '1062310'
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
ORDER BY s.total::numeric DESC;
-- Transaction list
-- 146,879 total transactions in Spiced Rum category. biggest transaction was $64,800 in total revenue 
-- for the county Dallas with a poulation of 66,135 and 2,400 bottles sold at $27 per.
-- Revenue per capita:
SELECT s.county, c.population, COUNT(*) AS total_transactions,
    SUM(s.bottle_qty) AS total_bottles_sold,
    SUM(s.total::money) AS total_revenue,
    ROUND(AVG(s.btl_price::numeric), 2) AS avg_bottle_price,
    ROUND(SUM(s.total::numeric) / NULLIF(c.population::numeric, 0), 2) AS revenue_per_capita
FROM sales AS s
JOIN counties AS c ON s.county = c.county
WHERE s.category = '1062310'
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY s.county, c.population
ORDER BY total_revenue DESC;
-- highest rev per capita goes to Dickinson with a 27.34 
-- with only $455,691.69 in rev and 16,667 population
-- The lowest rev per capita goes to Fremont with a 0.47
-- with only $3,500.49 in rev and 7,441 population
-- Most revenue goes to Polk county with $4,952,483.60 in rev and 11.50 rev per capita
-- with a 430,640 population 

-- My bonus Q: Best performing counties in Iowa for Diageo in 2014
SELECT s.county, s.county_number, COUNT(*) AS total_transactions,
    SUM(s.bottle_qty) AS total_bottles_sold,
    SUM(s.total::money) AS total_revenue
FROM sales AS s
JOIN stores AS st ON s.store = st.store
WHERE s.vendor LIKE '%Diageo%'
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY s.county, s.county_number
ORDER BY total_revenue DESC;
-- #1 Polk County with $17,205,406.69 in rev and 90,230 transactions, 1,002,961 bottles sold
-- Polk has a 430,640 population (makes sense why its the best) 11.50 rev per capita
-- #2 Linn $6,322,545.66 and 37,551 transac. population, 377,520 bottles sold
-- Linn has a 211,226 population, 11.63 rev per capita
-- #3 Scott $5,306,327.57 and 28,359 transac. , 322,722 bottles sold
-- Scott has a 165,224 population, 10.10 rev per capita
-- My bonus Q: Best performing store in Iowa, 2633, and its products ranking
SELECT s.store, st.name AS store_name, s.description AS product_name, s.category_name,
    COUNT(*) AS total_transactions,
    SUM(s.bottle_qty) AS total_bottles_sold,
    SUM(s.total::money) AS total_revenue,
    ROUND(AVG(s.btl_price::numeric), 2) AS avg_bottle_price
FROM sales AS s
JOIN stores AS st ON s.store = st.store
WHERE s.vendor LIKE '%Diageo%'
  AND s.store = 2633
  AND s.date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY s.store, st.name, s.description, s.category_name
ORDER BY total_revenue DESC;
-- No surprise here with Captain Morgan Spiced Rum as #1, with $747,405 rev
-- #2 Crown Royal Canadian Whisky with $656,758.98 rev
-- #3 Ketel One Imported Vodka with $243,449.76 rev