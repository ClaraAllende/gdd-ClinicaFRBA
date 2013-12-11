using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Clinica_Frba.Abm_de_Rol
{
  public class Rol{
      int id { get; set; }
      string nombre { get; set; }
        List<Funcionalidad> funcionalidades = new List<Funcionalidad>();

//Public constructor
  public Rol(string name, List<Funcionalidad> fs) {
      this.nombre = name;
      this.funcionalidades = fs;
    }
}
}
