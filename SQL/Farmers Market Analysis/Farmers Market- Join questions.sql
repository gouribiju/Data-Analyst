-- JOIN  ***********************

SELECT * FROM product;
SELECT * FROM product_category;

#1. List each product name along with its product category name.
SELECT p.product_name, c.product_category_name
FROM product p
JOIN product_category c
ON p.product_category_id = c.product_category_id;

#2. Get all the Customers who have not purchased anything from the market yet.     
SELECT c.customer_id,c.customer_first_name,c.customer_last_name
FROM customer c
LEFT JOIN customer_purchases cp
ON c.customer_id = cp.customer_id
WHERE cp.customer_id IS NULL;

#3. write a query that returns a list of all customers who did not make a purchase on March 2, 2019.
SELECT c.*, cp.market_date FROM customer AS c
LEFT JOIN customer_purchases AS cp ON c.customer_id = cp.customer_id
WHERE cp.market_date <> '2019-03-02'
