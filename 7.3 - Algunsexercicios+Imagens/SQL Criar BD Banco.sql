USE [master]
GO
/****** Object:  Database [Banco]    Script Date: 05/05/2018 12:10:34 ******/
CREATE DATABASE [Banco]
GO
ALTER DATABASE [Banco] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Banco].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Banco] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Banco] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Banco] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Banco] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Banco] SET ARITHABORT OFF 
GO
ALTER DATABASE [Banco] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Banco] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Banco] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Banco] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Banco] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Banco] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Banco] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Banco] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Banco] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Banco] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Banco] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Banco] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Banco] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Banco] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Banco] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Banco] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Banco] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Banco] SET RECOVERY FULL 
GO
ALTER DATABASE [Banco] SET  MULTI_USER 
GO
ALTER DATABASE [Banco] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Banco] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Banco] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Banco] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Banco', N'ON'
GO
USE [Banco]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Cid] [int] NOT NULL,
	[Nome] [nvarchar](50) NULL,
	[Data_nasc] [datetime] NULL,
	[Sexo] [bit] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conta]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conta](
	[NCid] [int] NOT NULL,
	[Data_abertura] [datetime] NOT NULL,
	[teste] [nchar](10) NULL,
 CONSTRAINT [PK_Conta] PRIMARY KEY CLUSTERED 
(
	[NCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[Mid] [int] NOT NULL,
	[TCid] [int] NOT NULL,
	[Valor] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Contactos] PRIMARY KEY CLUSTERED 
(
	[Mid] ASC,
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CPostal]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CPostal](
	[CP] [int] NOT NULL,
	[Localidade] [nvarchar](50) NULL,
 CONSTRAINT [PK_CPostal] PRIMARY KEY CLUSTERED 
(
	[CP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Morada]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Morada](
	[Cid] [int] NOT NULL,
	[Rua] [nvarchar](50) NULL,
	[CP] [int] NULL,
	[CPext] [int] NULL,
	[Mid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Morada_1] PRIMARY KEY CLUSTERED 
(
	[Mid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MovAccao]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovAccao](
	[NCid] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Tipo] [nchar](10) NULL,
	[QTD] [int] NULL,
	[Nome] [nchar](10) NULL,
	[ValorUnit] [money] NULL,
 CONSTRAINT [PK_MovAccoes] PRIMARY KEY CLUSTERED 
(
	[NCid] ASC,
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movimento]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimento](
	[NCid] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Tipo] [nchar](10) NULL,
	[Descricao] [nvarchar](50) NULL,
	[DataValor] [datetime] NULL,
	[Valor] [money] NULL,
 CONSTRAINT [PK_Movimentos] PRIMARY KEY CLUSTERED 
(
	[NCid] ASC,
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoContacto]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoContacto](
	[TCid] [int] NOT NULL,
	[Descricao] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoContacto] PRIMARY KEY CLUSTERED 
(
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Titular]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titular](
	[Cid] [int] NOT NULL,
	[NCid] [int] NOT NULL,
 CONSTRAINT [PK_Titular] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC,
	[NCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[relatorio]    Script Date: 05/05/2018 12:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[relatorio] as 
select nome, rua, morada.cp, localidade, descricao, valor 
from cliente, morada,cpostal, tipocontacto, contacto
where cliente.cid=morada.cid 
and morada.cp=cpostal.cp
and morada.mid=contacto.mid 
and contacto.tcid=tipocontacto.tcid

GO
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Morada] FOREIGN KEY([Mid])
REFERENCES [dbo].[Morada] ([Mid])
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contacto_Morada]
GO
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_TipoContacto] FOREIGN KEY([TCid])
REFERENCES [dbo].[TipoContacto] ([TCid])
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contactos_TipoContacto]
GO
ALTER TABLE [dbo].[Morada]  WITH CHECK ADD  CONSTRAINT [FK_Morada_Cliente] FOREIGN KEY([Cid])
REFERENCES [dbo].[Cliente] ([Cid])
GO
ALTER TABLE [dbo].[Morada] CHECK CONSTRAINT [FK_Morada_Cliente]
GO
ALTER TABLE [dbo].[Morada]  WITH CHECK ADD  CONSTRAINT [FK_Morada_CPostal] FOREIGN KEY([CP])
REFERENCES [dbo].[CPostal] ([CP])
GO
ALTER TABLE [dbo].[Morada] CHECK CONSTRAINT [FK_Morada_CPostal]
GO
ALTER TABLE [dbo].[MovAccao]  WITH CHECK ADD  CONSTRAINT [FK_MovAccoes_Conta] FOREIGN KEY([NCid])
REFERENCES [dbo].[Conta] ([NCid])
GO
ALTER TABLE [dbo].[MovAccao] CHECK CONSTRAINT [FK_MovAccoes_Conta]
GO
ALTER TABLE [dbo].[Movimento]  WITH CHECK ADD  CONSTRAINT [FK_Movimentos_Conta] FOREIGN KEY([NCid])
REFERENCES [dbo].[Conta] ([NCid])
GO
ALTER TABLE [dbo].[Movimento] CHECK CONSTRAINT [FK_Movimentos_Conta]
GO
ALTER TABLE [dbo].[Titular]  WITH CHECK ADD  CONSTRAINT [FK_Titular_Cliente] FOREIGN KEY([Cid])
REFERENCES [dbo].[Cliente] ([Cid])
GO
ALTER TABLE [dbo].[Titular] CHECK CONSTRAINT [FK_Titular_Cliente]
GO
ALTER TABLE [dbo].[Titular]  WITH CHECK ADD  CONSTRAINT [FK_Titular_Conta] FOREIGN KEY([NCid])
REFERENCES [dbo].[Conta] ([NCid])
GO
ALTER TABLE [dbo].[Titular] CHECK CONSTRAINT [FK_Titular_Conta]
GO
USE [master]
GO
ALTER DATABASE [Banco] SET  READ_WRITE 
GO
