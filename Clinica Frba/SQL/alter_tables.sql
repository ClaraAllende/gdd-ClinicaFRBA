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
ALTER TABLE HAKUNA_MATATA.BonoXCompra ADD CONSTRAINT pk_id_bono_compra PRIMARY KEY (id_bono, id_compra);
ALTER TABLE HAKUNA_MATATA.Cancelacion ADD CONSTRAINT pk_id_cancelacion PRIMARY KEY (id_cancelacion);
ALTER TABLE HAKUNA_MATATA.TipoCancelacion ADD CONSTRAINT pk_id_tipo PRIMARY KEY (id_tipo);
ALTER TABLE HAKUNA_MATATA.Consulta ADD CONSTRAINT pk_id_consulta PRIMARY KEY (id_consulta);
