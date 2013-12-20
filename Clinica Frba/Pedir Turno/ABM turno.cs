using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Clinica_Frba.Abm_de_Especialidades_Medicas;
using System.Data.SqlClient;

namespace Clinica_Frba.Pedido_Turno
{
    public partial class PedidoTurnoWindow : Form
    {
        public PedidoTurnoWindow()
        {
            InitializeComponent();
            //comboBox1.SelectedValue = null;
        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //UPDATE A LA DB
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private DataTable obtenerTablaEspecialidades()
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            DataTable tablaDeEspecialidades = DBConnection.getInstance.ExecuteQuery("HAKUNA_MATATA.FN_get_especialidades", parametros);
            return tablaDeEspecialidades;
        }

        private void FormTurnos_Load(object sender, EventArgs e)
        {
            DataTable tablaEspecialidades = obtenerTablaEspecialidades();
            List<Especialidad> especialidades = new List<Especialidad>();
            foreach(DataRow row in tablaEspecialidades.Rows)
            {
                especialidades.Add(new Especialidad(row.Field<string>("descripcion"), row.Field<decimal>("id_especialidad")));
            }
            comboBox1.DisplayMember = "Descripcion";
            comboBox1.ValueMember = "tipo";
            comboBox1.DataSource = especialidades;
            comboBox1.SelectedIndex = 0;


            //
            // Se asigna el evento para control el cambio de seleccion
            //
            comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);

        }
        
    }
}
