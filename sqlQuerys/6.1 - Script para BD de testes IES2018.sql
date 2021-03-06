USE [master]
GO
/****** Object:  Database [IES2018]    Script Date: 17-04-2018 17:45:22 ******/
CREATE DATABASE [IES2018]
GO
ALTER DATABASE [IES2018] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IES2018].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IES2018] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IES2018] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IES2018] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IES2018] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IES2018] SET ARITHABORT OFF 
GO
ALTER DATABASE [IES2018] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IES2018] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IES2018] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IES2018] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IES2018] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IES2018] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IES2018] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IES2018] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IES2018] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IES2018] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IES2018] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IES2018] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IES2018] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IES2018] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IES2018] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IES2018] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IES2018] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IES2018] SET RECOVERY FULL 
GO
ALTER DATABASE [IES2018] SET  MULTI_USER 
GO
ALTER DATABASE [IES2018] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IES2018] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IES2018] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IES2018] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IES2018] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IES2018', N'ON'
GO
USE [IES2018]
GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aluno](
	[Nid] [smallint] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](70) NOT NULL,
	[CP] [smallint] NULL,
	[CPext] [smallint] NOT NULL,
	[PCid] [tinyint] NULL,
	[BI] [int] NOT NULL,
	[NIF] [int] NULL,
	[Sexo] [char](1) NULL,
	[DataNasc] [date] NULL,
 CONSTRAINT [PK_Aluno] PRIMARY KEY CLUSTERED 
