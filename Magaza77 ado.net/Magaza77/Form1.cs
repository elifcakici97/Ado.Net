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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=localhost;database=Magaza77;integrated security=true");

        public void Listele(string prosedur)
        {
            SqlDataAdapter dr = new SqlDataAdapter(prosedur, con);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void BtnKaydet_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("PKaydet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("PersonelNo", TxtPerNo.Text);
            cmd.Parameters.AddWithValue("AdSoyad", TxtAd.Text);
            cmd.Parameters.AddWithValue("Birimi", TxtBirim.Text);
            cmd.Parameters.AddWithValue("Adres", TxtAdres.Text);
            cmd.Parameters.AddWithValue("Maas", TxtMaas.Text);
            cmd.Parameters.AddWithValue("Telefon", TxtTel.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Listele("PListele");

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            if (e.ColumnIndex == 0)
            {
                Guncelleme guncelle = new Guncelleme();
                guncelle.Show();
                guncelle.TxtPerNo.Tag = satir.Cells["ID"].Value.ToString();
                guncelle.TxtPerNo.Text = satir.Cells["PersonelNo"].Value.ToString();
                guncelle.TxtAd.Text = satir.Cells["AdSoyad"].Value.ToString();
                guncelle.TxtBirim.Text = satir.Cells["Birimi"].Value.ToString();
                guncelle.TxtAdres.Text = satir.Cells["Adres"].Value.ToString();
                guncelle.TxtMaas.Text = satir.Cells["Maas"].Value.ToString();
                guncelle.TxtTel.Text = satir.Cells["Telefon"].Value.ToString();
                this.Hide();

            }
            if (e.ColumnIndex == 1)
            {
                Personel_Silme personel_Silme = new Personel_Silme();
                personel_Silme.Show();
                personel_Silme.label1.Tag = satir.Cells["ID"].Value.ToString();
                personel_Silme.label1.Text = satir.Cells["PersonelNo"].Value.ToString();
                this.Hide();
            }



        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (TxtAra.Text == "")
            {
                Listele("PListele");
            }
            if (CmbAra.SelectedItem == "Personel No")
            {
                SqlCommand cmd = new SqlCommand("AraNo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("PersonelNo", TxtAra.Text);
                SqlDataAdapter dr = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dr.Fill(dt);
                dataGridView1.DataSource = dt;
                TxtAra.Clear();
            }
            if (CmbAra.SelectedItem == "Ad Soyad")
            {
                SqlCommand cmd = new SqlCommand("AraAd", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Ad Soyad", TxtAra.Text);
                SqlDataAdapter dr = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dr.Fill(dt);
                dataGridView1.DataSource = dt;
                TxtAra.Clear();

            }
            if (CmbAra.SelectedItem == "Birimi")
            {
                SqlCommand cmd = new SqlCommand("AraBirimi", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Birimi", TxtAra.Text);
                SqlDataAdapter dr = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dr.Fill(dt);
                dataGridView1.DataSource = dt;
                TxtAra.Clear();
            }

        }

        private void BtnKpt_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
