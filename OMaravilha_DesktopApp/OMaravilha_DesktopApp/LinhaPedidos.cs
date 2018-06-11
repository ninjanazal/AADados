using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace OMaravilha_DesktopApp
{
    public partial class LinhaPedidos : Form
    {
        private int mesaNum;

        public LinhaPedidos(int numMesa)
        {
            InitializeComponent();
            //recebe o numero da mesa por parametro
            mesaNum = numMesa;
            //altera a lable para o nome da janela para o numero da janela
            numeroMesa.Text = "Mesa: " + mesaNum;
            //titulo da janela
            this.Text = "Mesa: " + mesaNum;

            //iniciar connecçao
            String connectKey = "Data Source=DESKTOP-2V1JTH4;Initial Catalog=RestauranteMaravilha;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectKey);

            //cria comando para a base de dados
            SqlCommand command = new SqlCommand("dbo.getPedido", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@MID", mesaNum);
            //abrir connecçao
            connection.Open();
            //criar leitor
            SqlDataReader reader = command.ExecuteReader();

            //enquanto tem linhas para ler adiciona na tabela
            while (reader.Read())
                vistaPedidos.Rows.Add(reader[0].ToString().Trim(), reader[1]);
            //fecha connecçao
            connection.Close();
        }

        private void cancelarPedido_Click(object sender, EventArgs e)
        {
            //fecha e janela e abre selecao de mesas
            Mesas mesa = new Mesas();
            mesa.Visible = true;
            this.Visible = false;
        }

        private void LinhaPedidos_Load(object sender, EventArgs e)
        {

        }

        private void vistaPedidos_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
