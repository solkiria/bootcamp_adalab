# Crear base de datos desde cero:
CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;

#Creamos la tabla Zapatillas especificando para cada columna sus características:
CREATE TABLE Zapatillas (
id_zapatilla INT AUTO_INCREMENT NOT NULL,
modelo VARCHAR(45) NOT NULL,
color VARCHAR(45) NOT NULL,
PRIMARY KEY (id_zapatilla)
);

# Creamos la tabla Clientes especificando para cada columna sus características:
CREATE TABLE Clientes (
id_cliente INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(45) NOT NULL,
numero_telefono INT(9) NOT NULL,
email VARCHAR(45) NOT NULL,
direccion VARCHAR(45) NOT NULL,
ciudad VARCHAR(45),
provincia VARCHAR(45) NOT NULL,
pais VARCHAR(45) NOT NULL,
codigo_postal VARCHAR(45) NOT NULL,
PRIMARY KEY (id_cliente)
);

# Creamos tabla empleadosespecificando para cada columna sus características:
create table Empleados (
id_empleado INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(45) NOT NULL,
tienda VARCHAR(45) NOT NULL,
salario INT,
fecha_incorporacion DATE NOT NULL,
PRIMARY KEY (id_empleado)
);

# Creamos la tabla Facturas especificando para cada columna sus características:
create table Facturas (
id_factura INT AUTO_INCREMENT NOT NULL,
numero_factura VARCHAR(45) NOT NULL,
fecha date NOT NULL,
id_zapatilla INT NOT NULL,
id_empleado INT NOT NULL,
id_cliente INT NOT NULL,
PRIMARY KEY (id_factura),
CONSTRAINT fk_zapatillas FOREIGN KEY (id_zapatilla) REFERENCES Zapatillas (id_zapatilla),
CONSTRAINT fk_empleados FOREIGN KEY (id_empleado) REFERENCES Empleados (id_empleado),
CONSTRAINT fk_clientes FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente)
);
