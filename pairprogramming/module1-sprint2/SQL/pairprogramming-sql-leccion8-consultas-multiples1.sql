-- Ejercicios Pair programming Sprint 2
-- Lección 8: Consultas múltiples 1
-- Silvia Gordón, Lourdes Ochoa, Sonia Ruíz


USE `northwind`;
/* 1.- Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.
Deberéis obtener una tabla similar a esta:*/

SELECT customers.company_name AS "NombreEmpresa", COUNT(orders.order_id) AS "Numero de pedidos", customers.customer_id AS "Identificador"
FROM customers
NATURAL JOIN orders
WHERE customers.country="UK"
GROUP BY customers.customer_id;

/* 2.-Productos pedidos por empresa en UK por año:
Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie de consultas adicionales. 
La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.
El resultado será una tabla similar a esta: */

SELECT customers.company_name AS "NombreEmpresa", SUM(order_details.quantity) AS "NumObjetos", YEAR(orders.order_date)
FROM order_details
INNER JOIN orders
ON orders.order_id = order_details.order_id
INNER JOIN customers
ON customers.customer_id = orders.customer_id
WHERE orders.ship_country="UK"
GROUP BY customers.company_name, YEAR(orders.order_date)
ORDER BY customers.company_name ASC;

/* 3.- Mejorad la query anterior:
Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa cantidad de objetos, teniendo en cuenta los descuentos, etc. 
Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 15% nos sale como 0.15.
La tabla resultante será: */
# En la última operación lo que realizamos es el precio por unidad multiplicado por la cantidad aplicandole el descuento (ya nos aparece sin los porcentajes por lo que habrá que multiplicar)
# Hemos hecho 1 menos ese decuento para poder ver lo que tenemos que pagar directamente, sino ponemos el 1 obtendríamos solo lo que nos descuenta.
# Si no ponemos SUM solo nos aparecería el precio total del primero pedido de esa empresa de ese año, por lo que para que nos de el precio total de todos los pedidos de esa empresa ese año utilizamos la función SUM.

SELECT customers.company_name AS "NombreEmpresa", SUM(order_details.quantity) AS "NumObjetos", YEAR(orders.order_date), SUM((order_details.unit_price*order_details.quantity)*(1- order_details.discount)) AS "DineroTotal"
FROM order_details
INNER JOIN orders
ON orders.order_id = order_details.order_id
INNER JOIN customers
ON customers.customer_id = orders.customer_id
WHERE orders.ship_country="UK"
GROUP BY customers.company_name, YEAR(orders.order_date)
ORDER BY customers.company_name ASC;

/* Happy coding 💪🏽*/