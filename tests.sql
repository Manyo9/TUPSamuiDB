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



