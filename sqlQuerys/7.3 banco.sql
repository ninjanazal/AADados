--2.	Quais os clientes desta instituição que movimentaram mais de 20000€ em ações entre setembro de 2014 e dezembro de 2017? 
Select Cliente.Nome, MovTotal = SUM(QTD*ValorUnit)
from Cliente join Titula on Cliente.Cid = Titular.Cid
	join MovAcao on Titular.NCid = MovAcao.NCid
where Data >'2014-09-01' and Data <'2017-12-01'
Group by Cliente.Nome
Having SUM(QTD*ValorUnit) >20000

--3.	Qual o cliente com maior movimentação de valores no ano de 2017 (ignorar o movimento de ações)? 
Select Cliente.Nome, MovTotal = SUM(Valor)
from Cliente join Titular on Cliente,Cid = Titular.Cid
	join Movimento on Titular.Ncid = Movimento.Ncid
where year(Data) = 2017
group by Cliente.Nome
Having SUm(Valor) >= All (Select MovTotal = SUM(Valor)
							from Cliente join Titular on Cliente,Cid = Titular.Cid
								join Movimento on Titular.Ncid = Movimento.Ncid
							where year(Data) = 2017)
							
--4.	Qual o nome dos elementos da tabela cliente que não são titulares de qualquer conta? 

select Nome
from Clientewhere Cid not in (Select Cid from Titular)

-- ou

select * from Cliente left join Titular
on Cliente,Cid = Titular.cid
where Titular.Ncid is null

--5.	Quantos clientes têm morada no código postal 4100? 
Select COUNT(DISTINCT Cid)
from Morada
where CP = 4100

--6.	Quais os contactos do(s) titular(es) da conta com o número 123456? 
select Cliente.Nome, TipoContacto.Descriçao, Contacto.Valor
from Titular join cliente on cliente.cid = titular.cid
	join Morada on cliente.cid = morada.cid 
	join contacto on morada.Mid = contacto.mid
	join tipoContacto on tipoContacto.tcid = contacto.tcid
where Titular.ncid = 123456

--7.	Qual o valor total movimentado nas contas do cliente com o nome ‘José Silva’? 
select MovTotal = (
	select MovFin = SUM(movimento.valor)
	from Cliente join titular on cliente.cid = titular.cid
		join movimento on titular.ncid = movimento.ncid
	where cliente.Nome = 'José Silva')
	+(select MovAcçoes = SUM(MovAcao.QTD * MovAcao.)
	from Cliente join titular on cliente.cid = titular.cid
		join MovAcao on titular.ncid = MovAcao.ncid
	where cliente.Nome = 'José Silva')

--8.	Quantos contactos do tipo ‘Fax’ estão inseridos na BD? 
select Count(Contacto.Tcid)
from Contacto join TipoContacto on TipoContacto.Tcid = Contacto.Tcid
where TipoContacto.Descricao = 'Fax'

-- 9.	Imagine que pretende comercializar uma solução de Internet, fax e telefone fixo integradas. Quantas moradas da BD desta instituição bancária tem associados e-mail, telefone fixo e fax? 

Select Count (DISTINCT Mid)
from Contacto join TipoContacto on COntacto.Tcid = TipoContacto.Tcid
where Descricao = 'e-mail'
and Mid in (select Mid 
			from Contacto join TipoContacto on Contacto.Tcid = TipoContacto.Tcid
			where Descricao='telefone'
			and Mid in (select Mid 
						from Contacto join TipoContacto on Contacto.Tcid = TipoContacto.Tcid
						where Descricao='fax'))

--

