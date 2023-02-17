# Crear base de datos desde cero:
create schema tienda_zapatillas;
use tienda_zapatillas;

#Creamos la tabla Zapatillas especificando para cada columna sus características:
create table Zapatillas (
id_zapatilla int auto_increment not null,
modelo varchar(45) not null,
color varchar(45) not null,
primary key (id_zapatilla)
);

# Creamos la tabla Clientes especificando para cada columna sus características:
create table Clientes (
id_cliente int auto_increment not null,
nombre varchar(45) not null,
numero_telefono int(9) not null,
email varchar(45) not null,
direccion varchar(45) not null,
ciudad varchar(45),
provincia varchar(45) not null,
pais varchar(45) not null,
codigo_postal varchar(45) not null,
primary key (id_cliente)
);

# Creamos tabla empleadosespecificando para cada columna sus características:
create table Empleados (
id_empleado int auto_increment not null,
nombre varchar(45) not null,
tienda varchar(45) not null,
salario int,
fecha_incorporacion date not null,
primary key (id_empleado)
);

# Creamos la tabla Facturas especificando para cada columna sus características:
create table Facturas (
id_factura int auto_increment not null,
numero_factura varchar(45) not null,
fecha date not null,
id_zapatilla int not null,
id_empleado int not null,
id_cliente int not null,
primary key (id_factura),
constraint fk_zapatillas foreign key (id_zapatilla) references Zapatillas (id_zapatilla),
constraint fk_empleados foreign key (id_empleado) references Empleados (id_empleado),
constraint fk_clientes foreign key (id_cliente) references Clientes (id_cliente)
);
