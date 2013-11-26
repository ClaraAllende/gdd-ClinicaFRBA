using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Clinica_Frba.Registro_de_Usuario;
using System.Security.Cryptography;
using System.Data.SqlClient;

namespace Clinica_Frba.Login
{
    public partial class UserLoginWindow : Form
    {
        public string usr;
        public string pass;
        public int loginAttemptsCount;

        private static string encript(string password)
        {
            SHA256Managed encripter = new SHA256Managed();
            string hash = String.Empty;
            byte[] cr = encripter.ComputeHash(Encoding.UTF8.GetBytes(password), 0, Encoding.UTF8.GetByteCount(password));
            foreach (byte bit in cr)
            {
                hash += bit.ToString("x2");
            }
            return hash;
        }

       public void agregarUsuario(string usuario, string pswd){
            List<SqlParameter> ps = new List<SqlParameter>();
            ps.Add(new SqlParameter("nombre", usuario));
            ps.Add(new SqlParameter("contrasenia", encript(pswd)));
            DataTable user = DBConnection.getInstance.ExecuteQuery("[HAKUNA_MATATA].[SP_LOGIN]", ps);
        }
      
        public UserLoginWindow()
        {
              InitializeComponent();
              this.button1.Enabled = false;
               //bloquear todo.

            // if (!true) loginAttempsCount++;
            if (loginAttemptsCount == 3)
            {
                //block?
                //reset counter
                loginAttemptsCount = 0;
            }
        }


        protected void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
