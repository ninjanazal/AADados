namespace OMaravilha_DesktopApp
{
    partial class AdicionarPedidos
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
            this.inserirTipo = new System.Windows.Forms.Label();
            this.segundaVista = new System.Windows.Forms.DataGridView();
            this.adicionarArtigo = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.segundaVista)).BeginInit();
            this.SuspendLayout();
            // 
            // inserirTipo
            // 
            this.inserirTipo.AutoSize = true;
            this.inserirTipo.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.inserirTipo.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.inserirTipo.Location = new System.Drawing.Point(94, 9);
            this.inserirTipo.Name = "inserirTipo";
            this.inserirTipo.Size = new System.Drawing.Size(97, 18);
            this.inserirTipo.TabIndex = 0;
            this.inserirTipo.Text = "_inserirTipo";
            // 
            // segundaVista
            // 
            this.segundaVista.BackgroundColor = System.Drawing.SystemColors.Control;
            this.segundaVista.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.segundaVista.Location = new System.Drawing.Point(12, 39);
            this.segundaVista.Name = "segundaVista";
            this.segundaVista.Size = new System.Drawing.Size(260, 187);
            this.segundaVista.TabIndex = 1;
            // 
            // adicionarArtigo
            // 
            this.adicionarArtigo.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.adicionarArtigo.Location = new System.Drawing.Point(12, 257);
            this.adicionarArtigo.Name = "adicionarArtigo";
            this.adicionarArtigo.Size = new System.Drawing.Size(260, 23);
            this.adicionarArtigo.TabIndex = 2;
            this.adicionarArtigo.Text = "Adicionar";
            this.adicionarArtigo.UseVisualStyleBackColor = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(58, 236);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Quantidade:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(129, 233);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 20);
            this.textBox1.TabIndex = 4;
            // 
            // AdicionarPedidos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 292);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.adicionarArtigo);
            this.Controls.Add(this.segundaVista);
            this.Controls.Add(this.inserirTipo);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Name = "AdicionarPedidos";
            this.Text = "AdicionarPedidos";
            this.Load += new System.EventHandler(this.AdicionarPedidos_Load);
            ((System.ComponentModel.ISupportInitialize)(this.segundaVista)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label inserirTipo;
        private System.Windows.Forms.DataGridView segundaVista;
        private System.Windows.Forms.Button adicionarArtigo;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
    }
}