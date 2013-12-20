using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using Clinica_Frba.Login;
using System.Data.SqlClient;
using Clinica_Frba.Compra_de_Bono;


namespace Clinica_Frba
{
    public static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new Login.UserLoginWindow());
            Application.Run(new Pedido_Turno.PedidoTurnoWindow());
        }
    }
}

// CONNECTION STRING DE CLARI
//    <add key ="ConnectionString" value="Data Source=UTN-GDD-DACAB4E\SQLSERVER2008;Initial Catalog=GD2C2013;User ID=gd;Password=gd2013" />