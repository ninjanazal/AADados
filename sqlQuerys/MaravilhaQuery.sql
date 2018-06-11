--Qual o funcionario que serviu a mesa 2 as 18h do dia 12 de Maio de 2017
select Funcionario.Nome
from Funcionario join Mesa on Funcionario.FID= Mesa.FuncionarioFID
	join Fatura on Mesa.MID = Fatura.MesaMID
where Mesa.MID = 2 and DATEPART(HOUR,Fatura.DataFatura) like 18
	and Fatura.DataFatura= '2017-05-12'

--Qual o fornecedor que entregou 10kg de Arroz com a supervisionado do funcionario 'Zé'
select Fornecedor.NomeFornecedor as Fornecedor
from Funcionario join FuncEnc on Funcionario.FID = FuncEnc.FuncionarioFID
	join Encomenda on Encomenda.EncID = FuncEnc.EncomendaEncID
	join Fornecedor on Fornecedor.ForID = Encomenda.FornecedorForID
	join ArtigoEncomenda on ArtigoEncomenda.EncomendaEncID =Encomenda.EncID
	join Artigo on Artigo.ArtID = ArtigoEncomenda.ArtigoArtID
where Funcionario.Nome = 'Zé' and Artigo.NomeArt='Arroz fino'
	and ArtigoEncomenda.QuantidadeArt = 10.0

--Quantos funcionarios sao chefes de cozinha e vivem no porto
Select COUNT(distinct Funcionario.FID) as 'Numero de Chefes'
from Funcionario join Cargo on Cargo.CID = Funcionario.CargoCID
	join CPostal on CPostal.CPID = Funcionario.CPostalCPID
where Cargo.DescCargo ='Chefe' and CPostal.Localidade = 'Porto'

--Qual o funcionario que atendeu mais mesas no dia 15 de Maio de 2018
Select Funcionario.Nome, COUNT(Mesa.MID) as 'Numero de mesas'
From Funcionario join Mesa on Funcionario.FID = Mesa.FuncionarioFID
	join Fatura on Mesa.MID = Fatura.MesaMID
	join Cargo on Cargo.CID = Funcionario.CargoCID
where Fatura.DataFatura= '2017-05-15' and Cargo.DescCargo= 'Garçon'
Group by Funcionario.Nome
Having COUNT(Mesa.MID) >= all (Select COUNT(Mesa.MID)
								From Funcionario join Mesa on Funcionario.FID = Mesa.FuncionarioFID
									join Fatura on Mesa.MID = Fatura.MesaMID
									join Cargo on Cargo.CID = Funcionario.CargoCID
								where Fatura.DataFatura= '2017-05-15' and Cargo.DescCargo= 'Garçon')

--Quais os funcionarios que tem numero de telemovel mas nao tem email e sao garçons
Select distinct Funcionario.Nome, ContactoFun.FuncContacto as Telemovel
from Funcionario join ContactoFun on Funcionario.FID =ContactoFun.FuncionarioFID
	join TipoContacto on TipoContacto.TCID = ContactoFun.TipoContactoTCID
where TipoContacto.DescTipoContacto = 'Telemovel'
	and not exists(Select distinct Funcionario.Nome
					from Funcionario join ContactoFun on Funcionario.FID =ContactoFun.FuncionarioFID
						join TipoContacto on TipoContacto.TCID = ContactoFun.TipoContactoTCID
					where TipoContacto.DescTipoContacto = 'Email')

--Qual o peso medio de 'batatas' que o fornecedor 'horta do quim' entregou na primeira semana de Janeiro de 2018
select AVG(ArtigoEncomenda.QuantidadeArt) as Media
from Fornecedor join Encomenda on Fornecedor.ForID = Encomenda.FornecedorForID
	join FuncEnc on Encomenda.EncID = FuncEnc.EncomendaEncID
	join ArtigoEncomenda on Encomenda.EncID = ArtigoEncomenda.EncomendaEncID
	join Artigo on Artigo.ArtID = ArtigoEncomenda.ArtigoArtID
where Artigo.NomeArt = 'Batata'
	and Fornecedor.NomeFornecedor = 'Horta do Quim'
	and FuncEnc.DataRecepcao >= '2018-01-01' and FuncEnc.DataRecepcao <= '2018-01-07'

