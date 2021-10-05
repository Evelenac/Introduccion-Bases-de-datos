SHOW DATABASES;

USE tienda;

SHOW tables;

DESCRIBE empleado;
DESCRIBE articulo;
DESCRIBE puesto;
DESCRIBE venta;

SELECT nombre
FROM empleado;

SELECT * 
FROM empleado;

SELECT *
FROM empleado
WHERE apellido_paterno = 'Risom';

SELECT *
FROM empleado
WHERE id_puesto > 100;

SELECT *
FROM empleado
WHERE id_puesto >= 100
  AND id_puesto <= 200;
  
SELECT *
FROM empleado
WHERE id_puesto = 100
   OR id_puesto = 200;
   
SELECT *
FROM empleado
WHERE id_puesto IN (100,200);

SELECT *
FROM empleado
WHERE id_puesto = 4;

SELECT *
FROM puesto
WHERE salario >10000;

DESCRIBE articulo;

SELECT *
FROM articulo 
WHERE precio > 1000
AND iva > 100;

DESCRIBE venta;

SELECT *
FROM venta
WHERE id_articulo IN (135,963)
AND id_empleado IN ( 835, 369);

SELECT *
FROM puesto
ORDER BY salario DESC;

SELECT *
FROM puesto
ORDER BY salario ASC;

SELECT *
FROM puesto
ORDER BY salario;

SELECT *
FROM empleado
LIMIT 5;

SELECT *
FROM puesto
ORDER BY salario DESC
LIMIT 5;
