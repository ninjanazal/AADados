/* sql sex base dados */

-- Quais os associados com comissao 'omega' a trabalhar no projecto 'qwert'
select nomeP
from Associado join Comissao on Associado.Cid=Comissao.Cid
	join TrabalhaEm on Associado.SociadoId = TrabalhaEm.SocioId
	join Projecto on TrabalhaEm.ProjId=Projecto.ProjId
where Prijecto.Nome='Qwert'
	and Comissao.Nome='Omega'
	
-- Qual o valor angariado pelo projecto 'Qwert' para a Instituicao de caridade
select Sum(Doacao.valor * projIC.Valor) as 'Valor doado'
from Doacao join Projecto on Doacao.ProjId=Projecto.ProjId
	join ProjId on Projecto.ProjId=ProjIc.Projid
	join InstCaridade on InstCaridade.Icid=ProjIC.ICid
where Instaridade.Nome='XYZ'
	and Prjecto.Nome='QWRT'

--qual o numero de doadores que ja contribuiu para a institucao 'XYZ'
select Count(distinct Doacao.Did) as 'Doadores'
from InstCaridae join ProjIc on InstCaridade.ICid=ProjIs
	join Doacao on ProjIc.ProjIc=Doacao.Projid
where InstCaridade.Nome='XYZ'

--qual a afectacao por localidade dos donativos recebidos?
select Localidade,Sum(Doacao.Valor * projIc.Valor)as donativos
from CPostal join Instcaridade on Cpostal.cpid=InstCaridade.cpid
	join Projic on InstCaridade.ICid=ProjIC.ICid
	join Doacao on ProjIC.Projid=Doacao=Projid
group by Localidade

--quais os associaos provisorios envolvidos em mais do que 3 projectos
select NomeP, count(projd) as 'Envolvidos'
from Associado join TrabalhaEm on Associado.SocioId= TrabalhaEm.SocioId
where DataAdmissao > Dateadd(year,-1,getDate())
group by NomeP
having Count(ProjId > 3)

-- Qual o nome proprio e o codigo dos associados que ainda nao foram envolvidoem em nenhum projecto
Select nome=NomeP, codigo=SocioId
from Associado
where SocioId not in (select SocioId from TrabalhaEm)

-- qual o nome dos associados que trabalham simultaneamente no projecto 'QWERT' e no projecto 'AZERT'
select Associado.NomeP, Associado.Apelido
from Associado join TrabalhaEm on Associado.SocioId= TrabalhaEm.SocioId
	join Projecto on TrabalhaEm.ProjId=Projecto.ProjId
where Projecto.Nome='Qwert'
	and TrabalhaEm.SocioId in(select SocioId
					from TrabalhaEm join Projecto on TrabalhaEm.ProjId= projecto.ProjId
					where Projecto.Nome = 'AZERT')




