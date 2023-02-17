# Realizar correcciones en las tablas de la base de datos tienda_zapatilas:
##Modificar la tabla Zapatillas introduciendo la columna marca y la columna talla, especificando sus características:
ALTER TABLE Zapatillas
	ADD COLUMN marca varchar(45) not null, 
	ADD COLUMN talla int not null;

##Modificar la tabla Empleados editando la columna salario:
ALTER TABLE Empleados
	MODIFY COLUMN salario float not null;

##Modificar la tabla Clientes eliminando la columna pais y editando la columna codigo_postal:
ALTER TABLE Clientes
	DROP COLUMN pais,
	MODIFY COLUMN codigo_postal int(5);
    
##Modificar la tabla Facturas introduciendo la columna total, especificando sus características:
ALTER TABLE Facturas
	ADD COLUMN total float not null;
