
-- ELIMINAR BASE DE DATOS SI YA EXISTE Y VOLVERLA A CREAR


DROP DATABASE IF EXISTS Distribuidora_Electrica; 
CREATE DATABASE Distribuidora_Electrica; 

-- USAR BASE DE DATOS
use Distribuidora_Electrica;

-- CREAR TABLAS

CREATE TABLE Distribuidora_Electrica.clientes(
    id_clientes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_vendedores INT,
    nombre VARCHAR(20) NOT NULL,
    telefono VARCHAR(15) UNIQUE,
    email VARCHAR(50) DEFAULT 'cliente_x@gmail.com'
);

CREATE TABLE Distribuidora_Electrica.empleados(
    id_empleados INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_departamento INT,
    nombre VARCHAR(200),
    fecha_ingreso DATE,
    Salario DECIMAL(10,2)
    
);

CREATE TABLE Distribuidora_Electrica.vendedores(
    id_vendedores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_empleados INT,
    comision DECIMAL(10,2)
);

CREATE TABLE Distribuidora_Electrica.producto(
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    nombre VARCHAR(200),
    descripcion TEXT,
    precio DECIMAL(10,2),
    stock INT NOT NULL
);


CREATE TABLE Distribuidora_Electrica.pedidos(
    id_pedidos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_clientes INT,
    id_empleados INT,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    id_metodo_de_pago INT,
    id_transporte INT

);

CREATE TABLE Distribuidora_Electrica.provedor(
    id_provedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(200)
);

CREATE TABLE Distribuidora_Electrica.provedor_producto(
    id_provedor_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_provedor INT,
    id_producto INT
);

CREATE TABLE Distribuidora_Electrica.compras(
    id_compras INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_provedor INT,
    id_empleados INT,
    fecha_compra DATETIME DEFAULT CURRENT_TIMESTAMP, 
    total DECIMAL(10,2)

);

CREATE TABLE Distribuidora_Electrica.detalle_de_compras(
    id_detalle_compras INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_compras INT, 
    id_producto INT,
    cantidad INT

);

CREATE TABLE Distribuidora_Electrica.detalle_de_pedidos(
    id_detalle_pedidos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pedidos INT,
    id_producto INT,
    cantidad INT
    
);

CREATE TABLE Distribuidora_Electrica.transporte(
    id_transporte INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    envios_provincias VARCHAR(200)
);

CREATE TABLE Distribuidora_Electrica.metodos_de_pago(
    id_metodo_de_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Distribuidora_Electrica.departamento(
    id_departamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL
);

CREATE TABLE Distribuidora_Electrica.categoria(
    id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL
);

CREATE TABLE Distribuidora_Electrica.direcciones(
    id_direcciones INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_clientes INT,
    id_empleados INT,
    ciudad VARCHAR(200),
    calle VARCHAR(200),
    numero INT,
    codigo_postal VARCHAR(5)
);


-- Claves foráneas =

ALTER TABLE Distribuidora_Electrica.empleados
    ADD CONSTRAINT fk_departamento
    FOREIGN KEY (id_departamento) REFERENCES Distribuidora_Electrica.departamento(id_departamento);


ALTER TABLE Distribuidora_Electrica.vendedores
    ADD CONSTRAINT fk_empleados_vendedores
    FOREIGN KEY (id_empleados) REFERENCES Distribuidora_Electrica.empleados(id_empleados);

ALTER TABLE Distribuidora_Electrica.clientes
    ADD CONSTRAINT fk_vendedores_clientes
    FOREIGN KEY (id_vendedores) REFERENCES Distribuidora_Electrica.vendedores(id_vendedores);


ALTER TABLE Distribuidora_Electrica.producto
    ADD CONSTRAINT fk_categoria_producto
    FOREIGN KEY (id_categoria) REFERENCES Distribuidora_Electrica.categoria(id_categoria);

ALTER TABLE Distribuidora_Electrica.pedidos
    ADD CONSTRAINT fk_clientes_pedidos
    FOREIGN KEY (id_clientes) REFERENCES Distribuidora_Electrica.clientes(id_clientes),
    ADD CONSTRAINT fk_empleados_pedidos
    FOREIGN KEY (id_empleados) REFERENCES Distribuidora_Electrica.empleados(id_empleados),
    ADD CONSTRAINT fk_metodo_de_pago_pedidos
    FOREIGN KEY (id_metodo_de_pago) REFERENCES Distribuidora_Electrica.metodos_de_pago(id_metodo_de_pago),
    ADD CONSTRAINT fk_transporte_pedidos
    FOREIGN KEY (id_transporte) REFERENCES Distribuidora_Electrica.transporte(id_transporte);

ALTER TABLE Distribuidora_Electrica.provedor_producto
    ADD CONSTRAINT fk_provedor_provedor_producto
    FOREIGN KEY (id_provedor) REFERENCES Distribuidora_Electrica.provedor(id_provedor),
    ADD CONSTRAINT fk_producto_provedor_producto
    FOREIGN KEY (id_producto) REFERENCES Distribuidora_Electrica.producto(id_producto);

ALTER TABLE Distribuidora_Electrica.compras
    ADD CONSTRAINT fk_provedor_compras
    FOREIGN KEY (id_provedor) REFERENCES Distribuidora_Electrica.provedor(id_provedor),
    ADD CONSTRAINT fk_empleados_compras
    FOREIGN KEY (id_empleados) REFERENCES Distribuidora_Electrica.empleados(id_empleados);


ALTER TABLE Distribuidora_Electrica.detalle_de_compras
    ADD CONSTRAINT fk_compras_detalle_de_compras
    FOREIGN KEY (id_compras) REFERENCES Distribuidora_Electrica.compras(id_compras),
    ADD CONSTRAINT fk_producto_detalle_de_compras
    FOREIGN KEY (id_producto) REFERENCES Distribuidora_Electrica.producto(id_producto);

ALTER TABLE Distribuidora_Electrica.detalle_de_pedidos
    ADD CONSTRAINT fk_pedidos_detalle_de_pedidos
    FOREIGN KEY (id_pedidos) REFERENCES Distribuidora_Electrica.pedidos(id_pedidos),
    ADD CONSTRAINT fk_producto_detalle_de_pedidos
    FOREIGN KEY (id_producto) REFERENCES Distribuidora_Electrica.producto(id_producto);

ALTER TABLE Distribuidora_Electrica.direcciones
    ADD CONSTRAINT fk_clientes_direcciones
    FOREIGN KEY (id_clientes) REFERENCES Distribuidora_Electrica.clientes(id_clientes),
    ADD CONSTRAINT fk_empleados_direcciones
    FOREIGN KEY (id_empleados) REFERENCES Distribuidora_Electrica.empleados(id_empleados);