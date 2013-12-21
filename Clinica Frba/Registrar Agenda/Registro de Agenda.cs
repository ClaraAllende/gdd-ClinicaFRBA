using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Globalization;

namespace Clinica_Frba.Registro_de_Agenda
{
    public partial class RegistroDeAgendaWindow : Form
    {
        private void CargarComboBoxInicio(ComboBox cmb, int horaInicio, int horaFin)
        {
            DateTime time;
            for ( int i = horaInicio; i <= horaFin; i++ )
            {
                time = new DateTime(1, 1, 1, i, 0, 0, 0);
                cmb.Items.Add(time.ToString("HH:mm"));
                time = new DateTime(1, 1, 1, i, 30, 0, 0);
                cmb.Items.Add(time.ToString("HH:mm"));
   
            }
        }

        private void CargarComboBoxFin(ComboBox cmb, int horaInicio, int horaFin)
        {
            DateTime time;
            for (int i = horaInicio; i <= horaFin; i++)
            {
                time = new DateTime(1, 1, 1, i, 30, 0, 0);
                cmb.Items.Add(time.ToString("HH:mm"));
                time = new DateTime(1, 1, 1, i+1, 0, 0, 0);
                cmb.Items.Add(time.ToString("HH:mm"));

            }
        }


        public RegistroDeAgendaWindow()
        {
            InitializeComponent();
        }

        private void FormAgenda_Load(object sender, EventArgs e)
        {
            CargarComboBoxInicio(cmb_HoraLunesInicio, 7, 19);
            CargarComboBoxInicio(cmb_HoraMartesInicio, 7, 19);
            CargarComboBoxInicio(cmb_HoraMiercolesInicio, 7, 19);
            CargarComboBoxInicio(cmb_HoraJuevesInicio, 7, 19);
            CargarComboBoxInicio(cmb_HoraViernesInicio, 7, 19);
            CargarComboBoxInicio(cmb_HoraSabadoInicio, 10, 14);
            CargarComboBoxFin(cmb_HoraLunesFin, 7, 19);
            CargarComboBoxFin(cmb_HoraMartesFin, 7, 19);
            CargarComboBoxFin(cmb_HoraMiercolesFin, 7, 19);
            CargarComboBoxFin(cmb_HoraJuevesFin, 7, 19);
            CargarComboBoxFin(cmb_HoraViernesFin, 7, 19);
            CargarComboBoxFin(cmb_HoraSabadoFin, 10, 14);

            cmb_HoraLunesInicio.Enabled = false;
            cmb_HoraMartesInicio.Enabled = false;
            cmb_HoraMiercolesInicio.Enabled = false;
            cmb_HoraJuevesInicio.Enabled = false;
            cmb_HoraViernesInicio.Enabled = false;
            cmb_HoraSabadoInicio.Enabled = false;
            cmb_HoraLunesFin.Enabled = false;
            cmb_HoraMartesFin.Enabled = false;
            cmb_HoraMiercolesFin.Enabled = false;
            cmb_HoraJuevesFin.Enabled = false;
            cmb_HoraViernesFin.Enabled = false;
            cmb_HoraSabadoFin.Enabled = false;

        }

        

        private void btn_Cancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void chk_Lunes_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_Lunes.Checked == true)
            {
                cmb_HoraLunesInicio.Enabled = true;
                cmb_HoraLunesFin.Enabled = true;
            }
            else
            {
                cmb_HoraLunesInicio.Enabled = false;
                cmb_HoraLunesFin.Enabled = false;
            }
        }


        private void chk_Martes_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_Martes.Checked == true)
            {
                cmb_HoraMartesInicio.Enabled = true;
                cmb_HoraMartesFin.Enabled = true;
            }
            else
            {
                cmb_HoraMartesInicio.Enabled = false;
                cmb_HoraMartesFin.Enabled = false;
            }
        
        }

        private void chk_Miercoles_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_Miercoles.Checked == true)
            {
                cmb_HoraMiercolesInicio.Enabled = true;
                cmb_HoraMiercolesFin.Enabled = true;
            }
            else
            {
                cmb_HoraMiercolesInicio.Enabled = false;
                cmb_HoraMiercolesFin.Enabled = false;
            }
        
        }

        private void chk_Jueves_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_Jueves.Checked == true)
            {
                cmb_HoraJuevesInicio.Enabled = true;
                cmb_HoraJuevesFin.Enabled = true;
            }
            else
            {
                cmb_HoraJuevesInicio.Enabled = false;
                cmb_HoraJuevesFin.Enabled = false;
            }
        
        }

        private void chk_Viernes_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_Viernes.Checked == true)
            {
                cmb_HoraViernesInicio.Enabled = true;
                cmb_HoraViernesFin.Enabled = true;
            }
            else
            {
                cmb_HoraViernesInicio.Enabled = false;
                cmb_HoraViernesFin.Enabled = false;
            }
        
        }

        private void chk_Sabado_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_Sabado.Checked == true)
            {
                cmb_HoraSabadoInicio.Enabled = true;
                cmb_HoraSabadoFin.Enabled = true;
            }
            else
            {
                cmb_HoraSabadoInicio.Enabled = false;
                cmb_HoraSabadoFin.Enabled = false;
            }
        
        } 


    }
}
