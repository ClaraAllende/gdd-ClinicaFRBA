using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Clinica_Frba.Abm_de_Rol;
using System.ComponentModel;

namespace Clinica_Frba.Registro_de_Usuario
{
    class Usuario : INotifyPropertyChanged
    {
        Rol rol;
        private int loginAttempsCount;
        private string username;
        public string Username
        {
            get { return username; }
            set
            {
                username = value;
                InvokePropertyChanged(new PropertyChangedEventArgs("Username"));
            }
        }

        protected string password;
        public string Password
        {
            set
            {
                password = value;
                InvokePropertyChanged(new PropertyChangedEventArgs("Password"));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void InvokePropertyChanged(PropertyChangedEventArgs propertyChangedEventArgs)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, propertyChangedEventArgs);
        }

        public void login()
        {
            //llamar al script
           // if (!true) loginAttempsCount++;
            if (loginAttempsCount == 3)
            {
                //block?
                //reset counter
                loginAttempsCount = 0;
            }
        }
    }
    }
