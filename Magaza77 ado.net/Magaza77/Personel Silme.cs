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
    public partial class Personel_Silme : Form
    {
        public Personel_Silme()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=localhost;database=Magaza77;integrated security=true");
        private void BtnEvet_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("PSil", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", label1.Tag);
            cmd.ExecuteNonQuery();
            con.Close();
            Form1 form1 = new Form1();
            form1.Show();
            this.Close();

        }

        private void BtnHayır_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
