create Procedure getPratos
as
	Select Artigo.NomeArt as 'Nome'
	from Artigo join TipoArtigo on TipoArtigo.TAID = Artigo.TipoArtigoTAID
	where TipoArtigo.DescTipoArtigo = 'Prato'
