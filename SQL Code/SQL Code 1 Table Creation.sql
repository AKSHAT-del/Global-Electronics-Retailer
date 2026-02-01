create table ger.dim_customer_tb (
	customer_key int,
	gender varchar(50),
	name varchar(50),
	city varchar(50),
	state_code varchar(50),
	state varchar(100),
	zip_code varchar(50),
	country varchar(20),
	cotinent varchar(20),
	birthday date
);

select * from ger.dim_customer_tb;

Drop table ger.dim_customer_tb;


create table ger.dim_exchange_rate_tb (
	date date,
	currency varchar(10),
	exchange float
);

select * from ger.dim_exchange_rate_tb;

create table ger.dim_product_tb (
	brand varchar(20),
	color varchar(20),
	unit_cost float,
	unit_price float,
	sub_category_key int,
	sub_category varchar(50),
	category_key int,
	category varchar(50)
);


select * from ger.dim_stores_tb;

create table ger.dim_stores_tb 
(
	store_key int,
	country varchar(20),
	state varchar(30),
	square_meters int,
	open_date date
);

select * from ger.fact_sales_tb;

create table ger.fact_sales_tb(
	order_number int,
	line_item int,
	order_date date,
	delivery_date date,
	customer_key int,
	store_key int,
	product_key int,
	quantity int,
	currency_code varchar(20)
);



