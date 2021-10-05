USE classicmodels;
SELECT lastName FROM employees;

SELECT firstName, lastName, jobTitle FROM employees;

SELECT * FROM employees;

SELECT lastName, jobTitle 
FROM employees
WHERE jobTitle = 'Sales Rep';

SELECT lastName, jobTitle, officeCode 
FROM employees
WHERE jobTitle = 'Sales Rep'
	AND officeCode = '1';
    
SELECT lastName, jobTitle, officeCode 
FROM employees
WHERE jobTitle = 'Sales Rep'
	OR officeCode = '1';
    
SELECT lastName, jobTitle, officeCode 
FROM employees
WHERE officeCode IN (1,2,3);

SELECT lastName, jobTitle, officeCode 
FROM employees
WHERE jobTitle != 'Sales Rep';

SELECT lastName, firstName, officeCode 
FROM employees
WHERE officeCode  > 5;

SELECT lastName, firstName, officeCode 
FROM employees
WHERE officeCode  <= 4;

SELECT customerName, country, state
FROM customers
WHERE country ='USA'
	AND state ='CA';
    
SELECT customerName, country, state, creditLimit
FROM customers
WHERE country ='USA'
	AND state ='CA'
  AND creditLimit>100000;

SELECT customerName,country, state 
FROM customers 
WHERE country IN ('USA', 'FRANCE');

SELECT customerName, country, creditLimit
FROM customers 
WHERE country IN ('USA', 'France') AND creditLimit > 100000;

SELECT officeCode, city, phone, country 
FROM offices WHERE country IN ('USA','France');

SELECT officeCode, city, phone, country 
FROM offices WHERE NOT country IN ('USA','France');

SELECT orderNumber, customerNumber, status, shippedDate
FROM orders WHERE orderNumber IN (10165,10287,10310);

SELECT contactLastName, customerName FROM customers 
ORDER BY contactLastName ASC;

SELECT contactLastName, customerName FROM customers 
ORDER BY contactLastName DESC;

SELECT contactLastName, customerName
FROM customers
ORDER BY 
contactLastName DESC ,
customerName ASC;

SELECT  customerNumber, customerName,creditLimit
FROM customers
ORDER BY creditLimit DESC 
LIMIT 5;

SELECT  customerNumber, customerName,creditLimit
FROM customers
ORDER BY creditLimit ASC 
LIMIT 5;









