ALTER TABLE HAKUNA_MATATA.Agenda DROP CONSTRAINT fk_Agenda_to_Profesional;
ALTER TABLE HAKUNA_MATATA.Turno DROP CONSTRAINT fk_Turno_to_Agenda;
ALTER TABLE HAKUNA_MATATA.Turno DROP CONSTRAINT fk_Turno_to_Afiliado;
ALTER TABLE HAKUNA_MATATA.Consulta DROP CONSTRAINT fk_Consulta_to_Turno;
ALTER TABLE HAKUNA_MATATA.Afiliado DROP CONSTRAINT fk_Afiliado_to_PlanMedico;
ALTER TABLE HAKUNA_MATATA.BonoConsulta DROP CONSTRAINT fk_BonoConsulta_to_Afiliado;
ALTER TABLE HAKUNA_MATATA.BonoConsulta DROP CONSTRAINT fk_BonoConsulta_to_PlanMedico;
ALTER TABLE HAKUNA_MATATA.BonoFarmacia DROP CONSTRAINT fk_BonoFarmacia_to_Afiliado;
ALTER TABLE HAKUNA_MATATA.BonoFarmacia DROP CONSTRAINT fk_BonoFarmacia_to_PlanMedico;
ALTER TABLE HAKUNA_MATATA.Cancelacion DROP CONSTRAINT fk_Cancelacion_to_Turno;
ALTER TABLE HAKUNA_MATATA.Cancelacion DROP CONSTRAINT fk_Cancelacion_to_TipoCancelacion;
--fks que referencian a HAKUNA_MATATA.BonoXCompra
ALTER TABLE HAKUNA_MATATA.BonoConsulta DROP CONSTRAINT fk_BonoConsulta_to_Compra;
ALTER TABLE HAKUNA_MATATA.BonoFarmacia DROP CONSTRAINT fk_BonoFarmacia_to_Compra;
--fks que referencian a HAKUNA_MATATA.Usuario id_usuarios
ALTER TABLE HAKUNA_MATATA.UsuarioXRol DROP CONSTRAINT fk_UsuarioXRol_to_Usuario;
ALTER TABLE HAKUNA_MATATA.Profesional DROP CONSTRAINT fk_Profesional_to_Usuario;
ALTER TABLE HAKUNA_MATATA.Administrador DROP CONSTRAINT fk_Administrador_to_Usuario;
ALTER TABLE HAKUNA_MATATA.Afiliado DROP CONSTRAINT fk_Afiliado_to_Usuario;
--fks que referencian a HAKUNA_MATATA.Rol id_rol
ALTER TABLE HAKUNA_MATATA.FuncionalidadXRol DROP CONSTRAINT fk_FuncionalidadXRol_to_Rol;
ALTER TABLE HAKUNA_MATATA.UsuarioXRol DROP CONSTRAINT fk_UsuarioXRol_to_Rol;
--fks que referencian a HAKUNA_MATATA.Funcionalidad id_funcionalidad
ALTER TABLE HAKUNA_MATATA.FuncionalidadXRol DROP CONSTRAINT fk_FuncionalidadXRol_to_Funcionalidad;

ALTER TABLE HAKUNA_MATATA.Compra DROP CONSTRAINT fk_Compra_to_Afiliado;
ALTER TABLE HAKUNA_MATATA.Consulta DROP CONSTRAINT fk_Consulta_to_BonoConsulta;
ALTER TABLE HAKUNA_MATATA.Afiliado DROP CONSTRAINT fk_Afiliado_to_EstadoCivil;
ALTER TABLE HAKUNA_MATATA.MedicamentoXBono DROP CONSTRAINT fk_MedicamentoXBono_to_BonoFarmacia;
ALTER TABLE HAKUNA_MATATA.MedicamentoXBono DROP CONSTRAINT fk_MedicamentoXBono_to_Medicamento;
ALTER TABLE HAKUNA_MATATA.Afiliado DROP CONSTRAINT fk_Afiliado_to_TipoDocumento;
ALTER TABLE HAKUNA_MATATA.Profesional DROP CONSTRAINT fk_Profesional_to_TipoDocumento;

ALTER TABLE HAKUNA_MATATA.EspecialidadXProfesional DROP CONSTRAINT fk_EspecialidadXProfesional_to_Especialidad;
ALTER TABLE HAKUNA_MATATA.Especialidad DROP CONSTRAINT fk_Especialidad_to_TipoEspecialidad;
ALTER TABLE HAKUNA_MATATA.EspecialidadXProfesional DROP CONSTRAINT fk_EspecialidadXProfesional_to_Profesional;

DROP TABLE HAKUNA_MATATA.Rol;
DROP TABLE HAKUNA_MATATA.Funcionalidad;
DROP TABLE HAKUNA_MATATA.FuncionalidadXRol;
DROP TABLE HAKUNA_MATATA.UsuarioXRol;
DROP TABLE HAKUNA_MATATA.Usuario;
DROP TABLE HAKUNA_MATATA.Profesional;
DROP TABLE HAKUNA_MATATA.Administrador;
DROP TABLE HAKUNA_MATATA.Afiliado;
DROP TABLE HAKUNA_MATATA.TipoDocumento;
DROP TABLE HAKUNA_MATATA.EstadoCivil;
DROP TABLE HAKUNA_MATATA.EspecialidadXProfesional;
DROP TABLE HAKUNA_MATATA.Especialidad;
DROP TABLE HAKUNA_MATATA.TipoEspecialidad;
DROP TABLE HAKUNA_MATATA.Agenda;
DROP TABLE HAKUNA_MATATA.Turno;
DROP TABLE HAKUNA_MATATA.PlanMedico;
DROP TABLE HAKUNA_MATATA.BonoConsulta;
DROP TABLE HAKUNA_MATATA.BonoFarmacia;
DROP TABLE HAKUNA_MATATA.MedicamentoXBono;
DROP TABLE HAKUNA_MATATA.Compra;
DROP TABLE HAKUNA_MATATA.Cancelacion;
DROP TABLE HAKUNA_MATATA.TipoCancelacion;
DROP TABLE HAKUNA_MATATA.Consulta;
DROP TABLE HAKUNA_MATATA.Medicamento;