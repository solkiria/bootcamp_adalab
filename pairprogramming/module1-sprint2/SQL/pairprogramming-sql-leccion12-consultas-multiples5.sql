-- Ejercicios Pair programming Sprint 2
-- Lección 12: Consultas múltiples 5
-- Silvia Gordón, Lourdes Ochoa, Sonia Ruíz


use `northwind`;

/* Enunciado
En esta lección de pair programming vamos a continuar trabajando sobre la base de datos Northwind. 
En este caso trabajaremos con queries correlacionadas y con estamenteos como el like y not like. 
Para solucionar algunos de los ejercicios tendremos que aplicar conocimientos apredidos previamente como los join.
Es el momento de poner práctica los conceptos aprendidos en la lección de queries múltiples V. */

/* Ejercicios
1.- Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. 
Para eso nos pide que lo hagamos con una query correlacionada.*/

SELECT E1.order_id AS 'OrderID', E1.customer_id AS 'CustomerID', E1.employee_id AS 'EmployeeID', E1.order_date AS 'OrderDate', E1.required_date AS 'RequiredDate'
FROM orders AS E1
HAVING E1.required_date = (
						SELECT MAX(E2.required_date)
                        FROM orders AS E2
                        WHERE E1.order_id = E2.order_id
                        GROUP BY E2.employee_id)
ORDER By order_id ASC;


/*2.- Extraed el precio unitario máximo (unit_price) de cada producto vendido.
Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. 
De nuevo lo tendréis que hacer con queries correlacionadas.*/

SELECT E1.product_id AS 'ProductID', E1.unit_price AS 'Max_unit_price_sold'
FROM order_details AS E1
WHERE E1.unit_price = (
					SELECT MAX(E2.unit_price)
                    FROM order_details AS E2
                    WHERE E1.product_id = E2.product_id
                    GROUP BY E2.product_id)
GROUP BY E1.product_id
ORDER BY E1.product_id;

/*3.- Ciudades que empiezan con "A" o "B".
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas 
en ciudades que empiezan por "A" o "B". */

-- Resultado con LIKE

SELECT city AS 'City', company_name AS 'CompanyName', contact_name AS 'ContactName'
FROM customers
WHERE city LIKE 'A%' or city LIKE 'B%'
ORDER BY city;

-- Resultado con REGEXP

SELECT city AS 'City', company_name AS 'CompanyName', contact_name AS 'ContactName'
FROM customers
WHERE city REGEXP '^[A|B]'
ORDER BY city;

/*4.- Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos 
que han hecho todas las ciudades que empiezan por "L".*/

SELECT P1.city AS 'ciudad', P1.company_name AS 'empresa', P1.contact_name AS 'persona_contacto', COUNT(P2.order_id) AS 'numero_pedidos'
FROM customers AS P1
INNER JOIN orders AS P2
ON P1.customer_id = P2.customer_id
WHERE P1.city LIKE 'L%'
GROUP BY P1.company_name
ORDER BY P1.company_name;

-- Resultado con REGEXP

SELECT P1.city AS 'ciudad', P1.company_name AS 'empresa', P1.contact_name AS 'persona_contacto', COUNT(P2.order_id) AS 'numero_pedidos'
FROM customers AS P1
INNER JOIN orders AS P2
ON P1.customer_id = P2.customer_id
WHERE P1.city REGEXP '^L'
GROUP BY P1.company_name
ORDER BY P1.company_name;

/*5.- Todos los clientes cuyo "contact_title" no incluya "Sales".
Nuestro objetivo es extraer los clientes que no tienen el contacto "Sales" en su "contact_title". 
Extraer el nombre de contacto, su posisión (contact_title) y el nombre de la compañia.*/

SELECT contact_name, contact_title, company_name
FROM customers
WHERE contact_title NOT LIKE '%Sales%';

/*6.- Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.*/

SELECT contact_name AS 'ContactName'
FROM customers
WHERE contact_name NOT LIKE '_a%';
