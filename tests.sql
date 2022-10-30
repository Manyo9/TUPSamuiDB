#Login valido socio
call spIniciarSesion('manyouser','manyo123');
#Login invalido socio
call spIniciarSesion('manyouser','manyo124');
#Login valido empleado
call spIniciarSesion('abraguas','somebody');
#Login invalido empleado
call spIniciarSesion('abraguas','oncetoldme');
#Login valido admin
call spIniciarSesion('manyoadmin','manyo456');

# Nuevo usuario socio
call spNuevoUsuarioSocio('testuser','testpass');
select * from usuarios join roles on usuarios.idRol = roles.id where roles.nombre = 'Socio';

# Nuevo usuario empleado
call spNuevoUsuarioEmpleado('testempl','testpass', 2);
select * from usuarios join roles on usuarios.idRol = roles.id where roles.nombre = 'Empleado';

# Nuevo usuario admin
call spNuevoUsuarioAdmin('testadmin','testpass');
select * from usuarios join roles on usuarios.idRol = roles.id where roles.nombre = 'Admin';

# Dar de baja usuario
select * from usuarios where usuario = 'testuser' and contrasenia = 'testpass';
call spDarDeBajaUsuario(6, @status);
select *, @status from usuarios where usuario = 'testuser';

#Obtener productos
call spObtenerProductos();

#Obtener producto por ID
call spObtenerProductoPorID(1);

#Crear producto
call spInsertarProducto('Test producto', 1, 'prueba','prueba',false,0,null);

#Actualizar producto
call spActualizarProducto(12, 'Nombre cambiado', 0, 'prueba cambiada', 'prueba cambiada',true, 1, 'test.png');
call spObtenerProductoPorID(12);

#Borrar Producto
call spBorrarProducto(12);
call spObtenerProductoPorID(12);

#Traer pedidos
call spObtenerPedidos();

# Registrar Pedido y obtener pedido por ID
call spRegistrarPedido(1,1,1,'test',@last_id);
call spObtenerPedidoPorId(@last_id);

# Obtener detalles de un pedido
call spObtenerDetalles(1);

# Cancelar un pedido
call spObtenerPedidoPorId(4);
call spCancelarPedido(4);
call spObtenerPedidoPorId(4);

# Agregar un detalle
select * from productos;
call spRegistrarDetallePedido(3, 1, 1, 280, 28, 'de dulce de leche granizado');
call spObtenerDetalles(3);

# Borrar un detalle por id
call spBorrarDetalleId(9);
call spObtenerDetalles(3);

# Get all gustos
call spObtenerGustos();

# Editar un gusto
call spEditarGusto(1, 'Crema Chantilly test', false);
call spObtenerGustos();

# Create gusto
call spCrearGusto('Test gusto', 1);
call spObtenerGustos();

# Delete gusto
call spEliminarGusto(27);

# Registrar socio
call spRegistrarSocio(null, 'test', 'name', 'test street', 'test@prueba.com', 12345678, '351234567');

# Get ALL socios
call spObtenerSocios();

# Borrar un socio
call spBorrarSocio(5);

# Dar de baja socio
call spDarDeBajaSocio(6, @status);
select @status;
