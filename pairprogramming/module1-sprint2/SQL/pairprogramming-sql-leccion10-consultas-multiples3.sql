-- Ejercicios Pair programming Sprint 2
-- Lección 10: Consultas múltiples 3
-- Silvia Gordón, Lourdes Ochoa, Sonia Ruíz



use `northwind`;

SELECT  'Hola!'  AS tipo_nombre
FROM customers;

/* Enunciados
Extraer toda la información sobre las compañias que tengamos en la BBDD
Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD. 
Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). 
Pero importante! No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal. 
Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.
Nota: Deberás crear esta columna temporal en cada instrucción SELECT.
El resultado de la query debe devolver:*/

SELECT city as City, company_name as CompanyName, contact_name as ContactName, "Customers" as Relationship
FROM customers
UNION
SELECT city as City, company_name as CompanyName, contact_name as ContactName, "Suppliers" as Relationship
FROM suppliers
ORDER by city ASC;

/* Extraer todos los pedidos gestinados por "Nancy Davolio"
En este caso, nuestro jefe quiere saber cuantos pedidos ha gestionado "Nancy Davolio", una de nuestras empleadas. 
Nos pide todos los detalles tramitados por ella.
Los resultados de la query deben parecerse a la siguiente tabla:*/

SELECT *
FROM orders
WHERE employee_id  IN (
						SELECT employee_id
                        FROM employees
                        WHERE first_name = "Nancy" and last_name= "Davolio");

/* Extraed todas las empresas que no han comprado en el año 1997
En este caso, nuestro jefe quiere saber cuántas empresas no han comprado en el año 1997.
💡 Pista 💡 Para extraer el año de una fecha, podemos usar el estamento year. Más documentación sobre este método .
El resultado de la query será:*/

SELECT company_name as CompanyName, country as Country
FROM customers
WHERE customer_id NOT IN (
						SELECT customer_id
                        FROM orders
                        WHERE (YEAR(order_date)) = "1997");


/* Extraed toda la información de los pedidos donde tengamos "Konbu"
Estamos muy interesados en saber como ha sido la evolución de la venta de Konbu a lo largo del tiempo. Nuestro jefe nos pide que nos muestre todos los pedidos que contengan "Konbu".
💡 Pista 💡 En esta query tendremos que combinar conocimientos adquiridos en las lecciones anteriores como por ejemplo el INNER JOIN.
Los resultados nos devolverán algo como esto:*/

SELECT *
FROM orders
INNER JOIN order_details
on orders.order_id = order_details.order_id
WHERE product_id  IN (
						SELECT product_id
                        FROM products
                        WHERE product_name = "Konbu");


/* Happy coding 💪 */