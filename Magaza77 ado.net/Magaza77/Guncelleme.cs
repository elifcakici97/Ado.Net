using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Magaza77
{
    public partial class Guncelleme : Form
    {
        public Guncelleme()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=localhost;database=Magaza77;integrated security=true");
        private void BtnGuncelle_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("PGuncelle", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", TxtPerNo.Tag);
            cmd.Parameters.AddWithValue("PersonelNo", TxtPerNo.Text);
            cmd.Parameters.AddWithValue("AdSoyad", TxtAd.Text);
            cmd.Parameters.AddWithValue("Birimi", TxtBirim.Text);
            cmd.Parameters.AddWithValue("Adres", TxtAdres.Text);
            cmd.Parameters.AddWithValue("Maas", TxtMaas.Text);
            cmd.Parameters.AddWithValue("Telefon", TxtTel.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Form1 form1 = new Form1();
            form1.Show();
            this.Close();

        }

        private void BtnKapat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
