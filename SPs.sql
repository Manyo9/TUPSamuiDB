DELIMITER //
-- Gestion de usuarios
CREATE PROCEDURE spIniciarSesion(
IN usuario1 varchar(30),
IN contrasenia1 varchar(32)
)
BEGIN
SELECT u.id, r.nombre as rol,
     u.usuario, u.fechaAlta, u.fechaBaja FROM usuarios u
     join roles r on r.id = u.idRol
     where u.usuario=usuario1 and u.contrasenia=contrasenia1;

END //

-- NEW Usuario Socio
CREATE PROCEDURE spNuevoUsuarioSocio(
IN usuario1 varchar(30),
IN contrasenia1 varchar(32)
)
BEGIN
	declare idSoc int;
	select idSoc = id, nombre from roles
    where nombre = 'Socio';
	INSERT INTO usuarios(idRol, usuario, contrasenia, fechaAlta) values (idSoc, usuario1, contrasenia1, NOW());
END//

-- NEW Usuario Empleado
CREATE PROCEDURE spNuevoUsuarioEmpleado(
IN usuario1 varchar(30),
IN contrasenia1 varchar(32),
IN idRol1 int
)

BEGIN
	INSERT INTO usuarios(idRol, usuario, contrasenia, fechaAlta) values (idRol1, usuario1, contrasenia1, NOW());
END//

-- NEW Usuario Admin
CREATE PROCEDURE spNuevoUsuarioAdmin(
IN usuario1 varchar(30),
IN contrasenia1 varchar(32)
)
BEGIN
	declare idAdmin int;
	select idAdmin = id, nombre from roles
    where nombre = 'Admin';
    
	INSERT INTO usuarios(idRol, usuario, contrasenia, fechaAlta) values (idAdmin, usuario1, contrasenia1, NOW());
END//

-- Dar de baja Usuario
CREATE PROCEDURE spDarDeBajaUsuario(
IN idUsuario1 int,
OUT status tinyint
)
BEGIN
	DECLARE count int;
	SELECT count(*) INTO count FROM usuarios u where u.id = idUsuario1 and u.fechaBaja IS NULL;
    IF (count = 1) THEN
	BEGIN
		UPDATE usuarios set fechaBaja = NOW() where id=idUsuario1;
		SET status = 1;
    END;
    ELSE SET status = 0;
    END IF;
END//

-- Productos
-- GET ALL
CREATE PROCEDURE spObtenerProductos()
BEGIN
    SELECT id, nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen
	FROM productos;
END //

-- GET MY ID
CREATE PROCEDURE spObtenerProductoPorID(
	IN id int
)
BEGIN
    SELECT p.id, p.nombre, p.precio, p.descripcion, p.observaciones, p.activo, p.puntosGanados, p.urlImagen
	FROM productos p
    WHERE p.id = id;
END //

-- CREATE
CREATE PROCEDURE spInsertarProducto(
IN nom varchar(32),
IN pre double,
IN des varchar(100),
IN obs varchar(100),
IN act boolean,
IN pg int,
IN url varchar(100)
)
BEGIN
    INSERT INTO productos (nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen)
    VALUES (nom,pre,des,obs,act,pg,url);
END //

-- UPDATE
CREATE PROCEDURE spActualizarProducto(
IN i int,
IN nom varchar(32),
IN pre double,
IN des varchar(100),
IN obs varchar(100),
IN act boolean,
IN pg int,
IN url varchar(100)
)
BEGIN
    UPDATE productos 
    SET nombre = nom,
	precio = pre,
    descripcion = des,
    observaciones = obs,
    activo = act,
    puntosGanados = pg,
    urlImagen = url
    WHERE id = i;
    
END //

-- DELETE
CREATE PROCEDURE spBorrarProducto(
IN id int
)
BEGIN
	DELETE 
    FROM productos p
    WHERE p.id = id;
END //

-- Gestion de pedidos
-- NEW
CREATE PROCEDURE spRegistrarPedido(
IN idPuntoVenta1 int,
IN idSocio1 int,
IN idEmpleado1 int,
IN observaciones1 varchar(100),
OUT id int
)
BEGIN
    INSERT INTO pedidos (idPuntoVenta, idSocio, idEmpleado, idEstado, observaciones, fechaPedido)
    VALUES (idPuntoVenta1, idSocio1, idEmpleado1, 1, observaciones1, now());
    SET id := last_insert_id();
END //

-- NEW DETALLE
CREATE PROCEDURE spRegistrarDetallePedido(
IN idPedido1 int, 
IN idProducto1 int,
IN cantidad1 tinyint,
IN precioUnitario1 double,
IN puntosGanados1 int,
IN comentarios1 varchar(150)
)
BEGIN
    INSERT INTO detallespedido (idPedido, idProducto, cantidad, precioUnitario, puntosGanados, comentarios)
    Values (idPedido1, idProducto1, cantidad1, precioUnitario1, puntosGanados1, comentarios1);
END //

-- GET all Pedidos
CREATE PROCEDURE spObtenerPedidos()
BEGIN
    select p.id, pv.nombre as puntoVenta,
    so.apellido+' '+so.nombre as socio,
    em.apellido+' '+em.nombre as empelado,
    ep.nombre as estado,
    p.observaciones, p.fechaPedido
    from pedidos p 
    join puntosventa pv on p.idPuntoVenta = pv.id
    join socios so on p.idSocio = so.id
    join empleados em on p.idEmpleado = em.id
    join estadospedido ep on p.idEstado = ep.id;
END //

-- Get detalles de un pedido
CREATE PROCEDURE spObtenerDetalles(
	IN id int
)
BEGIN
    select idDetalle, idProducto, pr.nombre as nombreProducto,
    cantidad, precioUnitario,
    dp.puntosGanados, comentarios from detallespedido dp
    join productos pr on pr.id = dp.idProducto
    where idPedido = id;
END //

-- Cancelar un pedido
CREATE PROCEDURE spCancelarPedido(
	IN idPedido INT
)
BEGIN
	declare idCancel int;
	select idCancel = id, nombre from estadospedido
    where nombre = 'Cancelado';
    update pedidos p set p.idEstado = idCancel where p.id = idPedido;
END//

-- Borrar un detalle por ID
CREATE PROCEDURE spBorrarDetalleId(
	IN idDetalle1 INT
)
BEGIN
	delete from detallespedido where dp.idDetalle = idDetalle1;
END //

DELIMITER ;