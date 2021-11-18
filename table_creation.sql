--1) CREATING CUSTOMER TABLE--
CREATE TABLE customer
(
	customer_id SERIAL PRIMARY KEY,
	mobile VARCHAR(15) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL
);



--2) CREATING ADDRESS TABLE--
CREATE TABLE address
(
	address_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
	city VARCHAR(15) NOT NULL,
	district VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	zip_code VARCHAR(10) NOT NULL
);



--3) ADDING ADDRESS_ID FOREIGN KEY TO CUSTOMER TABLE--
ALTER TABLE customer ADD address_id INTEGER NOT NULL REFERENCES address(address_id);



--4) CREATING MEMBERSHIP_DETAILS TABLE--
CREATE TABLE membership_details
(
	membership_tag INTEGER PRIMARY KEY,
	membership_type VARCHAR(50) NOT NULL UNIQUE
);


--5) CREATING MEMBERSHIP TABLE--
CREATE TABLE membership
(
	membership_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
	membership_tag INTEGER NOT NULL REFERENCES membership_details(membership_tag),
	membership_start_date DATE NOT NULL,
	membership_end_date DATE NOT NULL
);


--6) CREATING DISCOUNT TABLE--
CREATE TABLE discount
(
	discount_id INTEGER PRIMARY KEY,
	membership_tag INTEGER NOT NULL REFERENCES membership_details(membership_tag),
	discount_info VARCHAR(150) NOT NULL,
	status VARCHAR(50) NOT NULL,
	discount_start_date DATE NOT NULL,
	discount_end_date DATE NOT NULL
);


--7) CREATING INVENTORY TABLE--
CREATE TABLE inventory
(
	product_id INTEGER PRIMARY KEY,
	product_name VARCHAR(50) NOT NULL,
	brand VARCHAR(50) NOT NULL,
	type VARCHAR(50) NOT NULL,
	price INTEGER NOT NULL
);


--8) CREATING BILL TABLE--
CREATE TABLE bill
(
	bill_number SERIAL PRIMARY KEY,
	product_name VARCHAR(5000) NOT NULL,
	customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
	bill_date DATE NOT NULL,
	bill_amount INTEGER NOT NULL
);
