
-- E-commerce Furniture Analysis Project - 10 SQL Queries
-- Table: ecommerce_furniture (productTitle, originalPrice, price, sold, tagText)

CREATE DATABASE e_commerce_db;
drop table if exists ecommerce_clean ;
CREATE TABLE ecommerce_clean (
    productTitle TEXT,
    originalPrice DOUBLE,
    price DOUBLE,
    sold INT,
    tagText VARCHAR(50)
);


SELECT count(*) FROM ecommerce_clean;

-- 1. Top 10 best-selling products
SELECT productTitle, price, sold
FROM ecommerce_clean
ORDER BY sold DESC
LIMIT 10;

-- 2. Products with the highest discount (originalPrice - price)
SELECT productTitle, originalPrice, price, (originalPrice - price) AS discount_amount
FROM ecommerce_clean
WHERE originalPrice > price
ORDER BY discount_amount DESC
LIMIT 10;

-- 3. Average price and average units sold overall
SELECT ROUND(AVG(price),2) AS avg_price, ROUND(AVG(sold),2) AS avg_units_sold
FROM ecommerce_clean;

-- 4. Free shipping vs paid shipping - average sales comparison
SELECT
    CASE WHEN tagText = 'Free shipping' THEN 'Free Shipping' ELSE 'Paid Shipping' END AS shipping_type,
    COUNT(*) AS num_products,
    ROUND(AVG(sold),2) AS avg_units_sold,
    ROUND(AVG(price),2) AS avg_price
FROM ecommerce_clean
GROUP BY shipping_type;

-- 5. Price range distribution (buckets)
SELECT
    CASE
        WHEN price < 50 THEN 'Under $50'
        WHEN price BETWEEN 50 AND 150 THEN '$50-$150'
        WHEN price BETWEEN 150 AND 300 THEN '$150-$300'
        ELSE 'Above $300'
    END AS price_range,
    COUNT(*) AS num_products,
    SUM(sold) AS total_sold
FROM ecommerce_clean
GROUP BY price_range
ORDER BY total_sold DESC;

-- 6. Total revenue estimate (price * sold) - top 10 products
SELECT productTitle, price, sold, ROUND(price * sold, 2) AS estimated_revenue
FROM ecommerce_clean
ORDER BY estimated_revenue DESC
LIMIT 10;

-- 7. Products with zero sales
SELECT COUNT(*) AS products_with_zero_sales
FROM ecommerce_clean
WHERE sold = 0;

-- 8. Highest priced products
SELECT productTitle, originalPrice, price, sold
FROM ecommerce_clean
ORDER BY price DESC
LIMIT 10;

-- 9. Average discount percentage across discounted products
SELECT ROUND(AVG((originalPrice - price) / originalPrice * 100), 2) AS avg_discount_pct
FROM ecommerce_clean
WHERE originalPrice > price AND originalPrice > 0;

-- 10. Correlation check: products priced under $100 vs sales performance
SELECT
    CASE WHEN price < 100 THEN 'Under $100' ELSE '$100 and above' END AS price_bucket,
    COUNT(*) AS num_products,
    ROUND(AVG(sold),2) AS avg_units_sold,
    SUM(sold) AS total_units_sold
FROM ecommerce_clean
GROUP BY price_bucket;
