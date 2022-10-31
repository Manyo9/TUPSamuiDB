DELIMITER //
##################### USUARIOS #####################
CREATE PROCEDURE spIniciarSesion(
IN usuario1 varchar(30),
IN contrasenia1 varchar(32)
)
BEGIN
    declare role varchar(30);
    select r1.nombre into role from usuarios u1
    join roles r1 on r1.id = u1.idRol
    where u1.usuario=usuario1 and u1.contrasenia=contrasenia1;

	IF (role<>'Socio' AND role IS NOT NULL) THEN
		BEGIN
		SELECT u3.id,
        em.id as idEmpleado,
        r3.nombre as rol,
		u3.usuario, u3.fechaAlta,
        u3.fechaBaja FROM usuarios u3
		join roles r3 on r3.id = u3.idRol
        join empleados em on em.idUsuario = u3.id
		where u3.usuario=usuario1 and u3.contrasenia=contrasenia1;
		END;
    ELSE
		BEGIN
        SELECT u2.id,
        so.id as idSocio,
        r2.nombre as rol,
		u2.usuario, u2.fechaAlta,
        u2.fechaBaja FROM usuarios u2
		join roles r2 on r2.id = u2.idRol
        join socios so on so.idUsuario = u2.id
		where u2.usuario=usuario1 and u2.contrasenia=contrasenia1;
		END;
    END IF;
END //

-- NEW Usuario Socio
CREATE PROCEDURE spNuevoUsuarioSocio(
IN usuario1 varchar(30),
IN contrasenia1 varchar(32)
)
BEGIN
	select id into @idSoc from roles
    where nombre = 'Socio';
	INSERT INTO usuarios(idRol, usuario, contrasenia, fechaAlta) values (@idSoc, usuario1, contrasenia1, NOW());
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
	select id into @idAdmin from roles
    where nombre = 'Admin';
    
	INSERT INTO usuarios(idRol, usuario, contrasenia, fechaAlta) values (@idAdmin, usuario1, contrasenia1, NOW());
END//

-- Dar de baja Usuario
CREATE PROCEDURE spDarDeBajaUsuario(
IN idUsuario1 int,
OUT status tinyint
)
BEGIN
	SELECT count(*) INTO @count FROM usuarios u where u.id = idUsuario1 and u.fechaBaja IS NULL;
    IF (@count = 1) THEN
	BEGIN
		UPDATE usuarios set fechaBaja = NOW() where id=idUsuario1;
		SET status = 1;
    END;
    ELSE SET status = 0;
    END IF;
END//

##################### PRODUCTOS #####################
-- GET ALL
CREATE PROCEDURE spObtenerProductos()
BEGIN
    SELECT id, nombre, precio, descripcion, observaciones, activo, puntosGanados, urlImagen
	FROM productos;
END //

-- GET BY ID
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
    VALUES (nom, pre, des, obs, act, pg, url);
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

##################### PEDIDOS #####################
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
    CONCAT(so.apellido,' ',so.nombre) as socio,
    CONCAT(em.apellido,' ',em.nombre) as empelado,
    ep.nombre as estado,
    p.observaciones, p.fechaPedido
    from pedidos p 
    join puntosventa pv on p.idPuntoVenta = pv.id
    left join socios so on p.idSocio = so.id
    left join empleados em on p.idEmpleado = em.id
    join estadospedido ep on p.idEstado = ep.id;
END //

CREATE PROCEDURE spObtenerPedidoPorId(
	IN id1 int
)
BEGIN
    select p.id, pv.nombre as puntoVenta,
    CONCAT(so.apellido,' ',so.nombre) as socio,
    CONCAT(em.apellido,' ',em.nombre) as empelado,
    ep.nombre as estado,
    p.observaciones, p.fechaPedido
    from pedidos p 
    join puntosventa pv on p.idPuntoVenta = pv.id
    left join socios so on p.idSocio = so.id
    left join empleados em on p.idEmpleado = em.id
    join estadospedido ep on p.idEstado = ep.id
    where p.id = id1;
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
	select id from estadospedido
    where nombre = 'Cancelado'
    into @idCancel;
    update pedidos p set p.idEstado = @idCancel where p.id = idPedido;
