-- INSERTS
-- 4 Clientes
INSERT INTO CLIENTE (limite_credito,saldo,descuento) VALUES ('5000','300','15');
INSERT INTO CLIENTE (limite_credito,saldo,descuento) VALUES ('1000','100','9');
INSERT INTO CLIENTE (limite_credito,saldo,descuento) VALUES ('900','0','5');
INSERT INTO CLIENTE (limite_credito,saldo,descuento) VALUES ('150','0','3');

SELECT * FROM CLIENTE;



-- 6 Direcciones (1 cliente tiene 3 direcciones, los demás solo una)
INSERT INTO DIRECCIONES (calle,numero,estado,id_cliente) 
	VALUES ('Av. Universidad','333','Colima','1');
INSERT INTO DIRECCIONES (calle,numero,estado,id_cliente) 
	VALUES ('Refugio Morales','677','Jalisco','1');
INSERT INTO DIRECCIONES (calle,numero,estado,id_cliente) 
	VALUES ('Tuberos','76','Colima','1');
INSERT INTO DIRECCIONES (calle,numero,estado,id_cliente) 
	VALUES ('Lago de Castores','25','Colima','2');
INSERT INTO DIRECCIONES (calle,numero,estado,id_cliente) 
	VALUES ('Del Lago','152','Jalisco','3');
INSERT INTO DIRECCIONES (calle,numero,estado,id_cliente) 
	VALUES ('Albaniles','340','Colima','4');
    
SELECT * FROM DIRECCIONES;



-- 5 artículos
INSERT INTO ARTICULO (descripcion,precio_unitario) 
	VALUES ('Peperoni','150');
INSERT INTO ARTICULO (descripcion,precio_unitario) 
	VALUES ('Hawaiana','150');
INSERT INTO ARTICULO (descripcion,precio_unitario) 
	VALUES ('Cuatro quesos','180');
INSERT INTO ARTICULO (descripcion,precio_unitario) 
	VALUES ('Vegetariana','150');
INSERT INTO ARTICULO (descripcion,precio_unitario) 
	VALUES ('Mexicana','180');

SELECT * FROM ARTICULO;



-- 2 sucursales
INSERT INTO SUCURSAL (telefono) VALUES ('3123185217');
INSERT INTO SUCURSAL (telefono) VALUES ('5514856457');

SELECT * FROM SUCURSAL;



-- 1 pedidos con 3 artículos pedidos
INSERT INTO PEDIDO (direccion,fecha,id_cliente,id_sucursal)
	VALUES ('Av Universidad 333','5may','1','1');
INSERT INTO PEDIDO_ARTICULO (cantidad,precio_unitario,id_articulo,id_pedido)
	VALUES ('2','150','1','1');
INSERT INTO PEDIDO_ARTICULO (cantidad,precio_unitario,id_articulo,id_pedido)
	VALUES ('1','180','3','1');
UPDATE PEDIDO SET monto_total = 480 WHERE id_pedido = 1;

SELECT * FROM PEDIDO;
SELECT * FROM PEDIDO_ARTICULO;



-- 1 pedido con 1 artículo pedido
INSERT INTO PEDIDO (direccion,fecha,id_cliente,id_sucursal)
	VALUES ('Del lago 152','1may','3','2');
INSERT INTO PEDIDO_ARTICULO (cantidad,precio_unitario,id_articulo,id_pedido)
	VALUES ('1','180','5','2');
UPDATE PEDIDO SET monto_total = 180 WHERE id_pedido = 2;

SELECT * FROM PEDIDO;
SELECT * FROM PEDIDO_ARTICULO;



-- existencias aleatorias de artículos en sucursal
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('15','1','1');
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('10','1','2');
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('12','1','3');
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('13','1','4');
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('14','1','5');
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('3','2','1');
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('5','2','2');
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('4','2','3');
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('3','2','4');
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo) 
	VALUES ('7','2','5');

SELECT * FROM ARTICULO_SUCURSAL;