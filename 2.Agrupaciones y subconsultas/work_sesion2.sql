USE tienda;

SELECT * FROM empleado WHERE nombre LIKE 'M%';
SELECT * FROM empleado WHERE nombre LIKE '%a';
SELECT * FROM empleado WHERE nombre LIKE 'M%a';
SELECT * FROM empleado WHERE nombre LIKE 'M_losa';

SELECT * FROM articulo WHERE nombre LIKE '%Pasta%';
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';
SELECT * FROM articulo WHERE nombre LIKE '% - %';

SELECT avg(precio) FROM articulo;
SELECT count(*) FROM articulo;

SELECT avg(salario) FROM puesto;
SELECT count(*) FROM articulo WHERE nombre LIKE '%Pasta%';
SELECT min(salario), max(salario) FROM puesto;
SELECT sum(salario) FROM (SELECT * FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS subconsulta;
 
SELECT nombre, sum(precio) AS Total FROM articulo GROUP BY nombre;
SELECT nombre, count(*) AS cantidad FROM articulo GROUP BY nombre ORDER BY cantidad DESC;
SELECT nombre, min(salario) AS menor, max(salario) AS mayor FROM puesto GROUP BY nombre;

SELECT nombre, count(*) AS total FROM puesto GROUP BY nombre;
SELECT nombre, sum(salario) AS total FROM puesto GROUP BY nombre;
SELECT * FROM venta;
SELECT id_empleado, count(clave) AS Ventas FROM venta GROUP BY id_empleado;
SELECT id_articulo, count(*) AS Ventas FROM venta GROUP BY id_articulo;

SELECT * FROM empleado WHERE id_puesto IN(SELECT id_puesto FROM puesto WHERE nombre = 'Junior Executive');
SELECT id_articulo, min(cantidad), max(cantidad)
FROM (
	SELECT clave, id_articulo, count(*) AS cantidad
	FROM venta
	GROUP BY clave, id_articulo
	ORDER BY clave) AS subconsulta
	GROUP BY id_articulo;

SELECT nombre, apellido_paterno, (SELECT salario FROM puesto WHERE id_puesto = e.id_puesto) AS sueldo
FROM empleado AS e;

SELECT nombre, apellido_paterno
FROM empleado 
WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE salario >10000);

SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM (
	SELECT clave, id_empleado, count(*) total_ventas
	FROM venta
	GROUP BY clave, id_empleado) AS subconsulta
GROUP BY id_empleado;

SELECT nombre, apellido_paterno, (SELECT nombre FROM puesto WHERE id_puesto = e.id_puesto) AS 'Puesto'
FROM empleado AS e;


