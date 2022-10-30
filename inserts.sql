-- Roles
INSERT INTO samuidb.roles (nombre) values ('Socio');
INSERT INTO samuidb.roles (nombre) values ('Empleado');
INSERT INTO samuidb.roles (nombre) values ('Admin');

-- Usuarios
INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (1, "manyouser", "manyo123", NOW());
INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (2, "manyoempleado", "manyo789", NOW());
INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (3, "manyoadmin", "manyo456", NOW());
INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (1, "pmonticoli", "qweasd123", NOW());
INSERT INTO samuidb.usuarios (idRol, usuario, contrasenia, fechaAlta) values (2, "abraguas", "somebody", NOW());

-- Empleados
INSERT into samuidb.empleados (idUsuario, nombre, apellido, telefono, email, dni, fechaAlta, fechaBaja)
values (2, 'empleado', 'manyo', '3518963212', 'manyo@samui.com', 41815522, NOW(), NULL);
INSERT into samuidb.empleados (idUsuario, nombre, apellido, telefono, email, dni, fechaAlta, fechaBaja)
values (3, 'admin', 'manyo', '3512548963', 'admin@samui.com', 40698325, NOW(), NULL);
INSERT into samuidb.empleados (idUsuario, nombre, apellido, telefono, email, dni, fechaAlta, fechaBaja)
values (3, 'empleado', 'franco', '3513287412', 'abraguas@samui.com', 42587123, NOW(), NULL);

-- Puntos de venta
INSERT INTO samuidb.puntosventa (nombre) values ('Sucursal Samui - Caja 1');
INSERT INTO samuidb.puntosventa (nombre) values ('Web');

-- Socios
INSERT INTO samuidb.socios (idUsuario,nombre,apellido,domicilio,email,dni,telefono,fechaAlta,fechaBaja) 
values (1,'agustin','manyito','messi street 123','manyo@hotmail.com','41236598','35136544782',NOW(),NULL);
INSERT INTO samuidb.socios (idUsuario,nombre,apellido,domicilio,email,dni,telefono,fechaAlta,fechaBaja) 
values (4,'pablo','monticoli','ovidio lagos','pablo@hotmail.com','4214122','3525555444',NOW(),NULL);
INSERT INTO samuidb.socios (idUsuario,nombre,apellido,domicilio,email,dni,telefono,fechaAlta,fechaBaja) 
values (null,'Lionel','Messi','Alguna Calle 123','messi@hotmail.com','26598987','0115481852',NOW(),NULL);
INSERT INTO samuidb.socios (idUsuario,nombre,apellido,domicilio,email,dni,telefono,fechaAlta,fechaBaja) 
values (null,'Linus','Sebastian','Canada 555','linussy@linustechtips.net','8975512','0358174226',NOW(),NULL);



-- Estados de pedido
INSERT INTO samuidb.estadospedido (nombre) values('Creado');
INSERT INTO samuidb.estadospedido (nombre) values('Pagado');
INSERT INTO samuidb.estadospedido (nombre) values('Entregado');
INSERT INTO samuidb.estadospedido (nombre) values('Cancelado');

