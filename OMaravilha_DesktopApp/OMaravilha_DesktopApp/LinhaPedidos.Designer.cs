namespace OMaravilha_DesktopApp
{
    partial class LinhaPedidos
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
            this.Pratos = new System.Windows.Forms.Button();
            this.Bebidas = new System.Windows.Forms.Button();
            this.Sobremesas = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.numeroMesa = new System.Windows.Forms.Label();
            this.cancelarPedido = new System.Windows.Forms.Button();
            this.vistaPedidos = new System.Windows.Forms.DataGridView();
            this.ColumnNumero = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colunaArtigo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colunaQuantidade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.vistaPedidos)).BeginInit();
            this.SuspendLayout();
            // 
            // Pratos
            // 
            this.Pratos.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.Pratos.Location = new System.Drawing.Point(363, 12);
            this.Pratos.Name = "Pratos";
            this.Pratos.Size = new System.Drawing.Size(149, 73);
            this.Pratos.TabIndex = 1;
            this.Pratos.Text = "Pratos";
            this.Pratos.UseVisualStyleBackColor = false;
            this.Pratos.Click += new System.EventHandler(this.Pratos_Click);
            // 
            // Bebidas
            // 
            this.Bebidas.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.Bebidas.Location = new System.Drawing.Point(363, 91);
            this.Bebidas.Name = "Bebidas";
            this.Bebidas.Size = new System.Drawing.Size(149, 93);
            this.Bebidas.TabIndex = 2;
            this.Bebidas.Text = "Bebidas";
            this.Bebidas.UseVisualStyleBackColor = false;
            this.Bebidas.Click += new System.EventHandler(this.Bebidas_Click);
            // 
            // Sobremesas
            // 
            this.Sobremesas.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.Sobremesas.Location = new System.Drawing.Point(363, 190);
            this.Sobremesas.Name = "Sobremesas";
            this.Sobremesas.Size = new System.Drawing.Size(149, 91);
            this.Sobremesas.TabIndex = 3;
            this.Sobremesas.Text = "Sobremesas";
            this.Sobremesas.UseVisualStyleBackColor = false;
            this.Sobremesas.Click += new System.EventHandler(this.Sobremesas_Click);
            // 
            // button4
            // 
            this.button4.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.button4.Location = new System.Drawing.Point(13, 303);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(106, 23);
            this.button4.TabIndex = 4;
            this.button4.Text = "Alterar";
            this.button4.UseVisualStyleBackColor = false;
            // 
            // button5
            // 
            this.button5.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.button5.Location = new System.Drawing.Point(125, 302);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(106, 23);
            this.button5.TabIndex = 5;
            this.button5.Text = "Remover";
            this.button5.UseVisualStyleBackColor = false;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // button6
            // 
            this.button6.BackColor = System.Drawing.Color.White;
            this.button6.Location = new System.Drawing.Point(237, 302);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(106, 23);
            this.button6.TabIndex = 6;
            this.button6.Text = "Finalizar";
            this.button6.UseVisualStyleBackColor = false;
            // 
            // numeroMesa
            // 
            this.numeroMesa.AutoSize = true;
            this.numeroMesa.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numeroMesa.Location = new System.Drawing.Point(122, 9);
            this.numeroMesa.Name = "numeroMesa";
            this.numeroMesa.Size = new System.Drawing.Size(130, 17);
            this.numeroMesa.TabIndex = 7;
            this.numeroMesa.Text = "Numero da mesa";
            this.numeroMesa.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // cancelarPedido
            // 
            this.cancelarPedido.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.cancelarPedido.BackColor = System.Drawing.SystemColors.Info;
            this.cancelarPedido.Location = new System.Drawing.Point(406, 302);
            this.cancelarPedido.Name = "cancelarPedido";
            this.cancelarPedido.Size = new System.Drawing.Size(106, 23);
            this.cancelarPedido.TabIndex = 8;
            this.cancelarPedido.Text = "Cancelar";
            this.cancelarPedido.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.cancelarPedido.UseVisualStyleBackColor = false;
            this.cancelarPedido.Click += new System.EventHandler(this.cancelarPedido_Click);
            // 
            // vistaPedidos
            // 
            this.vistaPedidos.AllowUserToAddRows = false;
            this.vistaPedidos.AllowUserToDeleteRows = false;
            this.vistaPedidos.BackgroundColor = System.Drawing.SystemColors.ButtonHighlight;
            this.vistaPedidos.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.vistaPedidos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            this.vistaPedidos.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ColumnNumero,
            this.colunaArtigo,
            this.colunaQuantidade});
            this.vistaPedidos.Location = new System.Drawing.Point(13, 10);
            this.vistaPedidos.MultiSelect = false;
            this.vistaPedidos.Name = "vistaPedidos";
            this.vistaPedidos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.vistaPedidos.Size = new System.Drawing.Size(345, 287);
            this.vistaPedidos.TabIndex = 9;
            this.vistaPedidos.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.vistaPedidos_CellContentClick);
            // 
            // ColumnNumero
            // 
            this.ColumnNumero.HeaderText = "NºPedido";
            this.ColumnNumero.Name = "ColumnNumero";
            this.ColumnNumero.ReadOnly = true;
            this.ColumnNumero.Width = 80;
            // 
            // colunaArtigo
            // 
            this.colunaArtigo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.colunaArtigo.HeaderText = "Artigo";
            this.colunaArtigo.Name = "colunaArtigo";
            this.colunaArtigo.ReadOnly = true;
            this.colunaArtigo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colunaArtigo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // colunaQuantidade
            // 
            this.colunaQuantidade.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.colunaQuantidade.HeaderText = "Quantidade";
            this.colunaQuantidade.Name = "colunaQuantidade";
            this.colunaQuantidade.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colunaQuantidade.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // LinhaPedidos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(524, 337);
            this.Controls.Add(this.vistaPedidos);
            this.Controls.Add(this.cancelarPedido);
            this.Controls.Add(this.numeroMesa);
            this.Controls.Add(this.button6);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.Sobremesas);
            this.Controls.Add(this.Bebidas);
            this.Controls.Add(this.Pratos);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Name = "LinhaPedidos";
            this.Text = "LinhaPedidos";
            this.Load += new System.EventHandler(this.LinhaPedidos_Load);
            ((System.ComponentModel.ISupportInitialize)(this.vistaPedidos)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button Pratos;
        private System.Windows.Forms.Button Bebidas;
        private System.Windows.Forms.Button Sobremesas;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Label numeroMesa;
        private System.Windows.Forms.Button cancelarPedido;
        private System.Windows.Forms.DataGridView vistaPedidos;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnNumero;
        private System.Windows.Forms.DataGridViewTextBoxColumn colunaArtigo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colunaQuantidade;
    }
}