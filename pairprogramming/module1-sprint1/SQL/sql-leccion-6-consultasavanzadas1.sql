USE northwind
;

/* 1. Buscar el producto más caro y más barato */
SELECT MAX(unit_price) AS highestPrices, MIN(unit_price) AS lowestPrice
FROM products
;

/* 2. Diseñar una consulta para conocer el número de productos y su precio medio. */
SELECT COUNT(product_id) AS NumProductos, ROUND(AVG(unit_price),2) AS MedPrice
FROM products
;

/* 3. Sacar la carga máxima y minima de los pedidos de UK. */
SELECT MAX(freight) AS MaxCarga, MIN(freight) AS MinCarga
FROM orders
WHERE ship_country = 'UK'
;

/* 4. Mostrar los productos se venden por encima del precio medio de los demás productos y ordenar de mayor a menor. */
SELECT AVG(unit_price) AS PrecioMedio
FROM products
;

/* PrecioMedio=28,87 */

SELECT product_id, unit_price
FROM products
WHERE unit_price > 28.87
ORDER BY unit_price DESC
;

/* 5. Conocer el número de productos que se han descontinuado (Discontinued) */
SELECT COUNT(discontinued) AS Descontinuados
FROM products
WHERE discontinued = 1
;
/*Descontinuados=0, es decir, ninguno*/

/* 6. Dar detalles de los productos discontinuados. */
SELECT product_id, product_name
FROM products
WHERE discontinued = 0
ORDER BY product_id DESC
LIMIT 10
;
