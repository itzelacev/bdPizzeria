-- Si sirve la llave foranea id_sucursal en ARTICULO_SUCURSAL
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo)
	VALUES ('7','222','2');

-- Si sirve la llave foranea id_articulo en ARTICULO_SUCURSAL 
INSERT INTO ARTICULO_SUCURSAL (existencias,id_sucursal,id_articulo)
	VALUES ('7','2','555');

-- Si sirve la llave foranea id_cliente en DIRECCIONES
INSERT INTO DIRECCIONES (calle,numero,estado,id_cliente)
	VALUES ('Av. Lopez','12','Colima','444');

-- Si sirve la llave foranea id_cliente en PEDIDO
INSERT INTO PEDIDO (direccion,fecha,monto_total,id_cliente,id_sucursal)
	VALUES ('Albañiles','1may','360','635','2');

-- Si sirve la llave foranea id_sucursal en PEDIDO
INSERT INTO PEDIDO (direccion,fecha,monto_total,id_cliente,id_sucursal)
	VALUES ('Albañiles','1may','360','2','1347');

-- Si sirve la llave foranea id_articulo en PEDIDO_ARTICULO
INSERT INTO PEDIDO_ARTICULO (cantidad,precio_unitario,id_articulo,id_pedido)
	VALUES ('3','150','1397','1');

-- Si sirve la llave foranea id_pedido en PEDIDO_ARTICULO
INSERT INTO PEDIDO_ARTICULO (cantidad,precio_unitario,id_articulo,id_pedido)
	VALUES ('3','150','4','3312');
    
    
    
    
    
    
    
    
    