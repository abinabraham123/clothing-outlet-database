-- 1) Display Name and Customer ID of all customers who have any kind of membership with Sigma--

SELECT customer.customer_id, CONCAT(customer.first_name, ' ', customer.last_name) AS full_name FROM customer
INNER JOIN membership
ON
customer.customer_id = membership.customer_id;

-- 2) Display Name and Customer ID and Membership Type of customers who have Either Gold or Diamond membership with Sigma--
--NOTE:- GOLD and DIAMOND are types of memberships--

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS full_name, md.membership_type FROM customer as c
INNER JOIN membership as m
ON
c.customer_id = m.customer_id
INNER JOIN membership_details as md
ON
m.membership_tag = md.membership_tag
WHERE
md.membership_type = 'Gold' OR md.membership_type = 'Diamond';

--3) Display Name, Customer ID and Country of the customers who live in USA, INDIA and JAPAN--

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS full_name, a.country FROM customer as c
INNER JOIN address as a
ON
c.customer_id = a.customer_id
WHERE country IN ('USA', 'India', 'Japan');

--4) Display how many customers are from UK--

SELECT COUNT(country) from address
WHERE
country = 'UK';

--5) Display Customer ID, Full Name and date of birth of customers who were born after on or after the year 1990--

SELECT customer_id, CONCAT(first_name, ' ', last_name) AS full_name, date_of_birth FROM customer
WHERE
date_of_birth > '1989-12-31';

--6) A special offer is announced for Gold, Platinum and Diamond membership customers who are born between 1980 and 2000--
--email and mobile no. of customers is required to contact them--
--Display customer_id, full_name, phone, email, date_of_birth, membership type of customers who belongs to above mentioned criteria--

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS full_name, c.mobile, c.email, c.date_of_birth, md.membership_type FROM customer as c
INNER JOIN membership AS m
ON c.customer_id = m.customer_id
INNER JOIN membership_details AS md 
ON m.membership_tag = md.membership_tag
WHERE
md.membership_type IN ('Gold', 'Platinum', 'Diamond') AND c.date_of_birth BETWEEN '1980-01-01' AND '2000-01-01';
