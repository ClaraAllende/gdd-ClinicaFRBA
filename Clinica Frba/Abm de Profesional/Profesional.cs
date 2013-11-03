using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Clinica_Frba.Abm_de_Especialidades_Medicas;
using Clinica_Frba.Pedir_Turno;

namespace Clinica_Frba.Abm_de_Profesional
{
    public class Profesional
    {
        DatosPersonales datos;
        List<Especialidad> especialidades = new List<Especialidad>();
        List<Turno> turnosAsignados = new List<Turno>();

       //TODO: plantearse si no necesito una fecha para calcular la carga horaria de la semana
        public int cargaHoraria(string dia)
        {
            return turnosAsignados.FindAll(ts => ts.dia.Equals(dia)).Sum(ts => ts.duracion);
        }

       
    }
}
