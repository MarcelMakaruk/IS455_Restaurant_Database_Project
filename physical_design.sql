DROP DATABASE IF EXISTS local_chain_restaurant;
CREATE DATABASE local_chain_restaurant;
USE local_chain_restaurant;

# Creating tables
CREATE TABLE restaurant_locations (
	location_id			INT 			PRIMARY KEY 	AUTO_INCREMENT,
    location_name		VARCHAR(50)		NOT NULL,
    address_line_1		VARCHAR(100)	NOT NULL		UNIQUE,
    address_line_2		VARCHAR(50)		DEFAULT NULL,
    city				VARCHAR(50)		NOT NULL,
    state				CHAR(2)			NOT NULL,
    zip_code			VARCHAR(10)		NOT NULL,
    phone_number		VARCHAR(12)		NOT NULL
);

CREATE TABLE customers (
	customer_id			INT 			PRIMARY KEY		AUTO_INCREMENT,
    first_name			VARCHAR(100)	NOT NULL,
    last_name			VARCHAR(100)	NOT NULL,
    address_line_1		VARCHAR(100)	NOT NULL		UNIQUE,
    address_line_2		VARCHAR(50)		DEFAULT NULL,
    city				VARCHAR(50)		NOT NULL,
    state				CHAR(2)			NOT NULL,
    zip_code			VARCHAR(10)		NOT NULL,
    phone_number		VARCHAR(12)		NOT NULL
);

CREATE TABLE online_customer_orders (
	order_id			INT				PRIMARY KEY		AUTO_INCREMENT,
    customer_id			INT				NOT NULL,
    location_id			INT				NOT NULL,
    order_date			DATETIME		NOT NULL,
    order_amount		DECIMAL(6,2)	NOT NULL,
    payment_type		ENUM('Visa', 'Master Card', 'American Express', 'PayPal')	NOT NULL,
    order_fulfilled		BOOLEAN			NOT NULL,
    CONSTRAINT online_customer_orders_fk_restaurant_locations
		FOREIGN KEY (location_id)
        REFERENCES restaurant_locations (location_id),
	CONSTRAINT online_customer_orders_fk_customers
		FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);

# Inserting Data into the tables
INSERT INTO restaurant_locations (location_id, location_name, address_line_1, address_line_2, city, state, zip_code, phone_number) VALUES
(1, 'Monty\'s #1', '1568 E Springfield Ave', '', 'Champaign', 'IL', '61820', '217-412-5468'),
(2, 'Monty\'s #2', '4587 E Montrose Ave', '', 'Chicago', 'IL', '60018', '773-541-8721'),
(3, 'Monty\'s #3', '2165 N Main St', '', 'Milwaukee', 'WI', '53201', '682-845-3548'),
(4, 'Monty\'s #4', '8425 E Valley Rd', '', 'Madison', 'WI', '53558', '654-124-5544'),
(5, 'Monty\'s #5', '9534 S University Ave', '', 'Detroit', 'MI', '48313', '313-845-5468'),
(6, 'Monty\'s #6', '4215 S Mattis Ave', '', 'Minneapolis', 'MN', '55403', '124-954-8475');

INSERT INTO customers (customer_id, first_name, last_name, address_line_1, address_line_2, city, state, zip_code, phone_number) VALUES
(1, 'Bob', 'Evans', '5487 N Shore Dr', 'Unit 2', 'Detroit', 'MI', '48512', '313-548-8475'),
(2, 'Mary', 'Ann', '8457 E Milwaukee Ave', 'Apt 3B', 'Minneapolis', 'MN', '55642', '124-458-7812'),
(3, 'Ronald', 'Mc\'Donald', '8457 W Virginia Ave', '', 'Oak Park', 'IL', '61254', '771-548-8745'),
(4, 'Peter', 'Kowalski', '9421 N Kirby Ave', 'Unit 2A', 'Champaign', 'IL', '61824', '217-874-4875'),
(5, 'Roxanne', 'Miller', '6542 S Grey Rd', '', 'Urbana', 'IL', '84752', '215-548-8475'),
(6, 'Karen', 'Kosciuszko', '8451 W Big Ave', '', 'Detroit', 'MI', '48245', '313-847-8765'),
(7, 'Karol', 'Smith', '8765 E Oak St', '', 'Madison', 'WI', '53558', '654-215-4589'),
(8, 'Justin', 'Williams', '3257 N Lake Dr', 'Apt 4', 'Chicago', 'IL', '60015', '773-546-8421'),
(9, 'Scott', 'Jones', '9842 S Long Rd', '', 'Milwaukee', 'WI', '53485', '682-912-4751'),
(10, 'Eve', 'Davis', '1245 W Maple Ave', 'Unit 5A', 'Madison', 'WI', '53584', '654-345-7541');

INSERT INTO online_customer_orders (order_id, customer_id, location_id, order_date, order_amount, payment_type, order_fulfilled) VALUES
(1, 6, 3, '2022-04-28 15:23:12', '54.96', 'Visa', 1),
(2, 4, 5, '2022-05-06 11:55:44', '24.25', 'Master Card', 0),
(3, 8, 1, '2022-05-15 13:24:32', '36.12', 'Visa', 1),
(4, 2, 2, '2022-05-24 17:12:15', '11.39', 'PayPal', 1),
(5, 7, 4, '2022-05-30 11:32:45', '49.19', 'American Express', 1),
(6, 3, 5, '2022-06-10 15:54:34', '28.24', 'Master Card', 1),
(7, 1, 3, '2022-06-12 09:12:36', '23.59', 'Visa', 0),
(8, 10, 6, '2022-06-26 18:54:24', '67.49', 'Master Card', 1),
(9, 5, 4, '2022-07-01 16:21:31', '46.25', 'Visa', 1),
(10, 9, 1, '2022-07-12 12:26:16', '20.99', 'PayPal', 1);