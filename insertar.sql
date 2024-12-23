USE Distribuidora_Electrica;

-- Insertar datos para la tabla Departamento
INSERT INTO Distribuidora_Electrica.departamento (nombre) 
VALUES 
  ('Administracion'), 
  ('Encargados'), 
  ('Deposito'), 
  ('Ventas');

-- Insertar datos para la tabla Empleados
INSERT INTO Distribuidora_Electrica.empleados (id_departamento, nombre, fecha_ingreso, Salario)
VALUES
  (3, 'Nicolas Ferro', '2022-06-07', 830000),
  (2, 'Sebastian', '2001-04-15', 3250000),
  (3, 'Javier Navarro', '2020-06-12', 1045200),
  (1, 'Karina', '2013-02-23', 1453400),
  (3, 'Franco', '2022-06-07', 830000),
  (2, 'Leandro', '1993-03-21', 4556112),
  (1, 'Bernardo', '1990-01-18', 6356532),
  (4, 'German Nieto', '2003-09-16', 3250000),
  (4, 'Juan Pablo', '2001-02-11', 1832000);

-- Insertar datos para la tabla Vendedores
INSERT INTO Distribuidora_Electrica.vendedores (id_empleados, comision)
VALUES
  (8, 0.05),
  (9, 0.04);

-- Insertar datos para la tabla Clientes
INSERT INTO Distribuidora_Electrica.clientes (id_vendedores, nombre, telefono, email) 
VALUES
  (1, 'María López', '123456789', 'maria@gmail.com'), 
  (2, 'Pedro Sánchez', '987654321', 'pedro@hotmail.com'),
  (2, 'Jorge Vazques', '1150320231', 'jorge@hotmail.com'),
  (1, 'Norberto Sanchez', '114323465', 'norber@hotmail.com');

-- Insertar datos para la tabla Categoría
INSERT INTO Distribuidora_Electrica.categoria (nombre) 
VALUES 
  ('Electricidad'), 
  ('Iluminación'), 
  ('Herramientas');

-- Insertar datos para la tabla Producto
INSERT INTO Distribuidora_Electrica.producto (id_categoria, nombre, descripcion, precio, stock) 
VALUES
  (1, 'Lámpara LED', 'Lámpara A60 9w', 500.00, 150), 
  (2, 'Spot', 'Spot de embutir Redondo', 3500.00, 50),
  (2, 'Farol', 'Farol Hexagonal negro', 5200.00, 15),
  (1, 'Llave Térmica', '2x25', 2400.00, 60),
  (1, 'Disyuntor', '2x40', 3200.00, 45),
  (3, 'Pico Loro', 'Cremallera 300mm', 3500.00, 8),
  (3, 'Llave Ajustable', '10mm', 800.00, 50);

-- Insertar datos para la tabla Transporte
INSERT INTO Distribuidora_Electrica.transporte (nombre, envios_provincias) 
VALUES
  ('Transporte ABC', 'Buenos Aires, Córdoba, Santa Fe'), 
  ('Logística Express', 'Mendoza, Salta, Tucumán');

-- Insertar datos para la tabla Métodos de Pago
INSERT INTO Distribuidora_Electrica.metodos_de_pago (nombre, descripcion) 
VALUES
  ('Efectivo', 'Pago en efectivo al recibir el pedido'), 
  ('Transferencia', 'Pago mediante transferencia bancaria');

-- Insertar datos para la tabla Proveedor
INSERT INTO Distribuidora_Electrica.provedor (nombre, telefono, email) 
VALUES
  ('Mota', '123123123', 'mota@gmail.com'), 
  ('Distribuidora Central', '987987987', 'ventas@central.com'),
  ('San Justo Iluminacion', '46822312', 'sanjusto@gmail.com');

-- Insertar datos para la tabla Proveedor_Producto
INSERT INTO Distribuidora_Electrica.provedor_producto (id_provedor, id_producto) 
VALUES
  (1, 6), 
  (1, 7), 
  (2, 1),
  (2, 4),
  (2, 5),
  (3, 2),
  (3, 3);

-- Insertar datos para la tabla Compras
INSERT INTO Distribuidora_Electrica.compras (id_provedor, id_empleados, total) 
VALUES
  (1, 2, 25000.00), 
  (2, 2, 70000.00);

-- Insertar datos para la tabla Detalle de Compras
INSERT INTO Distribuidora_Electrica.detalle_de_compras (id_compras, id_producto, cantidad) 
VALUES
  (1, 1, 50), 
  (2, 2, 20);

-- Insertar datos para la tabla Direcciones
INSERT INTO Distribuidora_Electrica.direcciones (id_clientes, ciudad, calle, numero, codigo_postal) 
VALUES
  (1, 'Buenos Aires', 'Av. Siempreviva', 123, '1001'), 
  (2, 'Rosario', 'Calle Falsa', 456, '2000');
