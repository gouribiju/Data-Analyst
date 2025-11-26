-- GroupBy Question **********

#1. Get a list of the products on each product category.
SELECT c.product_category_name, p.product_name
FROM product p
JOIN product_category c
ON p.product_category_id = c.product_category_id
ORDER BY c.product_category_name, p.product_name;

#2. Count the number of products per each product category.
SELECT c.product_category_name, COUNT(p.product_id) AS product_count
FROM product p
JOIN product_category c
ON p.product_category_id = c.product_category_id
GROUP BY c.product_category_name;

#3. Get a list of the customer IDs who made purchases on each market date.
SELECT market_date,customer_id
FROM customer_purchases
ORDER BY market_date, customer_id;

#4. Count the number of purchases each customer made per market date.
SELECT customer_id,market_date, COUNT(*) AS purchase_count
FROM customer_purchases
GROUP BY customer_id, market_date
ORDER BY customer_id, market_date;

#5. Calculate the total quantity purchased by each customer per market_date.
SELECT customer_id,market_date, SUM(quantity) AS total_quantity
FROM customer_purchases
GROUP BY customer_id, market_date
ORDER BY customer_id, market_date;

#6. How many different kinds of products were purchased by each customer on each market date.
SELECT customer_id, market_date, 
COUNT(DISTINCT product_id) AS distinct_products
FROM customer_purchases
GROUP BY customer_id, market_date
ORDER BY customer_id, market_date;

#7. Calculate the total price paid by customer_id 3 per market_date.
SELECT market_date,
SUM(quantity * cost_to_customer_per_qty) AS total_price
FROM customer_purchases
WHERE customer_id = 3
GROUP BY market_date
ORDER BY market_date;

#8. Filter out vendors who brought at least 10 items to the farmer’s market over the time period - 2019-05-02 and 2019-05-16.
SELECT vendor_id,
SUM(quantity) AS total_items
FROM vendor_inventory
WHERE market_date BETWEEN '2019-05-02' AND '2019-05-16'
GROUP BY vendor_id
HAVING SUM(quantity) >= 10;

#9. Find the average amount spent by customers on each day. We want to consider only those days where the number of purchases were more than 3 and the transaction amount was greater than 5.
SELECT market_date,
AVG(quantity * cost_to_customer_per_qty) AS avg_spend
FROM customer_purchases
GROUP BY market_date
HAVING COUNT(*) > 3 AND AVG(quantity * cost_to_customer_per_qty) > 5
ORDER BY market_date;







