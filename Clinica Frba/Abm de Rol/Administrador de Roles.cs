using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Clinica_Frba.NewFolder1
{
    public partial class FormRoles : Form
    {
        // En las clases le agrego los Ids para que sea mas facil la interaccion con la DB
        public class Rol
        {
            int id_rol;
            string numbre;
            List<Funcionalidad> funcionaldades = new List<Funcionalidad>();
        }
        public class Funcionalidad
        {
            int id_funcionalidad;
            string numbre;
        }

        public FormRoles()
        {
            InitializeComponent();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        // Cuando cree la dataGridView me dió la opción de hacer el bindeo con la Base de datos pero no se como no hardcodearlo a mi DB
            
        }
    }
}
