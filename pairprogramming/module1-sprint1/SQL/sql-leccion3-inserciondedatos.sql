# Introducir, actualizar y eliminar información en la base de datos tienda_zapatillas:
## Utilizar la base de datos tienda_zapatillas:
use tienda_zapatillas;

## Insertar datos en la tabla zapatillas:
insert into zapatillas (id_zapatilla, modelo, color, marca, talla)
values (1, 'XQYUN', 'Negro', 'Nike', 42),
		(2, 'UOPMN', 'Rosas', 'Nike', 39),
        (3, 'OPNYT', 'Verdes', 'Adidas', 35);

## Insertar datos en la tabla empleados:
insert into empleados (id_empleado, nombre, tienda, salario, fecha_incorporacion)
values (1, 'Laura', 'Alcobendas', 25987, '2010-09-03'),
		(2, 'Maria', 'Sevilla', 0, '2001-04-11'),
        (3, 'Ester', 'Oviedo', 30165.98, '2000-11-29');

## Insertar datos en la tabla clientes:        
insert into clientes (id_cliente, nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
values (1, 'Monica', 1234567289, 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', 28176),
		(2, 'Lorena', 289345678, 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', 12346),
        (3, 'Carmen', 298463759, 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', 23456);

## Insertar datos en la tabla facturas:
insert into facturas (id_factura, numero_factura, fecha, id_zapatilla, id_empleado, id_cliente, total)
values (1, '123', '2001-12-11', 1, 2, 1, 54.98),
		(2, '1234', '2005-05-23', 1, 1, 3, 89.91),
        (3, '12345', '2015-09-18', 2, 3, 3, 76.23);

## Actualizar datos en la tabla zapatillas cambiando un color almacenado:  
update zapatillas
set color = 'Amarillas'
where color = "Rosas";

## Actualizar datos en la tabla empleados cambiando la ubicación de uno de los empleados:
update empleados
set tienda = 'A Coruña'
where id_empleado = 1;

## Actualizar datos en la tabla clientes cambiando el número de teléfono de uno de los clientes:
update clientes
set numero_telefono = 123456728
where id_cliente = 1;

## Actualizar datos en la tabla facturas cambiando el precio de uno de los productos:
update facturas
set total = 89.91
where id_zapatilla = 2;
        