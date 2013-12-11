using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Clinica_Frba.Abm_de_Rol;
using System.ComponentModel;

namespace Clinica_Frba.Registro_de_Usuario
{
    class Usuario
    {

        public int id {get; set;}
        public List<Rol> roles { get; set; }

        public Usuario(int userId, List<Rol> rolesUsuario)
        {
            id = userId;
            roles = rolesUsuario;
        }
    }
}