(
	[Nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CPostal]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CPostal](
	[CP] [smallint] NOT NULL,
	[Localidade] [nvarchar](50) NULL,
 CONSTRAINT [PK_CPostal] PRIMARY KEY CLUSTERED 
(
	[CP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Curso]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Cid] [tinyint] NOT NULL,
	[Gid] [tinyint] NULL,
	[Nome] [nvarchar](65) NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Disciplina]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disciplina](
	[DISCid] [smallint] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[ECTS] [smallint] NULL,
	[Descrição] [nvarchar](max) NULL,
 CONSTRAINT [PK_Disciplina] PRIMARY KEY CLUSTERED 
(
	[DISCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Docente]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Docente](
	[DOCid] [smallint] NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Titulo] [smallint] NULL,
	[NomeComp] [nvarchar](80) NULL,
	[Inicio] [smalldatetime] NULL,
	[Fim] [smalldatetime] NULL,
	[TipoContrato] [smallint] NULL,
	[Categoria] [smallint] NULL,
	[CP] [smallint] NULL,
	[CPext] [smallint] NULL,
 CONSTRAINT [PK_Docente] PRIMARY KEY CLUSTERED 
(
	[DOCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DS]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DS](
	[DSid] [smallint] NOT NULL,
	[PCid] [smallint] NOT NULL,
	[DISCid] [smallint] NOT NULL,
	[AnoLectivo] [nchar](10) NOT NULL,
	[DOCid] [smallint] NULL,
 CONSTRAINT [PK_DS] PRIMARY KEY CLUSTERED 
(
	[DSid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grau]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grau](
	[Gid] [tinyint] NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grau] PRIMARY KEY CLUSTERED 
(
	[Gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inscricao]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscricao](
	[DSid] [smallint] NOT NULL,
	[Nid] [smallint] NOT NULL,
	[epoca] [smallint] NOT NULL,
	[Nota] [smallint] NULL,
	[Data] [smalldatetime] NULL,
 CONSTRAINT [PK_Inscricao] PRIMARY KEY CLUSTERED 
(
	[DSid] ASC,
	[Nid] ASC,
	[epoca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plano]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plano](
	[Cid] [tinyint] NOT NULL,
	[PCid] [smallint] NOT NULL,
	[Portaria] [nvarchar](10) NULL,
 CONSTRAINT [PK_Planos_1] PRIMARY KEY CLUSTERED 
(
	[PCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlanoCurricular]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanoCurricular](
	[PCid] [smallint] NOT NULL,
	[DISCid] [smallint] NOT NULL,
	[Ano] [tinyint] NULL,
 CONSTRAINT [PK_PlanoCurricular] PRIMARY KEY CLUSTERED 
(
	[PCid] ASC,
	[DISCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Aluno] ON 

INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (1, N'António Silva', 4750, 120, 13, 9570656, 196876454, N'M', CAST(N'1988-06-03' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (4, N'José Fernandes', 4750, 160, 2, 9570657, 196876453, N'M', CAST(N'1990-09-02' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (5, N'Maria Oliveira', 4750, 300, 3, 177444567, 196876452, N'F', CAST(N'1990-09-07' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (6, N'Domingos Gomes', 4110, 512, 4, 9570659, 196876451, N'M', CAST(N'1991-04-23' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (7, N'Bruno Moreira', 4150, 500, 13, 9570660, 196876450, N'M', CAST(N'1986-04-23' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (8, N'Cândida Miranda', 4750, 117, 2, 9570661, 196876449, N'F', CAST(N'1985-09-04' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (9, N'José António', 4750, 120, 3, 9570662, 196876448, N'M', CAST(N'1985-06-17' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (10, N'Elvira Vieira', 4750, 160, 4, 9570663, 196876447, N'F', CAST(N'1995-12-23' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (11, N'Maria Peixoto', 4750, 300, 13, 9570664, 196876446, N'F', CAST(N'1993-07-20' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (12, N'Dulcineia Vilaça', 4110, 512, 2, 9570665, 196876445, N'F', CAST(N'1993-11-12' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (13, N'Bruno Monteiro', 4150, 500, 3, 9570666, 196876444, N'M', CAST(N'1990-08-05' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (14, N'Iva Eiras', 4750, 117, 4, 9570667, 196876443, N'F', CAST(N'1985-12-28' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (15, N'Liliana Oliveira', 4750, 120, 13, 9570668, 196876442, N'F', CAST(N'1997-10-13' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (16, N'Bruno Santos', 4750, 160, 2, 9570669, 196876441, N'M', CAST(N'1997-11-14' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (17, N'Maria Vassalo', 4750, 300, 3, 9570670, 196876440, N'F', CAST(N'1985-06-13' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (18, N'Cidalina Cunha', 4110, 512, 4, 9570671, 196876439, N'F', CAST(N'1989-06-11' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (19, N'Luís Lima', 4150, 500, 13, 9570672, 196876438, N'M', CAST(N'1986-02-07' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (20, N'Cátia Magalhães', 4750, 117, 2, 9570673, 196876437, N'F', CAST(N'1995-11-27' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (21, N'Ricardo Campos', 4750, 120, 3, 9570674, 196876436, N'M', CAST(N'1997-08-04' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (22, N'Susana Costa', 4750, 160, 4, 9570675, 196876435, N'F', CAST(N'1993-11-26' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (23, N'José Silva', 4750, 300, 13, 9570676, 196876434, N'M', CAST(N'1994-07-04' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (24, N'Carmen Oliveira', 4110, 512, 2, 9570677, 196876433, N'F', CAST(N'1993-01-16' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (25, N'Joana Pereira', 4150, 500, 3, 9570678, 196876432, N'F', CAST(N'1993-12-26' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (26, N'Lúcia Silva', 4750, 117, 4, 9570679, 196876431, N'F', CAST(N'1994-12-21' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (27, N'Liliana Figueiredo', 4750, 120, 13, 9570680, 196876430, N'F', CAST(N'1995-11-29' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (28, N'Carla Silva', 4750, 160, 2, 9570681, 196876429, N'F', CAST(N'1997-02-28' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (29, N'José Ferreira', 4750, 300, 3, 9570682, 196876428, N'M', CAST(N'1992-03-19' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (30, N'João Gonçalves', 4110, 512, 4, 9570683, 196876427, N'M', CAST(N'1997-02-17' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (31, N'Ricardo Santos', 4150, 500, 13, 9570684, 196876426, N'M', CAST(N'1995-10-27' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (32, N'Maria Fonseca', 4750, 117, 2, 9570685, 196876425, N'F', CAST(N'1985-08-11' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (33, N'Hugo Barbosa', 4750, 120, 3, 9570686, 196876424, N'M', CAST(N'1990-08-23' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (34, N'Angelina Duarte', 4750, 160, 4, 9570687, 196876423, N'F', CAST(N'1987-05-02' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (35, N'Rui Machado', 4750, 300, 13, 9570688, 196876422, N'M', CAST(N'1996-12-07' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (36, N'Vera Barbosa', 4110, 512, 2, 9570689, 196876421, N'F', CAST(N'1997-03-13' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (37, N'Pedro Vilaça', 4150, 500, 3, 9570690, 196876420, N'M', CAST(N'1997-01-26' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (38, N'Marta Dias', 4750, 117, 4, 9570691, 196876419, N'F', CAST(N'1997-05-11' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (39, N'Sandrina Cunha', 4750, 120, 13, 9570692, 196876418, N'F', CAST(N'1993-09-03' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (40, N'Paulo Lourenço', 4750, 160, 2, 9570693, 196876417, N'M', CAST(N'1986-08-09' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (41, N'Rui Rodrigues', 4750, 300, 3, 9570694, 196876416, N'M', CAST(N'1991-11-18' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (42, N'Lucília Esteves', 4110, 512, 4, 9570695, 196876415, N'F', CAST(N'1986-11-14' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (43, N'Carla Silva', 4150, 500, 13, 9570696, 196876414, N'F', CAST(N'1991-06-03' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (44, N'Carla Veiga', 4750, 117, 2, 9570697, 196876413, N'F', CAST(N'1997-09-25' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (45, N'Raquel Ferreira', 4750, 120, 3, 9570698, 196876412, N'F', CAST(N'1991-02-15' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (46, N'Sandra Taveira', 4750, 160, 4, 9570699, 196876411, N'F', CAST(N'1988-03-09' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (47, N'Joaquim Vilaça', 4450, 512, 13, 9570700, 196876410, N'M', CAST(N'1992-08-30' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (48, N'Ângela Oliveira', 4110, 512, 2, 9570701, 196876409, N'M', CAST(N'1992-03-20' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (49, N'Hélder Ribeiro', 4150, 500, 3, 9570702, 196876408, N'M', CAST(N'1995-08-30' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (50, N'Elisabete Barbosa', 4750, 117, 4, 9570703, 196876407, N'F', CAST(N'1991-01-27' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (51, N'Ana Almeida', 4750, 120, 4, 9570704, 196876406, N'F', CAST(N'1995-02-15' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (52, N'Joana Macedo', 4750, 160, 13, 9570705, 196876405, N'F', CAST(N'1994-12-12' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (53, N'Madalena Pereira', 4750, 300, 13, 9570706, 196876404, N'F', CAST(N'1995-11-13' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (54, N'Faustino Santos', 4110, 512, 13, 9570707, 196876403, N'M', CAST(N'1997-08-12' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (55, N'Danilson Frederico', 4150, 500, 13, 9570708, 196876402, N'M', CAST(N'1990-09-03' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (56, N'Joana Ribeiro', 4750, 117, 4, 9570709, 196876401, N'F', CAST(N'1985-08-17' AS Date))
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (57, N'José Oliveira', 4750, 300, 2, 9570658, 196876452, N'M', NULL)
INSERT [dbo].[Aluno] ([Nid], [Nome], [CP], [CPext], [PCid], [BI], [NIF], [Sexo], [DataNasc]) VALUES (58, N'António Sousa D"Orey', 4900, 343, 11, 123941856, 84522345, N'M', CAST(N'1993-12-12' AS Date))
SET IDENTITY_INSERT [dbo].[Aluno] OFF
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4110, N'Porto')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4150, N'Porto')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4450, N'Matosinhos')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4470, N'Maia')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4500, N'Viana do Castelo')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4700, N'braga')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4750, N'Arcozelo')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4785, N'Trofa')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4800, N'Guimarães')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4820, N'Fafe')
INSERT [dbo].[CPostal] ([CP], [Localidade]) VALUES (4900, N'Viana do Castelo')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (1, 2, N'Sistemas de Informação para a Gestão')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (2, 4, N'Informática Industrial')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (3, 2, N'Informática Médica')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (4, 2, N'Design Industrial')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (5, 2, N'Design Gráfico')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (6, 4, N'Informática')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (7, 4, N'Informática Médica')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (8, 5, N'Redes e Segurança Informática')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (9, 5, N'Sistemas de Informação Geográfica')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (10, 3, N'Sistemas de Informação para a Gestão')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (11, 4, N'Jogos Digitais')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (12, 6, N'Medicina')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (13, 4, N'Engenharia Eléctrica')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (14, 4, N'Engenharia em Sistemas Informáticos')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (15, 3, N'informática para o desporto')
INSERT [dbo].[Curso] ([Cid], [Gid], [Nome]) VALUES (16, 4, N'Engenharia em Desenvolvimento de Jogos Digitais')
SET IDENTITY_INSERT [dbo].[Disciplina] ON 

INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (1, N'Análise de Matemática', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (2, N'Arquitectura de Computadores', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (3, N'Algoritmos e Estruturas de Dados I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (4, N'Inglês Técnico', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (5, N'Economia I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (6, N'Contabilidade Geral', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (7, N'Algoritmos e Estruturas de Dados II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (8, N'Matemática Discreta e Álgebra Linear', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (9, N'Comunicações por Computador', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (10, N'Linguagens de Programação I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (11, N'Engenharia de Software I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (12, N'Sistemas Operativos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (13, N'Linguagens de Programação II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (14, N'Probabilidade e Estatística', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (15, N'Engenharia de Software II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (16, N'Contabilidade Analítica', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (17, N'Economia II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (18, N'Gestão de Sistemas de Informação', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (19, N'Armazenamento e Acesso a Dados', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (20, N'Gestão de Produção', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (21, N'Sistemas de Informação em Rede', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (22, N'Multimédia', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (23, N'Gestão de Recursos Humanos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (24, N'Relato Financeiro', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (25, N'Direito', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (26, N'Gestão de Stocks', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (27, N'Bases de Dados Avançadas', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (28, N'Cálculo Financeiro', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (29, N'Sistemas de Informação Empresariais', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (30, N'Sistemas de Informação Aplicados', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (31, N'Sistemas de Apoio à Decisão', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (32, N'Integração de Sistemas de Informação', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (33, N'Segurança e Auditoria Informática', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (34, N'Desenvolvimento Organizacional', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (35, N'Algoritmos e Estruturas de Dados I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (36, N'Introdução às Tecnologias de Informação', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (37, N'Arquitectura de Computadores e Sistemas Operativos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (38, N'Matemática I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (39, N'Organização e Gestão', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (40, N'Física', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (41, N'Algoritmos e Estruturas de Dados II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (42, N'Redes de Computadores', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (43, N'Electrotecnia', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (44, N'Probabilidades e Estatística', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (45, N'Matemática II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (46, N'Inglês', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (47, N'Linguagens de Programação I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (48, N'Engenharia de Software I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (49, N'Métodos Numéricos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (50, N'Electrónica', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (51, N'Planeamento e Gestão da Produção', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (52, N'Armazenamento e Acesso a Dados', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (53, N'Linguagens de Programação II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (54, N'Engenharia de Software II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (55, N'Gestão de Stocks e Aprovisionamento', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (56, N'Sistemas de Informação Contabilística', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (57, N'Investigação Operacional', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (58, N'Controlo de Processos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (59, N'Gestão de Sistemas de Informação', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (60, N'Sistemas de Apoio à Gestão de Empresas I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (61, N'Sistemas de Informação em Rede', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (62, N'Sistemas CAD/CAM', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (63, N'Sistemas de Aquisição de Dados', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (64, N'Gestão da Qualidade', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (65, N'Sistemas Inteligentes de Produção', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (66, N'Sistemas de Apoio à Gestão de Empresas II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (67, N'Automação e Robótica', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (68, N'Desenvolvimento Organizacional', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (69, N'Projecto', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (70, N'Algoritmos e Estruturas de Dados I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (71, N'Sistemas e Tecnologias de Informação', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (72, N'Arquitectura de Computadores e Sistemas Operativos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (73, N'Matemática I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (74, N'Fundamentos de Medicina', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (75, N'Algoritmos e Estruturas de Dados II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (76, N'Redes e Comunicações I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (77, N'Sistema Nacional de Saúde', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (78, N'Armazenamento e Acesso a Dados', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (79, N'Matemática II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (80, N'Análise de Sistemas de Informação de Saúde', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (81, N'Registo Clínico Electrónico', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (82, N'Electrotecnia', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (83, N'Física', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (84, N'Redes e Comunicações II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (85, N'Probabilidades e Estatística', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (86, N'Linguagens de Programação I', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (87, N'Electrónica', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (88, N'Multimédia e Sistemas Interactivos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (89, N'Organização e Gestão de Unidades de Saúde', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (90, N'Linguagens de Programação II', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (91, N'Engenharia de Software', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (92, N'Sistemas de Apoio à Decisão Clínica', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (93, N'Processamento e Análise de Imagem Biomédica', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (94, N'Métodos Numéricos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (95, N'Segurança e Ética em Informática Médica', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (96, N'Telemedicina', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (97, N'E-Saúde', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (98, N'Bioestatística', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (99, N'Projecto', 4, N'')
GO
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (100, N'Algoritmos e Estruturas de Dados', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (101, N'Matemática Discreta e Álgebra Linear', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (102, N'Arquitectura de Computadores', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (103, N'Inglês Técnico', 3, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (104, N'Linguagens de Programação', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (105, N'Probabilidades e Estatística', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (106, N'Análise Matemática', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (107, N'Programação orientada a objectos', 8, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (108, N'Redes de computadores', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (109, N'Análise de Sistemas', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (110, N'Sistemas Operativos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (111, N'Ética e deontologia', 3, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (112, N'Comunicações de dados', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (113, N'Armazenamento e Acesso a Dados', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (114, N'Engenharia de Software', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (115, N'Gestão de Sistemas de Informação', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (116, N'Fundamentos de Gestão', 3, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (117, N'Inovação e empreendedorismo', 3, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (118, N'Sistemas de Informação Empresariais', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (119, N'Integração de Sistemas de Informação', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (120, N'Planeamento e Gestão da Produção', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (121, N'Opção ', 3, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (122, N'Investigação Operacional', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (123, N'Segurança e Auditoria Informática', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (124, N'Projecto', 9, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (125, N'Economia', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (126, N'Noções de Contabilidade e Relato Financeiro', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (127, N'Direito', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (128, N'Opção 1', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (129, N'Análise de Projectos de Investimento', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (130, N'Multimédia e Sistemas Interactivos', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (131, N'Sistemas de Informação em Rede', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (132, N'Desenvolvimento Organizacional', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (133, N'Sistemas de Apoio à Decisão', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (134, N'Electrotecnia', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (135, N'Física', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (136, N'Electrónica', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (137, N'Controlo de Processos', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (138, N'Sistemas de Aquisição de Dados', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (139, N'Métodos Numéricos', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (140, N'Microprocessadores e Microcontroladores', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (141, N'Automação e Robótica', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (142, N'Sistemas CAD/CAM', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (143, N'Fundamentos de Medicina', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (144, N'Electrotecnia', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (145, N'Sistema Nacional de Saúde', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (146, N'Electrónica', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (147, N'Análise de Sistemas de Informação de Saúde', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (148, N'Registo Clínico Electrónico', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (149, N'Métodos Numéricos', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (150, N'Física', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (151, N'Organização e Gestão de Unidades de Saúde', 8, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (152, N'Arquitectura de Computadores', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (153, N'Bioestatística', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (154, N'Processamento e Análise de Imagem Biomédica', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (155, N'Telemedicina', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (156, N'Multimédia e Sistemas Interactivos', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (157, N'Segurança e Auditoria em Informática Médica', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (158, N'E-Saúde', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (159, N'Sistemas de Apoio à Decisão Clínica', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (160, N'Projecto IS', 8, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (161, N'Análise de Projectos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (162, N'Jogos de Gestão', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (163, N'Investigação Operacional', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (164, N'Sistemas Distribuídos', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (165, N'Análise e Avaliação de Sistemas de Computação', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (166, N'Organização e Sistemas de Informação', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (167, N'Estágio', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (168, N'Metodologias de Investigação', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (169, N'Complementos de Redes', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (170, N'Electrónica das Comunicações', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (171, N'Segurança em Redes de Computadores', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (172, N'Opção 1', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (173, N'Sistemas Distribuídos', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (174, N'Redes Móveis', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (175, N'Gestão e Administração de Servidores', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (176, N'Planeamento e Gestão de Redes', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (177, N'Opção 2', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (178, N'Programação em Comunicações', 4, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (179, N'Redes Peer-to-peer', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (180, N'Informática Forense', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (181, N'Seminário de projecto', 15, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (182, N'Projecto/dissertação', 30, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (183, N'Metodologias de Investigação', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (184, N'Geodesia e Cartografia', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (185, N'Sistemas de Informação Geográfica', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (186, N'Bases de dados em SIG', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (187, N'Fotogrametria e Fotointerpretação', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (188, N'Sistemas de Posicionamento Global', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (189, N'Aquisição de dados', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (190, N'Detecção Remota', 5, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (191, N'Processamento Digital de Imagem', 6, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (192, N'SIG aplicado à Gestão Urbana e Territorial', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (193, N'Aplicações de SIG', 8, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (194, N'Análise espacial da Informação Geográfica', 7, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (195, N'Seminário de projecto', 15, N'')
INSERT [dbo].[Disciplina] ([DISCid], [Nome], [ECTS], [Descrição]) VALUES (196, N'Projecto/dissertação', 30, N'')
SET IDENTITY_INSERT [dbo].[Disciplina] OFF
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (1, N'José Silva', NULL, N'José António Almeida Silva', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (2, N'Alberto Caeiro', NULL, N'Alberto Joaquim Silva Caeiro', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (3, N'Teresa Costa', NULL, N'Maria Teresa Costa', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (4, N'Joana Andrade', NULL, N'Joana Pereira de Andrade', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (5, N'Artur Gomes', NULL, N'José Artur Orey Gomes', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (6, N'Álvaro de Campos', NULL, N'Álvaro Manuel Soares de Campos', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (7, N'Ana Clara Dias', NULL, N'Ana Clara Silva Dias', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (8, N'Luísa Leitão', NULL, N'Luísa Lurdes Leitão', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (9, N'Sofia Lemos', NULL, N'Sofia Joana Amaral Lemos', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (10, N'Bernardo Reis', NULL, N'Bernardo João Ribas Reis', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Docente] ([DOCid], [Nome], [Titulo], [NomeComp], [Inicio], [Fim], [TipoContrato], [Categoria], [CP], [CPext]) VALUES (11, N'Afonso Costa', NULL, N'Afonso Tiago Sintra Costa', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (1, 1, 1, N'2001/2002 ', 1)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (2, 1, 2, N'2001/2002 ', 2)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (3, 1, 3, N'2001/2002 ', 3)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (4, 1, 4, N'2001/2002 ', 4)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (5, 1, 5, N'2001/2002 ', 5)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (6, 1, 6, N'2001/2002 ', 1)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (7, 1, 7, N'2001/2002 ', 2)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (8, 1, 8, N'2001/2002 ', 3)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (9, 1, 9, N'2001/2002 ', 4)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (10, 1, 10, N'2001/2002 ', 5)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (11, 1, 11, N'2001/2002 ', 1)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (12, 1, 12, N'2001/2002 ', 2)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (13, 1, 13, N'2002/2003 ', 3)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (14, 1, 14, N'2002/2003 ', 4)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (15, 1, 15, N'2002/2003 ', 5)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (16, 1, 16, N'2002/2003 ', 1)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (17, 1, 17, N'2002/2003 ', 2)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (18, 1, 18, N'2002/2003 ', 3)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (19, 1, 19, N'2002/2003 ', 4)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (20, 1, 20, N'2002/2003 ', 5)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (21, 1, 21, N'2002/2003 ', 1)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (22, 1, 22, N'2002/2003 ', 2)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (23, 1, 23, N'2002/2003 ', 3)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (24, 1, 24, N'2002/2003 ', 4)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (25, 1, 25, N'2003/2004 ', 5)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (26, 1, 26, N'2003/2004 ', 1)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (27, 1, 27, N'2003/2004 ', 2)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (28, 1, 28, N'2003/2004 ', 3)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (29, 1, 29, N'2003/2004 ', 4)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (30, 1, 30, N'2003/2004 ', 5)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (31, 1, 31, N'2003/2004 ', 1)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (32, 1, 32, N'2003/2004 ', 2)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (33, 1, 33, N'2003/2004 ', 3)
INSERT [dbo].[DS] ([DSid], [PCid], [DISCid], [AnoLectivo], [DOCid]) VALUES (34, 1, 34, N'2003/2004 ', 4)
INSERT [dbo].[Grau] ([Gid], [Descricao]) VALUES (1, N'CET')
INSERT [dbo].[Grau] ([Gid], [Descricao]) VALUES (2, N'Bacharel')
INSERT [dbo].[Grau] ([Gid], [Descricao]) VALUES (3, N'DESE')
INSERT [dbo].[Grau] ([Gid], [Descricao]) VALUES (4, N'Licenciatura')
INSERT [dbo].[Grau] ([Gid], [Descricao]) VALUES (5, N'Mestrado')
INSERT [dbo].[Grau] ([Gid], [Descricao]) VALUES (6, N'Doutoramento')
INSERT [dbo].[Grau] ([Gid], [Descricao]) VALUES (7, N'TecSupProf')
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 1, 1, 16, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 7, 1, 6, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 11, 1, 11, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 15, 1, 18, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 19, 1, 7, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 23, 1, 4, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 27, 1, 7, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 31, 1, 12, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 35, 1, 18, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 39, 1, 7, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 43, 1, 4, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 47, 1, 10, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 51, 1, 7, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 52, 1, 2, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 53, 1, 1, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 54, 1, 7, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 55, 1, 3, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (1, 56, 1, 6, CAST(N'2002-02-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 1, 1, 12, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 7, 1, 14, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 11, 1, 15, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 15, 1, 2, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 19, 1, 15, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 23, 1, 13, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 27, 1, 6, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 31, 1, 6, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 35, 1, 7, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 39, 1, 5, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 43, 1, 7, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 47, 1, 6, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 51, 1, 2, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 52, 1, 10, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 53, 1, 12, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 54, 1, 2, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 55, 1, 1, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (2, 56, 1, 16, CAST(N'2002-02-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 1, 1, 18, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 7, 1, 17, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 11, 1, 0, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 15, 1, 5, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 19, 1, 15, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 23, 1, 12, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 27, 1, 17, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 31, 1, 16, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 35, 1, 13, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 39, 1, 0, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 43, 1, 14, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 47, 1, 13, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 51, 1, 6, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 52, 1, 7, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 53, 1, 16, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 54, 1, 14, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 55, 1, 15, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (3, 56, 1, 2, CAST(N'2002-02-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 1, 1, 3, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 7, 1, 5, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 11, 1, 2, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 15, 1, 10, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 19, 1, 12, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 23, 1, 17, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 27, 1, 13, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 31, 1, 7, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 35, 1, 8, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 39, 1, 18, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 43, 1, 17, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 47, 1, 14, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 51, 1, 12, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 52, 1, 8, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 53, 1, 13, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 54, 1, 0, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 55, 1, 1, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (4, 56, 1, 10, CAST(N'2002-02-11 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 1, 1, 18, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 7, 1, 5, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 11, 1, 3, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 15, 1, 3, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 19, 1, 4, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 23, 1, 18, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 27, 1, 10, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 31, 1, 11, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 35, 1, 17, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 39, 1, 2, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 43, 1, 13, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 47, 1, 10, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 51, 1, 3, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 52, 1, 5, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 53, 1, 16, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 54, 1, 13, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 55, 1, 6, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (5, 56, 1, 3, CAST(N'2002-02-13 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 1, 1, 12, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 7, 1, 18, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 11, 1, 4, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 15, 1, 8, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 19, 1, 6, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 23, 1, 2, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 27, 1, 1, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 31, 1, 5, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 35, 1, 9, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 39, 1, 15, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 43, 1, 4, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 47, 1, 11, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 51, 1, 10, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 52, 1, 17, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 53, 1, 3, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 54, 1, 7, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 55, 1, 1, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (6, 56, 1, 13, CAST(N'2002-02-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 1, 1, 0, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 7, 1, 15, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 11, 1, 16, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 15, 1, 2, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 19, 1, 16, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 23, 1, 9, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 27, 1, 8, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 31, 1, 17, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 35, 1, 17, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 39, 1, 0, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 43, 1, 3, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 47, 1, 5, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 51, 1, 11, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 52, 1, 5, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 53, 1, 0, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 54, 1, 8, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 55, 1, 6, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (7, 56, 1, 17, CAST(N'2002-07-06 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 1, 1, 15, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 7, 1, 3, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 11, 1, 4, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 15, 1, 4, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 19, 1, 14, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 23, 1, 13, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 27, 1, 13, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 31, 1, 4, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 35, 1, 17, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 39, 1, 3, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 43, 1, 15, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 47, 1, 11, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 51, 1, 5, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 52, 1, 15, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 53, 1, 9, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 54, 1, 8, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 55, 1, 1, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (8, 56, 1, 7, CAST(N'2002-07-08 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 1, 1, 18, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 7, 1, 11, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 11, 1, 1, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 15, 1, 16, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 19, 1, 0, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 23, 1, 5, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 27, 1, 5, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 31, 1, 15, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 35, 1, 3, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 39, 1, 13, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 43, 1, 13, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 47, 1, 11, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 51, 1, 2, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 52, 1, 2, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 53, 1, 12, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 54, 1, 14, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 55, 1, 7, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (9, 56, 1, 7, CAST(N'2002-07-10 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 1, 1, 5, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 7, 1, 10, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 11, 1, 18, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 15, 1, 9, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 19, 1, 8, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 23, 1, 2, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 27, 1, 13, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 31, 1, 18, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 35, 1, 13, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 39, 1, 7, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 43, 1, 13, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 47, 1, 3, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 51, 1, 3, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 52, 1, 14, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 53, 1, 2, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 54, 1, 17, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 55, 1, 13, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (10, 56, 1, 1, CAST(N'2002-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 1, 1, 16, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 7, 1, 9, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 11, 1, 7, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 15, 1, 4, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 19, 1, 7, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 23, 1, 15, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 27, 1, 10, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 31, 1, 13, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 35, 1, 1, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 39, 1, 17, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 43, 1, 15, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 47, 1, 12, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 51, 1, 0, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 52, 1, 1, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 53, 1, 9, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 54, 1, 7, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 55, 1, 11, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (11, 56, 1, 11, CAST(N'2002-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 1, 1, 3, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 7, 1, 15, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 11, 1, 16, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 15, 1, 5, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 19, 1, 4, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 23, 1, 14, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 27, 1, 18, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 31, 1, 2, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 35, 1, 9, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 39, 1, 1, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 43, 1, 10, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 47, 1, 7, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 51, 1, 12, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 52, 1, 14, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 53, 1, 12, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 54, 1, 16, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 55, 1, 8, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (12, 56, 1, 8, CAST(N'2002-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 1, 1, 10, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 7, 1, 11, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 11, 1, 12, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 15, 1, 12, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 19, 1, 10, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 23, 1, 15, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 27, 1, 11, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 31, 1, 14, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 35, 1, 3, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 39, 1, 4, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 43, 1, 15, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 47, 1, 2, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 51, 1, 14, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 52, 1, 6, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 53, 1, 11, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 54, 1, 1, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 55, 1, 5, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (13, 56, 1, 2, CAST(N'2003-01-15 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 1, 1, 12, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 7, 1, 7, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 11, 1, 17, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 15, 1, 11, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 19, 1, 7, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 23, 1, 3, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 27, 1, 18, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 31, 1, 8, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 35, 1, 8, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 39, 1, 5, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 43, 1, 6, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 47, 1, 8, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 51, 1, 14, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 52, 1, 16, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 53, 1, 10, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 54, 1, 16, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 55, 1, 7, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (14, 56, 1, 1, CAST(N'2003-01-17 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 1, 1, 3, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 7, 1, 7, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 11, 1, 12, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 15, 1, 14, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 19, 1, 4, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 23, 1, 14, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 27, 1, 6, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 31, 1, 11, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 35, 1, 7, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 39, 1, 1, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 43, 1, 0, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 47, 1, 15, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 51, 1, 11, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 52, 1, 3, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 53, 1, 6, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 54, 1, 3, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 55, 1, 8, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (15, 56, 1, 5, CAST(N'2003-01-19 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 1, 1, 13, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 7, 1, 16, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 11, 1, 17, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 15, 1, 0, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 19, 1, 9, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 23, 1, 16, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 27, 1, 3, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 31, 1, 7, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 35, 1, 3, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 39, 1, 11, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 43, 1, 15, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 47, 1, 16, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 51, 1, 16, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 52, 1, 18, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 53, 1, 0, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 54, 1, 7, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 55, 1, 10, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (16, 56, 1, 5, CAST(N'2003-01-21 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 1, 1, 15, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 7, 1, 1, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 11, 1, 6, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 15, 1, 4, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 19, 1, 13, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 23, 1, 10, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 27, 1, 18, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 31, 1, 18, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 35, 1, 12, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 39, 1, 0, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 43, 1, 18, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 47, 1, 5, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 51, 1, 17, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 52, 1, 4, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 53, 1, 7, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 54, 1, 11, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 55, 1, 4, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (17, 56, 1, 17, CAST(N'2003-01-23 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 1, 1, 15, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 7, 1, 10, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 11, 1, 17, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 15, 1, 7, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 19, 1, 9, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 23, 1, 7, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 27, 1, 3, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 31, 1, 8, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 35, 1, 0, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 39, 1, 17, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 43, 1, 9, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 47, 1, 14, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 51, 1, 17, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 52, 1, 18, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 53, 1, 17, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 54, 1, 15, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 55, 1, 18, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (18, 56, 1, 1, CAST(N'2003-01-25 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 1, 1, 1, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 7, 1, 4, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 11, 1, 2, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 15, 1, 15, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 19, 1, 12, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 23, 1, 2, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 27, 1, 6, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 31, 1, 18, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 35, 1, 11, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 39, 1, 6, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 43, 1, 13, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 47, 1, 2, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 51, 1, 16, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 52, 1, 16, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 53, 1, 11, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 54, 1, 5, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 55, 1, 15, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (19, 56, 1, 18, CAST(N'2003-07-14 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 1, 1, 0, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 7, 1, 12, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 11, 1, 10, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 15, 1, 10, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 19, 1, 1, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 23, 1, 8, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 27, 1, 3, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 31, 1, 11, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 35, 1, 9, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 39, 1, 2, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 43, 1, 11, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 47, 1, 3, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 51, 1, 0, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 52, 1, 3, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 53, 1, 3, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 54, 1, 3, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 55, 1, 15, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (20, 56, 1, 1, CAST(N'2003-07-16 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 1, 1, 0, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 7, 1, 4, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 11, 1, 15, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 15, 1, 7, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 19, 1, 4, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 23, 1, 6, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 27, 1, 6, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 31, 1, 9, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 35, 1, 14, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 39, 1, 13, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 43, 1, 5, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 47, 1, 2, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 51, 1, 16, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 52, 1, 3, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 53, 1, 15, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 54, 1, 5, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 55, 1, 2, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (21, 56, 1, 11, CAST(N'2003-07-18 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 1, 1, 0, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 7, 1, 13, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 11, 1, 8, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 15, 1, 13, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 19, 1, 11, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 23, 1, 17, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 27, 1, 17, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 31, 1, 17, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 35, 1, 0, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 39, 1, 14, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 43, 1, 0, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 47, 1, 2, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 51, 1, 17, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 52, 1, 14, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 53, 1, 9, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 54, 1, 18, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 55, 1, 0, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (22, 56, 1, 9, CAST(N'2003-07-20 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 1, 1, 2, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 7, 1, 8, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 11, 1, 13, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 15, 1, 10, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 19, 1, 12, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 23, 1, 17, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 27, 1, 17, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 31, 1, 16, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 35, 1, 1, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 39, 1, 16, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 43, 1, 4, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 47, 1, 8, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 51, 1, 15, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 52, 1, 11, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 53, 1, 2, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 54, 1, 14, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 55, 1, 9, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (23, 56, 1, 18, CAST(N'2003-07-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 1, 1, 7, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 7, 1, 14, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 11, 1, 9, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 15, 1, 1, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 19, 1, 12, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 23, 1, 5, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 27, 1, 1, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 31, 1, 7, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 35, 1, 17, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 39, 1, 4, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 43, 1, 12, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 47, 1, 1, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 51, 1, 0, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 52, 1, 11, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 53, 1, 11, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 54, 1, 7, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 55, 1, 16, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (24, 56, 1, 0, CAST(N'2003-07-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 1, 1, 0, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 7, 1, 11, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 11, 1, 18, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 15, 1, 3, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 19, 1, 5, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 23, 1, 2, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 27, 1, 17, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 31, 1, 12, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 35, 1, 13, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 39, 1, 0, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 43, 1, 1, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 47, 1, 15, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 51, 1, 10, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 52, 1, 2, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 53, 1, 12, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 54, 1, 18, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 55, 1, 14, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (25, 56, 1, 7, CAST(N'2004-01-22 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 1, 1, 11, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 7, 1, 9, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 11, 1, 14, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 15, 1, 12, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 19, 1, 15, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 23, 1, 4, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 27, 1, 13, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 31, 1, 18, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 35, 1, 1, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 39, 1, 5, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 43, 1, 1, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 47, 1, 4, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 51, 1, 1, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 52, 1, 16, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 53, 1, 4, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 54, 1, 16, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 55, 1, 12, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (26, 56, 1, 3, CAST(N'2004-01-24 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 1, 1, 5, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 7, 1, 13, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 11, 1, 14, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 15, 1, 12, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 19, 1, 18, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 23, 1, 9, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 27, 1, 18, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 31, 1, 1, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 35, 1, 11, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 39, 1, 11, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 43, 1, 5, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 47, 1, 2, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 51, 1, 12, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 52, 1, 18, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 53, 1, 17, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 54, 1, 6, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 55, 1, 5, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (27, 56, 1, 7, CAST(N'2004-01-26 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 1, 1, 7, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 7, 1, 15, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 11, 1, 18, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 15, 1, 16, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 19, 1, 5, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 23, 1, 10, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 27, 1, 9, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 31, 1, 4, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 35, 1, 8, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 39, 1, 12, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 43, 1, 18, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 47, 1, 1, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 51, 1, 2, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 52, 1, 5, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 53, 1, 3, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 54, 1, 0, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 55, 1, 5, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (28, 56, 1, 7, CAST(N'2004-01-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 1, 1, 2, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 7, 1, 9, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 11, 1, 4, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 15, 1, 15, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 19, 1, 4, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 23, 1, 6, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 27, 1, 0, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 31, 1, 10, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 35, 1, 18, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 39, 1, 6, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 43, 1, 7, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 47, 1, 5, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 51, 1, 17, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 52, 1, 18, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 53, 1, 1, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 54, 1, 16, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 55, 1, 1, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (29, 56, 1, 12, CAST(N'2004-01-30 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 1, 1, 3, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 7, 1, 6, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 11, 1, 0, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 15, 1, 3, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 19, 1, 12, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 23, 1, 15, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 27, 1, 14, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 31, 1, 15, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 35, 1, 1, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 39, 1, 18, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 43, 1, 12, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 47, 1, 9, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 51, 1, 15, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 52, 1, 12, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 53, 1, 13, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 54, 1, 3, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 55, 1, 6, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (30, 56, 1, 14, CAST(N'2004-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 1, 1, 3, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 7, 1, 16, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 11, 1, 11, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 15, 1, 8, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 19, 1, 15, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 23, 1, 16, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 27, 1, 13, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 31, 1, 9, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 35, 1, 15, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 39, 1, 17, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 43, 1, 7, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 47, 1, 0, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 51, 1, 0, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 52, 1, 17, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 53, 1, 8, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 54, 1, 18, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 55, 1, 13, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (31, 56, 1, 16, CAST(N'2004-07-03 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 1, 1, 2, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 7, 1, 14, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 11, 1, 10, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 15, 1, 11, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 19, 1, 6, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 23, 1, 8, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 27, 1, 2, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 31, 1, 1, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 35, 1, 15, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 39, 1, 7, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 43, 1, 16, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 47, 1, 2, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 51, 1, 18, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 52, 1, 7, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 53, 1, 2, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 54, 1, 16, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 55, 1, 12, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (32, 56, 1, 6, CAST(N'2004-07-05 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 1, 1, 3, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 7, 1, 11, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 11, 1, 10, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 15, 1, 1, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 19, 1, 6, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 23, 1, 1, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 27, 1, 9, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 31, 1, 18, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 35, 1, 7, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 39, 1, 5, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 43, 1, 7, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 47, 1, 12, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 51, 1, 6, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 52, 1, 6, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 53, 1, 17, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 54, 1, 9, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 55, 1, 3, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (33, 56, 1, 15, CAST(N'2004-07-07 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 1, 1, 7, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 7, 1, 8, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 11, 1, 1, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 15, 1, 8, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 19, 1, 17, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 23, 1, 4, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 27, 1, 16, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 31, 1, 8, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 35, 1, 1, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 39, 1, 11, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 43, 1, 17, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 47, 1, 2, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 51, 1, 3, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 52, 1, 6, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 53, 1, 18, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 54, 1, 15, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 55, 1, 1, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Inscricao] ([DSid], [Nid], [epoca], [Nota], [Data]) VALUES (34, 56, 1, 14, CAST(N'2004-07-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (1, 1, N'1995')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (1, 2, N'2005')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (2, 3, N'2003')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (3, 4, N'2004')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (6, 5, N'2007')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (6, 6, N'2007')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (7, 7, N'2007')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (10, 8, N'2005')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (8, 9, N'2007')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (9, 10, N'2007')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (11, 11, N'2009')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (12, 12, N'2010')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (13, 13, N'2009')
INSERT [dbo].[Plano] ([Cid], [PCid], [Portaria]) VALUES (14, 14, N'2009')
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 1, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 2, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 3, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 4, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 5, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 6, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 7, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 8, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 9, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 10, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 11, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 12, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 13, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 14, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 15, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 16, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 17, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 18, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 19, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 20, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 21, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 22, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 23, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 24, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 25, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 26, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 27, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 28, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 29, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 30, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 31, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 32, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 33, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (1, 34, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 36, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 37, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 38, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 39, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 40, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 41, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 42, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 43, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 44, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 45, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 46, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 47, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 48, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 49, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 50, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 51, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 52, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 53, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 54, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 55, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 56, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 57, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 58, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 59, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 60, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 61, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 62, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 63, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 64, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 65, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 66, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 67, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 68, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (3, 69, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 71, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 72, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 73, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 74, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 75, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 76, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 77, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 78, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 79, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 80, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 81, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 82, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 83, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 84, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 85, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 86, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 87, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 88, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 89, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 90, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 91, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 92, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 93, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 94, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 95, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 96, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 97, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 98, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (4, 99, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 101, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 102, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 103, 1)
GO
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 104, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 105, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 106, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 107, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 108, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 109, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 110, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 111, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 112, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 113, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 114, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 115, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 116, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 117, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 118, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 119, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 120, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 121, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 122, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 123, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 124, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 126, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 127, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 128, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 129, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 130, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 131, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 132, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (5, 133, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 101, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 102, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 103, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 104, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 105, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 106, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 107, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 108, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 109, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 110, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 111, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 112, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 113, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 114, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 115, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 116, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 117, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 118, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 119, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 120, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 121, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 122, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 123, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 124, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 135, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 136, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 137, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 138, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 139, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 140, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 141, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (6, 142, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 101, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 102, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 104, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 105, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 106, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 107, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 108, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 109, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 111, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 112, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 113, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 114, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 115, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 118, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 122, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 144, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 145, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 146, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 147, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 148, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 149, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 150, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 151, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 152, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 153, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 154, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 155, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 156, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 157, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 158, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 159, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (7, 160, 3)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 162, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 163, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 164, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 165, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 166, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 167, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 169, 1)
GO
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 170, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 171, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (8, 172, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 173, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 174, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 175, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 176, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 177, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 178, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 179, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 180, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 181, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (9, 182, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 184, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 185, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 186, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 187, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 188, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 189, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 190, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 191, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 192, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 193, 1)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 194, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 195, 2)
INSERT [dbo].[PlanoCurricular] ([PCid], [DISCid], [Ano]) VALUES (10, 196, 2)
/****** Object:  Index [CCidadao]    Script Date: 17-04-2018 17:45:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [CCidadao] ON [dbo].[Aluno]
(
	[BI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Grau] FOREIGN KEY([Gid])
REFERENCES [dbo].[Grau] ([Gid])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_Grau]
GO
ALTER TABLE [dbo].[Docente]  WITH CHECK ADD  CONSTRAINT [FK_Docente_CPostal] FOREIGN KEY([CP])
REFERENCES [dbo].[CPostal] ([CP])
GO
ALTER TABLE [dbo].[Docente] CHECK CONSTRAINT [FK_Docente_CPostal]
GO
ALTER TABLE [dbo].[DS]  WITH CHECK ADD  CONSTRAINT [FK_DS_Docente] FOREIGN KEY([DOCid])
REFERENCES [dbo].[Docente] ([DOCid])
GO
ALTER TABLE [dbo].[DS] CHECK CONSTRAINT [FK_DS_Docente]
GO
ALTER TABLE [dbo].[DS]  WITH CHECK ADD  CONSTRAINT [FK_DS_PlanoCurricular] FOREIGN KEY([PCid], [DISCid])
REFERENCES [dbo].[PlanoCurricular] ([PCid], [DISCid])
GO
ALTER TABLE [dbo].[DS] CHECK CONSTRAINT [FK_DS_PlanoCurricular]
GO
ALTER TABLE [dbo].[Inscricao]  WITH CHECK ADD  CONSTRAINT [FK_Inscricao_Aluno_Cascade] FOREIGN KEY([Nid])
REFERENCES [dbo].[Aluno] ([Nid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inscricao] CHECK CONSTRAINT [FK_Inscricao_Aluno_Cascade]
GO
ALTER TABLE [dbo].[Inscricao]  WITH CHECK ADD  CONSTRAINT [FK_Inscricao_DS] FOREIGN KEY([DSid])
REFERENCES [dbo].[DS] ([DSid])
GO
ALTER TABLE [dbo].[Inscricao] CHECK CONSTRAINT [FK_Inscricao_DS]
GO
ALTER TABLE [dbo].[Plano]  WITH CHECK ADD  CONSTRAINT [FK_Planos_Curso] FOREIGN KEY([Cid])
REFERENCES [dbo].[Curso] ([Cid])
GO
ALTER TABLE [dbo].[Plano] CHECK CONSTRAINT [FK_Planos_Curso]
GO
ALTER TABLE [dbo].[PlanoCurricular]  WITH CHECK ADD  CONSTRAINT [FK_PlanoCurricular_Disciplina] FOREIGN KEY([DISCid])
REFERENCES [dbo].[Disciplina] ([DISCid])
GO
ALTER TABLE [dbo].[PlanoCurricular] CHECK CONSTRAINT [FK_PlanoCurricular_Disciplina]
GO
ALTER TABLE [dbo].[PlanoCurricular]  WITH CHECK ADD  CONSTRAINT [FK_PlanoCurricular_Planos] FOREIGN KEY([PCid])
REFERENCES [dbo].[Plano] ([PCid])
GO
ALTER TABLE [dbo].[PlanoCurricular] CHECK CONSTRAINT [FK_PlanoCurricular_Planos]
GO
/****** Object:  StoredProcedure [dbo].[Listaalunos]    Script Date: 17-04-2018 17:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Paulo 
-- Create date: <Create Date,,>
-- Description:	Stored Procedure para listar os alunos de um curso
-- =============================================
CREATE PROCEDURE [dbo].[Listaalunos] 
	-- Add the parameters for the stored procedure here
	@Plano int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Nid, Nome
	From aluno where PCid=@Plano
END

GO
USE [master]
GO
ALTER DATABASE [IES2018] SET  READ_WRITE 
GO
