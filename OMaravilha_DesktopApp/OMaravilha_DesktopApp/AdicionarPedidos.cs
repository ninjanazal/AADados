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
    public partial class AdicionarPedidos : Form
    {
        private int mesa;
        private int numPedido;

        public AdicionarPedidos(string tipo, int numMesa, int nPedido)
        {
            InitializeComponent();
            segundaVista.DataSource = null;

            //nome da label para o tipo a que vai ser adicionado
            inserirTipo.Text = tipo;
            //numero da mesa
            mesa = numMesa;
            //numero do pedido
            numPedido = nPedido;

            //iniciar connecçao
            String connectKey = "Data Source=DESKTOP-2V1JTH4;Initial Catalog=RestauranteMaravilha;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectKey);

            //cria comando para a base de dados
            SqlCommand command = new SqlCommand("dbo.get" + tipo, connection);
            command.CommandType = CommandType.StoredProcedure;

            //abrir connecçao
            connection.Open();

            //criar leitor
            SqlDataReader reader = command.ExecuteReader();

            //enquanto tem linhas para ler adiciona na tabela
            while (reader.Read())
                segundaVista.Rows.Add(reader[0], reader[1].ToString().Trim());
            //fecha connecçao
            connection.Close();

        }

        private void AdicionarPedidos_Load(object sender, EventArgs e)
        {

        }

        private void cancelarButton_Click(object sender, EventArgs e)
        {
            //volta á janela anterior de linha de pedido
            LinhaPedidos linhaPedido = new LinhaPedidos(mesa);
            linhaPedido.Show();
            this.Close();
        }

        private void adicionarArtigo_Click(object sender, EventArgs e)
        {
            int value;

            if (!String.IsNullOrWhiteSpace(quantidadeText.Text) &&
                int.TryParse(quantidadeText.Text, out value))
            {
                //linha selecionada
                DataGridViewRow row = segundaVista.SelectedRows[0];

                //iniciar connecçao
                String connectKey = "Data Source=DESKTOP-2V1JTH4;Initial Catalog=RestauranteMaravilha;Integrated Security=True";
                SqlConnection connection = new SqlConnection(connectKey);

                //cria comando para a base de dados
                SqlCommand command = new SqlCommand("dbo.addpedido", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@ArtigoId", row.Cells[0].Value);
                command.Parameters.AddWithValue("@PedidoId", numPedido);
                command.Parameters.AddWithValue("@Quantidade", Convert.ToInt32(quantidadeText.Text));

                //abrir connecçao
                connection.Open();

                //executa remoçao 
                try
                {
                    command.ExecuteNonQuery();
                }
                catch
                {
                    MessageBox.Show("Artigo existento no pedido!");
                }
                //fecha connecçao
                connection.Close();

                //volta á janela anterior de linha de pedido
                LinhaPedidos linhaPedido = new LinhaPedidos(mesa);
                linhaPedido.Show();
                this.Close();
                }
            else
            {
                    MessageBox.Show("Insira apenas valores!");
                    quantidadeText.Text = null;
                }
            }
        }
    }
