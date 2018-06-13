--procedimento adcinar Artigo
Create Procedure addpedido
	(@ArtigoId int, @PedidoId int, @Quantidade int)
as
	insert into PedidoArtigo(ArtigoArtID,PedidoPID,Quantidade)
	values (@ArtigoId,@PedidoId,@Quantidade)
	
--procedimento receber bebidas
reate Procedure getBebidas
as
	Select Artigo.ArtID, Artigo.NomeArt as 'Nome'
	from Artigo join TipoArtigo on TipoArtigo.TAID = Artigo.TipoArtigoTAID
	where TipoArtigo.DescTipoArtigo = 'Bebidas'
	
--Procedimento Receber nome do funcionario
Create procedure getNomeFuncionario
	(@pedidoId int)
as
	select Funcionario.Nome
	from Funcionario join Pedido on Funcionario.FID = Pedido.FuncionarioFID
	where Pedido.PID = @pedidoId
	
--Procedimento receber numero do pedido
CREATE Procedure getNumPedido
	(@Mesa int)
as
	Select Pedido.PID
	 from Pedido
	  where Pedido.MesaMID = @Mesa
	  and Pedido.PID >= ALL(Select Pedido.PID
	 from Pedido
	  where Pedido.MesaMID = @Mesa)
	  
--procedimento para receber pedido
Create Procedure getPedido
	(@MID int)
as
	Select  Pedido.PID, NomeArt as 'Nome', PedidoArtigo.Quantidade
	from Pedido join PedidoArtigo on PedidoArtigo.PedidoPID = Pedido.PID
		join Artigo on Artigo.ArtID = PedidoArtigo.ArtigoArtID
		join Mesa on Mesa.MID = Pedido.MesaMID
	where Mesa.MID = @MID 
		and Pedido.PID >= ALL(Select Pedido.PID from Pedido where Pedido.MesaMID = @MID)
		
--Procedimento para receber pratos
Create Procedure getPratos
as
	Select Artigo.ArtID, Artigo.NomeArt as 'Nome'
	from Artigo join TipoArtigo on TipoArtigo.TAID = Artigo.TipoArtigoTAID
	where TipoArtigo.DescTipoArtigo = 'Prato'
	
--procedimento para receber sobremesas
Create Procedure getSobremesas
as
	Select Artigo.ArtID, Artigo.NomeArt as 'Nome'
	from Artigo join TipoArtigo on TipoArtigo.TAID = Artigo.TipoArtigoTAID
	where TipoArtigo.DescTipoArtigo = 'Sobremesas'
	
--Procedimento para criar um pedido novo
Create procedure novoPedido
	(@MID int, @func char(255))
as
	Insert into Pedido(MesaMID,FuncionarioFID)
	Select @MID , Funcionario.FID
	from Funcionario
	where Funcionario.Nome = @func
	
--Procedimento para remover um artigo do pedido
Create Procedure removePedidoArtigo
	(@Artigo char(255), @Pedido int)
as
	Delete from PedidoArtigo
	where PedidoArtigo.PedidoPID = @Pedido
	and PedidoArtigo.ArtigoArtID in (select Artigo.ArtID from  Artigo where Artigo.NomeArt = @Artigo)
	
--Procedimento para actualizar artigos do pedido
Create Procedure updatePedido
	(@ArtigoId char(255),@PedidoId int, @Quantidade int)
as
	Update PedidoArtigo
	set Quantidade =@Quantidade
	where PedidoArtigo.PedidoPID = @PedidoId
		and PedidoArtigo.ArtigoArtID in (Select Artigo.ArtID
										 from Artigo
										 where Artigo.NomeArt = @ArtigoId)