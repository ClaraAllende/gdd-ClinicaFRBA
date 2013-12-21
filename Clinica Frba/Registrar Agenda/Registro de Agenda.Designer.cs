using System.Windows.Forms;
namespace Clinica_Frba.Registro_de_Agenda
{
    partial class RegistroDeAgendaWindow : Form
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
            this.lbl_Matricula = new System.Windows.Forms.Label();
            this.txt_Matricula = new System.Windows.Forms.TextBox();
            this.lbl_FechaInicio = new System.Windows.Forms.Label();
            this.lbl_FechaFin = new System.Windows.Forms.Label();
            this.btn_SeleccionarInicio = new System.Windows.Forms.Button();
            this.btn_SeleccionarFin = new System.Windows.Forms.Button();
            this.lbl_HoraInicio = new System.Windows.Forms.Label();
            this.lbl_HoraFin = new System.Windows.Forms.Label();
            this.chk_Lunes = new System.Windows.Forms.CheckBox();
            this.chk_Martes = new System.Windows.Forms.CheckBox();
            this.chk_Miercoles = new System.Windows.Forms.CheckBox();
            this.chk_Jueves = new System.Windows.Forms.CheckBox();
            this.chk_Viernes = new System.Windows.Forms.CheckBox();
            this.chk_Sabado = new System.Windows.Forms.CheckBox();
            this.cmb_HoraLunesInicio = new System.Windows.Forms.ComboBox();
            this.cmb_HoraLunesFin = new System.Windows.Forms.ComboBox();
            this.cmb_HoraMartesInicio = new System.Windows.Forms.ComboBox();
            this.cmb_HoraMartesFin = new System.Windows.Forms.ComboBox();
            this.cmb_HoraMiercolesInicio = new System.Windows.Forms.ComboBox();
            this.cmb_HoraMiercolesFin = new System.Windows.Forms.ComboBox();
            this.cmb_HoraJuevesInicio = new System.Windows.Forms.ComboBox();
            this.cmb_HoraJuevesFin = new System.Windows.Forms.ComboBox();
            this.cmb_HoraViernesInicio = new System.Windows.Forms.ComboBox();
            this.cmb_HoraViernesFin = new System.Windows.Forms.ComboBox();
            this.cmb_HoraSabadoInicio = new System.Windows.Forms.ComboBox();
            this.cmb_HoraSabadoFin = new System.Windows.Forms.ComboBox();
            this.btn_RegistrarAgenda = new System.Windows.Forms.Button();
            this.btn_Cancelar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lbl_Matricula
            // 
            this.lbl_Matricula.AutoSize = true;
            this.lbl_Matricula.Location = new System.Drawing.Point(27, 28);
            this.lbl_Matricula.Name = "lbl_Matricula";
            this.lbl_Matricula.Size = new System.Drawing.Size(109, 13);
            this.lbl_Matricula.TabIndex = 0;
            this.lbl_Matricula.Text = " Número de matrícula";
            // 
            // txt_Matricula
            // 
            this.txt_Matricula.Location = new System.Drawing.Point(155, 21);
            this.txt_Matricula.Name = "txt_Matricula";
            this.txt_Matricula.Size = new System.Drawing.Size(101, 20);
            this.txt_Matricula.TabIndex = 1;
            // 
            // lbl_FechaInicio
            // 
            this.lbl_FechaInicio.AutoSize = true;
            this.lbl_FechaInicio.Location = new System.Drawing.Point(27, 62);
            this.lbl_FechaInicio.Name = "lbl_FechaInicio";
            this.lbl_FechaInicio.Size = new System.Drawing.Size(79, 13);
            this.lbl_FechaInicio.TabIndex = 2;
            this.lbl_FechaInicio.Text = "Fecha de inicio";
            // 
            // lbl_FechaFin
            // 
            this.lbl_FechaFin.AutoSize = true;
            this.lbl_FechaFin.Location = new System.Drawing.Point(27, 98);
            this.lbl_FechaFin.Name = "lbl_FechaFin";
            this.lbl_FechaFin.Size = new System.Drawing.Size(66, 13);
            this.lbl_FechaFin.TabIndex = 3;
            this.lbl_FechaFin.Text = "Fecha de fin";
            // 
            // btn_SeleccionarInicio
            // 
            this.btn_SeleccionarInicio.Location = new System.Drawing.Point(155, 52);
            this.btn_SeleccionarInicio.Name = "btn_SeleccionarInicio";
            this.btn_SeleccionarInicio.Size = new System.Drawing.Size(101, 23);
            this.btn_SeleccionarInicio.TabIndex = 4;
            this.btn_SeleccionarInicio.Text = "Seleccionar...";
            this.btn_SeleccionarInicio.UseVisualStyleBackColor = true;
            // 
            // btn_SeleccionarFin
            // 
            this.btn_SeleccionarFin.Location = new System.Drawing.Point(155, 88);
            this.btn_SeleccionarFin.Name = "btn_SeleccionarFin";
            this.btn_SeleccionarFin.Size = new System.Drawing.Size(101, 23);
            this.btn_SeleccionarFin.TabIndex = 5;
            this.btn_SeleccionarFin.Text = "Seleccionar...";
            this.btn_SeleccionarFin.UseVisualStyleBackColor = true;
            // 
            // lbl_HoraInicio
            // 
            this.lbl_HoraInicio.AutoSize = true;
            this.lbl_HoraInicio.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.lbl_HoraInicio.Location = new System.Drawing.Point(120, 144);
            this.lbl_HoraInicio.Name = "lbl_HoraInicio";
            this.lbl_HoraInicio.Size = new System.Drawing.Size(72, 13);
            this.lbl_HoraInicio.TabIndex = 6;
            this.lbl_HoraInicio.Text = "Hora de inicio";
            // 
            // lbl_HoraFin
            // 
            this.lbl_HoraFin.AutoSize = true;
            this.lbl_HoraFin.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.lbl_HoraFin.Location = new System.Drawing.Point(229, 144);
            this.lbl_HoraFin.Name = "lbl_HoraFin";
            this.lbl_HoraFin.Size = new System.Drawing.Size(59, 13);
            this.lbl_HoraFin.TabIndex = 7;
            this.lbl_HoraFin.Text = "Hora de fin";
            // 
            // chk_Lunes
            // 
            this.chk_Lunes.AutoSize = true;
            this.chk_Lunes.Location = new System.Drawing.Point(30, 176);
            this.chk_Lunes.Name = "chk_Lunes";
            this.chk_Lunes.Size = new System.Drawing.Size(55, 17);
            this.chk_Lunes.TabIndex = 8;
            this.chk_Lunes.Text = "Lunes";
            this.chk_Lunes.UseVisualStyleBackColor = true;
            this.chk_Lunes.CheckedChanged += new System.EventHandler(this.chk_Lunes_CheckedChanged);
            // 
            // chk_Martes
            // 
            this.chk_Martes.AutoSize = true;
            this.chk_Martes.Location = new System.Drawing.Point(30, 203);
            this.chk_Martes.Name = "chk_Martes";
            this.chk_Martes.Size = new System.Drawing.Size(58, 17);
            this.chk_Martes.TabIndex = 9;
            this.chk_Martes.Text = "Martes";
            this.chk_Martes.UseVisualStyleBackColor = true;
            this.chk_Martes.CheckedChanged += new System.EventHandler(this.chk_Martes_CheckedChanged);
            // 
            // chk_Miercoles
            // 
            this.chk_Miercoles.AutoSize = true;
            this.chk_Miercoles.Location = new System.Drawing.Point(30, 228);
            this.chk_Miercoles.Name = "chk_Miercoles";
            this.chk_Miercoles.Size = new System.Drawing.Size(71, 17);
            this.chk_Miercoles.TabIndex = 10;
            this.chk_Miercoles.Text = "Miércoles";
            this.chk_Miercoles.UseVisualStyleBackColor = true;
            this.chk_Miercoles.CheckedChanged += new System.EventHandler(this.chk_Miercoles_CheckedChanged);
            // 
            // chk_Jueves
            // 
            this.chk_Jueves.AutoSize = true;
            this.chk_Jueves.Location = new System.Drawing.Point(30, 255);
            this.chk_Jueves.Name = "chk_Jueves";
            this.chk_Jueves.Size = new System.Drawing.Size(60, 17);
            this.chk_Jueves.TabIndex = 11;
            this.chk_Jueves.Text = "Jueves";
            this.chk_Jueves.UseVisualStyleBackColor = true;
            this.chk_Jueves.CheckedChanged += new System.EventHandler(this.chk_Jueves_CheckedChanged);
            // 
            // chk_Viernes
            // 
            this.chk_Viernes.AutoSize = true;
            this.chk_Viernes.Location = new System.Drawing.Point(30, 282);
            this.chk_Viernes.Name = "chk_Viernes";
            this.chk_Viernes.Size = new System.Drawing.Size(61, 17);
            this.chk_Viernes.TabIndex = 12;
            this.chk_Viernes.Text = "Viernes";
            this.chk_Viernes.UseVisualStyleBackColor = true;
            this.chk_Viernes.CheckedChanged += new System.EventHandler(this.chk_Viernes_CheckedChanged);
            // 
            // chk_Sabado
            // 
            this.chk_Sabado.AutoSize = true;
            this.chk_Sabado.Location = new System.Drawing.Point(30, 310);
            this.chk_Sabado.Name = "chk_Sabado";
            this.chk_Sabado.Size = new System.Drawing.Size(63, 17);
            this.chk_Sabado.TabIndex = 13;
            this.chk_Sabado.Text = "Sábado";
            this.chk_Sabado.UseVisualStyleBackColor = true;
            this.chk_Sabado.CheckedChanged += new System.EventHandler(this.chk_Sabado_CheckedChanged);
            // 
            // cmb_HoraLunesInicio
            // 
            this.cmb_HoraLunesInicio.FormattingEnabled = true;
            this.cmb_HoraLunesInicio.Location = new System.Drawing.Point(123, 172);
            this.cmb_HoraLunesInicio.Name = "cmb_HoraLunesInicio";
            this.cmb_HoraLunesInicio.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraLunesInicio.TabIndex = 14;
            // 
            // cmb_HoraLunesFin
            // 
            this.cmb_HoraLunesFin.FormattingEnabled = true;
            this.cmb_HoraLunesFin.Location = new System.Drawing.Point(225, 170);
            this.cmb_HoraLunesFin.Name = "cmb_HoraLunesFin";
            this.cmb_HoraLunesFin.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraLunesFin.TabIndex = 15;
            // 
            // cmb_HoraMartesInicio
            // 
            this.cmb_HoraMartesInicio.FormattingEnabled = true;
            this.cmb_HoraMartesInicio.Location = new System.Drawing.Point(123, 199);
            this.cmb_HoraMartesInicio.Name = "cmb_HoraMartesInicio";
            this.cmb_HoraMartesInicio.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraMartesInicio.TabIndex = 16;
            // 
            // cmb_HoraMartesFin
            // 
            this.cmb_HoraMartesFin.FormattingEnabled = true;
            this.cmb_HoraMartesFin.Location = new System.Drawing.Point(225, 197);
            this.cmb_HoraMartesFin.Name = "cmb_HoraMartesFin";
            this.cmb_HoraMartesFin.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraMartesFin.TabIndex = 17;
            // 
            // cmb_HoraMiercolesInicio
            // 
            this.cmb_HoraMiercolesInicio.FormattingEnabled = true;
            this.cmb_HoraMiercolesInicio.Location = new System.Drawing.Point(123, 224);
            this.cmb_HoraMiercolesInicio.Name = "cmb_HoraMiercolesInicio";
            this.cmb_HoraMiercolesInicio.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraMiercolesInicio.TabIndex = 18;
            // 
            // cmb_HoraMiercolesFin
            // 
            this.cmb_HoraMiercolesFin.FormattingEnabled = true;
            this.cmb_HoraMiercolesFin.Location = new System.Drawing.Point(225, 224);
            this.cmb_HoraMiercolesFin.Name = "cmb_HoraMiercolesFin";
            this.cmb_HoraMiercolesFin.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraMiercolesFin.TabIndex = 19;
            // 
            // cmb_HoraJuevesInicio
            // 
            this.cmb_HoraJuevesInicio.FormattingEnabled = true;
            this.cmb_HoraJuevesInicio.Location = new System.Drawing.Point(123, 249);
            this.cmb_HoraJuevesInicio.Name = "cmb_HoraJuevesInicio";
            this.cmb_HoraJuevesInicio.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraJuevesInicio.TabIndex = 20;
            // 
            // cmb_HoraJuevesFin
            // 
            this.cmb_HoraJuevesFin.FormattingEnabled = true;
            this.cmb_HoraJuevesFin.Location = new System.Drawing.Point(225, 251);
            this.cmb_HoraJuevesFin.Name = "cmb_HoraJuevesFin";
            this.cmb_HoraJuevesFin.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraJuevesFin.TabIndex = 21;
            // 
            // cmb_HoraViernesInicio
            // 
            this.cmb_HoraViernesInicio.FormattingEnabled = true;
            this.cmb_HoraViernesInicio.Location = new System.Drawing.Point(123, 276);
            this.cmb_HoraViernesInicio.Name = "cmb_HoraViernesInicio";
            this.cmb_HoraViernesInicio.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraViernesInicio.TabIndex = 22;
            // 
            // cmb_HoraViernesFin
            // 
            this.cmb_HoraViernesFin.FormattingEnabled = true;
            this.cmb_HoraViernesFin.Location = new System.Drawing.Point(225, 278);
            this.cmb_HoraViernesFin.Name = "cmb_HoraViernesFin";
            this.cmb_HoraViernesFin.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraViernesFin.TabIndex = 23;
            // 
            // cmb_HoraSabadoInicio
            // 
            this.cmb_HoraSabadoInicio.FormattingEnabled = true;
            this.cmb_HoraSabadoInicio.Location = new System.Drawing.Point(123, 304);
            this.cmb_HoraSabadoInicio.Name = "cmb_HoraSabadoInicio";
            this.cmb_HoraSabadoInicio.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraSabadoInicio.TabIndex = 24;
            // 
            // cmb_HoraSabadoFin
            // 
            this.cmb_HoraSabadoFin.FormattingEnabled = true;
            this.cmb_HoraSabadoFin.Location = new System.Drawing.Point(225, 306);
            this.cmb_HoraSabadoFin.Name = "cmb_HoraSabadoFin";
            this.cmb_HoraSabadoFin.Size = new System.Drawing.Size(69, 21);
            this.cmb_HoraSabadoFin.TabIndex = 25;
            // 
            // btn_RegistrarAgenda
            // 
            this.btn_RegistrarAgenda.Location = new System.Drawing.Point(123, 365);
            this.btn_RegistrarAgenda.Name = "btn_RegistrarAgenda";
            this.btn_RegistrarAgenda.Size = new System.Drawing.Size(123, 23);
            this.btn_RegistrarAgenda.TabIndex = 26;
            this.btn_RegistrarAgenda.Text = "Registrar agenda";
            this.btn_RegistrarAgenda.UseVisualStyleBackColor = true;
            // 
            // btn_Cancelar
            // 
            this.btn_Cancelar.Location = new System.Drawing.Point(259, 365);
            this.btn_Cancelar.Name = "btn_Cancelar";
            this.btn_Cancelar.Size = new System.Drawing.Size(75, 23);
            this.btn_Cancelar.TabIndex = 27;
            this.btn_Cancelar.Text = "Cancelar";
            this.btn_Cancelar.UseVisualStyleBackColor = true;
            this.btn_Cancelar.Click += new System.EventHandler(this.btn_Cancelar_Click);
            // 
            // RegistroDeAgendaWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(346, 394);
            this.Controls.Add(this.btn_Cancelar);
            this.Controls.Add(this.btn_RegistrarAgenda);
            this.Controls.Add(this.cmb_HoraSabadoFin);
            this.Controls.Add(this.cmb_HoraSabadoInicio);
            this.Controls.Add(this.cmb_HoraViernesFin);
            this.Controls.Add(this.cmb_HoraViernesInicio);
            this.Controls.Add(this.cmb_HoraJuevesFin);
            this.Controls.Add(this.cmb_HoraJuevesInicio);
            this.Controls.Add(this.cmb_HoraMiercolesFin);
            this.Controls.Add(this.cmb_HoraMiercolesInicio);
            this.Controls.Add(this.cmb_HoraMartesFin);
            this.Controls.Add(this.cmb_HoraMartesInicio);
            this.Controls.Add(this.cmb_HoraLunesFin);
            this.Controls.Add(this.cmb_HoraLunesInicio);
            this.Controls.Add(this.chk_Sabado);
            this.Controls.Add(this.chk_Viernes);
            this.Controls.Add(this.chk_Jueves);
            this.Controls.Add(this.chk_Miercoles);
            this.Controls.Add(this.chk_Martes);
            this.Controls.Add(this.chk_Lunes);
            this.Controls.Add(this.lbl_HoraFin);
            this.Controls.Add(this.lbl_HoraInicio);
            this.Controls.Add(this.btn_SeleccionarFin);
            this.Controls.Add(this.btn_SeleccionarInicio);
            this.Controls.Add(this.lbl_FechaFin);
            this.Controls.Add(this.lbl_FechaInicio);
            this.Controls.Add(this.txt_Matricula);
            this.Controls.Add(this.lbl_Matricula);
            this.Name = "RegistroDeAgendaWindow";
            this.Text = "Registrar agenda de profesional";
            this.Load += new System.EventHandler(this.FormAgenda_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Label lbl_Matricula;
        private TextBox txt_Matricula;
        private Label lbl_FechaInicio;
        private Label lbl_FechaFin;
        private Button btn_SeleccionarInicio;
        private Button btn_SeleccionarFin;
        private Label lbl_HoraInicio;
        private Label lbl_HoraFin;
        private CheckBox chk_Lunes;
        private CheckBox chk_Martes;
        private CheckBox chk_Miercoles;
        private CheckBox chk_Jueves;
        private CheckBox chk_Viernes;
        private CheckBox chk_Sabado;
        private ComboBox cmb_HoraLunesInicio;
        private ComboBox cmb_HoraLunesFin;
        private ComboBox cmb_HoraMartesInicio;
        private ComboBox cmb_HoraMartesFin;
        private ComboBox cmb_HoraMiercolesInicio;
        private ComboBox cmb_HoraMiercolesFin;
        private ComboBox cmb_HoraJuevesInicio;
        private ComboBox cmb_HoraJuevesFin;
        private ComboBox cmb_HoraViernesInicio;
        private ComboBox cmb_HoraViernesFin;
        private ComboBox cmb_HoraSabadoInicio;
        private ComboBox cmb_HoraSabadoFin;
        private Button btn_RegistrarAgenda;
        private Button btn_Cancelar;
    }
}