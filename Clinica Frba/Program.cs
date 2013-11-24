using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using Clinica_Frba.Login;
using System.Data.SqlClient;


namespace Clinica_Frba
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
       
        public static SqlConnection persistentConnection = new SqlConnection("Database=GD2013;Server=UTN-GDD-DACAB4E\\SQLSERVER2008;IntegratedSecurity=true");
        
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new MainWindow());
            persistentConnection.Open();
            Application.Run(new UserLoginWindow());
        }
    }
}
