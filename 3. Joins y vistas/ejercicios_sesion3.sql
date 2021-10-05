USE classicmodels;
SHOW tables;
SELECT * FROM products;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM customers;
SELECT * FROM employees;

-- 1
SELECT o.orderNumber, sum(quantityOrdered)
FROM orders o
JOIN orderdetails od
	ON o.orderNumber = od.orderNumber
GROUP BY od.orderNumber;
-- 2 
SELECT o.orderNumber, o.status, py.amount
FROM payments py
JOIN orders o
	ON py.customerNumber = o.customerNumber;
-- 3
SELECT o.orderNumber, o.orderDate, od. orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
FROM orders o
JOIN orderdetails od
	ON o.orderNumber = od.orderNumber
JOIN products p
	ON p.productCode = od.productCode;
-- 4
SELECT o.orderNumber, od. orderLineNumber, p.productName, p.MSRP, od.priceEach
FROM orders o
JOIN orderdetails od
	ON o.orderNumber = od.orderNumber
JOIN products p
	ON p.productCode = od.productCode;
    
-- 5 
SELECT cs.customerNumber num_cliente, concat(cs.contactFirstName,' ',cs.contactLastName) cliente,
od.orderNumber num_order, od.status estado
FROM customers cs
LEFT JOIN payments py
  ON cs.customerNumber = py.customerNumber
LEFT JOIN orders od
  ON cs.customerNumber = od.customerNumber;
  
-- Me regresa todo los clientes  y nulos que de los campos num order y estado por eso es mejor usar LEFT JOIN a INNER JOIN,
--  para saber quien no tiene esos datos.
  
 -- 6  
SELECT cs.customerNumber num_cliente, concat(cs.contactFirstName,' ',cs.contactLastName) cliente,
od.orderNumber num_order, od.status estado
FROM customers cs
LEFT  JOIN payments py
  ON cs.customerNumber = py.customerNumber
LEFT JOIN orders od
  ON cs.customerNumber = od.customerNumber
WHERE od.orderNumber IS NULL;

-- 7
SELECT concat(e.firstName,' ',e.lastName) empleado, cs.customerName cliente, py.checkNumber, py.amount total
FROM employees e
LEFT JOIN customers cs
	ON e.employeeNumber = cs.salesRepEmployeeNumber
LEFT JOIN payments py
	ON cs.customerNumber = py.customerNumber
WHERE cs.customerName IS NOT NULL;

-- 8 
SELECT cs.customerNumber num_cliente, concat(cs.contactFirstName,' ',cs.contactLastName) cliente,
od.orderNumber num_order, od.status estado
FROM customers cs
RIGHT JOIN payments py
  ON cs.customerNumber = py.customerNumber
RIGHT JOIN orders od
  ON cs.customerNumber = od.customerNumber;

  
 -- 9  
SELECT cs.customerNumber num_cliente, concat(cs.contactFirstName,' ',cs.contactLastName) cliente,
od.orderNumber num_order, od.status estado
FROM customers cs
RIGHT JOIN payments py
  ON cs.customerNumber = py.customerNumber
RIGHT JOIN orders od
  ON cs.customerNumber = od.customerNumber
WHERE od.orderNumber IS NULL;

-- 10
SELECT concat(e.firstName,' ',e.lastName) empleado, cs.customerName cliente, py.checkNumber, py.amount total
FROM employees e
RIGHT JOIN customers cs
	ON e.employeeNumber = cs.salesRepEmployeeNumber
RIGHT JOIN payments py
	ON cs.customerNumber = py.customerNumber
WHERE cs.customerName IS NOT NULL;

-- Las diferencias al usar RIGHT JOIN en los 3 ultimos ejercicios es que en lugar de asociarse al campo de clientes
-- me devuelve todos lo campos que cumplen la condicion pero no se obtenienen todos los clientes, sino los clientes
-- con los campos del RIGHT JOIN, y los nulos asociados a clientes no se muestran.

CREATE VIEW evev1_535 AS
(SELECT o.orderNumber, sum(quantityOrdered) Total
FROM orders o
JOIN orderdetails od
	ON o.orderNumber = od.orderNumber
GROUP BY od.orderNumber);

SELECT * FROM eve1_535 WHERE Total>100;


CREATE VIEW evev2_535 AS
(SELECT o.orderNumber, o.status, py.amount
FROM payments py
JOIN orders o
	ON py.customerNumber = o.customerNumber);

SELECT * FROM eve2_535 WHERE orderNumber IN (50,51,52);

CREATE VIEW eves3v3_535 AS
(SELECT o.orderNumber, o.orderDate, od. orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
FROM orders o
JOIN orderdetails od
	ON o.orderNumber = od.orderNumber
JOIN products p
	ON p.productCode = od.productCode);
    
SELECT * FROM eve3_535 WHERE priceEach > 100;


