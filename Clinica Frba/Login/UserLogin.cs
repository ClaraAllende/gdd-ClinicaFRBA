using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Clinica_Frba.Registro_de_Usuario;

namespace Clinica_Frba.Login
{
    public partial class UserLoginWindow : Form
    {
        public void Login()
        {
            InitializeComponent();
            Usuario currentUser = new Usuario();
            textBox1.DataBindings.Add("Text", currentUser, "Usuario");
            textBox2.DataBindings.Add("Text", currentUser, "Password");
            currentUser.login();
        }
    }
}
