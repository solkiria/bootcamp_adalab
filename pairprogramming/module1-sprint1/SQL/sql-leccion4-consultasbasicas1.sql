/* Utilizar la base de datos Northwind. */
USE northwind
;

/* 1. Obtener una lista con los datos de las empleadas y empleados de la empresa Northwind.*/
SELECT `employee_id`, `last_name`, `first_name`
FROM employees
;

/* 2. Obtenemos los productos con importe unitario entre 0 y 5. */
SELECT `product_name`
FROM `products`
WHERE `unit_price` <= 5
;

/* 3. Conocer  los productos que tengan un precio exacto de 18, 19 o 20. */
SELECT *
FROM `products`
WHERE `unit_price` = 20 OR `unit_price` = 19 OR `unit_price` = 18
;

/* 4. Obtener los datos de los productos que tengan precio >=15, y <=50. */
SELECT *
FROM `products`
WHERE `unit_price` >= 15 AND `unit_price` <= 50
;

/* 5. Seleccionar los productos que no tengan el valor de precio. */
SELECT *
FROM `products`
WHERE `unit_price` IS NULL
;

/* 6. Obtener los datos de los productos con precio menor a 15$, pero con un id menor de 10. */
SELECT *
FROM `products`
WHERE `product_id` < 10 AND `unit_price` < 15
;

/* 7. Obtener lo mismo que elejercicio anterior utilizando el operador NOT. */
SELECT *
FROM `products`
WHERE NOT `product_id` > 10 AND NOT `unit_price` > 15
;

/* 8. Obtener los paises donde se hacen pedidos a Northwind. */
SELECT `ship_country`
FROM `orders`
;

