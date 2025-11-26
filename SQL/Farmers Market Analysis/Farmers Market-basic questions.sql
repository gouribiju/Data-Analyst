
USE farmers_market;
SHOW TABLES;

SELECT * FROM booth;
SELECT * FROM customer;
SELECT * FROM customer_purchases;
SELECT * FROM market_date_info;
SELECT * FROM product;
SELECT * FROM product_category;
SELECT * FROM vendor;
SELECT * FROM vendor_booth_assignments;
SELECT * FROM vendor_inventory;

-- BASIC QUESTIONS ********************************

#1. Get all the products available in the market
SELECT * FROM product;

#2. List down 10 rows of vendor booth assignments, displaying the market date, vendor ID, and booth number from the vendor_booth_assignments table.
SELECT vendor_id, booth_number, market_date
FROM vendor_booth_assignments
LIMIT 10;

#3. In the customer purchases, we have quantity and cost per qty separate, query the total amount that the customer has paid along with date, customer id, vendor_id, qty, cost per qty and the total amt.?
SELECT customer_id, vendor_id,market_date, quantity, cost_to_customer_per_qty,
(quantity * cost_to_customer_per_qty) AS total_amt
FROM customer_purchases;

#4. Merge each customer’s name into a single column that contains the first name, then a space, and then the last name.
SELECT customer_id,
CONCAT(customer_first_name, ' ', customer_last_name) AS full_name
FROM customer;

#5. Extract all the product names that are part of product category 1
SELECT product_name
FROM product
WHERE product_category_id = 1;

#6. Print a report of everything customer_id 4 has ever purchased at the farmer’s market, sorted by market date, vendor ID, and product ID.
SELECT market_date, vendor_id, product_id
FROM customer_purchases
WHERE customer_id = 4
ORDER BY market_date, vendor_id, product_id;

#7. Get all the product info for products with id between 3 and 8 (not inclusive) or product with id 10.
SELECT * FROM product
WHERE (product_id > 3 AND product_id < 8)
OR product_id = 10;
   
#8. Details of all the purchases made by customer_id 4 at vendor_id 7, along with the total_amt. 
SELECT product_id, quantity, cost_to_customer_per_qty,
(quantity * cost_to_customer_per_qty) AS total_amt
FROM customer_purchases
WHERE customer_id = 4 AND vendor_id = 7;

#9. Find the customer detail with the first name of “carlos” or the last name of “diaz”
SELECT * FROM customer
WHERE customer_first_name = 'carlos'
OR customer_last_name = 'diaz';

#10. Find the booth assignments for vendor 7 for any market date that occurred between april 3, 2019, and may 16, 2019   
SELECT * FROM vendor_booth_assignments
WHERE vendor_id = 7
AND market_date BETWEEN '2019-04-03' AND '2019-05-16';

#11. Return a list of customers with selected last names - [diaz, edwards and wilson].  
SELECT * FROM customer
WHERE customer_last_name IN ('diaz', 'edwards', 'wilson');

#12. Analyze purchases made at the farmer’s market on days when it rained.
SELECT cp.* FROM customer_purchases cp
JOIN market_date_info mdi
ON cp.market_date = mdi.market_date
WHERE mdi.market_rain_flag = 1;

#13. Return all products without sizes.
SELECT * FROM product
WHERE product_size IS NULL OR product_size = '';

#14. You want to get data about a customer you knew as “jerry,” but you aren’t sure if he was listed in the database as “jerry” or “jeremy” or “jeremiah.” How would you get the data from this partial string?
SELECT * FROM customer
WHERE customer_first_name LIKE 'jer%';

#15. We want to merge each customer’s name into a single column that contains the first name, then a space, and then the last name in upper case
SELECT customer_id,
UPPER(CONCAT(customer_first_name, ' ', customer_last_name)) AS full_name_upper
FROM customer;

#16. Find out what booths vendor 2 was assigned to on or before (less than or equal to) april 20, 2019
SELECT * FROM vendor_booth_assignments
WHERE vendor_id = 2 AND market_date <= '2019-04-20';

#17. Find out which vendors primarily sell fresh produce and which don’t.
SELECT vendor_id, vendor_name, vendor_type,
    CASE
        WHEN LOWER(vendor_type) LIKE '%fresh%'
            THEN 'Fresh Produce'
        ELSE 'Other'
    END AS vendor_type_condensed
FROM farmers_market.vendor;










