-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
------------------------TRABAJO PRACTICO GESTION DE DATOS----------------------------
----------------------------------ENTREGA 1------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
----------------------------ESQUEMA HAKUNA_MATATA------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

USE [GD2C2013]
GO
CREATE SCHEMA [HAKUNA_MATATA] AUTHORIZATION [gd]
GO

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
----------------------------------CREATE TABLES--------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

CREATE TABLE HAKUNA_MATATA.Rol(
id_rol NUMERIC(18,0) IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Funcionalidad (
id_funcionalidad NUMERIC(18,0) IDENTITY(1,1) NOT NULL,
nombre varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.FuncionalidadXRol (
id_rol NUMERIC(18,0) ,
id_funcionalidad NUMERIC(18,0) NOT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.UsuarioXRol (
id_usuario NUMERIC(18,0) NOT NULL,
id_rol NUMERIC(18,0) NOT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Usuario (
id_usuario NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
nombre varchar(255),
contrasenia varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Profesional (
matricula NUMERIC(18, 0)IDENTITY(1,1) NOT NULL,
id_usuario NUMERIC(18,0),
nombre varchar(255),
apellido varchar (255),
id_tipo_documento NUMERIC(18,0) DEFAULT 1,
numero_documento NUMERIC(18,0),
direccion varchar(255),
telefono NUMERIC(18,0),
mail varchar(255),
fecha_nacimiento datetime,
sexo bit DEFAULT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Administrador (
id_administrador NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
id_usuario NUMERIC(18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Afiliado (
id_afiliado NUMERIC(18, 0)IDENTITY(001,100) NOT NULL,
id_usuario NUMERIC(18,0),
nombre varchar(255),
apellido varchar (255),
id_tipo_documento NUMERIC(18,0) DEFAULT 1,
numero_documento NUMERIC(18,0),
direccion varchar(255),
telefono NUMERIC(18,0),
mail varchar(255),
fecha_nacimiento datetime,
sexo bit DEFAULT NULL,
id_estado_civil NUMERIC(18,0) DEFAULT NULL,
id_plan NUMERIC(18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.TipoDocumento (
id_tipo_documento NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.EstadoCivil (
id_estado_civil NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.EspecialidadXProfesional (
matricula NUMERIC(18,0) NOT NULL,
id_especialidad NUMERIC(18,0) NOT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Especialidad (
id_especialidad NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
codigo_especialidad NUMERIC(18,0),
id_tipo_especialidad NUMERIC(18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.TipoEspecialidad (
id_tipo_especialidad NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
codigo_tipo_especialidad NUMERIC(18,0),
descripcion_tipo_especialidad varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Agenda (
matricula NUMERIC(18,0),
fecha_inicio datetime,
fecha_fin datetime,
id_agenda NUMERIC(18,0) IDENTITY(1,1) NOT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Turno (
id_turno NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
fecha_y_hora datetime,
id_agenda NUMERIC(18,0),
id_afiliado NUMERIC(18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.PlanMedico (
id_plan NUMERIC(18,0) IDENTITY(1,1) NOT NULL,
precio_bono_consulta NUMERIC(18,0) ,
precio_bono_farmacia NUMERIC(18,0),
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.BonoConsulta (
id_bono NUMERIC(18,0) IDENTITY(1,1) NOT NULL,
id_compra NUMERIC(18,0) NOT NULL,
id_afiliado NUMERIC(18,0),
id_plan NUMERIC(18,0),
precio NUMERIC(18,0),
fecha_impresion datetime,
descripcion varchar(255),
numero_principal NUMERIC(18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.BonoFarmacia (
id_bono NUMERIC(18,0) IDENTITY(1,1) NOT NULL,
id_compra NUMERIC(18,0) NOT NULL,
id_afiliado NUMERIC(18,0),
id_plan NUMERIC(18,0),
precio NUMERIC(18,0),
fecha_emision datetime,
fecha_impresion datetime,
descripcion varchar(255),
numero_principal NUMERIC(18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.MedicamentoXBono (
id_bono NUMERIC(18,0) NOT NULL,
id_medicamento NUMERIC(18,0) NOT NULL,
cantidad NUMERIC(18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Compra (
id_compra NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
id_afiliado NUMERIC(18,0),
fecha datetime,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Cancelacion (
id_cancelacion NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
id_tipo NUMERIC(18,0),
id_turno NUMERIC(18,0),
descripcion varchar(255),
fecha datetime,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.TipoCancelacion (
id_tipo NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Consulta (
id_bono NUMERIC(18,0),
id_consulta NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
fecha_y_hora datetime,
id_turno NUMERIC(18,0),
sintoma VARCHAR(255),
diagnostico VARCHAR(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Medicamento (
id_medicamento NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
------------------------------------CREAR PKS----------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

ALTER TABLE HAKUNA_MATATA.Rol ADD CONSTRAINT pk_id_rol PRIMARY KEY (id_rol);
ALTER TABLE HAKUNA_MATATA.Funcionalidad ADD CONSTRAINT pk_id_funcionalidad PRIMARY KEY (id_funcionalidad);
ALTER TABLE HAKUNA_MATATA.FuncionalidadXRol ADD CONSTRAINT pk_id_funcionalidad_rol PRIMARY KEY (id_funcionalidad);
ALTER TABLE HAKUNA_MATATA.UsuarioXRol ADD CONSTRAINT pk_id_usuario_rol PRIMARY KEY (id_rol,id_usuario);
ALTER TABLE HAKUNA_MATATA.Usuario ADD CONSTRAINT pk_id_usuario PRIMARY KEY (id_usuario);
ALTER TABLE HAKUNA_MATATA.Profesional ADD CONSTRAINT pk_id_profesional PRIMARY KEY (matricula);
ALTER TABLE HAKUNA_MATATA.Administrador ADD CONSTRAINT pk_id_administrador PRIMARY KEY (id_administrador);
ALTER TABLE HAKUNA_MATATA.Afiliado ADD CONSTRAINT pk_id_afiliado PRIMARY KEY (id_afiliado);
ALTER TABLE HAKUNA_MATATA.TipoDocumento ADD CONSTRAINT pk_id_tipo_documento PRIMARY KEY (id_tipo_documento);
ALTER TABLE HAKUNA_MATATA.EstadoCivil ADD CONSTRAINT pk_id_estado_civil PRIMARY KEY (id_estado_civil);
ALTER TABLE HAKUNA_MATATA.EspecialidadXProfesional ADD CONSTRAINT pk_especialidad_profesional PRIMARY KEY (matricula,id_especialidad);
ALTER TABLE HAKUNA_MATATA.Especialidad ADD CONSTRAINT pk_id_especialidad PRIMARY KEY (id_especialidad);
ALTER TABLE HAKUNA_MATATA.TipoEspecialidad ADD CONSTRAINT pk_id_tipo_especialidad PRIMARY KEY (id_tipo_especialidad);
ALTER TABLE HAKUNA_MATATA.Agenda ADD CONSTRAINT pk_id_agenda PRIMARY KEY (id_agenda);
ALTER TABLE HAKUNA_MATATA.Turno ADD CONSTRAINT pk_id_turno PRIMARY KEY (id_turno);
ALTER TABLE HAKUNA_MATATA.PlanMedico ADD CONSTRAINT pk_id_plan PRIMARY KEY (id_plan);
ALTER TABLE HAKUNA_MATATA.BonoConsulta ADD CONSTRAINT pk_id_bono_consulta PRIMARY KEY (id_bono);
ALTER TABLE HAKUNA_MATATA.BonoFarmacia ADD CONSTRAINT pk_id_bono_receta PRIMARY KEY (id_bono);
ALTER TABLE HAKUNA_MATATA.MedicamentoXBono ADD CONSTRAINT pk_id_medicamento_bono PRIMARY KEY (id_bono,id_medicamento);
ALTER TABLE HAKUNA_MATATA.Medicamento ADD CONSTRAINT pk_id_medicamento PRIMARY KEY (id_medicamento);
ALTER TABLE HAKUNA_MATATA.Compra ADD CONSTRAINT pk_id_compra PRIMARY KEY (id_compra);
ALTER TABLE HAKUNA_MATATA.Cancelacion ADD CONSTRAINT pk_id_cancelacion PRIMARY KEY (id_cancelacion);
ALTER TABLE HAKUNA_MATATA.TipoCancelacion ADD CONSTRAINT pk_id_tipo PRIMARY KEY (id_tipo);
ALTER TABLE HAKUNA_MATATA.Consulta ADD CONSTRAINT pk_id_consulta PRIMARY KEY (id_consulta);

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
------------------------------------CREAR FKS----------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

ALTER TABLE HAKUNA_MATATA.Agenda ADD CONSTRAINT fk_Agenda_to_Profesional
FOREIGN KEY (matricula) REFERENCES HAKUNA_MATATA.Profesional (matricula)
;
ALTER TABLE HAKUNA_MATATA.Turno ADD CONSTRAINT fk_Turno_to_Agenda
FOREIGN KEY (id_agenda) REFERENCES HAKUNA_MATATA.Agenda (id_agenda)
;
ALTER TABLE HAKUNA_MATATA.Turno ADD CONSTRAINT fk_Turno_to_Afiliado
FOREIGN KEY (id_afiliado) REFERENCES HAKUNA_MATATA.Afiliado (id_afiliado)
;
ALTER TABLE HAKUNA_MATATA.Consulta ADD CONSTRAINT fk_Consulta_to_Turno
FOREIGN KEY (id_turno) REFERENCES HAKUNA_MATATA.Turno (id_turno)
;
ALTER TABLE HAKUNA_MATATA.Afiliado ADD CONSTRAINT fk_Afiliado_to_PlanMedico
FOREIGN KEY (id_plan) REFERENCES HAKUNA_MATATA.PlanMedico (id_plan)
;
ALTER TABLE HAKUNA_MATATA.BonoConsulta ADD CONSTRAINT fk_BonoConsulta_to_Afiliado
FOREIGN KEY (id_afiliado) REFERENCES HAKUNA_MATATA.Afiliado (id_afiliado)
;
ALTER TABLE HAKUNA_MATATA.BonoConsulta ADD CONSTRAINT fk_BonoConsulta_to_PlanMedico
FOREIGN KEY (id_plan) REFERENCES HAKUNA_MATATA.PlanMedico (id_plan)
;
ALTER TABLE HAKUNA_MATATA.BonoFarmacia ADD CONSTRAINT fk_BonoFarmacia_to_Afiliado
FOREIGN KEY (id_afiliado) REFERENCES HAKUNA_MATATA.Afiliado (id_afiliado)
;
ALTER TABLE HAKUNA_MATATA.BonoFarmacia ADD CONSTRAINT fk_BonoFarmacia_to_PlanMedico
FOREIGN KEY (id_plan) REFERENCES HAKUNA_MATATA.PlanMedico (id_plan)
;
ALTER TABLE HAKUNA_MATATA.Cancelacion ADD CONSTRAINT fk_Cancelacion_to_Turno
FOREIGN KEY (id_turno) REFERENCES HAKUNA_MATATA.Turno (id_turno)
;
ALTER TABLE HAKUNA_MATATA.Cancelacion ADD CONSTRAINT fk_Cancelacion_to_TipoCancelacion
FOREIGN KEY (id_tipo) REFERENCES HAKUNA_MATATA.TipoCancelacion (id_tipo)
;
--fks que referencian a HAKUNA_MATATA.BonoXCompra
ALTER TABLE HAKUNA_MATATA.BonoConsulta ADD CONSTRAINT fk_BonoConsulta_to_Compra
FOREIGN KEY (id_compra) REFERENCES HAKUNA_MATATA.Compra (id_compra)
;
ALTER TABLE HAKUNA_MATATA.BonoFarmacia ADD CONSTRAINT fk_BonoFarmacia_to_Compra
FOREIGN KEY (id_compra) REFERENCES HAKUNA_MATATA.Compra (id_compra)
;
--fks que referencian a HAKUNA_MATATA.Usuario id_usuarios
ALTER TABLE HAKUNA_MATATA.UsuarioXRol ADD CONSTRAINT fk_UsuarioXRol_to_Usuario 
FOREIGN KEY (id_usuario) REFERENCES HAKUNA_MATATA.Usuario (id_usuario)
;
ALTER TABLE HAKUNA_MATATA.Profesional ADD CONSTRAINT fk_Profesional_to_Usuario 
FOREIGN KEY (id_usuario) REFERENCES HAKUNA_MATATA.Usuario (id_usuario)
;
ALTER TABLE HAKUNA_MATATA.Administrador ADD CONSTRAINT fk_Administrador_to_Usuario 
FOREIGN KEY (id_usuario) REFERENCES HAKUNA_MATATA.Usuario (id_usuario)
;
ALTER TABLE HAKUNA_MATATA.Afiliado ADD CONSTRAINT fk_Afiliado_to_Usuario 
FOREIGN KEY (id_usuario) REFERENCES HAKUNA_MATATA.Usuario (id_usuario)
;
--fks que referencian a HAKUNA_MATATA.Rol id_rol
ALTER TABLE HAKUNA_MATATA.FuncionalidadXRol ADD CONSTRAINT fk_FuncionalidadXRol_to_Rol 
FOREIGN KEY (id_rol) REFERENCES HAKUNA_MATATA.Rol (id_rol)
;
ALTER TABLE HAKUNA_MATATA.UsuarioXRol ADD CONSTRAINT fk_UsuarioXRol_to_Rol 
FOREIGN KEY (id_rol) REFERENCES HAKUNA_MATATA.Rol (id_rol)
;
--fks que referencian a HAKUNA_MATATA.Funcionalidad id_funcionalidad
ALTER TABLE HAKUNA_MATATA.FuncionalidadXRol ADD CONSTRAINT fk_FuncionalidadXRol_to_Funcionalidad 
FOREIGN KEY (id_funcionalidad) REFERENCES HAKUNA_MATATA.Funcionalidad (id_funcionalidad)
;
ALTER TABLE HAKUNA_MATATA.Compra ADD CONSTRAINT fk_Compra_to_Afiliado
FOREIGN KEY (id_afiliado) REFERENCES HAKUNA_MATATA.Afiliado (id_afiliado)
;
ALTER TABLE HAKUNA_MATATA.Consulta ADD CONSTRAINT fk_Consulta_to_BonoConsulta
FOREIGN KEY (id_bono) REFERENCES HAKUNA_MATATA.BonoConsulta (id_bono)
;
ALTER TABLE HAKUNA_MATATA.Afiliado ADD CONSTRAINT fk_Afiliado_to_EstadoCivil
FOREIGN KEY (id_estado_civil) REFERENCES HAKUNA_MATATA.EstadoCivil (id_estado_civil)
;
ALTER TABLE HAKUNA_MATATA.MedicamentoXBono ADD CONSTRAINT fk_MedicamentoXBono_to_BonoFarmacia
FOREIGN KEY (id_bono) REFERENCES HAKUNA_MATATA.BonoFarmacia (id_bono)
;
ALTER TABLE HAKUNA_MATATA.MedicamentoXBono ADD CONSTRAINT fk_MedicamentoXBono_to_Medicamento
FOREIGN KEY (id_medicamento) REFERENCES HAKUNA_MATATA.Medicamento (id_medicamento)
;
ALTER TABLE HAKUNA_MATATA.Afiliado ADD CONSTRAINT fk_Afiliado_to_TipoDocumento
FOREIGN KEY (id_tipo_documento) REFERENCES HAKUNA_MATATA.TipoDocumento (id_tipo_documento)
;
ALTER TABLE HAKUNA_MATATA.Profesional ADD CONSTRAINT fk_Profesional_to_TipoDocumento
FOREIGN KEY (id_tipo_documento) REFERENCES HAKUNA_MATATA.TipoDocumento (id_tipo_documento)
;
ALTER TABLE HAKUNA_MATATA.Especialidad ADD CONSTRAINT fk_Especialidad_to_TipoEspecialidad
FOREIGN KEY (id_tipo_especialidad) REFERENCES HAKUNA_MATATA.TipoEspecialidad (id_tipo_especialidad)
;
ALTER TABLE HAKUNA_MATATA.EspecialidadXProfesional ADD CONSTRAINT fk_EspecialidadXProfesional_to_Especialidad
FOREIGN KEY (id_especialidad) REFERENCES HAKUNA_MATATA.Especialidad (id_especialidad)
;
ALTER TABLE HAKUNA_MATATA.EspecialidadXProfesional ADD CONSTRAINT fk_EspecialidadXProfesional_to_Profesional
FOREIGN KEY (matricula) REFERENCES HAKUNA_MATATA.Profesional (matricula)
;

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
------------------------------------MIGRACION----------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

--------------------------------------------------------
--------------------EstadoCivil-------------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.EstadoCivil(descripcion)
VALUES ('Soltero'),('Casado'),('Viudo'),('Divorciado')

--------------------------------------------------------
--------------------TipoCancelacion---------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.TipoCancelacion(descripcion)
VALUES ('Cancelada por el paciente'),('Cancelada por el medico')

--------------------------------------------------------
--------------------TipoDocumento-----------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.TipoDocumento(descripcion)
VALUES ('DNI'),('LE'),('LC')

--------------------------------------------------------
--------------------Usuario-----------------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.Usuario(nombre, contrasenia)
SELECT DISTINCT Paciente_Dni, 'w23e'
FROM gd_esquema.Maestra
UNION
SELECT DISTINCT Medico_Dni, 'w23e'
FROM gd_esquema.Maestra
WHERE Medico_Dni IS NOT NULL

INSERT INTO HAKUNA_MATATA.Usuario(nombre, contrasenia)
VALUES ('admin','w23e') 

--------------------------------------------------------
--------------------Profesional-------------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.Profesional (id_usuario,nombre,apellido,numero_documento,direccion,telefono,mail,fecha_nacimiento)
SELECT DISTINCT U.id_usuario,M.Medico_Nombre,M.Medico_Apellido, M.Medico_Dni,M.Medico_Direccion,M.Medico_Telefono,M.Medico_Mail,M.Medico_Fecha_Nac
FROM gd_esquema.Maestra M, HAKUNA_MATATA.Usuario U
WHERE U.nombre = CAST(M.Medico_Dni AS varchar(255))

--------------------------------------------------------
------------------TipoEspecialidad----------------------
--------------------------------------------------------
INSERT HAKUNA_MATATA.TipoEspecialidad (codigo_tipo_especialidad, descripcion_tipo_especialidad)
SELECT DISTINCT M.Tipo_Especialidad_Codigo, M.Tipo_Especialidad_Descripcion
FROM gd_esquema.Maestra M
WHERE M.Medico_Dni IS NOT NULL

--------------------------------------------------------
--------------------Especialidad------------------------
--------------------------------------------------------
INSERT HAKUNA_MATATA.Especialidad (descripcion, codigo_especialidad, id_tipo_especialidad)
SELECT DISTINCT M.Especialidad_Descripcion , M.Especialidad_Codigo, TE.id_tipo_especialidad
FROM gd_esquema.Maestra M, HAKUNA_MATATA.TipoEspecialidad TE
WHERE M.Tipo_Especialidad_Codigo = TE.codigo_tipo_especialidad

--------------------------------------------------------
--------------EspecialidadXProfesional------------------
--------------------------------------------------------
INSERT HAKUNA_MATATA.EspecialidadXProfesional (matricula, id_especialidad)
SELECT DISTINCT P.matricula, E.id_especialidad
FROM HAKUNA_MATATA.Profesional P, HAKUNA_MATATA.Especialidad E, gd_esquema.Maestra M
WHERE P.numero_documento= M.Medico_Dni AND
	  E.codigo_especialidad=M.Especialidad_Codigo
	  
--------------------------------------------------------
--------------------Funcionalidad-----------------------
--------------------------------------------------------	  
INSERT HAKUNA_MATATA.Funcionalidad (nombre)
VALUES ('Crear usuario'),('Modificar usuario'),('Dar de baja usuario')

--------------------------------------------------------
------------------------Rol-----------------------------
--------------------------------------------------------
INSERT HAKUNA_MATATA.Rol (descripcion)
VALUES ('Administrador'),('Profesional'),('Afiliado')

--------------------------------------------------------
------------------FuncionalidadXRol---------------------
--------------------------------------------------------
INSERT HAKUNA_MATATA.FuncionalidadXRol (id_rol, id_funcionalidad)
VALUES (1,1),(1,2),(1,3) 

--------------------------------------------------------
--------------------UsuarioXRol-------------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.UsuarioXRol (id_usuario, id_rol)
SELECT U.id_usuario, 3  
FROM HAKUNA_MATATA.Usuario U, HAKUNA_MATATA.Rol R, gd_esquema.Maestra M
WHERE Convert(Varchar(255), M.Paciente_Dni) = U.nombre
UNION
SELECT U.id_usuario, 2  
FROM HAKUNA_MATATA.Usuario U, HAKUNA_MATATA.Rol R, gd_esquema.Maestra M
WHERE Convert(Varchar(255), M.Medico_Dni) = U.nombre

--------------------------------------------------------
--------------------Administrador-----------------------
-------------------------------------------------------- 
INSERT INTO HAKUNA_MATATA.Administrador(id_usuario)
SELECT U.id_usuario
FROM HAKUNA_MATATA.Usuario U
WHERE U.nombre ='admin' AND U.contrasenia='w23e'

--------------------------------------------------------
---------------------PlanMedico-------------------------
--------------------------------------------------------
SET IDENTITY_INSERT HAKUNA_MATATA.PlanMedico ON
INSERT INTO HAKUNA_MATATA.PlanMedico (id_plan, descripcion, precio_bono_consulta, precio_bono_farmacia)
SELECT DISTINCT Plan_Med_Codigo, Plan_Med_Descripcion, Plan_Med_Precio_Bono_Consulta, Plan_Med_Precio_Bono_Farmacia
FROM gd_esquema.Maestra
SET IDENTITY_INSERT HAKUNA_MATATA.PlanMedico OFF

--------------------------------------------------------
--------------------Medicamento-------------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.Medicamento (descripcion)
SELECT DISTINCT Bono_Farmacia_Medicamento
FROM gd_esquema.Maestra
WHERE Bono_Farmacia_Medicamento IS NOT NULL

--------------------------------------------------------
----------------------Afiliado--------------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.Afiliado (id_usuario, nombre, apellido, numero_documento, direccion, telefono, mail, fecha_nacimiento, id_plan)
SELECT DISTINCT U.id_usuario, M.Paciente_Nombre, M.Paciente_Apellido, M.Paciente_Dni, M.Paciente_Direccion, M.Paciente_Telefono, M.Paciente_Mail, M.Paciente_Fecha_Nac, M.Plan_Med_Codigo 
FROM gd_esquema.Maestra M, HAKUNA_MATATA.Usuario U
WHERE U.nombre = CAST(M.Paciente_Dni AS varchar(255))

--------------------------------------------------------
-----------------------Compra---------------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.Compra (id_afiliado, fecha)
SELECT DISTINCT A.id_afiliado, M.Compra_Bono_Fecha
FROM HAKUNA_MATATA.Afiliado A
JOIN gd_esquema.Maestra M ON (A.numero_documento = M.Paciente_Dni AND M.Compra_Bono_Fecha IS NOT NULL)

--------------------------------------------------------
--------------------BonoFarmacia------------------------
--------------------------------------------------------
SET IDENTITY_INSERT HAKUNA_MATATA.BonoFarmacia ON
INSERT INTO HAKUNA_MATATA.BonoFarmacia (id_bono, id_compra, id_afiliado, id_plan, precio, fecha_emision, numero_principal, fecha_impresion)
SELECT DISTINCT M.Bono_Farmacia_Numero, C.id_compra,A.id_afiliado, A.id_plan, M.Plan_Med_Precio_Bono_Farmacia, M.Compra_Bono_Fecha, CAST(A.id_afiliado/100 AS NUMERIC(18,0)), M.Bono_Farmacia_Fecha_Impresion
FROM HAKUNA_MATATA.Afiliado A 
LEFT JOIN HAKUNA_MATATA.Usuario U ON (A.id_usuario = U.id_usuario)
LEFT JOIN gd_esquema.Maestra M ON (U.nombre = CAST(M.Paciente_Dni AS varchar(255)) AND M.Bono_Farmacia_Numero IS NOT NULL AND M.Compra_Bono_Fecha IS NOT NULL)
JOIN HAKUNA_MATATA.Compra C ON (M.Compra_Bono_Fecha = C.fecha AND A.id_afiliado = C.id_afiliado)
ORDER BY M.Bono_Farmacia_Numero
SET IDENTITY_INSERT HAKUNA_MATATA.BonoFarmacia OFF

--------------------------------------------------------
--------------------BonoConsulta------------------------
--------------------------------------------------------
SET IDENTITY_INSERT HAKUNA_MATATA.BonoConsulta ON
INSERT INTO HAKUNA_MATATA.BonoConsulta (id_bono, id_compra, id_afiliado, id_plan, precio, numero_principal, fecha_impresion)
SELECT DISTINCT M.Bono_Consulta_Numero, C.id_compra,A.id_afiliado, A.id_plan, M.Plan_Med_Precio_Bono_Consulta, CAST(A.id_afiliado/100 AS NUMERIC(18,0)), M.Bono_Consulta_Fecha_Impresion
FROM HAKUNA_MATATA.Afiliado A 
LEFT JOIN HAKUNA_MATATA.Usuario U ON (A.id_usuario = U.id_usuario)
LEFT JOIN gd_esquema.Maestra M ON (U.nombre = CAST(M.Paciente_Dni AS varchar(255)) AND M.Bono_Consulta_Numero IS NOT NULL)
JOIN HAKUNA_MATATA.Compra C ON (M.Compra_Bono_Fecha = C.fecha AND A.id_afiliado = C.id_afiliado)
ORDER BY M.Bono_Consulta_Numero
SET IDENTITY_INSERT HAKUNA_MATATA.BonoConsulta OFF

--------------------------------------------------------
------------------MedicamentoXBono----------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.MedicamentoXBono (id_bono, id_medicamento)
SELECT DISTINCT Ma.Bono_Farmacia_Numero, Me.id_medicamento
FROM gd_esquema.Maestra Ma
JOIN HAKUNA_MATATA.Medicamento Me ON(Ma.Bono_Farmacia_Medicamento = Me.descripcion
									AND Ma.Bono_Farmacia_Numero IS NOT NULL)

--------------------------------------------------------
------------------------Turno---------------------------
--------------------------------------------------------
SET IDENTITY_INSERT HAKUNA_MATATA.Turno ON
INSERT INTO HAKUNA_MATATA.Turno (id_turno, fecha_y_hora, id_afiliado)
SELECT DISTINCT M.Turno_Numero, M.Turno_Fecha, A.id_afiliado
FROM HAKUNA_MATATA.Afiliado A
JOIN gd_esquema.Maestra M ON (A.numero_documento = M.Paciente_Dni AND M.Turno_Numero IS NOT NULL)
ORDER BY M.Turno_Numero
SET IDENTITY_INSERT HAKUNA_MATATA.Turno OFF

--------------------------------------------------------
-----------------------Consulta-------------------------
--------------------------------------------------------
INSERT INTO HAKUNA_MATATA.Consulta (id_bono, id_turno, sintoma, diagnostico)
SELECT DISTINCT BC.id_bono, M.Turno_Numero, M.Consulta_Sintomas, M.Consulta_Enfermedades
FROM HAKUNA_MATATA.Afiliado A
JOIN gd_esquema.Maestra M ON (A.numero_documento = M.Paciente_Dni AND M.Turno_Numero IS NOT NULL AND M.Consulta_Sintomas IS NOT NULL)
JOIN HAKUNA_MATATA.BonoConsulta BC ON (A.id_afiliado = BC.id_afiliado AND BC.id_bono = M.Bono_Consulta_Numero)