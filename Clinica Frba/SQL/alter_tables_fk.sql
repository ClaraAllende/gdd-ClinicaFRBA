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
--fks que referencian a tablas "de facu"
ALTER TABLE HAKUNA_MATATA.Especialidad ADD CONSTRAINT fk_Especialidad_to_TipoEspecialidad
FOREIGN KEY (id_tipo_especialidad) REFERENCES HAKUNA_MATATA.TipoEspecialidad (id_tipo_especialidad)
;
ALTER TABLE HAKUNA_MATATA.EspecialidadXProfesional ADD CONSTRAINT fk_EspecialidadXProfesional_to_Especialidad
FOREIGN KEY (id_especialidad) REFERENCES HAKUNA_MATATA.Especialidad (id_especialidad)
;
ALTER TABLE HAKUNA_MATATA.EspecialidadXProfesional ADD CONSTRAINT fk_EspecialidadXProfesional_to_Profesional
FOREIGN KEY (matricula) REFERENCES HAKUNA_MATATA.Profesional (matricula)
;