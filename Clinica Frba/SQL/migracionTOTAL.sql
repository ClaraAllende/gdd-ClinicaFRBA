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

INSERT INTO HAKUNA_MATATA.Profesional (id_usuario,nombre,apellido,numero_documento,direccion,telefono,mail,fecha_nacimiento)
SELECT DISTINCT U.id_usuario,M.Medico_Nombre,M.Medico_Apellido, M.Medico_Dni,M.Medico_Direccion,M.Medico_Telefono,M.Medico_Mail,M.Medico_Fecha_Nac
FROM gd_esquema.Maestra M, HAKUNA_MATATA.Usuario U
WHERE U.nombre = CAST(M.Medico_Dni AS varchar(255))

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
	  ('Comprar bono de farmacia'),('Registrar llegada para atención médica'),('Registrar resultado para atención médica'),
	  ('Cancelar atención médica por médico'),('Cancelar atención médica por paciente'),('Crear receta médica'),
	  ('Ver top 5 de las especialidades que más se registraron cancelaciones'),
	  ('Ver top 5 de la cantidad total de bonos farmacia vencidos por afiliado'),
	  ('Ver top 5 de las especialidades de médicos con más bonos de farmacia recetados'),
	  ('Ver top 10 de los afiliados que utilizaron bonos que ellos mismo no compraron'),
	  ('Crear usuario'),('Modificar usuario'),('Dar de baja usuario'), ('Ver especialidades médicas'),('Modificar agenda') */

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

INSERT INTO HAKUNA_MATATA.PlanMedico (id_plan, descripcion, precio_bono_consulta, precio_bono_farmacia)
SELECT DISTINCT Plan_Med_Codigo, Plan_Med_Descripcion, Plan_Med_Precio_Bono_Consulta, Plan_Med_Precio_Bono_Farmacia
FROM gd_esquema.Maestra

INSERT INTO HAKUNA_MATATA.Medicamento (descripcion)
SELECT DISTINCT Bono_Farmacia_Medicamento
FROM gd_esquema.Maestra
WHERE Bono_Farmacia_Medicamento IS NOT NULL

INSERT INTO HAKUNA_MATATA.Afiliado (id_usuario, nombre, apellido, numero_documento, direccion, telefono, mail, fecha_nacimiento, id_plan)
SELECT DISTINCT U.id_usuario, M.Paciente_Nombre, M.Paciente_Apellido, M.Paciente_Dni, M.Paciente_Direccion, M.Paciente_Telefono, M.Paciente_Mail, M.Paciente_Fecha_Nac, M.Plan_Med_Codigo 
FROM gd_esquema.Maestra M, HAKUNA_MATATA.Usuario U
WHERE U.nombre = CAST(M.Paciente_Dni AS varchar(255))

--arreglar esto ,,
INSERT INTO HAKUNA_MATATA.BonoConsulta (id_bono, id_afiliado, id_plan, precio) --numero_principal lo deje en NULL porque no aplica a los de la maestra
SELECT DISTINCT M.Bono_Consulta_Numero, A.id_afiliado, A.id_plan, M.Plan_Med_Precio_Bono_Consulta
FROM HAKUNA_MATATA.Afiliado A 
LEFT JOIN HAKUNA_MATATA.Usuario U ON (A.id_usuario = U.id_usuario)
LEFT JOIN gd_esquema.Maestra M ON (U.nombre = CAST(M.Paciente_Dni AS varchar(255)) AND M.Bono_Consulta_Numero IS NOT NULL)
ORDER BY M.Bono_Consulta_Numero

INSERT INTO HAKUNA_MATATA.Compra (id_afiliado, fecha)
SELECT DISTINCT BC.id_afiliado, M.Compra_Bono_Fecha
FROM HAKUNA_MATATA.BonoConsulta BC
JOIN HAKUNA_MATATA.Afiliado A ON (BC.id_afiliado = A.id_afiliado)
JOIN gd_esquema.Maestra M ON (A.numero_documento = M.Paciente_Dni AND M.Compra_Bono_Fecha IS NOT NULL)

INSERT INTO HAKUNA_MATATA.BonoXCompra (id_bono, id_compra)
SELECT DISTINCT BC.id_bono, C.id_compra
FROM HAKUNA_MATATA.Compra C
JOIN HAKUNA_MATATA.Afiliado A ON (C.id_afiliado = A.id_afiliado)
JOIN gd_esquema.Maestra M ON (A.numero_documento = M.Paciente_Dni AND M.Compra_Bono_Fecha IS NOT NULL AND M.Compra_Bono_Fecha = C.fecha)
JOIN HAKUNA_MATATA.BonoConsulta BC ON (M.Bono_Consulta_Numero = BC.id_bono)

INSERT INTO HAKUNA_MATATA.BonoFarmacia (id_bono, id_afiliado, id_plan, precio, fecha_emision) --numero_principal lo deje en NULL porque no aplica a los de la maestra
SELECT DISTINCT M.Bono_Farmacia_Numero, A.id_afiliado, A.id_plan, M.Plan_Med_Precio_Bono_Farmacia, M.Compra_Bono_Fecha
FROM HAKUNA_MATATA.Afiliado A 
LEFT JOIN HAKUNA_MATATA.Usuario U ON (A.id_usuario = U.id_usuario)
LEFT JOIN gd_esquema.Maestra M ON (U.nombre = CAST(M.Paciente_Dni AS varchar(255)) AND M.Bono_Farmacia_Numero IS NOT NULL AND M.Compra_Bono_Fecha IS NOT NULL)
ORDER BY M.Bono_Farmacia_Numero