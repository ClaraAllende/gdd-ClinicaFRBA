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
hora datetime,
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
fecha datetime,
id_turno NUMERIC(18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Medicamento (
id_medicamento NUMERIC(18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);