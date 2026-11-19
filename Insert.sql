-- VendeTuProblema - Datos de prueba
-- Ejecutar despues de schema.sql en PostgreSQL / Neon.
-- Inserta al menos 5 registros en cada una de las 17 tablas.

BEGIN;

INSERT INTO usuario (id,nombre,email,password_hash,telefono,fecha_aceptacion_politica,activo) VALUES
(1,'Ana Lopez','ana@example.com','hash_demo_ana','600111001',CURRENT_TIMESTAMP,TRUE),
(2,'Carlos Ruiz','carlos@example.com','hash_demo_carlos','600111002',CURRENT_TIMESTAMP,TRUE),
(3,'Lucia Martin','lucia@example.com','hash_demo_lucia','600111003',CURRENT_TIMESTAMP,TRUE),
(4,'David Sanchez','david@example.com','hash_demo_david','600111004',CURRENT_TIMESTAMP,TRUE),
(5,'Marta Perez','marta@example.com','hash_demo_marta','600111005',CURRENT_TIMESTAMP,TRUE),
(6,'Javier Torres','javier@example.com','hash_demo_javier','600222001',CURRENT_TIMESTAMP,TRUE),
(7,'Elena Gomez','elena@example.com','hash_demo_elena','600222002',CURRENT_TIMESTAMP,TRUE),
(8,'Pablo Diaz','pablo@example.com','hash_demo_pablo','600222003',CURRENT_TIMESTAMP,TRUE),
(9,'Sara Romero','sara@example.com','hash_demo_sara','600222004',CURRENT_TIMESTAMP,TRUE),
(10,'Mario Navarro','mario@example.com','hash_demo_mario','600222005',CURRENT_TIMESTAMP,TRUE),
(11,'Admin Uno','admin1@example.com','hash_demo_admin1','600333001',CURRENT_TIMESTAMP,TRUE),
(12,'Admin Dos','admin2@example.com','hash_demo_admin2','600333002',CURRENT_TIMESTAMP,TRUE),
(13,'Admin Tres','admin3@example.com','hash_demo_admin3','600333003',CURRENT_TIMESTAMP,TRUE),
(14,'Admin Cuatro','admin4@example.com','hash_demo_admin4','600333004',CURRENT_TIMESTAMP,TRUE),
(15,'Admin Cinco','admin5@example.com','hash_demo_admin5','600333005',CURRENT_TIMESTAMP,TRUE);

INSERT INTO cliente (id_usuario,tipo,nif) VALUES
(1,'particular','11111111A'),(2,'particular','22222222B'),(3,'empresa','B12345678'),
(4,'particular','44444444D'),(5,'empresa','B87654321');

INSERT INTO profesional (id_usuario,descripcion,experiencia) VALUES
(6,'Especialista en reparaciones domesticas','5 anos'),
(7,'Disenadora grafica freelance','4 anos'),
(8,'Tecnico informatico','6 anos'),
(9,'Profesional de limpieza','3 anos'),
(10,'Electricista autorizado','8 anos');

INSERT INTO administrador (id_usuario,nivel) VALUES
(11,'moderador'),(12,'moderador'),(13,'superadmin'),(14,'moderador'),(15,'superadmin');

INSERT INTO categoria (id,nombre) VALUES
(1,'Reparaciones del hogar'),(2,'Diseno grafico'),(3,'Informatica'),
(4,'Limpieza'),(5,'Electricidad');

INSERT INTO profesional_categoria (id_profesional,id_categoria) VALUES
(6,1),(7,2),(8,3),(9,4),(10,5);

INSERT INTO problema (id,id_cliente,id_categoria,titulo,descripcion,estado,prioritario) VALUES
(1,1,1,'Grifo con fuga','El grifo de la cocina pierde agua.','abierto',TRUE),
(2,2,2,'Diseno de logotipo','Necesito un logotipo para mi negocio.','abierto',FALSE),
(3,3,3,'Ordenador lento','El ordenador tarda mucho en arrancar.','abierto',FALSE),
(4,4,4,'Limpieza de vivienda','Necesito una limpieza general de un piso.','abierto',FALSE),
(5,5,5,'Instalacion de enchufe','Quiero instalar un enchufe en una habitacion.','abierto',TRUE);

