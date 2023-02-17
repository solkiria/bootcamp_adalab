-- Ejercicios Pair programming Sprint 2
-- Lección 13: CTEs
-- Silvia Gordón, Lourdes Ochoa, Sonia Ruíz

/* 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers.
Los resultados de esta query tendrán las columnas CustID y CompanyName.*/

USE northwind;

WITH empleadas_compañias(CustID,CompanyName)
AS (
	SELECT customer_id AS CustID, company_name AS CompanyName
	FROM customers)
SELECT empleadas_compañias.CustID, empleadas_compañias.CompanyName
FROM empleadas_compañias;

/*2. Selecciona solo los de que vengan de "Germany"
Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior,
pero solo queremos los que pertezcan a "Germany".
Los resultados de esta query tendrán las columnas CustID y CompanyName.*/

WITH empleadas_compañias(CustID, CompanyName, Country)
AS (
	SELECT customer_id AS CustId, company_name AS CompanyName, country AS Country
	FROM customers)
SELECT empleadas_compañias.CustID, empleadas_compañias.CompanyName
FROM empleadas_compañias 
WHERE empleadas_compañias.Country = "Germany";

/*3. Extraed el id de las facturas y su fecha de cada cliente.
En este caso queremos extraer todas las facturas que se han emitido a un cliente, 
su fecha la compañia a la que pertenece.
📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).
Los resultados de esta query tendrán las columnas customer_id, company_name, order_id, oder_date.*/

WITH facturas_cliente(order_id, NumeroCliente, order_Date)
AS (
	SELECT o.order_id AS order_id, o.customer_id AS NumeroCliente, o.order_date AS order_date
	FROM orders AS o)
SELECT c.customer_id, c.company_name, facturas_cliente.order_id, facturas_cliente.order_date
FROM customers AS c
INNER JOIN facturas_cliente
ON c.customer_id = facturas_cliente.NumeroCliente;


/*4. Contad el número de facturas por cliente
Mejoremos la query anterior. En este caso queremos saber el número de facturas emitidas por cada cliente.
Los resultados de esta query tendrán las columnas cutomer_id, company_name, numero_facturas.*/

WITH facturas_cliente(order_id, customer_id, order_date)
AS (
	SELECT o.order_id, o.customer_id, o.order_date
	FROM orders AS o)
SELECT c.customer_id, c.company_name, COUNT(facturas_cliente.order_id) AS numero_factura
FROM customers AS c
INNER JOIN facturas_cliente
ON c.customer_id = facturas_cliente.customer_id
GROUP BY c.customer_id;

/*5. Cuál la cantidad media pedida de todos los productos ProductID.
Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.
Los resultados de esta query tendrán las columnas producto, media_p?:*/

WITH suma_productos(producto,contador,suma)
AS (
	SELECT o.product_id AS producto, COUNT(o.product_id) AS contador, SUM(o.quantity) AS suma
    FROM order_details AS o
    GROUP BY product_id)
SELECT p.product_name AS producto, AVG(suma_productos.suma/suma_productos.contador) AS media_productos
FROM products AS p
INNER JOIN suma_productos 
ON p.product_id = suma_productos.producto
GROUP BY p.product_name;
