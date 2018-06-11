--stored procedure
create Procedure getPedido
	(@MID int)
as
	Select  Artigo.NomeArt as 'Nome', PedidoArtigo.Quantidade
	from Pedido join PedidoArtigo on PedidoArtigo.PedidoPID = Pedido.PID
		join Artigo on Artigo.ArtID = PedidoArtigo.ArtigoArtID
		join Mesa on Mesa.MID = Pedido.MesaMID
	where Mesa.MID = @MID 
		and Pedido.PID >= ALL(Select Pedido.PID from Pedido where Pedido.MesaMID = @MID)
