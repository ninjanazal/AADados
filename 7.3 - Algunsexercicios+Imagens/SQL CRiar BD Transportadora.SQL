/****** Script Date: 05/05/2018 10:02:23 ******/
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'Transportadora'
GO
USE [master]
GO
ALTER DATABASE [Transportadora] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [Transportadora]
GO

USE Master
GO
CREATE DATABASE [Transportadora]
GO
USE [Transportadora]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Funcionario]') AND type in (N'U'))
    DROP TABLE [dbo].[Funcionario]
GO
CREATE TABLE [dbo].[Funcionario] (
[Func_id] integer  NOT NULL  
, [Nome] CHAR(10)  NULL  
, [Morada] CHAR(10)  NULL  
, [Data_nasc] CHAR(10)  NULL  
, [Data_entrada] CHAR(10)  NULL  
, [Carta_conducao] CHAR(10)  NULL  
, [CP] integer  NOT NULL  
, [CP_est] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Funcionario] ADD CONSTRAINT [Funcionario_PK] PRIMARY KEY CLUSTERED (
[Func_id]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Veiculo]') AND type in (N'U'))
    DROP TABLE [dbo].[Veiculo]
GO
CREATE TABLE [dbo].[Veiculo] (
[Modelo_id] integer  NOT NULL  
, [Lotação] CHAR(10)  NULL  
, [Tara] CHAR(10)  NULL  
, [Veiculo_id] integer  NOT NULL  
, [CL_id] integer  NOT NULL  
, [Matricula] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Veiculo] ADD CONSTRAINT [Veiculo_PK] PRIMARY KEY CLUSTERED (
[Veiculo_id]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classe]') AND type in (N'U'))
    DROP TABLE [dbo].[Classe]
GO
CREATE TABLE [dbo].[Classe] (
[CL_id] integer  NOT NULL  
, [Classe] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Classe] ADD CONSTRAINT [Classe_PK] PRIMARY KEY CLUSTERED (
[CL_id]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Local]') AND type in (N'U'))
    DROP TABLE [dbo].[Local]
GO
CREATE TABLE [dbo].[Local] (
[Local_id] integer  NOT NULL  
, [Local] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Local] ADD CONSTRAINT [Local_PK] PRIMARY KEY CLUSTERED (
[Local_id]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rota]') AND type in (N'U'))
    DROP TABLE [dbo].[Rota]
GO
CREATE TABLE [dbo].[Rota] (
[Rota_id] integer  NOT NULL  
, [Origem] integer  NULL  
, [Destino] integer  NOT NULL  
)
GO

ALTER TABLE [dbo].[Rota] ADD CONSTRAINT [Rota_PK] PRIMARY KEY CLUSTERED (
[Rota_id]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPostal]') AND type in (N'U'))
    DROP TABLE [dbo].[CPostal]