--Qual o funcionario que recebeu mais encomendas no mes de Fevereiro
Select Funcionario.Nome
from Funcionario join FuncEnc on Funcionario.FID = FuncEnc.FuncionarioFID
where FuncEnc.DataRecepcao >= '2018-02-01' and FuncEnc.DataRecepcao<= '2018-02-28'
group by Funcionario.Nome
having COUNT(FuncEnc.DataRecepcao) >= All(select COUNT(FuncEnc.DataRecepcao)
											from Funcionario join FuncEnc on Funcionario.FID = FuncEnc.FuncionarioFID
											where FuncEnc.DataRecepcao >= '2018-02-01' and FuncEnc.DataRecepcao<= '2018-02-28')

--Quais os 3 artigos mais recebidos provenientes do distrito do porto
Select top 3 Artigo.NomeArt, COUNT(Artigo.artId) as Quantidade
from Fornecedor join CPostal on CPostal.CPID = Fornecedor.CPostalCPID
	join Encomenda on Fornecedor.ForID = Encomenda.FornecedorForID
	join ArtigoEncomenda on Encomenda.EncID = ArtigoEncomenda.EncomendaEncID
	join Artigo on Artigo.ArtID = ArtigoEncomenda.ArtigoArtID
where CPostal.Localidade = 'Porto'
group by Artigo.NomeArt
order by Quantidade asc

--Qual o nome do chefe que confecionou 'Bacalhao' para a mesa 7 no dia 7 de Julho de 2017 as 17h
select Funcionario.Nome
from Funcionario join Cargo on Cargo.CID = Funcionario.CargoCID
	join Mesa on Funcionario.FID = Mesa.FuncionarioFID
	join Fatura on mesa.MID = Fatura.MesaMID
	join Pedido on Mesa.MID = Pedido.MesaMID
	join PedidoArtigo on Pedido.PID = PedidoArtigo.PedidoPID
	join Artigo on Artigo.ArtID = PedidoArtigo.ArtigoArtID
where Artigo.NomeArt = 'Bacalhao'  and Mesa.MID = 7 
	and Fatura.DataFatura = '2017-07-07' 
	and DATEPART(HOUR,Fatura.DataFatura) like  17

--Quais os nomes dos clientes que reservaram a mesa 5 no dia 8 de Abril de 2017
select Cliente.Nome, DATEPART(HOUR,Reserva.DataReserva) as 'Data de reserva'
from Cliente join Reserva on Cliente.CLID = Reserva.ClienteCLID
	join MesaReserva on Reserva.ResID = MesaReserva.ReservaResID
where MesaReserva.MesaMID = 5 and Reserva.DataReserva = '2017-04-08'

--Qual o funcionario que mais vezes serviu o 'Joaquim' em todas as visitas ao Maravilha
select Funcionario.Nome, COUNT(Cliente.CLID) as 'numero de atendimentos'
from Funcionario join mesa on Funcionario.FID = Mesa.FuncionarioFID
	join MesaReserva on Mesa.MID = MesaReserva.MesaMID
	join Reserva on Reserva.ResID = MesaReserva.ReservaResID
	join Cliente on Cliente.CLID = Reserva.ClienteCLID
where Cliente.Nome = 'Joaquim'
group by Funcionario.Nome
Having COUNT(Cliente.CLID) >= All (select COUNT(Cliente.CLID)
									from Funcionario join mesa on Funcionario.FID = Mesa.FuncionarioFID
										join MesaReserva on Mesa.MID = MesaReserva.MesaMID
										join Reserva on Reserva.ResID = MesaReserva.ReservaResID
										join Cliente on Cliente.CLID = Reserva.ClienteCLID
									where Cliente.Nome = 'Joaquim')

--Quantas vezes o cliente 'Joaquim' ficou ficou estacionado mais que 1h no parque
select COUNT(ValeEstacionamento.EstID) as 'Numero de estacionamento'
from Cliente join ValeEstacionamento on Cliente.CLID = ValeEstacionamento.ClienteCLID
where Cliente.Nome = 'Joaquim' 
	and DATEDIFF(MINUTE,ValeEstacionamento.HoraSaida,ValeEstacionamento.HoraEntrada) >= 60

--Quanto faturou o restaurante Maravilha no mes de 'Agosto de 2017'
Select SUM(PedidoArtigo.Quantidade * Artigo.ValorUnidade) as 'Valor faturado'
from Fatura join LinhaFatura on Fatura.FatID = LinhaFatura.FaturaFatID
	join PedidoArtigo on PedidoArtigo.ArtigoArtID = LinhaFatura.PedidoArtigoArtigoArtID 
		and PedidoArtigo.PedidoPID = LinhaFatura.PedidoArtigoPedidoPID
	join Artigo on Artigo.ArtID = PedidoArtigo.ArtigoArtID
where DATEPART(MONTH,Fatura.DataFatura) like 6 and DATEPART(YEAR, Fatura.DataFatura) like 2017
