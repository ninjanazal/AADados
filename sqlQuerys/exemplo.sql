/*
- para adicionar
-> Insert "Nome da tabela"("elementos da tabela")

--------operadores
-> top = devolve a quantidade de linha desejadas
->(*)= tudo
-> Having= usado quando tem por exemplo um Count e é pretendido um excepçao
*/

/*Selecionar tod o o conteudo da tabela aluno */
select * from Aluno

/* Inserir um novo aluno na tabela aluno*/
Insert Aluno(Nome,CP,CPext,PCid,BI,NIF,Sexo,DataNasc)
	Value('António Sousa Almada D''Orey', 4900,343,11,145876598,196543321,'M','1998-11--11')


/* Idade dos alunos*/
select datanasc, FLOOR(DATEDIFF(day,datanasc,getDate())/ 365.25) as Age
from Aluno

/*Selecionar os alunos do curso de ESI*/
Select Aluno.Nome
from Aluno Join Plano on Aluno.PCid = Plano.PCid
	Join Curso on Plano.Cid = Curso.Cid
Where Curso.Nome = 'Informática Médica'
Order by Nome asc

-- ou
Select Aluno.Nome
from Aluno, Curso, Plano
where Aluno.PCid=Plano.PCid
	and Curso.Cid=Plano.Cid
	and Curso.Nome ='Informática Médica'
Order by Nome asc

--ou
select A.nome
from Curso C join Plano P ON C.Cid=P.Cid
	Join Aluno A on A.PCid = P.PCid
where C.Nome ='Informática Médica'
order by A.Nome asc

-- Quantos alunos estao inscritos na BD
Select Alunos = COUNT(Nid) 
from Aluno
--ou
--(nome da tabela com varias palavrras)
select 'Alunos Inscritos' = COUNT(*)
from Aluno

/* alunos com inscriçoes */
select count(Distinct nid) from Inscricao

/*quantos alunos estao inscritos por curso*/
select curso=C.Nome, COUNT(nid) as Inscritos
from Aluno A Join Plano P on A.PCid = P.PCid
	Join Curso C on P.Cid =C.Cid
Group By c.Nome  

/*Quais os cursos com mais de 15 alunos inscritos*/
select curso=C.nome, Inscritos=COUNT(nid)
from Aluno A Join Plano P on A.PCid = P.PCid
	Join Curso C on P.Cid = C.Cid
Group By c.Nome
Having COUNT(Nid)>15

/*Atualizar o plano curricular de um determinado aluno*/
update Aluno set PCid = 2 where nid = 6

/*Qual o grau, nome, disciplinas e ano do plano curricular com o numero 16*/
Select  Grau.Descricao,Curso.Nome,Disciplina.Nome, PlanoCurricular.Ano
from Grau join Curso on Grau.Gid = Curso.Gid
	join Plano on Plano.Cid = Curso.Cid
	join PlanoCurricular on PlanoCurricular.PCid=Plano.PCid
	join Disciplina on PlanoCurricular.DISCid=Disciplina.DISCid
where PlanoCurricular.PCid =6

/* quais as disciplinas a que esta inscrito o aluno 51*/
select Disciplina.Nome
from Inscricao Join DS on Inscricao.DSid = ds.DSid
	Join Disciplina on ds.DISCid = Disciplina.DISCid
where Inscricao.Nid = 51

--Quais as disciplinas em que esta inscrito o alunos 'José Silva'
select Disciplina.Nome
from Inscricao Join DS on Inscricao.DSid = ds.DSid
	Join Disciplina on ds.DISCid = Disciplina.DISCid
	Join Aluno on Aluno.Nid = Inscricao.Nid
where Aluno.Nome='José Silva'

--Quais os alunos inscritos na disciplina de 'Armazenamento e Acesso a Dados'
select Aluno.Nome
from Aluno Join Inscricao on Aluno.Nid=Inscricao.Nid
	Join DS on Inscricao.DSid=DS.DISCid
	Join Disciplina on Ds.DISCid = Disciplina.DISCid
where Disciplina.Nome= 'Armazenamento e Acesso a Dados'
Order by Nome

/*qual é a media das notas positivas da disciplina de 'Armazenamento e acesso a dados'*/
Select Media=AVG(Nota)
from Inscricao Join Ds on Inscricao.DSid = DS.DSid
	Join Disciplina on DS.DISCid = Disciplina.DISCid
