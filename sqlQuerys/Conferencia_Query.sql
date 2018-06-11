--1. Quais os artigos, e datas de apresenta��o se existirem, propostos pela IES com o maior n�mero de revisores?
select Count(Participacao.Pid)
from CertEst join Participacao on CertEst.Pid = Participacao.Pid
	join AutorArt on Participacao.ArtId=AutorArt.AutId
	join autor on AutorArt.AutId=Autor.AutId
where Autor.Ies=CertEst.Ies

--3. Qual o artigo a que foi atribu�da a m�dia mais elevada? 
select Titulo, AVG(EscId) as Media
from Artigo join Aval on Artigo.ArtId=Aval.ArtId
group by Titulo
Having AVG(EscId)>= All (select AVG(EscId)
							from Aval 
							group by ArtId)

--4.	Qual o autor com mais propostas de artigos? 
select Nome, Count(ArtId)
from Autor join AutorArt on Autor.AutId=AutorArt.AutId
group by Nome

--5.	Quais os artigos propostos que n�o ser�o apresentados?
select Artigo.Titulo
from Artigo
where ArtId not in(Select Apresentacao.ArtId from Apresentacao)