-- Productos
INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Cucurucho de 1 bocha', 280.00, 'Cucurucho clásico con una bocha de helado de gusto a elección', null, true, 28, '../../../assets/imgProductos/1bocha');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Cucurucho de 2 bochas', 500.00, 'Cucurucho clásico con dos bochas de helado de gusto a elección', null, true, 50, '../../../assets/imgProductos/2bochas');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Samui Batido', 800.00, 'Batido de helado con leche, un gusto de helado a elección.', null, true, 80, '../../../assets/imgProductos/milkShake');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('1kg healdo', 1100.00, '1kg de helado, elegir hasta cuatro gustos.', null, true, 110, '../../../assets/imgProductos/1kgHelado');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('1/2 kg healdo', 650.00, 'Medio kg de helado, elegir hasta tres gustos.', null, true, 65, '../../../assets/imgProductos/medioKg');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Palito bombón', 75.00, 'Helado de crema bañado en chocolate en palito.', null, true, 7, '../../../assets/imgProductos/palitoBombon');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Palito frutal de agua', 60.00, 'Helado de agua de frutilla, naranja, o limón.', null, true, 6, '../../../assets/imgProductos/palitoFrutal');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Caja palitos frutales 20 U', 1100.00, '20 unidades de palitos de helado de agua, sabores: frutilla, naranja, o limón.',
'No disponible por falta de packaging.', false, 110, '../../../assets/imgProductos/cajaFrutal');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Pote 1L helado', 750.00, '1 litro de helado de dulce de leche, chocolate, o vainilla.', null, true, 75, '../../../assets/imgProductos/litroHelado');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Salsa de chocolate', 200.00, 'Salsa líquida de chocolate para agregar a helados.',
'Dado de baja por falta de acuerdo con proveedor', false, 20, '../../../assets/imgProductos/salsaChocolate');

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Salsa de dulce de leche', 200.00, 'Salsa líquida de dulce de leche para agregar a helados.', null, true, 20, '../../../assets/imgProductos/salsaChocolate');

-- Promociones
INSERT INTO samuidb.promociones (nombre, descripcion, precioPuntos, fechaDesde, fechaHasta) values
('Promo Palitos bombon', 'Llevate 4 palitos bombon.', 560, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 10 DAY));
INSERT INTO samuidb.promociones (nombre, descripcion, precioPuntos, fechaDesde, fechaHasta) values
('Promo kg y litro', 'Llevate 1kg de helado y un pote de litro con gustos a elección', 3700, DATE_SUB(NOW(), INTERVAL 15 DAY), DATE_ADD(NOW(), INTERVAL 15 DAY));
INSERT INTO samuidb.promociones (nombre, descripcion, precioPuntos, fechaDesde, fechaHasta) values
('Promo 2kg', 'Llevate 2kg de helado, eligiendo hasta 8 gustos a elección', 2200, DATE_SUB(NOW(), INTERVAL 18 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY));
INSERT INTO samuidb.promociones (nombre, descripcion, precioPuntos, fechaDesde, fechaHasta) values
('Promo 2kg', 'Vuelven los 2kg! Llevate 2kg de helado, eligiendo hasta 8 gustos a elección', 2200, DATE_ADD(NOW(), INTERVAL 15 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY));

-- Detalle promociones
INSERT INTO samuidb.detallepromocion (idPromocion, idProducto, cantidad) values (1, 6, 4);
INSERT INTO samuidb.detallepromocion (idPromocion, idProducto, cantidad) values (2, 4, 1);
INSERT INTO samuidb.detallepromocion (idPromocion, idProducto, cantidad) values (2, 9, 1);
INSERT INTO samuidb.detallepromocion (idPromocion, idProducto, cantidad) values (3, 4, 2);
INSERT INTO samuidb.detallepromocion (idPromocion, idProducto, cantidad) values (4, 4, 2);

