using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Clinica_Frba.Abm_de_Rol;

namespace Clinica_Frba.Registro_de_Usuario
{
    class Usuario
    {
        public String username;
        protected String password;
        public Rol rol;
        private int loginAttempsCount;   

    public void login(String name, String password){
        //llamar al script
         if (!true) loginAttempsCount++;
        if (loginAttempsCount == 3) {
            //block?
            //reset counter
            loginAttempsCount = 0;
    }
}
