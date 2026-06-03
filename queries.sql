-- =====================================================
-- SALES PERFORMANCE ANALYTICS - SQL QUERIES
-- Dataset: Superstore Sales | Tool: PostgreSQL
-- =====================================================


-- ── Q1. TOTAL SALES, PROFIT & ORDERS ─────────────────
SELECT
    COUNT(DISTINCT order_id)        AS total_orders,
    COUNT(DISTINCT customer_id)     AS total_customers,
    ROUND(SUM(sales)::NUMERIC, 2)   AS total_sales,
    ROUND(SUM(profit)::NUMERIC, 2)  AS total_profit,
    ROUND(AVG(profit_margin_pct)::NUMERIC, 2) AS avg_profit_margin
FROM superstore_sales;


-- ── Q2. SALES & PROFIT BY REGION ─────────────────────
SELECT
    region,
    ROUND(SUM(sales)::NUMERIC, 2)  AS total_sales,
    ROUND(SUM(profit)::NUMERIC, 2) AS total_profit,
    COUNT(DISTINCT order_id)        AS total_orders
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;


-- ── Q3. SALES & PROFIT BY CATEGORY ───────────────────
SELECT
    category,
    ROUND(SUM(sales)::NUMERIC, 2)  AS total_sales,
    ROUND(SUM(profit)::NUMERIC, 2) AS total_profit,
    ROUND(AVG(profit_margin_pct)::NUMERIC, 2) AS avg_margin
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;


-- ── Q4. TOP 10 PRODUCTS BY SALES ─────────────────────
SELECT
    product_name,
    ROUND(SUM(sales)::NUMERIC, 2)  AS total_sales,
    ROUND(SUM(profit)::NUMERIC, 2) AS total_profit
FROM superstore_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


-- ── Q5. TOP 10 LOSS-MAKING PRODUCTS ──────────────────
SELECT
    product_name,
    ROUND(SUM(profit)::NUMERIC, 2) AS total_profit
FROM superstore_sales
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;


-- ── Q6. YEARLY SALES TREND ───────────────────────────
SELECT
    order_year,
    ROUND(SUM(sales)::NUMERIC, 2)  AS total_sales,
    ROUND(SUM(profit)::NUMERIC, 2) AS total_profit,
    COUNT(DISTINCT order_id)        AS total_orders
FROM superstore_sales
GROUP BY order_year
ORDER BY order_year;


-- ── Q7. MONTHLY SALES TREND ──────────────────────────
SELECT
    order_month,
    order_month_name,
    ROUND(SUM(sales)::NUMERIC, 2) AS total_sales
FROM superstore_sales
GROUP BY order_month, order_month_name
ORDER BY order_month;


-- ── Q8. SALES BY CUSTOMER SEGMENT ────────────────────
SELECT
    segment,
    ROUND(SUM(sales)::NUMERIC, 2)  AS total_sales,
    ROUND(SUM(profit)::NUMERIC, 2) AS total_profit,
    COUNT(DISTINCT customer_id)     AS total_customers
FROM superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;


-- ── Q9. TOP 10 CUSTOMERS BY REVENUE ──────────────────
SELECT
    customer_name,
    segment,
    ROUND(SUM(sales)::NUMERIC, 2)  AS total_sales,
    ROUND(SUM(profit)::NUMERIC, 2) AS total_profit
FROM superstore_sales
GROUP BY customer_name, segment
ORDER BY total_sales DESC
LIMIT 10;


-- ── Q10. SHIPPING MODE ANALYSIS ──────────────────────
SELECT
    ship_mode,
    COUNT(*)                        AS total_orders,
    ROUND(AVG(shipping_days), 1)    AS avg_shipping_days,
    ROUND(SUM(sales)::NUMERIC, 2)   AS total_sales
FROM superstore_sales
GROUP BY ship_mode
ORDER BY total_orders DESC;


-- ── Q11. STATE-WISE SALES (TOP 10) ───────────────────
SELECT
    state,
    ROUND(SUM(sales)::NUMERIC, 2)  AS total_sales,
    ROUND(SUM(profit)::NUMERIC, 2) AS total_profit
FROM superstore_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;


-- ── Q12. DISCOUNT IMPACT ON PROFIT ───────────────────
SELECT
    CASE
        WHEN discount = 0          THEN 'No Discount'
        WHEN discount <= 0.2       THEN 'Low (0-20%)'
        WHEN discount <= 0.4       THEN 'Medium (20-40%)'
        ELSE                            'High (40%+)'
    END AS discount_range,
    COUNT(*)                        AS total_orders,
    ROUND(AVG(profit)::NUMERIC, 2)  AS avg_profit,
    ROUND(SUM(sales)::NUMERIC, 2)   AS total_sales
FROM superstore_sales
GROUP BY discount_range
ORDER BY avg_profit DESC;