GO
CREATE TABLE [dbo].[CPostal] (
[CP] integer  NOT NULL  
, [Localidade] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[CPostal] ADD CONSTRAINT [CPostal_PK] PRIMARY KEY CLUSTERED (
[CP]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Habilitacao]') AND type in (N'U'))
    DROP TABLE [dbo].[Habilitacao]
GO
CREATE TABLE [dbo].[Habilitacao] (
[CL_id] integer  NOT NULL  
, [Func_id] integer  NOT NULL  
, [Data] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Habilitacao] ADD CONSTRAINT [Habilitacao_PK] PRIMARY KEY CLUSTERED (
[CL_id]
, [Func_id]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marca]') AND type in (N'U'))
    DROP TABLE [dbo].[Marca]
GO
CREATE TABLE [dbo].[Marca] (
[Marca_id] integer  NOT NULL  
, [Marca] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Marca] ADD CONSTRAINT [Marca_PK] PRIMARY KEY CLUSTERED (
[Marca_id]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Modelo]') AND type in (N'U'))
    DROP TABLE [dbo].[Modelo]
GO
CREATE TABLE [dbo].[Modelo] (
[Marca_id] integer  NOT NULL  
, [Modelo] CHAR(10)  NULL  
, [Modelo_Id] integer  NOT NULL  
)
GO

ALTER TABLE [dbo].[Modelo] ADD CONSTRAINT [Modelo_PK] PRIMARY KEY CLUSTERED (
[Modelo_Id]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Horario]') AND type in (N'U'))
    DROP TABLE [dbo].[Horario]
GO
CREATE TABLE [dbo].[Horario] (
[Rota_id] integer  NOT NULL  
, [Dia] CHAR(10)  NOT NULL  
, [Func_id] integer  NOT NULL  
, [Veiculo_id] integer  NOT NULL  
, [Hora] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Horario] ADD CONSTRAINT [Horario_PK] PRIMARY KEY CLUSTERED (
[Rota_id]
, [Dia]
, [Veiculo_id]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Percurso]') AND type in (N'U'))
    DROP TABLE [dbo].[Percurso]
GO
CREATE TABLE [dbo].[Percurso] (
[Rota_id] integer  NOT NULL  
, [Local_id] integer  NOT NULL  
, [NumOrdem] integer  NOT NULL  
, [Distancia] integer  NULL  
)
GO

ALTER TABLE [dbo].[Percurso] ADD CONSTRAINT [Percurso_PK] PRIMARY KEY CLUSTERED (
[Rota_id]
, [NumOrdem]
)
GO
GO

ALTER TABLE [dbo].[Funcionario] WITH CHECK ADD CONSTRAINT [CPostal_Funcionario_FK1] FOREIGN KEY (
[CP]
)
REFERENCES [dbo].[CPostal] (
[CP]
)
GO

ALTER TABLE [dbo].[Veiculo] WITH CHECK ADD CONSTRAINT [Classe_Veiculo_FK1] FOREIGN KEY (
[CL_id]
)
REFERENCES [dbo].[Classe] (
[CL_id]
)
ALTER TABLE [dbo].[Veiculo] WITH CHECK ADD CONSTRAINT [Modelo_Veiculo_FK1] FOREIGN KEY (
[Modelo_id]
)
REFERENCES [dbo].[Modelo] (
[Modelo_Id]
)
GO

GO

GO

ALTER TABLE [dbo].[Rota] WITH CHECK ADD CONSTRAINT [Local_Rota_FK1] FOREIGN KEY (
[Destino]
)
REFERENCES [dbo].[Local] (
[Local_id]
)
GO

GO

ALTER TABLE [dbo].[Habilitacao] WITH CHECK ADD CONSTRAINT [Classe_Habilitacao_FK1] FOREIGN KEY (
[CL_id]
)
REFERENCES [dbo].[Classe] (
[CL_id]
)
ALTER TABLE [dbo].[Habilitacao] WITH CHECK ADD CONSTRAINT [Funcionario_Habilitacao_FK1] FOREIGN KEY (
[Func_id]
)
REFERENCES [dbo].[Funcionario] (
[Func_id]
)
GO

GO

ALTER TABLE [dbo].[Modelo] WITH CHECK ADD CONSTRAINT [Marca_Modelo_FK1] FOREIGN KEY (
[Marca_id]
)
REFERENCES [dbo].[Marca] (
[Marca_id]
)
GO

ALTER TABLE [dbo].[Horario] WITH CHECK ADD CONSTRAINT [Veiculo_Horario_FK1] FOREIGN KEY (
[Veiculo_id]
)
REFERENCES [dbo].[Veiculo] (
[Veiculo_id]
)
ALTER TABLE [dbo].[Horario] WITH CHECK ADD CONSTRAINT [Rota_Horario_FK1] FOREIGN KEY (
[Rota_id]
)
REFERENCES [dbo].[Rota] (
[Rota_id]
)
ALTER TABLE [dbo].[Horario] WITH CHECK ADD CONSTRAINT [Funcionario_Horario_FK1] FOREIGN KEY (
[Func_id]
)
REFERENCES [dbo].[Funcionario] (
[Func_id]
)
GO

ALTER TABLE [dbo].[Percurso] WITH CHECK ADD CONSTRAINT [Rota_Percurso_FK1] FOREIGN KEY (
[Rota_id]
)
REFERENCES [dbo].[Rota] (
[Rota_id]
)
ALTER TABLE [dbo].[Percurso] WITH CHECK ADD CONSTRAINT [Local_Percurso_FK1] FOREIGN KEY (
[Local_id]
)
REFERENCES [dbo].[Local] (
[Local_id]
)
GO

