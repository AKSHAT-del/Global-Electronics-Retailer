-- View all tables (run after data population)
SELECT * FROM ger.dim_customer_tb;
SELECT * FROM ger.dim_exchange_rate_tb;
SELECT * FROM ger.dim_product_tb;
SELECT * FROM ger.dim_stores_tb;
SELECT * FROM ger.fact_sales_tb;

-- Filter null deliveries
SELECT * FROM ger.fact_sales_tb WHERE delivery_date IS NULL;  -- Fixed: ISNULL → IS NULL

-- Date arithmetic (PostgreSQL syntax)
SELECT 
    date, 
    date + INTERVAL '7 days' AS new_date  -- Works; no DATE() wrapper needed
FROM ger.dim_exchange_rate_tb;


-- Multiple CASE variants (consolidated; pick one)
SELECT 
    order_date,
    delivery_date,
    CASE 
        WHEN delivery_date IS NULL THEN order_date + INTERVAL '6 days'
        ELSE delivery_date 
    END AS new_delivery_date
FROM ger.fact_sales_tb
WHERE delivery_date IS NULL;  -- Focus on nulls for efficiency

-- Add new column
ALTER TABLE ger.fact_sales_tb 
ADD COLUMN new_delivery_date DATE;

-- Update with imputation logic
UPDATE ger.fact_sales_tb 
SET new_delivery_date = CASE 
    WHEN delivery_date IS NULL THEN order_date + INTERVAL '6 days'
    ELSE delivery_date 
END;

-- Verify results
SELECT * FROM ger.fact_sales_tb;
SELECT * FROM ger.fact_sales_tb WHERE new_delivery_date IS NULL;  -- Should return 0 rows



