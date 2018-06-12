using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace OMaravilha_DesktopApp
{
    public partial class Mesas : Form
    {
        Thread th;


        public Mesas()
        {
            InitializeComponent();
        }


        //botoes de mesa
        private void mesa1_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(1);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

     

        private void mesa2_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(2);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

        private void mesa3_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(3);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

        private void mesa4_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(4);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

        private void mesa5_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(5);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

        private void mesa6_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(6);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

        private void mesa7_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(7);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

        private void mesa8_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(8);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

        private void mesa9_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(9);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

        private void mesa10_Click(object sender, EventArgs e)
        {
            //Criar a nova janela
            LinhaPedidos linhaPedidos = new LinhaPedidos(10);
            linhaPedidos.Visible = true;

            //fecha janela de selecçao de mesas
            this.Visible = false;
        }

        private void Mesas_Load(object sender, EventArgs e)
        {

        }
    }
}
