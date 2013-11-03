using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Clinica_Frba.Abm_de_Planes;

namespace Clinica_Frba.Abm_de_Afiliado
{
    class Afiliado
    {
        DatosPersonales datos;
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
