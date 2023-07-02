USE northwind;

/* 1. Crea una consulta de los primeros 10 productos según ID y muestre sus nombres y sus precios. */

SELECT product_name, unit_price
FROM products
ORDER BY product_id
LIMIT 10;

/* 2. Crea una consulta de los últimos 10 productos según ID y muestre sus nombres y sus precios. */

SELECT product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;

/* 3. Conocer los pedidos distintos y que no estén duplicados */

SELECT DISTINCT order_id
FROM order_details;

/* 4. Ver los dos primeros pedidos en detalle, sin que haya duplicados */

SELECT DISTINCT order_id
FROM order_details
WHERE order_id
LIMIT 2;

/* 5. Que pedidos han suspuesto un mayor coste para la empresa = ALIAS : ImporteTotal */

SELECT order_id, unit_price AS ImporteTotal
FROM order_details
ORDER BY unit_price DESC
LIMIT 3;

/* 6. Seleccionar el ID de los pedidos situados entre la posición 5 y 10 respecto al coste */

SELECT order_id
FROM order_details
ORDER BY unit_price DESC
LIMIT 6
OFFSET 4;

/* 7. Lista de categorías de los tipos de pedido = NombreDeCategoria */

SELECT category_name AS NombreDeCategoria
FROM categories;

/* 8. Cual es la fecha de envío de los pedidos almacenados, si estos sufrieran un retraso de 5 días */

SELECT DATE_ADD(shipped_date, INTERVAL 5 DAY)  AS FechaRetrasada
FROM orders
;

/* 9. Selecciona los productos con un precio mayor o igual a 15 dólares, pero menor o igual que 50 dólares */

SELECT *
FROM products
WHERE unit_price BETWEEN 15 AND 50;

/* 10. Muestra los productos que cuesten 18, 19 0 20 dólares */

SELECT *
FROM products
WHERE unit_price IN (18, 19, 20);