-- Dimension tables
CREATE TABLE ger.dim_customer_tb (
    customer_key   INT,
    gender         VARCHAR(50),
    name           VARCHAR(50),
    city           VARCHAR(50),
    state_code     VARCHAR(50),
    state          VARCHAR(100),
    zip_code       VARCHAR(50),
    country        VARCHAR(20),
    continent      VARCHAR(20),  -- Fixed typo: 'cotinent' -> 'continent'
    birthday       DATE
);

CREATE TABLE ger.dim_exchange_rate_tb (
    date     DATE,
    currency VARCHAR(10),
    exchange FLOAT
);

CREATE TABLE ger.dim_product_tb (
    brand             VARCHAR(20),
    color             VARCHAR(20),
    unit_cost         FLOAT,
    unit_price        FLOAT,
    sub_category_key  INT,
    sub_category      VARCHAR(50),
    category_key      INT,
    category          VARCHAR(50)
);

CREATE TABLE ger.dim_stores_tb (
    store_key     INT,
    country       VARCHAR(20),
    state         VARCHAR(30),
    square_meters INT,
    open_date     DATE
);

-- Fact table
CREATE TABLE ger.fact_sales_tb (
    order_number   INT,
    line_item      INT,
    order_date     DATE,
    delivery_date  DATE,
    customer_key   INT,
    store_key      INT,
    product_key    INT,
    quantity       INT,
    currency_code  VARCHAR(20)
);
