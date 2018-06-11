/****** Script Date: 05/05/2018 10:02:23 ******/
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'Conferencia'
GO
USE [master]
GO
ALTER DATABASE [Conferencia] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [Conferencia]
GO

USE Master
GO
CREATE DATABASE [Conferencia]
GO
USE [Conferencia]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Artigo]') AND type in (N'U'))
    DROP TABLE [dbo].[Artigo]
GO
CREATE TABLE [dbo].[Artigo] (
[ArtId] CHAR(10)  NOT NULL  
, [Titulo] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Artigo] ADD CONSTRAINT [Artigo_PK] PRIMARY KEY CLUSTERED (
[ArtId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoPart]') AND type in (N'U'))
    DROP TABLE [dbo].[TipoPart]
GO
CREATE TABLE [dbo].[TipoPart] (
[TP] CHAR(10)  NOT NULL  
, [Descricao] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[TipoPart] ADD CONSTRAINT [TipoPart_PK] PRIMARY KEY CLUSTERED (
[TP]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IES]') AND type in (N'U'))
    DROP TABLE [dbo].[IES]
GO
CREATE TABLE [dbo].[IES] (
[Ies] CHAR(10)  NOT NULL  
, [Nome] CHAR(10)  NULL  
, [Morada] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[IES] ADD CONSTRAINT [IES_PK] PRIMARY KEY CLUSTERED (
[Ies]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Apresentacao]') AND type in (N'U'))
    DROP TABLE [dbo].[Apresentacao]
GO
CREATE TABLE [dbo].[Apresentacao] (
[ArtId] CHAR(10)  NOT NULL  
, [DiaHora] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Apresentacao] ADD CONSTRAINT [Apresentacao_PK] PRIMARY KEY CLUSTERED (
[ArtId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autor]') AND type in (N'U'))
    DROP TABLE [dbo].[Autor]
GO
CREATE TABLE [dbo].[Autor] (
[AutId] CHAR(10)  NOT NULL  
, [Ies] CHAR(10)  NOT NULL  
, [Nome] CHAR(10)  NULL  
, [eMail] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Autor] ADD CONSTRAINT [Autor_PK] PRIMARY KEY CLUSTERED (
[AutId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participacao]') AND type in (N'U'))
    DROP TABLE [dbo].[Participacao]
GO
CREATE TABLE [dbo].[Participacao] (
[ArtId] CHAR(10)  NOT NULL  
, [Pid] CHAR(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Participacao] ADD CONSTRAINT [Participacao_PK] PRIMARY KEY CLUSTERED (
[Pid]
, [ArtId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AutorArt]') AND type in (N'U'))
    DROP TABLE [dbo].[AutorArt]
GO
CREATE TABLE [dbo].[AutorArt] (
[AutId] CHAR(10)  NOT NULL  
, [ArtId] CHAR(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[AutorArt] ADD CONSTRAINT [AutorArt_PK] PRIMARY KEY CLUSTERED (
[AutId]
, [ArtId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Escala]') AND type in (N'U'))
    DROP TABLE [dbo].[Escala]
GO
CREATE TABLE [dbo].[Escala] (
[EscId] CHAR(10)  NOT NULL  
, [Valor] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Escala] ADD CONSTRAINT [Escala_PK] PRIMARY KEY CLUSTERED (
[EscId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PagaAnt]') AND type in (N'U'))
    DROP TABLE [dbo].[PagaAnt]
GO
CREATE TABLE [dbo].[PagaAnt] (
[TransacId] CHAR(10)  NULL  
, [Pid] CHAR(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[PagaAnt] ADD CONSTRAINT [PagaAnt_PK] PRIMARY KEY CLUSTERED (
[Pid]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CertEst]') AND type in (N'U'))
    DROP TABLE [dbo].[CertEst]
GO
CREATE TABLE [dbo].[CertEst] (
[Pid] CHAR(10)  NOT NULL  
, [Ies] CHAR(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[CertEst] ADD CONSTRAINT [CertEst_PK] PRIMARY KEY CLUSTERED (
[Pid]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Revisor]') AND type in (N'U'))
    DROP TABLE [dbo].[Revisor]
GO
CREATE TABLE [dbo].[Revisor] (
[Rid] CHAR(10)  NOT NULL  
, [Ies] CHAR(10)  NULL  
, [Nome] CHAR(10)  NULL  
, [eMail] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Revisor] ADD CONSTRAINT [Revisor_PK] PRIMARY KEY CLUSTERED (
[Rid]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aval]') AND type in (N'U'))
    DROP TABLE [dbo].[Aval]
GO
CREATE TABLE [dbo].[Aval] (
[ArtId] CHAR(10)  NOT NULL  
, [Rid] CHAR(10)  NOT NULL  
, [EscId] CHAR(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Aval] ADD CONSTRAINT [Aval_PK] PRIMARY KEY CLUSTERED (
[ArtId]
, [Rid]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participante]') AND type in (N'U'))
    DROP TABLE [dbo].[Participante]
GO
CREATE TABLE [dbo].[Participante] (
[Pid] CHAR(10)  NOT NULL  
, [Nome] CHAR(10)  NULL  
, [Morada] CHAR(10)  NULL  
, [eMail] CHAR(10)  NULL  
, [TP] CHAR(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Participante] ADD CONSTRAINT [Participante_PK] PRIMARY KEY CLUSTERED (
[Pid]
)
GO
GO

GO

GO

GO

ALTER TABLE [dbo].[Apresentacao] WITH CHECK ADD CONSTRAINT [Artigo_Apresentacao_FK1] FOREIGN KEY (
[ArtId]
)
REFERENCES [dbo].[Artigo] (
[ArtId]
)
GO

ALTER TABLE [dbo].[Autor] WITH CHECK ADD CONSTRAINT [IES_Autor_FK1] FOREIGN KEY (
[Ies]
)
REFERENCES [dbo].[IES] (
[Ies]
)
GO

ALTER TABLE [dbo].[Participacao] WITH CHECK ADD CONSTRAINT [Apresentacao_Participacao_FK1] FOREIGN KEY (
[ArtId]
)
REFERENCES [dbo].[Apresentacao] (
[ArtId]
)
ALTER TABLE [dbo].[Participacao] WITH CHECK ADD CONSTRAINT [Participante_Participacao_FK1] FOREIGN KEY (
[Pid]
)
REFERENCES [dbo].[Participante] (
[Pid]
)
GO

ALTER TABLE [dbo].[AutorArt] WITH CHECK ADD CONSTRAINT [Autor_AutorArt_FK1] FOREIGN KEY (
[AutId]
)
REFERENCES [dbo].[Autor] (
[AutId]
)
ALTER TABLE [dbo].[AutorArt] WITH CHECK ADD CONSTRAINT [Artigo_AutorArt_FK1] FOREIGN KEY (
[ArtId]
)
REFERENCES [dbo].[Artigo] (
[ArtId]
)
GO

GO

ALTER TABLE [dbo].[PagaAnt] WITH CHECK ADD CONSTRAINT [Participante_PagaAnt_FK1] FOREIGN KEY (
[Pid]
)
REFERENCES [dbo].[Participante] (
[Pid]
)
GO

ALTER TABLE [dbo].[CertEst] WITH CHECK ADD CONSTRAINT [Participante_CertEst_FK1] FOREIGN KEY (
[Pid]
)
REFERENCES [dbo].[Participante] (
[Pid]
)
ALTER TABLE [dbo].[CertEst] WITH CHECK ADD CONSTRAINT [IES_CertEst_FK1] FOREIGN KEY (
[Ies]
)
REFERENCES [dbo].[IES] (
[Ies]
)
GO

ALTER TABLE [dbo].[Revisor] WITH CHECK ADD CONSTRAINT [IES_Revisor_FK1] FOREIGN KEY (
[Ies]
)
REFERENCES [dbo].[IES] (
[Ies]
)
GO

ALTER TABLE [dbo].[Aval] WITH CHECK ADD CONSTRAINT [Artigo_Aval_FK1] FOREIGN KEY (
[ArtId]
)
REFERENCES [dbo].[Artigo] (
[ArtId]
)
ALTER TABLE [dbo].[Aval] WITH CHECK ADD CONSTRAINT [Escala_Aval_FK1] FOREIGN KEY (
[EscId]
)
REFERENCES [dbo].[Escala] (
[EscId]
)
ALTER TABLE [dbo].[Aval] WITH CHECK ADD CONSTRAINT [Revisor_Aval_FK1] FOREIGN KEY (
[Rid]
)
REFERENCES [dbo].[Revisor] (
[Rid]
)
GO

ALTER TABLE [dbo].[Participante] WITH CHECK ADD CONSTRAINT [TipoPart_Participante_FK1] FOREIGN KEY (
[TP]
)
REFERENCES [dbo].[TipoPart] (
[TP]
)
GO