INSERT INTO oferta (id,id_problema,id_profesional,precio,descripcion,estado) VALUES
(1,1,6,45.00,'Reparacion de la fuga del grifo.','aceptada'),
(2,2,7,80.00,'Diseno de logotipo con dos propuestas.','aceptada'),
(3,3,8,35.00,'Diagnostico y optimizacion del ordenador.','aceptada'),
(4,4,9,60.00,'Limpieza general de la vivienda.','aceptada'),
(5,5,10,50.00,'Instalacion y comprobacion del enchufe.','aceptada');

INSERT INTO contratacion (id,id_oferta,id_problema,precio_acordado,estado,fecha_inicio,fecha_fin) VALUES
(1,1,1,45.00,'terminada',CURRENT_TIMESTAMP-INTERVAL '10 days',CURRENT_TIMESTAMP-INTERVAL '9 days'),
(2,2,2,80.00,'en_curso',CURRENT_TIMESTAMP-INTERVAL '3 days',NULL),
(3,3,3,35.00,'pendiente_conformidad',CURRENT_TIMESTAMP-INTERVAL '2 days',NULL),
(4,4,4,60.00,'pendiente_pago',CURRENT_TIMESTAMP,NULL),
(5,5,5,50.00,'con_incidencia',CURRENT_TIMESTAMP-INTERVAL '1 day',NULL);

INSERT INTO pago (id,id_contratacion,importe,estado,referencia_proveedor) VALUES
(1,1,45.00,'liberado','PAGO-DEMO-001'),
(2,2,80.00,'retenido','PAGO-DEMO-002'),
(3,3,35.00,'retenido','PAGO-DEMO-003'),
(4,4,60.00,'pendiente','PAGO-DEMO-004'),
(5,5,50.00,'reembolsado','PAGO-DEMO-005');

INSERT INTO evidencia (id,id_contratacion,descripcion,ruta_archivo) VALUES
(1,1,'Foto del grifo reparado','evidencias/grifo.jpg'),
(2,2,'Primera propuesta del logotipo','evidencias/logotipo.png'),
(3,3,'Captura del diagnostico del ordenador','evidencias/diagnostico.png'),
(4,4,'Foto del estado inicial de la vivienda','evidencias/vivienda.jpg'),
(5,5,'Foto de la instalacion electrica','evidencias/enchufe.jpg');

INSERT INTO monedero (id,id_usuario,saldo) VALUES
(1,1,100.00),(2,2,120.00),(3,3,75.00),(4,4,90.00),(5,5,110.00);

INSERT INTO movimiento_monedero (id,id_monedero,id_pago,tipo,importe,estado,referencia_externa) VALUES
(1,1,1,'pago_enviado',45.00,'completado','MOV-DEMO-001'),
(2,2,2,'pago_enviado',80.00,'completado','MOV-DEMO-002'),
(3,3,3,'pago_enviado',35.00,'completado','MOV-DEMO-003'),
(4,4,4,'pago_enviado',60.00,'pendiente','MOV-DEMO-004'),
(5,5,5,'reembolso',50.00,'completado','MOV-DEMO-005');

INSERT INTO conversacion (id,id_problema,id_profesional) VALUES
(1,1,6),(2,2,7),(3,3,8),(4,4,9),(5,5,10);

INSERT INTO mensaje (id,id_conversacion,id_remitente,contenido) VALUES
(1,1,1,'Cuando podrias revisar el grifo?'),
(2,2,2,'Podrias enviarme las propuestas del logotipo?'),
(3,3,3,'El ordenador sigue funcionando muy lento.'),
(4,4,4,'Que productos utilizas para la limpieza?'),
(5,5,5,'Puedes confirmar cuando realizaras la instalacion?');

