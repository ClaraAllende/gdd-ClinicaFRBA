INSERT INTO HAKUNA_MATATA.EstadoCivil(descripcion)
VALUES ('Soltero'),('Casado'),('Viudo'),('Divorciado')

INSERT INTO HAKUNA_MATATA.TipoCancelacion(descripcion)
VALUES ('Cancelada por el paciente'),('Cancelada por el medico')

INSERT INTO HAKUNA_MATATA.TipoDocumento(descripcion)
VALUES ('DNI'),('LE'),('LC')

INSERT INTO HAKUNA_MATATA.Usuario(nombre, contrasenia)
SELECT DISTINCT Paciente_Dni, 'w23e'
FROM gd_esquema.Maestra
UNION
SELECT DISTINCT Medico_Dni, 'w23e'
FROM gd_esquema.Maestra
WHERE Medico_Dni IS NOT NULL

INSERT HAKUNA_MATATA.Profesional (id_usuario,nombre,apellido,numero_documento,direccion,telefono,mail,fecha_nacimiento)
SELECT DISTINCT U.id_usuario,M.Medico_Nombre,M.Medico_Apellido, M.Medico_Dni,M.Medico_Direccion,M.Medico_Telefono,M.Medico_Mail,M.Medico_Fecha_Nac
FROM gd_esquema.Maestra M, HAKUNA_MATATA.Usuario U
WHERE U.nombre=M.Medico_Dni

INSERT HAKUNA_MATATA.TipoEspecialidad (codigo_tipo_especialidad, descripcion_tipo_especialidad)
SELECT DISTINCT M.Tipo_Especialidad_Codigo, M.Tipo_Especialidad_Descripcion
FROM gd_esquema.Maestra M
WHERE M.Medico_Dni IS NOT NULL

INSERT HAKUNA_MATATA.Especialidad (descripcion, codigo_especialidad, id_tipo_especialidad)
SELECT DISTINCT M.Especialidad_Descripcion , M.Especialidad_Codigo, TE.id_tipo_especialidad
FROM gd_esquema.Maestra M, HAKUNA_MATATA.TipoEspecialidad TE
WHERE M.Tipo_Especialidad_Codigo = TE.codigo_tipo_especialidad

INSERT HAKUNA_MATATA.EspecialidadXProfesional (matricula, id_especialidad)
SELECT DISTINCT P.matricula, E.id_especialidad
FROM HAKUNA_MATATA.Profesional P, HAKUNA_MATATA.Especialidad E, gd_esquema.Maestra M
WHERE P.numero_documento= M.Medico_Dni AND
	  E.codigo_especialidad=M.Especialidad_Codigo
	  
INSERT HAKUNA_MATATA.Funcionalidad (nombre)
VALUES ('Crear usuario'),('Modificar usuario'),('Dar de baja usuario')

/*('Actualizar datos'),('Pedir turno'),('Crear afiliado'),('Modificar afiliado'),('Dar de baja afiliado'),
	  ('Crear profesional'),('Modificar profesional'),('Dar de baja profesional'),('Ver agenda'),('Comprar bono de consulta'),
	  ('Comprar bono de farmacia'),('Registrar llegada para atenci�n m�dica'),('Registrar resultado para atenci�n m�dica'),
	  ('Cancelar atenci�n m�dica por m�dico'),('Cancelar atenci�n m�dica por paciente'),('Crear receta m�dica'),
	  ('Ver top 5 de las especialidades que m�s se registraron cancelaciones'),
	  ('Ver top 5 de la cantidad total de bonos farmacia vencidos por afiliado'),
	  ('Ver top 5 de las especialidades de m�dicos con m�s bonos de farmacia recetados'),
	  ('Ver top 10 de los afiliados que utilizaron bonos que ellos mismo no compraron'),
	  ('Crear usuario'),('Modificar usuario'),('Dar de baja usuario'), ('Ver especialidades m�dicas'),('Modificar agenda') */

INSERT HAKUNA_MATATA.Rol (descripcion)
VALUES ('Administrador'),('Profesional'),('Afiliado')

INSERT HAKUNA_MATATA.FuncionalidadXRol (id_rol, id_funcionalidad)
VALUES (1,1),(1,2),(1,3) 


INSERT INTO HAKUNA_MATATA.UsuarioXRol (id_usuario, id_rol)
SELECT U.id_usuario, 3  
FROM HAKUNA_MATATA.Usuario U, HAKUNA_MATATA.Rol R, gd_esquema.Maestra M
WHERE M.Paciente_Dni = U.nombre
UNION
SELECT U.id_usuario, 2  
FROM HAKUNA_MATATA.Usuario U, HAKUNA_MATATA.Rol R, gd_esquema.Maestra M
WHERE M.Medico_Dni = U.nombre 

INSERT INTO HAKUNA_MATATA.Usuario(nombre, contrasenia)
VALUES ('admin','w23e') 

INSERT INTO HAKUNA_MATATA.Administrador(id_usuario)
SELECT U.id_usuario
FROM HAKUNA_MATATA.Usuario U
WHERE U.nombre ='admin' AND U.contrasenia='w23e'