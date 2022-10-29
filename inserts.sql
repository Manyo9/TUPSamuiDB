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

-- Estados de pedido
INSERT INTO samuidb.estadospedido (nombre) values('Creado');
INSERT INTO samuidb.estadospedido (nombre) values('Pagado');
INSERT INTO samuidb.estadospedido (nombre) values('Entregado');
INSERT INTO samuidb.estadospedido (nombre) values('Cancelado');

-- Productos
INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Cucurucho de 1 bocha', 280.00, 'Cucurucho clásico con una bocha de helado de gusto a elección', null, true, 28, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Cucurucho de 2 bochas', 500.00, 'Cucurucho clásico con dos bochas de helado de gusto a elección', null, true, 50, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Samui Batido', 800.00, 'Batido de helado con leche, un gusto de helado a elección.', null, true, 80, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('1kg healdo', 1100.00, '1kg de helado, elegir hasta cuatro gustos.', null, true, 110, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('1/2 kg healdo', 650.00, 'Medio kg de helado, elegir hasta tres gustos.', null, true, 65, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Palito bombón', 75.00, 'Helado de crema bañado en chocolate en palito.', null, true, 7, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Palito frutal de agua', 60.00, 'Helado de agua de frutilla, naranja, o limón.', null, true, 6, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Caja palitos frutales, 20 unidades', 1100.00, '20 unidades de palitos de helado de agua, sabores: frutilla, naranja, o limón.',
'No disponible por falta de packaging.', false, 110, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Pote 1L helado', 750.00, '1 litro de helado de dulce de leche, chocolate, o vainilla.', null, true, 75, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Salsa de chocolate', 200.00, 'Salsa líquida de chocolate para agregar a helados.',
'Dado de baja por falta de acuerdo con proveedor', false, 20, null);

INSERT INTO samuidb.productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
values ('Salsa de dulce de leche', 200.00, 'Salsa líquida de dulce de leche para agregar a helados.', null, true, 20, null);

-- Promociones
INSERT INTO samuidb.promociones (nombre, descripcion, precioPuntos, fechaDesde, fechaHasta) values
('Promo Palitos bombon');



