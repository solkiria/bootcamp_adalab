# Realizar correcciones en las tablas de la base de datos tienda_zapatilas:
##Modificar la tabla Zapatillas introduciendo la columna marca y la columna talla, especificando sus características:
ALTER TABLE Zapatillas
	ADD COLUMN marca VARCHAR(45) NOT NULL, 
	ADD COLUMN talla INT NOT NULL;

##Modificar la tabla Empleados editando la columna salario:
ALTER TABLE Empleados
	MODIFY COLUMN salario FLOAT NOT NULL;

##Modificar la tabla Clientes eliminando la columna pais y editando la columna codigo_postal:
ALTER TABLE Clientes
	DROP COLUMN pais,
	MODIFY COLUMN codigo_postal INT(5);
    
##Modificar la tabla Facturas introduciendo la columna total, especificando sus características:
ALTER TABLE Facturas
	ADD COLUMN total FLOAT NOT NULL;
