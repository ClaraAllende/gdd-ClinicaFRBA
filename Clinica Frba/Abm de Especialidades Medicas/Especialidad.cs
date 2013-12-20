using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Clinica_Frba.Abm_de_Especialidades_Medicas
{
    public class Especialidad
    {
        string Descripcion { get; set; }
        decimal Id_especialidad { get; set; }
        public Especialidad(string descripcion, decimal id_especialidad)
        {
            Descripcion = descripcion;
            Id_especialidad = id_especialidad;
        }   
        public override string ToString()
        {
            return Descripcion;
        }
    }
}
