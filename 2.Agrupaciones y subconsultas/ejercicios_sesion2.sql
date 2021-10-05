USE classicmodels;
SHOW tables;
SELECT * FROM employees;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM customers;

SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE 'A%';
SELECT employeeNumber, lastName, firstName FROM employees WHERE lastName LIKE '%on';
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE '%on%';
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE 'G_____';
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName NOT LIKE 'B%';
SELECT productCode, productName FROM products WHERE productCode LIKE "%\_20%";
SELECT orderNumber, SUM(priceEach) Total FROM orderdetails GROUP BY orderNumber;
SELECT COUNT(*) 'Total Ordenes', anio 'Año' FROM (SELECT YEAR(orderDate) anio, orderNumber FROM orders) as Ordenes GROUP BY anio;
SELECT lastName, firstName FROM employees WHERE officeCode IN (SELECT officeCode FROM offices WHERE country = 'USA');
SELECT customerNumber, checkNumber, amount FROM payments ORDER BY amount DESC LIMIT 1;
SELECT customerNumber, checkNumber, amount FROM payments WHERE amount > (SELECT AVG(amount) FROM payments );
SELECT customerName FROM customers WHERE customerNumber NOT IN (SELECT customerNumber FROM orders);
SELECT productCode, max(quantityOrdered) AS Maximo, min(quantityOrdered) AS Minimo, avg(quantityOrdered) AS Promedio 
FROM orderdetails GROUP BY productCode;
SELECT status, count(*) AS Total FROM orders GROUP BY status;


