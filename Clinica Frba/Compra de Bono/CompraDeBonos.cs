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
            parametros.Add(new SqlParameter("nro_afiliado", txt_NroDeAfiliado.Text));
            DataTable tablaDePrecios = DBConnection.getInstance.ExecuteQuery("HAKUNA_MATATA.SP_precios_bonos", parametros);
            return tablaDePrecios;
        }

        private void comprarBonos() {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("nro_afiliado", txt_NroDeAfiliado.Text));
            parametros.Add(new SqlParameter("cant_bonos_consulta", txt_CantBonosConsulta.Text));
            parametros.Add(new SqlParameter("cant_bonos_farmacia", txt_CantBonosFarmacia.Text));
            DataTable tablaDePrecios = DBConnection.getInstance.ExecuteQuery("HAKUNA_MATATA.SP_comprar_bonos", parametros);
            return;
        }

        private void actualizarBotones() {
            if (String.IsNullOrEmpty(txt_NroDeAfiliado.Text) || String.IsNullOrEmpty(txt_CantBonosConsulta.Text) || String.IsNullOrEmpty(txt_CantBonosFarmacia.Text)) {
                btn_CalcularPrecio.Enabled = false;
                btn_Comprar.Enabled = false;
            } else {
                btn_CalcularPrecio.Enabled = true;
                btn_Comprar.Enabled = true;
            }
        }

        private void validarNumeroEnTextBox(TextBox txt) {
            int result = 0;
            if (!int.TryParse(txt.Text, out result))
                txt.Text = "";
        }
 
        public CompraDeBonosWindow() {
            InitializeComponent();
            actualizarBotones();
        }

        private void CompraDeBonosWindow_Load(object sender, EventArgs e) {
        }

        private void btn_Cancelar_Click(object sender, EventArgs e) {
            this.Close();
        }

        private void btn_CalcularPrecio_Click(object sender, EventArgs e) {
            try {
               txt_Precio.Text = calcularPrecio().ToString();
            }
            catch (NullReferenceException a) {
                MessageBox.Show("El afiliado no existe", "Consulta de precio", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void btn_Comprar_Click(object sender, EventArgs e) {
            try {
                comprarBonos();
            }
            catch (SystemException a) {
                MessageBox.Show("El afiliado no existe", "Resultado de compra", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            MessageBox.Show("La compra fue realizada con éxito", "Resultado de compra", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
        }

        private void txt_NroDeAfiliado_TextChanged(object sender, EventArgs e) {
            actualizarBotones();
        }

        private void txt_CantBonosConsulta_TextChanged(object sender, EventArgs e) {
            actualizarBotones();
            validarNumeroEnTextBox(txt_CantBonosConsulta);
        }

        private void txt_CantBonosFarmacia_TextChanged(object sender, EventArgs e) {
            actualizarBotones();
            validarNumeroEnTextBox(txt_CantBonosFarmacia);
        }

    }
}