INSERT INTO valoracion (id,id_contratacion,id_autor,id_destinatario,puntuacion,comentario) VALUES
(1,1,1,6,5,'Trabajo rapido y bien realizado.'),
(2,2,2,7,4,'Buena comunicacion y diseno original.'),
(3,3,3,8,4,'El diagnostico fue claro.'),
(4,4,4,9,5,'Servicio atento y profesional.'),
(5,5,5,10,3,'El trabajo tuvo una incidencia.');

INSERT INTO notificacion (id,id_usuario,tipo,texto,leida) VALUES
(1,1,'nueva_oferta','Has recibido una oferta para tu problema.',FALSE),
(2,2,'oferta_aceptada','Tu oferta ha sido aceptada.',TRUE),
(3,3,'nuevo_mensaje','Tienes un mensaje nuevo.',FALSE),
(4,4,'pago_pendiente','Tienes un pago pendiente.',FALSE),
(5,5,'incidencia','Se ha registrado una incidencia.',TRUE);

-- Actualizar secuencias de IDsENTITY despues de insertar IDs manualmente.
SELECT setval(pg_get_serial_sequence('usuario','id'),(SELECT MAX(id) FROM usuario));
SELECT setval(pg_get_serial_sequence('categoria','id'),(SELECT MAX(id) FROM categoria));
SELECT setval(pg_get_serial_sequence('problema','id'),(SELECT MAX(id) FROM problema));
SELECT setval(pg_get_serial_sequence('oferta','id'),(SELECT MAX(id) FROM oferta));
SELECT setval(pg_get_serial_sequence('contratacion','id'),(SELECT MAX(id) FROM contratacion));
SELECT setval(pg_get_serial_sequence('pago','id'),(SELECT MAX(id) FROM pago));
SELECT setval(pg_get_serial_sequence('evidencia','id'),(SELECT MAX(id) FROM evidencia));
SELECT setval(pg_get_serial_sequence('monedero','id'),(SELECT MAX(id) FROM monedero));
SELECT setval(pg_get_serial_sequence('movimiento_monedero','id'),(SELECT MAX(id) FROM movimiento_monedero));
SELECT setval(pg_get_serial_sequence('conversacion','id'),(SELECT MAX(id) FROM conversacion));
SELECT setval(pg_get_serial_sequence('mensaje','id'),(SELECT MAX(id) FROM mensaje));
SELECT setval(pg_get_serial_sequence('valoracion','id'),(SELECT MAX(id) FROM valoracion));
SELECT setval(pg_get_serial_sequence('notificacion','id'),(SELECT MAX(id) FROM notificacion));

COMMIT;

-- COMPROBACION: cada tabla debe mostrar 5 filas.
SELECT 'usuario' AS tabla,COUNT(*) AS filas FROM usuario
UNION ALL SELECT 'cliente',COUNT(*) FROM cliente
UNION ALL SELECT 'profesional',COUNT(*) FROM profesional
UNION ALL SELECT 'administrador',COUNT(*) FROM administrador
UNION ALL SELECT 'categoria',COUNT(*) FROM categoria
UNION ALL SELECT 'profesional_categoria',COUNT(*) FROM profesional_categoria
UNION ALL SELECT 'problema',COUNT(*) FROM problema
UNION ALL SELECT 'oferta',COUNT(*) FROM oferta
UNION ALL SELECT 'contratacion',COUNT(*) FROM contratacion
UNION ALL SELECT 'pago',COUNT(*) FROM pago
UNION ALL SELECT 'evidencia',COUNT(*) FROM evidencia
UNION ALL SELECT 'monedero',COUNT(*) FROM monedero
UNION ALL SELECT 'movimiento_monedero',COUNT(*) FROM movimiento_monedero
UNION ALL SELECT 'conversacion',COUNT(*) FROM conversacion
UNION ALL SELECT 'mensaje',COUNT(*) FROM mensaje
UNION ALL SELECT 'valoracion',COUNT(*) FROM valoracion
UNION ALL SELECT 'notificacion',COUNT(*) FROM notificacion
ORDER BY tabla;