where Disciplina.Nome = 'Armazenamento e Acesso a dados'
	and Nota>=10

/*Quais os alunos com a melhor nota a 'Armazenamento e Acesso a dados'*/
select A.Nome, Nota
from Aluno A join Inscricao I on A.Nid = I.Nid
	Join DS on Ds.DSid = I.DSid
	Join Disciplina on Ds.DISCid = Disciplina.DISCid
where Disciplina.Nome = 'Armazenamento e Acesso a dados'
	and Nota = (select MAX(nota)
			   from Aluno A join Inscricao I on A.Nid = I.Nid
					Join DS on Ds.DSid = I.DSid
					Join Disciplina on Ds.DISCid = Disciplina.DISCid
			   where Disciplina.Nome = 'Armazenamento e Acesso a dados')

/*Qual é o aluno com a melhor media de ESI*/
Select Aluno.Nome, Media=AVG(Nota)
from Aluno join Inscricao on Aluno.Nid = Inscricao.Nid
	join Plano on Plano.PCid = Aluno.PCid
	join Curso on Curso.Cid = Plano.Cid
where Curso.Nome ='Informática Médica'
	and Nota>= 10
group by Aluno.Nome
having AVG(Nota) >= All (Select Media=AVG(Nota)
	from Aluno join Inscricao on Aluno.Nid = Inscricao.Nid
		join Plano on Plano.PCid = Aluno.PCid
		join Curso on Curso.Cid = Plano.Cid
	where Curso.Nome ='Informática Médica'
		and Nota>= 10
	group by Aluno.Nome) 

/*qual é o aluno com 13 a armazenamento e acesso a dados e 14 a calculo*/
Select Aluno.Nome
from Aluno join Inscricao on Aluno.Nid = Inscricao.Nid
	Join DS on Ds.DSid = Inscricao.DSid
	Join Disciplina on Ds.DISCid = Disciplina.DISCid
where Disciplina.Nome = 'Armazenamento e Acesso a Dados'
	and Nota >= 13
	and Aluno.Nome in (Select Aluno.Nome
						from Aluno join Inscricao on Aluno.Nid = Inscricao.Nid
							Join DS on Ds.DSid = Inscricao.DSid
							Join Disciplina on Ds.DISCid = Disciplina.DISCid
							where Disciplina.Nome = 'Economia I'
							and Nota >= 13) 	
							
/*DE quantas localidades diferentes ha alunos inscritos*/
Select Localidades=COUNT(distinct Localidade) 
from Aluno join CPostal on Aluno.CP = CPostal.CP
	Join Inscricao on Aluno.Nid = Inscricao.Nid

/*quais as localidades que tem pelo menos 2 alunos*/
Select Localidade, Alunos=CoUNT(nid)
from Aluno join CPostal on Aluno.CP = CPostal.CP
group by Localidade
Having COUNT(nid)>= 2

/*Qual o nome do aluno mais novo*/
select Nome
from Aluno
where DataNasc = (select max(DataNasc)
					from Aluno)


/* para cada aluno qual o nome do curso em que esta inscrito*/
select Aluno=Aluno.Nome, Curso= curso.Nome
from Aluno join PLano on Aluno.PCid= Plano.PCid
	join Curso on Plano.Cid= Curso.Cid
Order by Aluno

/*quais as medias de cada um dos alunos*/
Select Nome, Media=AVG(nota)
from Aluno join Inscricao on Aluno.Nid = Inscricao.Nid
where Nota>=10
group by Nome

/*Quais os numeros dos alunos com media superior a 14*/
select nid, media=AVG(nota)
from Inscricao
where Nota>=10
group by nid
having AVG(Nota)>=14

/*quais os alunos que nunca estiveram inscritos a nenhuma disciplina */
select Nid , Aluno.Nome
from Aluno
where Nid not in(select Nid from Inscricao)

/*qual o docente que atribui melhores notas*/
select Nome, AVG(Nota)
from Docente join DS on Docente.DOCid=ds.DOCid
	join Inscricao on ds.DSid= Inscricao.DSid
where Nota>= 10
group by Nome
Having AVG(Nota) >= all (select AVG(Nota)
							from Docente join DS on Docente.DOCid = DS.DOCid
								join Inscricao on ds.DSid = Inscricao.DSid
							where Nota>=10
							group by Nome)