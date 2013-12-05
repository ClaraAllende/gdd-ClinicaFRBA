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
        public string anterior;
        public int loginAttemptsCount;
        public bool onStart;

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
           List<SqlParameter> ps = createQueryParameters(usuario, pswd);
            DataTable user = DBConnection.getInstance.ExecuteQuery("[HAKUNA_MATATA].[SP_LOGIN]", ps);
        }

       private static List<SqlParameter> createQueryParameters(string usuario, string pswd)
       {
           List<SqlParameter> ps = new List<SqlParameter>();
           ps.Add(new SqlParameter("nombre", usuario));
           ps.Add(new SqlParameter("contrasenia", encript(pswd)));
           return ps;
       }
      
        public UserLoginWindow()
        {
              InitializeComponent();
              this.button1.Enabled = false;

               //bloquear todo.

              usr = textBox1.Text.ToString();
              pass = textBox2.Text.ToString();
            //TODO: esto lo valida antes de abrir la ventana, y hay que poner un observer para 
            //el property changed.
              if (String.IsNullOrEmpty(usr) || String.IsNullOrEmpty(pass))
              {
                  MessageBox.Show("Usuario o password incorrecto. Intente de nuevo.",
                      "Login Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                  return;
              }
              else
              {
                      this.button1.Enabled = true;
              }
        }

        private void login()
        {
            createQueryParameters(usr, pass);
            //query db for right pass
            if (false)
            {
                //login correcto
                //habilitar funcionalidades
                //open next window--> Rol.
            }
            else
            {
                //incorrect login
                if (anterior == usr)
                {
                    loginAttemptsCount++;
                    if (loginAttemptsCount >= 3)
                    {
                        //block?
                        MessageBox.Show("Ha llegado al máximo de intentos de login fallidos.El usuario se bloqueará, contacte al administrador del sistema",
                            "Max login attempts", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                }
                else
                {
                    loginAttemptsCount = 1;
                    anterior = usr;
                }
            }
        }

        protected void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            login();
        }

    }
}
