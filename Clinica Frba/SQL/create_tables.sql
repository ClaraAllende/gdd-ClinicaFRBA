CREATE TABLE HAKUNA_MATATA.Rol(
id_rol numeric(18,0) IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Funcionalidad (
id_funcionalidad numeric (18,0) IDENTITY(1,1) NOT NULL,
nombre varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.FuncionalidadXRol (
id_rol numeric(18,0) ,
id_funcionalidad numeric(18,0) NOT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.UsuarioXRol (
id_usuario numeric(18,0) NOT NULL,
id_rol numeric(18,0) NOT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Usuario (
id_usuario numeric (18,0)IDENTITY(1,1) NOT NULL,
nombre varchar(255),
contrasenia varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Profesional (
matricula numeric (18, 0)IDENTITY(1,1) NOT NULL,
id_usuario numeric (18,0),
nombre varchar(255),
apellido varchar (255),
id_tipo_documento numeric (18,0)DEFAULT 1,
numero_documento numeric (18,0),
direccion varchar(255),
telefono numeric (18,0),
mail varchar(255),
fecha_nacimiento datetime,
sexo bit NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Administrador (
id_administrador numeric (18,0)IDENTITY(1,1) NOT NULL,
id_usuario numeric (18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Afiliado (
id_afiliado numeric (18, 0)IDENTITY(1,1) NOT NULL,
id_usuario numeric (18,0),
nombre varchar(255),
apellido varchar (255),
id_tipo_documento numeric (18,0),
numero_documento numeric (18,0),
direccion varchar(255),
telefono numeric (18,0),
mail varchar(255),
fecha_nacimiento datetime,
sexo bit,
id_estado_civil numeric (18,0),
id_plan numeric (18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.TipoDocumento (
id_tipo_documento numeric (18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.EstadoCivil (
id_estado_civil numeric (18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.EspecialidadXProfesional (
matricula numeric (18,0) NOT NULL,
id_especialidad numeric (18,0) NOT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Especialidad (
id_especialidad numeric (18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
codigo_especialidad numeric(18,0),
id_tipo_especialidad numeric (18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.TipoEspecialidad (
id_tipo_especialidad numeric (18,0)IDENTITY(1,1) NOT NULL,
codigo_tipo_especialidad numeric(18,0),
descripcion_tipo_especialidad varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Agenda (
matricula numeric (18,0),
fecha_inicio datetime,
fecha_fin datetime,
id_agenda numeric (18,0) IDENTITY(1,1) NOT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Turno (
id_turno numeric (18,0)IDENTITY(1,1) NOT NULL,
hora datetime,
id_agenda numeric (18,0),
id_afiliado numeric (18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.PlanMedico (
id_plan numeric (18,0) NOT NULL,
precio_bono_consulta numeric (18,0) ,
precio_bono_farmacia numeric (18,0),
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.BonoConsulta (
id_bono numeric (18,0)IDENTITY(1,1) NOT NULL,
id_afiliado numeric(18,0),
id_plan numeric (18,0),
precio numeric (18,0),
descripcion varchar(255),
numero_principal numeric(18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.BonoFarmacia (
id_bono numeric (18,0)IDENTITY(1,1) NOT NULL,
id_afiliado numeric(18,0),
id_plan numeric (18,0),
precio numeric (18,0),
fecha_emision datetime,
descripcion varchar(255),
numero_principal numeric (18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.MedicamentoXBono (
id_bono numeric (18,0) NOT NULL,
id_medicamento numeric (18,0) NOT NULL,
cantidad numeric (18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Compra (
id_compra numeric (18,0)IDENTITY(1,1) NOT NULL,
id_afiliado numeric (18,0),
fecha datetime,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.BonoXCompra (
id_bono numeric (18,0) NOT NULL,
id_compra numeric (18,0) NOT NULL,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Cancelacion (
id_cancelacion numeric (18,0)IDENTITY(1,1) NOT NULL,
id_tipo numeric (18,0),
id_turno numeric (18,0),
descripcion varchar(255),
fecha datetime,
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.TipoCancelacion (
id_tipo numeric (18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Consulta (
id_bono numeric (18,0),
id_consulta numeric (18,0)IDENTITY(1,1) NOT NULL,
fecha datetime,
id_turno numeric (18,0),
habilitada bit DEFAULT 1,
);

CREATE TABLE HAKUNA_MATATA.Medicamento (
id_medicamento numeric (18,0)IDENTITY(1,1) NOT NULL,
descripcion varchar(255),
habilitada bit DEFAULT 1,
);