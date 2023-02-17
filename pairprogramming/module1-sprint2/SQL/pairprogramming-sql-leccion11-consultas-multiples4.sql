-- Ejercicios Pair programming Sprint 2
-- Lección 11: Consultas múltiples 4
-- Silvia Gordón, Lourdes Ochoa, Sonia Ruíz


/*Es el turno de las subqueries. En este ejercicios os planteamos una serie de queries que nos permitirán
conocer información de la base de datos, que tendréis que solucionar usando subqueries.*/
USE northwind;

/*1. Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo
de producto. En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve
el ID del producto, el nombre del producto y su ID de categoría.
La query debería resultar en una tabla con las columnas: ProductID, ProductName, CategoryID .*/

SELECT products.product_id AS 'ProductID', products.product_name AS 'ProductName', products.category_id AS 'CategoryID'
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
WHERE category_name IN
	(SELECT category_name
    FROM categories
    WHERE category_name='Beverages');

/*También podríamos hacer la misma consulta con un INNER JOIN*/
SELECT products.product_id AS 'ProductID', products.product_name AS 'ProductName', products.category_id AS 'CategoryID'
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
WHERE category_name ='Beverages';


/*2. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse
a estos países para buscar proveedores adicionales.
Los resultados de esta query tienen la columna country*/

SELECT DISTINCT(customers.country)
FROM customers
WHERE customers.country NOT IN (
	SELECT suppliers.country
    FROM suppliers);


/*3. Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del
producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.
Resultado de nuestra query deberíamos tener una tabla con las columnas OrderID, CustomerID .*/
SELECT orders.order_id AS 'OrderID', customers.customer_id AS 'CustomerID'
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
WHERE orders.order_id IN (
	SELECT order_details.order_id
	FROM order_details
	WHERE quantity>20 AND product_id=6)
ORDER BY customers.customer_id;



/*4. Extraed los 10 productos más caros
Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.
Los resultados esperados de esta query nos darían una tabla con las columnas Ten_Most_Expensive_Products, UnitPrice .*/

SELECT products.product_name AS 'Ten_Most_Expensive_Products', products.unit_price AS 'UnitPrice'
FROM products
WHERE products.unit_price IN (
	SELECT products.unit_price
	FROM products)
ORDER BY products.unit_price DESC
LIMIT 10;

/*BONUS:
1. Qué producto es más popular
Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró.
El resultado de esta query nos da una taba con las columnas ProductName y MAX(SumQuantity) con Queso cabarales 1577
Happy coding 🥳*/


