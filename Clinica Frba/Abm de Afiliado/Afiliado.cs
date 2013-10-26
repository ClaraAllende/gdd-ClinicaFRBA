using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Abm_de_Planes.PlanMedico;
namespace Clinica_Frba.Abm_de_Afiliado
{
    class Afiliado
    {
        string nombreYApellido;
        string documento; //asumo que viene todo en el mismo string, si necesitamos hacer alguna validaciòn podemos splitearlo, o hacer dos atributos distintos
        string direccion;
        int telefono;
        string mail;
        string fechaDeNacimiento; //por lo pronto string, vemos si necesitamos hacer algo màs con esta fecha
        char sexo;
        string estadoCivil;
        List<Afiliado> familiaresACargo = new List<Afiliado>();
        PlanMedico planMedico;
        int numeroAfiliado;


        public void asociarFamiliar(Afiliado fliar)
        {
            familiaresACargo.Add(fliar);
        }

        public int generarNumeroAfiliado()
        {
            //TODO: really implement this.
            return 0;
        }
    }
}
