using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Clinica_Frba.Abm_de_Rol
{
    public partial class Roles_Usuario : Form
    {
        public Roles_Usuario()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Acá se bindea con el resultado del SP_login
            //comboBox1.DataSource = usuario.getRoles;
            //comboBox1.ValueMember = rol.id
            //comboBox1.DisplayMember = rol.nombre
            
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //comboBox2.DataSource = comboBox1.SelectedValue.getFuncionalidades;
            //comboBox2.ValueMember = funcionalidad.id
            //comboBox2.DisplayMember = funcionalidad.nombre
        }
    }
}