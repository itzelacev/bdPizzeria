
-- Crear usuario "deptoVentas" que tenga privilegios solo de SELECT a las vistas 4 y 5. 
CREATE USER 'depVentas'@'localhost' identified by 'florecilla';

GRANT SELECT ON db_PIZZERIA_CAPRI.VW4_CAB_PEDIDO1 TO 'depVentas'@'localhost';

GRANT SELECT ON db_PIZZERIA_CAPRI.VW5_LISTA_PED1 TO 'depVentas'@'localhost';