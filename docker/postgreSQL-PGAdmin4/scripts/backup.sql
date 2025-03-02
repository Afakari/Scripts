-- Date Dimension Table
CREATE TABLE date_dim (
	    date_id SERIAL PRIMARY KEY,
	    date DATE NOT NULL,
	    day INTEGER NOT NULL,
	    month INTEGER NOT NULL,
	    year INTEGER NOT NULL,
	    quarter INTEGER NOT NULL,
	    day_of_week VARCHAR(10)
);

-- Customer Dimension Table
CREATE TABLE customer_dim (
	    customer_id SERIAL PRIMARY KEY,
	    customer_name VARCHAR(100),
	    customer_email VARCHAR(100),
	    customer_city VARCHAR(50),
	    customer_state VARCHAR(50),
	    customer_country VARCHAR(50)
);

-- Product Dimension Table
CREATE TABLE product_dim (
	    product_id SERIAL PRIMARY KEY,
	    product_name VARCHAR(100),
	    product_category VARCHAR(50),
	    product_price NUMERIC(10, 2)
);

-- Store Dimension Table
CREATE TABLE store_dim (
	    store_id SERIAL PRIMARY KEY,
	    store_name VARCHAR(100),
	    store_city VARCHAR(50),
	    store_state VARCHAR(50),
	    store_country VARCHAR(50)
);

-- Sales Fact Table
CREATE TABLE sales_fact (
	    sales_id SERIAL PRIMARY KEY,
	    date_id INTEGER NOT NULL REFERENCES date_dim(date_id),
	    customer_id INTEGER NOT NULL REFERENCES customer_dim(customer_id),
	    product_id INTEGER NOT NULL REFERENCES product_dim(product_id),
	    store_id INTEGER NOT NULL REFERENCES store_dim(store_id),
	    quantity_sold INTEGER NOT NULL,
	    sales_amount NUMERIC(10, 2) NOT NULL
);


-- Insert into date_dim
INSERT INTO date_dim (date, day, month, year, quarter, day_of_week)
VALUES ('2024-01-01', 1, 1, 2024, 1, 'Monday');

-- Insert into customer_dim
INSERT INTO customer_dim (customer_name, customer_email, customer_city, customer_state, customer_country)
VALUES ('Alice Johnson', 'alice@example.com', 'New York', 'NY', 'USA');

-- Insert into product_dim
INSERT INTO product_dim (product_name, product_category, product_price)
VALUES ('Laptop', 'Electronics', 799.99);

-- Insert into store_dim
INSERT INTO store_dim (store_name, store_city, store_state, store_country)
VALUES ('Tech Store', 'San Francisco', 'CA', 'USA');

-- Insert into sales_fact
INSERT INTO sales_fact (date_id, customer_id, product_id, store_id, quantity_sold, sales_amount)
VALUES (1, 1, 1, 1, 1, 799.99);

-- Populate date_dim with multiple dates
INSERT INTO date_dim (date, day, month, year, quarter, day_of_week) VALUES
('2024-01-01', 1, 1, 2024, 1, 'Monday'),
('2024-02-15', 15, 2, 2024, 1, 'Thursday'),
('2024-03-20', 20, 3, 2024, 1, 'Wednesday'),
('2024-04-05', 5, 4, 2024, 2, 'Friday'),
('2024-07-25', 25, 7, 2024, 3, 'Thursday'),
('2025-01-03', 3, 1, 2025, 1, 'Friday'),
('2025-06-12', 12, 6, 2025, 2, 'Thursday'),
('2025-11-09', 9, 11, 2025, 4, 'Sunday');


-- Populate customer_dim with multiple customers
INSERT INTO customer_dim (customer_name, customer_email, customer_city, customer_state, customer_country) VALUES
('Alice Johnson', 'alice@example.com', 'New York', 'NY', 'USA'),
('Bob Smith', 'bob@example.com', 'Los Angeles', 'CA', 'USA'),
('Carlos Perez', 'carlos@example.com', 'Miami', 'FL', 'USA'),
('Diana Roberts', 'diana@example.com', 'Chicago', 'IL', 'USA'),
('Elena Garcia', 'elena@example.com', 'Madrid', 'Madrid', 'Spain'),
('Fatima Khan', 'fatima@example.com', 'London', 'England', 'UK'),
('Gustavo Silva', 'gustavo@example.com', 'Sao Paulo', 'SP', 'Brazil'),
('Hiro Tanaka', 'hiro@example.com', 'Tokyo', 'Tokyo', 'Japan');

-- Populate store_dim with multiple stores
INSERT INTO store_dim (store_name, store_city, store_state, store_country) VALUES
('Tech Store NY', 'New York', 'NY', 'USA'),
('Tech Store SF', 'San Francisco', 'CA', 'USA'),
('Office Supplies Chicago', 'Chicago', 'IL', 'USA'),
('Electronics Hub LA', 'Los Angeles', 'CA', 'USA'),
('Furniture World Miami', 'Miami', 'FL', 'USA'),
('London Electronics', 'London', 'England', 'UK'),
('Tokyo Gadgets', 'Tokyo', 'Tokyo', 'Japan'),
('Madrid Office Supplies', 'Madrid', 'Madrid', 'Spain');

INSERT INTO product_dim (product_name, product_category, product_price) VALUES
('Laptop', 'Electronics', 799.99),
('Smartphone', 'Electronics', 699.99),
('Tablet', 'Electronics', 299.99),
('Office Chair', 'Furniture', 150.00),
('Desk', 'Furniture', 250.00),
('Headphones', 'Accessories', 50.00),
('Water Bottle', 'Accessories', 15.00),
('Backpack', 'Accessories', 80.00);
-- Populate sales_fact with multiple sales transactions
INSERT INTO sales_fact (date_id, customer_id, product_id, store_id, quantity_sold, sales_amount) VALUES
(1, 1, 1, 1, 2, 1599.98),   -- Alice bought 2 laptops from Tech Store NY
(2, 2, 2, 2, 1, 699.99),    -- Bob bought 1 smartphone from Tech Store SF
(3, 3, 3, 3, 5, 1499.95),   -- Carlos bought 5 tablets from Office Supplies Chicago
(4, 4, 4, 4, 3, 450.00),    -- Diana bought 3 office chairs from Electronics Hub LA
(5, 5, 5, 5, 1, 250.00),    -- Elena bought 1 desk from Furniture World Miami
(6, 6, 6, 6, 10, 500.00),   -- Fatima bought 10 headphones from London Electronics
(7, 7, 7, 7, 20, 300.00),   -- Gustavo bought 20 water bottles from Tokyo Gadgets
(8, 8, 8, 8, 5, 400.00),    -- Hiro bought 5 backpacks from Madrid Office Supplies
(1, 1, 2, 1, 2, 1399.98),   -- Alice bought 2 smartphones from Tech Store NY
(2, 2, 3, 2, 3, 899.97),    -- Bob bought 3 tablets from Tech Store SF
(3, 3, 4, 3, 1, 150.00),    -- Carlos bought 1 office chair from Office Supplies Chicago
(4, 4, 5, 4, 2, 500.00),    -- Diana bought 2 desks from Electronics Hub LA
(5, 5, 6, 5, 4, 200.00),    -- Elena bought 4 headphones from Furniture World Miami
(6, 6, 7, 6, 6, 90.00),     -- Fatima bought 6 water bottles from London Electronics
(7, 7, 8, 7, 2, 160.00),    -- Gustavo bought 2 backpacks from Tokyo Gadgets
(8, 8, 1, 8, 1, 799.99);    -- Hiro bought 1 laptop from Madrid Office Supplies

