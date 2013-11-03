using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Clinica_Frba
{
    public class DatosPersonales
    {
        string nombreYApellido;
        string documento; //asumo que viene todo en el mismo string, si necesitamos hacer alguna validaciòn podemos splitearlo, o hacer dos atributos distintos
        string direccion;
        int telefono;
        string mail;
        string fechaDeNacimiento; //por lo pronto string, vemos si necesitamos hacer algo màs con esta fecha
        char sexo;
    }
}
