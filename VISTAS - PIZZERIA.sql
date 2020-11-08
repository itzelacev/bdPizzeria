
-- Vista 1: que muestre los clientes con sus direcciones con los campos: 
-- nombre_completo_cliente, saldo, domicilio_completo (incluye: calle, número y estado)

CREATE VIEW VW1_CLIENTES AS
    SELECT cli.nombre_completo AS nombre_completo_cliente, cli.saldo, 
	CONCAT(dir.calle,' #',dir.numero,' ',dir.estado) 'domicilio_completo'
	FROM CLIENTE cli
	INNER JOIN DIRECCIONES dir ON dir.id_cliente = cli.id_cliente;
SELECT * FROM VW1_CLIENTES;


-- Vista 2: que muestre el artículo más vendido con los campos:  
-- cuantos_vendi y  nombre_articulo_vendido
CREATE VIEW VW2_ART_MAS_VENDIDO AS
	SELECT DISTINCT art.descripcion AS nombre_articulo_vendido, 
	SUM(ped.cantidad) 'cuantos_vendi'
    FROM PEDIDO_ARTICULO ped 
    INNER JOIN ARTICULO art ON ped.id_articulo = art.id_articulo
    GROUP BY art.descripcion 
    ORDER BY SUM(cantidad) DESC 
    LIMIT 1;

SELECT * FROM VW2_ART_MAS_VENDIDO;


-- Vista 3: que muestre de las sucursales y las existencias que tienen de 
-- artículos con los campos: existencia, nombre_articulo y nombre_sucursal
CREATE VIEW VW3_SUCURSALES AS
	SELECT artsuc.existencias AS existencia, art.descripcion AS nombre_articulo,
	suc.nombre AS nombre_sucursal
	FROM SUCURSAL suc
    INNER JOIN ARTICULO_SUCURSAL artsuc ON suc.id_sucursal = artsuc.id_sucursal
    INNER JOIN ARTICULO art ON art.id_articulo = artsuc.id_articulo;

SELECT * FROM VW3_SUCURSALES;


-- Vista 4: los datos de la cabecera del pedido número 1 con los campos: 
-- id_pedido, nombre_completo_cliente,  monto_total, fecha_pedido y Domicilio_completo (incluye: calle, número y estado)
CREATE VIEW VW4_CAB_PEDIDO1 AS
    SELECT ped.id_pedido, cli.nombre_completo AS nombre_completo_cliente, ped.monto_total,
	ped.fecha AS fecha_pedido, ped.direccion AS domicilio_completo
	FROM PEDIDO ped 
    INNER JOIN CLIENTE cli ON ped.id_cliente = cli.id_cliente
    WHERE ped.id_pedido = 1;

SELECT * FROM VW4_CAB_PEDIDO1;


-- Vista 5: de artículos (listado) que corresponden al pedido número 1 con los campos: 
-- direccionesid_pedido, cantidad, precio_vendido, nombre_articulo_vendido
CREATE VIEW VW5_LISTA_PED1 AS
	SELECT ped.direccion, ped.id_pedido, pedart.cantidad, 
	pedart.precio_unitario AS precio_vendido, 
	art.descripcion AS nombre_articulo_vendido
	FROM PEDIDO_ARTICULO pedart
    INNER JOIN PEDIDO ped ON pedart.id_pedido = ped.id_pedido
    INNER JOIN ARTICULO art ON pedart.id_articulo = art.id_articulo
    WHERE ped.id_pedido = 1;

SELECT * FROM VW5_LISTA_PED1;
