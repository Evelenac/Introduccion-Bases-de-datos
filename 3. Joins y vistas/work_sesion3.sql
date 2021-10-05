USE tienda;
SHOW KEYS FROM venta;

DESCRIBE empleado;

SELECT * FROM empleado;
SELECT * FROM puesto;


SELECT *
FROM empleado AS e
JOIN puesto AS p
  ON e.id_puesto = p.id_puesto;
  
SELECT *
FROM puesto AS p
LEFT JOIN empleado e
ON p.id_puesto = e.id_puesto;

SELECT *
FROM empleado AS e
RIGHT JOIN puesto AS p
ON e.id_puesto = p.id_puesto;

#Reto 1
Show tables;
DESCRIBE empleado;
DESCRIBE venta;

SELECT *
FROM empleado AS e
JOIN venta AS v
  ON e.id_empleado = v.id_empleado;

SELECT * FROM articulo;
SELECT * FROM venta;

SELECT  v.clave, round(sum(a.precio),2)
FROM venta v
JOIN articulo a
	ON v.id_articulo = a.id_articulo
GROUP BY v.clave;

SELECT *
FROM venta AS v
JOIN articulo a
	ON v.id_articulo = a.id_articulo;

#Ejemplo2
SELECT *
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo;
  
SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo;

CREATE VIEW tickets_535 AS 
(SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo);
  
SELECT *
FROM tickets_535;

SELECT clave, round(sum(precio),2) total
FROM tickets_535
GROUP BY clave;

#Reto2
SELECT * FROM empleado;
SELECT * FROM puesto;

SELECT p.nombre, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM empleado e
JOIN puesto p
	ON e.id_puesto = p.id_puesto
LIMIT 1;

CREATE VIEW eve1_535 AS
(SELECT p.nombre, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM empleado e
JOIN puesto p
	ON e.id_puesto = p.id_puesto
LIMIT 1);

SELECT *
FROM eve1_535;

SELECT * FROM venta;
SELECT * FROM articulo;
SELECT * FROM empleado;
SELECT * FROM puesto;

SELECT concat(e.nombre,' ', e.apellido_paterno, e. apellido_materno) empleado, a.nombre producto
FROM venta v
JOIN articulo a
	ON v.id_articulo = a.id_articulo
JOIN empleado e
	ON v.id_empleado = e.id_empleado;

CREATE VIEW eve2_535 AS
(SELECT concat(e.nombre,' ', e.apellido_paterno, e. apellido_materno) empleado, a.nombre producto
FROM venta v
JOIN articulo a
	ON v.id_articulo = a.id_articulo
JOIN empleado e
	ON v.id_empleado = e.id_empleado);
SELECT *
FROM eve2_535;

SELECT p.nombre, count(v.clave) ventas
FROM empleado e
JOIN puesto p
	ON e.id_puesto = p.id_puesto
JOIN venta v
	ON e.id_empleado = v.id_empleado
GROUP BY p.nombre
ORDER BY ventas DESC;

CREATE VIEW eve4_535 AS
(SELECT p.nombre, count(v.clave) ventas
FROM empleado e
JOIN puesto p
	ON e.id_puesto = p.id_puesto
JOIN venta v
	ON e.id_empleado = v.id_empleado
GROUP BY p.nombre
ORDER BY ventas DESC);

DROP VIEW eve3_535;

SELECT *
FROM eve4_535;






