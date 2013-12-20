using System.Windows.Forms;
namespace Clinica_Frba.Compra_de_Bono
{
    partial class CompraDeBonosWindow : Form
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lbl_CantBonosFarmacia = new System.Windows.Forms.Label();
            this.txt_CantBonosConsulta = new System.Windows.Forms.TextBox();
            this.lbl_NroDeAfialiado = new System.Windows.Forms.Label();
            this.txt_NroDeAfiliado = new System.Windows.Forms.TextBox();
            this.txt_Precio = new System.Windows.Forms.TextBox();
            this.btn_Comprar = new System.Windows.Forms.Button();
            this.btn_Cancelar = new System.Windows.Forms.Button();
            this.lbl_CantBonosConsulta = new System.Windows.Forms.Label();
            this.txt_CantBonosFarmacia = new System.Windows.Forms.TextBox();
            this.btn_CalcularPrecio = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lbl_CantBonosFarmacia
            // 
            this.lbl_CantBonosFarmacia.AutoSize = true;
            this.lbl_CantBonosFarmacia.Location = new System.Drawing.Point(12, 90);
            this.lbl_CantBonosFarmacia.Name = "lbl_CantBonosFarmacia";
            this.lbl_CantBonosFarmacia.Size = new System.Drawing.Size(143, 13);
            this.lbl_CantBonosFarmacia.TabIndex = 2;
            this.lbl_CantBonosFarmacia.Text = "Cantidad de Bonos Farmacia";
            // 
            // txt_CantBonosConsulta
            // 
            this.txt_CantBonosConsulta.Location = new System.Drawing.Point(172, 50);
            this.txt_CantBonosConsulta.Name = "txt_CantBonosConsulta";
            this.txt_CantBonosConsulta.Size = new System.Drawing.Size(32, 20);
            this.txt_CantBonosConsulta.TabIndex = 3;
            // 
            // lbl_NroDeAfialiado
            // 
            this.lbl_NroDeAfialiado.AutoSize = true;
            this.lbl_NroDeAfialiado.Location = new System.Drawing.Point(12, 24);
            this.lbl_NroDeAfialiado.Name = "lbl_NroDeAfialiado";
            this.lbl_NroDeAfialiado.Size = new System.Drawing.Size(56, 13);
            this.lbl_NroDeAfialiado.TabIndex = 6;
            this.lbl_NroDeAfialiado.Text = "Afiliado Nº";
            // 
            // txt_NroDeAfiliado
            // 
            this.txt_NroDeAfiliado.Location = new System.Drawing.Point(89, 17);
            this.txt_NroDeAfiliado.Name = "txt_NroDeAfiliado";
            this.txt_NroDeAfiliado.Size = new System.Drawing.Size(115, 20);
            this.txt_NroDeAfiliado.TabIndex = 7;
            // 
            // txt_Precio
            // 
            this.txt_Precio.Location = new System.Drawing.Point(140, 144);
            this.txt_Precio.Name = "txt_Precio";
            this.txt_Precio.Size = new System.Drawing.Size(64, 20);
            this.txt_Precio.TabIndex = 8;
            // 
            // btn_Comprar
            // 
            this.btn_Comprar.Location = new System.Drawing.Point(40, 220);
            this.btn_Comprar.Name = "btn_Comprar";
            this.btn_Comprar.Size = new System.Drawing.Size(75, 23);
            this.btn_Comprar.TabIndex = 9;
            this.btn_Comprar.Text = "Comprar";
            this.btn_Comprar.UseVisualStyleBackColor = true;
            this.btn_Comprar.Click += new System.EventHandler(this.btn_Comprar_Click);
            // 
            // btn_Cancelar
            // 
            this.btn_Cancelar.Location = new System.Drawing.Point(140, 220);
            this.btn_Cancelar.Name = "btn_Cancelar";
            this.btn_Cancelar.Size = new System.Drawing.Size(75, 23);
            this.btn_Cancelar.TabIndex = 10;
            this.btn_Cancelar.Text = "Cancelar";
            this.btn_Cancelar.UseVisualStyleBackColor = true;
            this.btn_Cancelar.Click += new System.EventHandler(this.btn_Cancelar_Click);
            // 
            // lbl_CantBonosConsulta
            // 
            this.lbl_CantBonosConsulta.AutoSize = true;
            this.lbl_CantBonosConsulta.Location = new System.Drawing.Point(12, 57);
            this.lbl_CantBonosConsulta.Name = "lbl_CantBonosConsulta";
            this.lbl_CantBonosConsulta.Size = new System.Drawing.Size(141, 13);
            this.lbl_CantBonosConsulta.TabIndex = 11;
            this.lbl_CantBonosConsulta.Text = "Cantidad de Bonos Consulta";
            // 
            // txt_CantBonosFarmacia
            // 
            this.txt_CantBonosFarmacia.Location = new System.Drawing.Point(172, 83);
            this.txt_CantBonosFarmacia.Name = "txt_CantBonosFarmacia";
            this.txt_CantBonosFarmacia.Size = new System.Drawing.Size(32, 20);
            this.txt_CantBonosFarmacia.TabIndex = 12;
            // 
            // btn_CalcularPrecio
            // 
            this.btn_CalcularPrecio.Location = new System.Drawing.Point(12, 141);
            this.btn_CalcularPrecio.Name = "btn_CalcularPrecio";
            this.btn_CalcularPrecio.Size = new System.Drawing.Size(103, 23);
            this.btn_CalcularPrecio.TabIndex = 13;
            this.btn_CalcularPrecio.Text = "Calcular precio";
            this.btn_CalcularPrecio.UseVisualStyleBackColor = true;
            this.btn_CalcularPrecio.Click += new System.EventHandler(this.btn_CalcularPrecio_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(127, 146);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(13, 13);
            this.label4.TabIndex = 14;
            this.label4.Text = "$";
            // 
            // CompraDeBonosWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(229, 253);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btn_CalcularPrecio);
            this.Controls.Add(this.txt_CantBonosFarmacia);
            this.Controls.Add(this.lbl_CantBonosConsulta);
            this.Controls.Add(this.btn_Cancelar);
            this.Controls.Add(this.btn_Comprar);
            this.Controls.Add(this.txt_Precio);
            this.Controls.Add(this.txt_NroDeAfiliado);
            this.Controls.Add(this.lbl_NroDeAfialiado);
            this.Controls.Add(this.txt_CantBonosConsulta);
            this.Controls.Add(this.lbl_CantBonosFarmacia);
            this.Name = "CompraDeBonosWindow";
            this.Text = "Compra de Bonos";
            this.Load += new System.EventHandler(this.CompraDeBonosWindow_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbl_CantBonosFarmacia;
        private System.Windows.Forms.TextBox txt_CantBonosConsulta;
        private System.Windows.Forms.Label lbl_NroDeAfialiado;
        private System.Windows.Forms.TextBox txt_NroDeAfiliado;
        private System.Windows.Forms.TextBox txt_Precio;
        private System.Windows.Forms.Button btn_Comprar;
        private System.Windows.Forms.Button btn_Cancelar;
        private Label lbl_CantBonosConsulta;
        private TextBox txt_CantBonosFarmacia;
        private Button btn_CalcularPrecio;
        private Label label4;
    }
}