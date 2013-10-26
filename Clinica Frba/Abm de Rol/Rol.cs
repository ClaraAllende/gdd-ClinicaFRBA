using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Clinica_Frba.Abm_de_Rol
{
  public class Rol{
        private string nombre;
        private List<Funcionalidad> funcionalidades = new List<Funcionalidad>();

//Public constructor
  public Rol(string name, List<Funcionalidad> fs) {
      nombre = name;
      funcionalidades = fs;
    }
}
}
