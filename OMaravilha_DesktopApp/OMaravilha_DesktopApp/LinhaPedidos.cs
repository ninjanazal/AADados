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
        private int numPedido;

        public LinhaPedidos(int numMesa)
        {
            InitializeComponent();
            //recebe o numero da mesa por parametro
            mesaNum = numMesa;
            //altera a lable para o nome do funcionario

            //titulo da janela
            this.Text = "Mesa: " + mesaNum;

            //iniciar connecçao
            String connectKey = "Data Source=DESKTOP-2V1JTH4;Initial Catalog=RestauranteMaravilha;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectKey);

            //cria comando para a base de dados
            SqlCommand command = new SqlCommand("dbo.getPedido", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@MID", mesaNum);

            //criar comando para pedir o numero do pedido
            SqlCommand command2 = new SqlCommand("dbo.getNumPedido", connection);
            command2.CommandType = CommandType.StoredProcedure;
            command2.Parameters.AddWithValue("@Mesa", mesaNum);           


            //abrir connecçao
            connection.Open();
            //criar leitor
            SqlDataReader reader = command.ExecuteReader();
            //enquanto tem linhas para ler adiciona na tabela
            while (reader.Read())
                vistaPedidos.Rows.Add(reader[0], reader[1].ToString().Trim(), reader[2]);
            reader.Close();

            //le o numero do pedido
            SqlDataReader reader2 = command2.ExecuteReader();
            while (reader2.Read())
                numPedido = (int)reader2["PID"];
            reader2.Close();


            //cria comando para pedir o nome do funcionario
            SqlCommand command3 = new SqlCommand("dbo.getNomeFuncionario", connection);
            command3.CommandType = CommandType.StoredProcedure;
            command3.Parameters.AddWithValue("@pedidoId", numPedido);

            //le o nome do funcionario
            reader2 = command3.ExecuteReader();
            while (reader2.Read())
                nomeFunc.Text = reader2[0].ToString().Trim();

            //fecha connecçao
            connection.Close();
        }

        private void cancelarPedido_Click(object sender, EventArgs e)
        {
            //fecha e janela e abre selecao de mesas
            Mesas mesa = new Mesas();
            mesa.Show();
            this.Close();
        }

        private void LinhaPedidos_Load(object sender, EventArgs e)
        {

        }

        private void vistaPedidos_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Pratos_Click(object sender, EventArgs e)
        {
            //criar janela passando o nome por parametro
            AdicionarPedidos addPedido = new AdicionarPedidos("Pratos", mesaNum, numPedido);
            addPedido.Show();
            this.Hide();
        }

        private void Bebidas_Click(object sender, EventArgs e)
        {
            //criar janela passando o nome por parametro
            AdicionarPedidos addPedido = new AdicionarPedidos("Bebidas", mesaNum, numPedido);
            addPedido.Show();
            this.Hide();
        }

        private void Sobremesas_Click(object sender, EventArgs e)
        {
            //criar janela passando o nome por parametro
            AdicionarPedidos addPedido = new AdicionarPedidos("Sobremesas", mesaNum, numPedido);
            addPedido.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            //caso nao haja nenhuma selecçao ou tenha mais que um
            if (vistaPedidos.SelectedRows.Count == 0 ||
                vistaPedidos.SelectedRows.Count > 1)
                MessageBox.Show("Nenhum pedido selecionado!");
            else
            {
                //dados da linha selecionada
                DataGridViewRow row = vistaPedidos.SelectedRows[0];

                //iniciar connecçao
                String connectKey = "Data Source=DESKTOP-2V1JTH4;Initial Catalog=RestauranteMaravilha;Integrated Security=True";
                SqlConnection connection = new SqlConnection(connectKey);

                //cria comando para a base de dados
                SqlCommand command = new SqlCommand("dbo.removePedidoArtigo", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@Pedido", numPedido);
                command.Parameters.AddWithValue("@Artigo", row.Cells[1].Value.ToString());

                ////cria comando para a base de dados, update da tabela
                SqlCommand commandUpdate = new SqlCommand("dbo.getPedido", connection);
                commandUpdate.CommandType = CommandType.StoredProcedure;
                commandUpdate.Parameters.AddWithValue("@MID", mesaNum);

                //abrir connecçao
                connection.Open();

                //executa remoçao 
                command.ExecuteNonQuery();

                vistaPedidos.Rows.Clear();
                ////criar leitor
                SqlDataReader reader = commandUpdate.ExecuteReader();

                ////enquanto tem linhas para ler adiciona na tabela
                while (reader.Read())
                    vistaPedidos.Rows.Add(reader[0], reader[1].ToString().Trim(), reader[2]);

                //fecha connecçao
                connection.Close();

            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //dados da linha selecionada
            DataGridViewRow row = vistaPedidos.SelectedRows[0];

            //iniciar connecçao
            String connectKey = "Data Source=DESKTOP-2V1JTH4;Initial Catalog=RestauranteMaravilha;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectKey);

            //cria comando para a base de dados
            SqlCommand command = new SqlCommand("dbo.updatePedido", connection);
            command.CommandType = CommandType.StoredProcedure;

            //parametros
            command.Parameters.AddWithValue("@ArtigoId", row.Cells[1].Value.ToString());
            command.Parameters.AddWithValue("@PedidoId", numPedido);
            command.Parameters.AddWithValue("@Quantidade", Convert.ToInt32(row.Cells[2].Value));

            ////cria comando para a base de dados, update da tabela
            SqlCommand commandUpdate = new SqlCommand("dbo.getPedido", connection);
            commandUpdate.CommandType = CommandType.StoredProcedure;
            commandUpdate.Parameters.AddWithValue("@MID", mesaNum);

            //abrir connecçao
            connection.Open();

            //executa remoçao 
            command.ExecuteNonQuery();

            vistaPedidos.Rows.Clear();
            ////criar leitor
            SqlDataReader reader = commandUpdate.ExecuteReader();

            ////enquanto tem linhas para ler adiciona na tabela
            while (reader.Read())
                vistaPedidos.Rows.Add(reader[0], reader[1].ToString().Trim(), reader[2]);

            //fecha connecçao
            connection.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            //iniciar connecçao
            String connectKey = "Data Source=DESKTOP-2V1JTH4;Initial Catalog=RestauranteMaravilha;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectKey);


            //cria comando para a base de dados
            SqlCommand command = new SqlCommand("dbo.novoPedido", connection);
            command.CommandType = CommandType.StoredProcedure;

            //parametros
            command.Parameters.AddWithValue("@MID", mesaNum);
            command.Parameters.AddWithValue("@func", nomeFunc.Text);

            connection.Open();
            command.ExecuteNonQuery();

            connection.Close();

            //fecha e janela e abre selecao de mesas
            Mesas mesa = new Mesas();
            mesa.Show();
            this.Close();
        }
    }
}