-- Gustos
INSERT INTO samuidb.gustos (nombre, activo) values ('Crema Chantilly',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Crema Flan',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Crema del cielo',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Frutilla a la crema',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Bananita Dolca',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Cereza a la crema',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Menta granizada',  false);
INSERT INTO samuidb.gustos (nombre, activo) values ('Banana Split',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Sambayon',  false);
INSERT INTO samuidb.gustos (nombre, activo) values ('Pistacho',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Crema Tramontana',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Vainilla',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Dulce de leche',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Dulce de leche granizado',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Dulce de leche con nuez',  false);
INSERT INTO samuidb.gustos (nombre, activo) values ('Dulce de leche con brownies',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Chocolate',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Chocolate con almendras',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Chocolate con pasas',  false);
INSERT INTO samuidb.gustos (nombre, activo) values ('Chocolate blanco',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Chocolate suizo',  false);
INSERT INTO samuidb.gustos (nombre, activo) values ('Frutilla al agua',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Limón',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Durazno',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Tiramisú',  true);
INSERT INTO samuidb.gustos (nombre, activo) values ('Mascarpone c/ frutos del bosq',  true);

-- Pedidos y detalle pedidos
-- 1
INSERT INTO samuidb.pedidos
(idPuntoVenta, idSocio, idEmpleado, idEstado, observaciones, fechaPedido) values
(2, 1, null, 3, 'Abono con efectivo al retirar', DATE_SUB(NOW(), INTERVAL 10 DAY));

INSERT INTO samuidb.detallespedido
(idPedido, idProducto, cantidad, precioUnitario, puntosGanados) values
(1, 2, 1, 480, 48);

INSERT INTO samuidb.detallespedido
(idPedido, idProducto, cantidad, precioUnitario, puntosGanados) values
(1, 1, 1, 280, 28);

INSERT INTO samuidb.movimientospuntos (idPromocion, idDetallePedido, idSocio, puntos) values
(null, 2, 1, 48);

INSERT INTO samuidb.movimientospuntos (idPromocion, idDetallePedido, idSocio, puntos) values
(null, 2, 2, 28);

-- 2
INSERT INTO samuidb.pedidos
(idPuntoVenta, idSocio, idEmpleado, idEstado, observaciones, fechaPedido) values
(2, null, null, 1, 'Retira Jorge Martinez', DATE_SUB(NOW(), INTERVAL 35 MINUTE));

INSERT INTO samuidb.detallespedido
(idPedido, idProducto, cantidad, precioUnitario, puntosGanados, comentarios) values
(2, 2, 2, 500, 100, 'DDL y crema del cielo, y chocolate y vainilla');

INSERT INTO samuidb.detallespedido
(idPedido, idProducto, cantidad, precioUnitario, puntosGanados, comentarios) values
(2, 1, 1, 280, 28, 'Crema del cielo, con salsa de frutilla');

-- 3
INSERT INTO samuidb.pedidos
(idPuntoVenta, idSocio, idEmpleado, idEstado, observaciones, fechaPedido) values
(1, 2, 3, 2, 'Abonó con efectivo en caja', DATE_SUB(NOW(), INTERVAL 15 MINUTE));

INSERT INTO samuidb.detallespedido
(idPedido, idProducto, cantidad, precioUnitario, puntosGanados, comentarios) values
(3, 3, 5, 800, 400, 'Tres de vainilla y dos de dulce de leche');

INSERT INTO samuidb.movimientospuntos (idPromocion, idDetallePedido, idSocio, puntos) values
(null, 5, 2, 400);

INSERT INTO samuidb.detallespedido
(idPedido, idProducto, cantidad, precioUnitario, puntosGanados, comentarios) values
(3, 9, 3, 750, 225, '1 choco 1 ddl 1 vainill');

INSERT INTO samuidb.movimientospuntos (idPromocion, idDetallePedido, idSocio, puntos) values
(null, 6, 2, 225);

INSERT INTO samuidb.detallespedido
(idPedido, idProducto, cantidad, precioUnitario, puntosGanados, comentarios) values
(3, 11, 2, 200, 40, '1 choco 1 ddl 1 vainill');

INSERT INTO samuidb.movimientospuntos (idPromocion, idDetallePedido, idSocio, puntos) values
(null, 7, 2, 40);

INSERT INTO samuidb.detallespedido
(idPedido, idProducto, cantidad, precioUnitario, puntosGanados, comentarios) values
(3, 4, 1, 1100, 110, '1 choco 1 ddl 1 vainill');

INSERT INTO samuidb.movimientospuntos (idPromocion, idDetallePedido, idSocio, puntos) values
(null, 8, 2, 110);