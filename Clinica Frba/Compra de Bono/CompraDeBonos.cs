using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Clinica_Frba.Compra_de_Bono
{
    public partial class CompraDeBonosWindow : Form
        {

        private decimal calcularPrecio() {
            DataTable tablaDePrecios = obtenerTablaDePrecios();
            decimal precioBonoConsulta = tablaDePrecios.Rows[0].Field<decimal>("precio_bono_consulta");
            decimal precioBonoFarmacia = tablaDePrecios.Rows[0].Field<decimal>("precio_bono_farmacia");
            int cantBonosConsulta = int.Parse(txt_CantBonosConsulta.Text);
            int cantBonosFarmacia = int.Parse(txt_CantBonosFarmacia.Text);
            decimal precio = (precioBonoConsulta * cantBonosConsulta) + (precioBonoFarmacia * cantBonosFarmacia);
            return precio;
        }

        private DataTable obtenerTablaDePrecios() {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("nombre_usuario", txt_NroDeAfiliado.Text));
            DataTable tablaDePrecios = DBConnection.getInstance.ExecuteQuery("HAKUNA_MATATA.SP_precios_bonos", parametros);
            return tablaDePrecios;
        }

        private void comprarBonos() {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("nombre_usuario", txt_NroDeAfiliado.Text));
            parametros.Add(new SqlParameter("cant_bonos_consulta", txt_CantBonosConsulta.Text));
            parametros.Add(new SqlParameter("cant_bonos_farmacia", txt_CantBonosFarmacia.Text));
            DataTable tablaDePrecios = DBConnection.getInstance.ExecuteQuery("HAKUNA_MATATA.SP_comprar_bonos", parametros);
            return;
        }

        public CompraDeBonosWindow() {
            InitializeComponent();
        }

        private void btn_Cancelar_Click(object sender, EventArgs e) {
            this.Close();
        }

        private void btn_CalcularPrecio_Click(object sender, EventArgs e) {
            txt_Precio.Text = calcularPrecio().ToString();
        }

        private void CompraDeBonosWindow_Load(object sender, EventArgs e) {
        }

        private void btn_Comprar_Click(object sender, EventArgs e) {
            comprarBonos();
            MessageBox.Show("La compra fue realizada con éxito", "Resultado de compra", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
        }

    }
}