END//

-- Borrar un detalle por ID
CREATE PROCEDURE spBorrarDetalleId(
	IN idDetalle1 INT
)
BEGIN
	delete from detallespedido dp where dp.idDetalle = idDetalle1;
END //

##################### GUSTOS #####################
-- GET all gustos
CREATE PROCEDURE spObtenerGustos()
BEGIN
	select nombre, activo from gustos;
END //

-- UPDATE gusto by id
CREATE PROCEDURE spEditarGusto(
    IN id1 int,
    IN nombre1 varchar(30),
    IN activo1 boolean
)
BEGIN
	update gustos set activo = activo1, nombre = nombre1 where id = id1;
END //

-- CREATE gusto
CREATE PROCEDURE spCrearGusto(
	IN nombre1 varchar(30),
    IN activo1 boolean
)
BEGIN
	INSERT INTO gustos (nombre, activo) VALUES (nombre1, activo1);
END //

-- DELETE gusto
CREATE PROCEDURE spEliminarGusto(
	in id1 int
)
BEGIN
    DELETE FROM gustos WHERE id = id1;
END //


##################### SOCIOS #####################
-- NEW
CREATE PROCEDURE spRegistrarSocio(
IN idUsuario1 int,
IN nombre1 varchar(30),
IN apellido1 varchar(30),
IN domicilio1 varchar(50),
IN email1 varchar(40),
IN dni1 int,
IN telefono1 varchar(20)
)
BEGIN
    INSERT INTO socios (idUsuario, nombre, apellido,domicilio,email,dni,telefono,fechaAlta)
    VALUES (idUsuario1,nombre1,apellido1,domicilio1,email1,dni1,telefono1,NOW());
END //

-- GET all socios
CREATE PROCEDURE spObtenerSocios()
BEGIN
	select * from socios;
END //

-- DELETE
CREATE PROCEDURE spBorrarSocio(
IN id int
)
BEGIN
	DELETE 
    FROM socios s
    WHERE s.id = id;
END //

CREATE PROCEDURE spDarDeBajaSocio(
IN idSocio1 int,
OUT status tinyint
)
BEGIN
	DECLARE count int;
	SELECT count(*) INTO count FROM socios s where s.id = idSocio1 and s.fechaBaja IS NULL;
    IF (count = 1) THEN
	BEGIN
		UPDATE socios set fechaBaja = NOW() where id=idSocio1;
		SET status = 1;
    END;
    ELSE SET status = 0;
    END IF;
END//


##################### PROMOCIONES #####################
-- NEW
CREATE PROCEDURE spRegistrarPromocion(
IN nombre1 varchar(50),
IN descripcion1 varchar(100),
IN precioPuntos1 mediumint,
IN fechaDesde1 datetime,
IN fechaHasta1 datetime,
OUT id int
)
BEGIN
    INSERT INTO promociones (nombre, descripcion, precioPuntos, fechaDesde, fechaHasta)
    VALUES (nombre1, descripcion1, precioPuntos1, fechaDesde1, fechaHasta1);
    SET id := last_insert_id();
END //

-- NEW DETALLE
CREATE PROCEDURE spRegistrarDetallePromocion(
IN idPromocion1 int, 
IN idProducto1 int,
IN cantidad1 tinyint
)
BEGIN
    INSERT INTO detallepromocion (idPromocion, idProducto, cantidad)
    Values (idPromocion1, idProducto1, cantidad1);
END //


-- GET all promociones
CREATE PROCEDURE spObtenerPromociones()
BEGIN
	select p.nombre,p.descripcion,p.precioPuntos,p.fechaDesde,p.fechaHasta
    from promociones p;
END //


-- GET detalles de una promocion
CREATE PROCEDURE spObtenerDetallesPromocion(
	IN id int
)
BEGIN
    select dp.id , pr.nombre as nombreProducto,
    cantidad from detallepromocion dp
    join productos pr on pr.id = dp.idProducto
    where idPromocion = id;
END //
DELIMITER ;