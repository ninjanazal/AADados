select *	
from Funcionario
select * 
from CPostal
select *
from Mesa
select * 
from Pedido
select *from TipoArtigo
select * from Artigo

--adicionar codigo postal
Insert INTO CPostal(Localidade,CodigoPostal)
Values ('Braga',4750-000)

--adicionar cargos
Insert into Cargo(DescCargo)
values ('Garçon')

--Adicionar funcionarios
Insert into Funcionario(Nome,DataNascimento,DataAdmicao,Morada,CPostalCPID,CargoCID)
values ('Joaquim Francisco Ramires','2000-10-13','2018-06-11','Avenida das Penas de S. Pombal',1,1)

Insert into Funcionario(Nome,DataNascimento,DataAdmicao,Morada,CPostalCPID,CargoCID)
values ('Antonio Francisco Ramires','2000-10-13','2018-06-11','Avenida das Penas de S. Pombal',1,1)

--adicionar mesas(10)
Insert into Mesa(NumLugares,FuncionarioFID)
values (4,1)
Insert into Mesa(NumLugares,FuncionarioFID)
values (4,1)
Insert into Mesa(NumLugares,FuncionarioFID)
values (4,1)
Insert into Mesa(NumLugares,FuncionarioFID)
values (4,1)
Insert into Mesa(NumLugares,FuncionarioFID)
values (10,1)

Insert into Mesa(NumLugares,FuncionarioFID)
values (4,2)
Insert into Mesa(NumLugares,FuncionarioFID)
values (4,2)
Insert into Mesa(NumLugares,FuncionarioFID)
values (4,2)
Insert into Mesa(NumLugares,FuncionarioFID)
values (4,2)
Insert into Mesa(NumLugares,FuncionarioFID)
values (10,2)

--adicionar pedidos
insert into Pedido(MesaMID,FuncionarioFID)
values (1,1)
insert into Pedido(MesaMID,FuncionarioFID)
values (2,1)
insert into Pedido(MesaMID,FuncionarioFID)
values (3,1)
insert into Pedido(MesaMID,FuncionarioFID)
values (4,1)
insert into Pedido(MesaMID,FuncionarioFID)
values (5,1)
insert into Pedido(MesaMID,FuncionarioFID)
values (6,2)
insert into Pedido(MesaMID,FuncionarioFID)
values (7,2)
insert into Pedido(MesaMID,FuncionarioFID)
values (8,2)
insert into Pedido(MesaMID,FuncionarioFID)
values (9,2)
insert into Pedido(MesaMID,FuncionarioFID)
values (10,2)

--tipo artigos
insert into TipoArtigo(DescTipoArtigo)
values ('Prato')

insert into TipoArtigo(DescTipoArtigo)
values ('Bebidas')
insert into TipoArtigo(DescTipoArtigo)
values ('Sobremesas')

-- artigo
insert into Artigo(ValorUnidade,DescArt,NomeArt,TipoArtigoTAID)
values (12.0,'Bacalhao','Bacalhao com natas',1)
insert into Artigo(ValorUnidade,DescArt,NomeArt,TipoArtigoTAID)
values (8.0,'prego','Prego no prato',1)
insert into Artigo(ValorUnidade,DescArt,NomeArt,TipoArtigoTAID)
values (10.0,'massa','Carbonara',1)

insert into Artigo(ValorUnidade,DescArt,NomeArt,TipoArtigoTAID)
values (23.0,'vinho','Tapada da lebres (tinto maduro)',2)
insert into Artigo(ValorUnidade,DescArt,NomeArt,TipoArtigoTAID)
values (3.0,'agua','Água natural',2)
insert into Artigo(ValorUnidade,DescArt,NomeArt,TipoArtigoTAID)
values (3.0,'sumo','Coca-cola',2)

insert into Artigo(ValorUnidade,DescArt,NomeArt,TipoArtigoTAID)
values (8.0,'doce','Gelado de morango',3)
insert into Artigo(ValorUnidade,DescArt,NomeArt,TipoArtigoTAID)
values (8.0,'doce','leite-creme',3)
insert into Artigo(ValorUnidade,DescArt,NomeArt,TipoArtigoTAID)
values (8.0,'bolo','Bolo de chocolate',3)


--adicionar pedido artigos
Insert into PedidoArtigo(ArtigoArtID,PedidoPID,Quantidade)
values (1,1,2)


DELETE FROM Funcionario
DBCC CHECKIDENT ('Funcionario', RESEED, 0)
GO
