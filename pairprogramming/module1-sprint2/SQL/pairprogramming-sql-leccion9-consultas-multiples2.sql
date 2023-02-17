-- Ejercicios Pair programming Sprint 2
-- Lección 9: Consultas múltiples 2
-- Silvia Gordón, Lourdes Ochoa, Sonia Ruíz



/*En esta lección de pair programming vamos a continuar trabajando sobre la base de datos Northwind.
El día de hoy vamos a realizar ejercicios en los que practicaremos las queries SQL a múltiples tablas
usando los operadores LEFT JOIN, RIGHT JOIN, SELF JOIN. De esta manera podremos combinar los datos de
diferentes tablas en las mismas bases de datos, para así realizar consultas mucho mas complejas.*/
USE northwind;

/*Ejercicio 1. Qué empresas tenemos en la BBDD Northwind:
Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas
cliente, los ID de sus pedidos y las fechas.*/

SELECT orders.order_id, customers.company_name, orders.order_date
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;



/*Ejercicio 2. Pedidos por cliente de UK:
Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de pedidos que ha realizado
cada cliente del propio Reino Unido de cara a conocerlos mejor y poder adaptarse al mercado
actual. Especificamente nos piden el nombre de cada compañía cliente junto con el número de pedidos.*/
SELECT customers.company_name AS NombreCliente, COUNT(orders.order_id) AS NumeroPedidos
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name;


/*Ejercicio 3. Empresas de UK y sus pedidos:
También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino Unido (tengan
pedidos o no) junto con los ID de todos los pedidos que han realizado, el nombre de contacto de cada empresa
y la fecha del pedido.*/
/*Hemos añadido la columna Contacto, respecto a la imagen de la solucion, ya que en el enunciado nos pide saber
el nombre de contacto de cada empresa*/
SELECT orders.order_id AS NumeroPedidos, customers.company_name AS NombreCliente, orders.order_date AS FechaPedido , customers.contact_name AS Contacto
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK';


/*Ejercicio 4. Empleadas que sean de la misma ciudad:
Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que muestre por pantalla
los datos de todas las empleadas y sus supervisoras. Concretamente nos piden: la ubicación, nombre, y apellido
tanto de las empleadas como de las jefas. Investiga el resultado, ¿sabes decir quién es el director?*/

SELECT `Subordinados`.city, `Subordinados`.first_name AS NombreEmpleado, `Subordinados`.last_name AS ApellidoEmpleado, `Jefes`.city, `Jefes`.first_name AS NombreJefe, `Jefes`.last_name AS ApellidoJefe
FROM employees AS `Subordinados`, employees AS `Jefes`
WHERE `Subordinados`.reports_to = `Jefes`.employee_id
ORDER BY `Subordinados`.city;
/*El directo es Andrew Fuller, ya que los empleados reportan tanto a Andrew Fuller como a Steven Buchanan, pero
Steven Buchanan reporta a su vez a Andrew Fuller.*/


/*ESTE EJERCICIO NO SE EVALUARÁ SI NO ES ENTREGADO
1. BONUS: FULL OUTER JOIN Pedidos y empresas con pedidos asociados o no:
Selecciona todos los pedidos, tengan empresa asociada o no, y todas las empresas tengan pedidos asociados
o no. Muestra el ID del pedido, el nombre de la empresa y la fecha del pedido (si existe).*/

SELECT orders.order_id, customers.company_name, orders.order_date
FROM orders
LEFT JOIN customers
ON customers.customer_id = orders.customer_id
UNION
SELECT orders.order_id, customers.company_name, orders.order_date
FROM orders
RIGHT JOIN customers
ON customers.customer_id = orders.customer_id;
