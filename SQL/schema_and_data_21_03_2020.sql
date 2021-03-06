USE [master]
GO
/****** Object:  Database [mussika_bd]    Script Date: 21-03-2020 1:16:07 PM ******/
CREATE DATABASE [mussika_bd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mussika_bd', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\mussika_bd.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mussika_bd_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\mussika_bd_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mussika_bd] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mussika_bd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mussika_bd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mussika_bd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mussika_bd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mussika_bd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mussika_bd] SET ARITHABORT OFF 
GO
ALTER DATABASE [mussika_bd] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [mussika_bd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mussika_bd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mussika_bd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mussika_bd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mussika_bd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mussika_bd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mussika_bd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mussika_bd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mussika_bd] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mussika_bd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mussika_bd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mussika_bd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mussika_bd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mussika_bd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mussika_bd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mussika_bd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mussika_bd] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mussika_bd] SET  MULTI_USER 
GO
ALTER DATABASE [mussika_bd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mussika_bd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mussika_bd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mussika_bd] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [mussika_bd] SET DELAYED_DURABILITY = DISABLED 
GO
USE [mussika_bd]
GO
/****** Object:  Table [dbo].[acomodacao]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acomodacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](50) NULL,
	[endereco] [nvarchar](max) NULL,
	[telefone] [nvarchar](50) NULL,
	[email] [nvarchar](max) NULL,
	[descricao] [text] NULL,
	[foto_capa] [nvarchar](max) NULL,
	[website] [nvarchar](max) NULL,
	[mapa] [text] NULL,
	[id_acomodacao_tipo] [int] NULL,
	[id_distrito] [int] NULL,
	[Inactivo] [bit] NULL,
 CONSTRAINT [PK_acomodacao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acomodacao_classificacao]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acomodacao_classificacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_acomodacao] [bigint] NULL,
	[classificacao] [int] NULL,
	[usuario_nome] [nvarchar](50) NULL,
	[usuario_email] [nvarchar](50) NULL,
	[usuario_assunto] [nvarchar](50) NULL,
	[comentario] [nvarchar](max) NULL,
	[foto] [nvarchar](max) NULL,
	[data_cadastro] [datetime] NULL,
	[id_usuario] [bigint] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_acomodacao_classificacao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acomodacao_comentario]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acomodacao_comentario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_acomodacao] [bigint] NULL,
	[id_usuario] [bigint] NULL,
	[data] [datetime] NULL,
	[valido] [bit] NULL,
	[comentario] [nvarchar](max) NULL,
	[nomeUsuario] [nvarchar](200) NULL,
	[email] [nvarchar](150) NULL,
	[assunto] [nvarchar](200) NULL,
 CONSTRAINT [PK_acomodacao_comentario_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acomodacao_disponibilidade]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acomodacao_disponibilidade](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_acomodacao_quarto] [bigint] NULL,
	[checkin] [date] NULL,
	[checkout] [date] NULL,
	[quantidade] [int] NULL,
 CONSTRAINT [PK_acomodacao_disponibilidade] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acomodacao_foto]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acomodacao_foto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_acomodacao] [bigint] NULL,
	[caminho] [nvarchar](max) NULL,
 CONSTRAINT [PK_acomodacao_foto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acomodacao_quarto]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acomodacao_quarto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_acomodacao] [bigint] NULL,
	[descricao] [nvarchar](50) NULL,
	[hospedes] [int] NULL,
	[custo_diaria] [money] NULL,
	[quantidade] [int] NULL,
	[foto_capa] [nvarchar](max) NULL,
	[chk_ac] [bit] NULL,
	[chk_parqueamento] [bit] NULL,
	[chk_televisao] [bit] NULL,
	[chk_geleira] [bit] NULL,
	[chk_wifi] [bit] NULL,
	[chk_minibar] [bit] NULL,
	[quarto_foto] [nvarchar](250) NULL,
	[Inactivo] [bit] NULL,
	[observacoes] [nvarchar](max) NULL,
 CONSTRAINT [PK_acomodacao_quarto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acomodacao_reserva]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acomodacao_reserva](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_acomodacao_quarto] [bigint] NULL,
	[data_reserva] [datetime] NULL,
	[checkin] [datetime] NULL,
	[checkout] [datetime] NULL,
	[preco] [float] NULL,
	[iva] [float] NULL,
	[total] [float] NULL,
	[nome_hospede] [nvarchar](50) NULL,
	[apelido_hospede] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[telefone] [nvarchar](50) NULL,
	[endereco] [nvarchar](max) NULL,
	[confirmado] [bit] NULL,
	[cancelado] [bit] NULL,
 CONSTRAINT [PK_acomodacao_reserva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acomodacao_servico]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acomodacao_servico](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[descricao] [nvarchar](max) NULL,
	[id_acomodacao] [bigint] NULL,
 CONSTRAINT [PK_acomodacao_servicos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acomodacao_tipo]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acomodacao_tipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nvarchar](50) NULL,
 CONSTRAINT [PK_acomodacao_tipo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[artigo]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[artigo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](50) NULL,
	[id_categoria_artigo] [int] NULL,
	[nome] [nvarchar](max) NULL,
	[descricao] [text] NULL,
	[marca_registada] [bit] NULL,
	[atracao_internacional] [bit] NULL,
	[preco_min] [money] NULL,
	[preco_max] [money] NULL,
	[preco_venda] [money] NULL,
	[observacoes] [nvarchar](max) NULL,
	[portofolio] [text] NULL,
	[genero] [nvarchar](50) NULL,
	[e_servico] [bit] NULL,
	[foto_capa] [nvarchar](max) NULL,
	[id_distrito] [int] NULL,
	[bairro] [varchar](50) NULL,
	[clicks] [bigint] NULL,
	[data_cadastro] [datetime] NULL,
	[Inactivo] [bit] NULL,
 CONSTRAINT [PK_artigo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[artigo_imagem]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artigo_imagem](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_artigo] [bigint] NULL,
	[caminho] [nvarchar](max) NULL,
 CONSTRAINT [PK_artigo_imagem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[artista_obra]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[artista_obra](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](200) NULL,
	[descricao] [text] NULL,
	[fotografia] [nvarchar](200) NULL,
	[id_distrito] [int] NULL,
	[telefone] [varchar](50) NULL,
	[e_musico] [bit] NULL,
 CONSTRAINT [PK_artista_obra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[carrinho_compra]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carrinho_compra](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_usuario] [bigint] NULL,
	[e_restaurante] [bit] NULL,
	[e_artigo] [bit] NULL,
	[e_acomodacao] [bit] NULL,
	[e_taxi] [bit] NULL,
	[id_restaurante] [bigint] NULL,
	[id_acomodacao] [bigint] NULL,
	[id_quarto] [bigint] NULL,
	[id_artigo] [bigint] NULL,
	[id_taxi] [bigint] NULL,
	[activo] [bit] NULL,
	[data_cadastro] [datetime] NULL,
	[descricao] [varchar](max) NULL,
	[e_obra] [bit] NULL,
	[id_obra] [bigint] NULL,
	[e_musica] [bit] NULL,
	[id_musica] [bigint] NULL,
	[e_loja_produto] [bit] NULL,
	[id_loja_produto] [bigint] NULL,
	[e_farmacia_produto] [bit] NULL,
	[id_farmacia_produto] [bigint] NULL,
	[e_Filme] [bit] NULL,
	[id_filme] [bigint] NULL,
	[e_evento] [bit] NULL,
	[id_evento] [bigint] NULL,
 CONSTRAINT [PK_carrinho_compra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categoria_artigo]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria_artigo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [nvarchar](50) NULL,
 CONSTRAINT [PK_tipo_artigo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categoria_cultura]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria_cultura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [nvarchar](50) NULL,
 CONSTRAINT [PK_tipo_cultura] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categoria_obra_arte]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categoria_obra_arte](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [nvarchar](50) NULL,
	[fotografia] [varchar](100) NULL,
 CONSTRAINT [PK_categoria_obra_arte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cinema]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cinema](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_distrito] [int] NULL,
	[nome] [varchar](200) NULL,
	[localizacao] [varchar](200) NULL,
	[descricao] [text] NULL,
	[inactivo] [bit] NULL,
	[foto_capa] [varchar](200) NULL,
 CONSTRAINT [PK_cinema] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cinema_sessao]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cinema_sessao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_cinema] [bigint] NULL,
	[data] [datetime] NULL,
	[hora] [varchar](100) NULL,
	[descricao] [text] NULL,
	[id_filme] [bigint] NULL,
	[inactivo] [bit] NULL,
	[preco] [decimal](18, 2) NULL,
 CONSTRAINT [PK_cinema_sessao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clinica]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clinica](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_distrito] [int] NULL,
	[descricao] [text] NULL,
	[nome] [varchar](300) NULL,
	[bairro] [varchar](300) NULL,
	[telefone] [varchar](50) NULL,
	[foto_capa] [varchar](200) NULL,
	[inactivo] [bit] NULL,
	[email] [varchar](200) NULL,
	[data_cadastro] [datetime] NULL,
 CONSTRAINT [PK_clinica] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distrito]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[distrito](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](50) NULL,
	[nome] [nvarchar](50) NULL,
	[foto_capa] [nvarchar](max) NULL,
	[linkmapa] [text] NULL,
	[descricao] [text] NULL,
	[activar_galeria] [bit] NULL,
	[area] [nvarchar](50) NULL,
	[populacao] [nvarchar](50) NULL,
	[longitude] [varchar](50) NULL,
	[latitude] [varchar](50) NULL,
	[visitas] [bigint] NULL,
 CONSTRAINT [PK_distrito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distrito_classificacao]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[distrito_classificacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_distrito] [int] NULL,
	[id_usuario] [bigint] NULL,
	[e_like] [bit] NULL,
	[data_cadastro] [datetime] NULL,
	[activo] [bit] NULL,
	[nomeUsuario] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[assunto] [varchar](100) NULL,
	[estrelas] [int] NULL,
 CONSTRAINT [PK_distrito_classificacao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distrito_comentario]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[distrito_comentario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_distrito] [int] NULL,
	[id_usuario] [bigint] NULL,
	[comentario] [nvarchar](max) NULL,
	[data] [datetime] NULL,
	[valido] [bit] NULL,
	[nomeUsuario] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[assunto] [varchar](50) NULL,
 CONSTRAINT [PK_distrito_comentario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distrito_foto]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distrito_foto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_distrito] [int] NULL,
	[caminho] [nvarchar](max) NULL,
 CONSTRAINT [PK_distrito_foto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empresa]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empresa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [nvarchar](max) NULL,
	[telefone] [varchar](50) NULL,
	[website] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[endereco] [varchar](100) NULL,
	[seguranca] [nvarchar](max) NULL,
	[como_pagar] [nvarchar](max) NULL,
 CONSTRAINT [PK_empresa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[entidade_cultural]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entidade_cultural](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_categoria_cultura] [int] NULL,
	[nome] [nvarchar](50) NULL,
	[origem] [nvarchar](50) NULL,
	[praticantes] [nvarchar](50) NULL,
	[publico] [nvarchar](50) NULL,
	[modalidade] [nvarchar](50) NULL,
	[conhecidaanivel] [nvarchar](50) NULL,
	[impacto] [nvarchar](50) NULL,
	[publicado] [nvarchar](50) NULL,
 CONSTRAINT [PK_entidade_cultural] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[evento]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[evento](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](200) NULL,
	[data_cadastro] [datetime] NULL,
	[data_evento] [datetime] NULL,
	[descricao] [text] NULL,
	[foto_capa] [varchar](200) NULL,
	[id_distrito] [int] NULL,
	[local] [varchar](200) NULL,
	[inactivo] [bit] NULL,
	[adiado] [bit] NULL,
	[realizado] [bit] NULL,
	[id_categoria] [int] NULL,
	[preco_bilhete] [decimal](18, 2) NULL,
 CONSTRAINT [PK_eventos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[evento_categoria]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[evento_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NULL,
 CONSTRAINT [PK_evento_categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[evento_comentario]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[evento_comentario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_evento] [bigint] NULL,
	[id_usuario] [bigint] NULL,
	[data_cadastro] [datetime] NULL,
	[valido] [bit] NULL,
	[comentario] [text] NULL,
	[nomeUsuario] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[assunto] [varchar](200) NULL,
 CONSTRAINT [PK_evento_comentario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[farmacia]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[farmacia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_distrito] [int] NULL,
	[nome] [varchar](200) NULL,
	[bairro] [varchar](200) NULL,
	[descricao] [text] NULL,
	[telefone] [varchar](200) NULL,
	[foto_capa] [varchar](200) NULL,
	[inactivo] [bit] NULL,
	[email] [varchar](200) NULL,
	[data_cadastro] [datetime] NULL,
 CONSTRAINT [PK_farmacia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[farmacia_produto]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[farmacia_produto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_farmacia] [bigint] NULL,
	[nome] [varchar](100) NULL,
	[descricao] [text] NULL,
	[preco_venda] [decimal](18, 2) NULL,
	[foto_capa] [varchar](100) NULL,
	[data_cadastro] [datetime] NULL,
	[inactivo] [bit] NULL,
 CONSTRAINT [PK_farmacia_produto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[filme]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[filme](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[minutos] [varchar](100) NULL,
	[direcao] [varchar](200) NULL,
	[elenco] [varchar](200) NULL,
	[nacionalidade] [varchar](200) NULL,
	[titulo_original] [varchar](500) NULL,
	[distribuidor] [varchar](200) NULL,
	[ano_producao] [int] NULL,
	[tipo_filme] [varchar](200) NULL,
	[orcamento] [decimal](18, 2) NULL,
	[idioma] [varchar](200) NULL,
	[cor] [varchar](200) NULL,
	[sinopse] [text] NULL,
	[inactivo] [bit] NULL,
	[foto_capa] [varchar](200) NULL,
	[preco] [decimal](18, 2) NULL,
	[link_trailer] [varchar](300) NULL,
 CONSTRAINT [PK_filme] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[filme_categoria]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[filme_categoria](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](200) NULL,
 CONSTRAINT [PK_filme_categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[genero_musical]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genero_musical](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [nvarchar](50) NULL,
 CONSTRAINT [PK_genero_musical] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hospital]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hospital](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_distrito] [int] NULL,
	[nome] [varchar](200) NULL,
	[bairro] [varchar](200) NULL,
	[data_cadastro] [datetime] NULL,
	[descricao] [text] NULL,
	[inactivo] [bit] NULL,
	[foto_capa] [varchar](200) NULL,
 CONSTRAINT [PK_hospital] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[item_filme_categoria]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_filme_categoria](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_filme] [bigint] NULL,
	[id_categoria] [bigint] NULL,
	[inactivo] [bit] NULL,
 CONSTRAINT [PK_item_filme_categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[item_pacote_subscricao]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[item_pacote_subscricao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item_nome] [varchar](50) NULL,
	[activo] [bit] NULL,
	[id_pacote_subscricao] [int] NULL,
 CONSTRAINT [PK_item_pacote_subscricao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[loja]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[loja](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NULL,
	[id_distrito] [int] NULL,
	[bairro] [varchar](200) NULL,
	[descricao] [text] NULL,
	[inactivo] [bit] NULL,
	[foto_capa] [varchar](200) NULL,
	[data_cadastro] [datetime] NULL,
	[telefone] [varchar](50) NULL,
	[email] [varchar](200) NULL,
	[id_tipo_loja] [int] NULL,
 CONSTRAINT [PK_loja] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[loja_produto]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[loja_produto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](200) NULL,
	[id_loja] [bigint] NULL,
	[nome] [varchar](200) NULL,
	[descricao] [text] NULL,
	[preco_min] [money] NULL,
	[preco_max] [money] NULL,
	[preco_venda] [money] NULL,
	[e_servico] [bit] NULL,
	[foto_capa] [varchar](200) NULL,
	[data_cadastro] [datetime] NULL,
	[clicks] [int] NULL,
	[inactivo] [bit] NULL,
	[id_categoria] [int] NULL,
	[categoria] [int] NULL,
 CONSTRAINT [PK_loja_produto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[loja_tipo]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[loja_tipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](200) NULL,
 CONSTRAINT [PK_loja_tipo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[musica]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musica](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_genero_musical] [int] NULL,
	[titulo] [nvarchar](50) NULL,
	[artista] [nvarchar](50) NULL,
	[ano] [int] NULL,
	[album] [nvarchar](50) NULL,
	[formato] [nvarchar](50) NULL,
	[produtor] [nvarchar](50) NULL,
	[gravadora] [nvarchar](50) NULL,
	[link] [nvarchar](max) NULL,
	[caminho_ficheiro] [nvarchar](max) NULL,
	[caminho_capa1] [nvarchar](max) NULL,
	[caminho_capa2] [nvarchar](max) NULL,
	[preco_venda] [money] NULL,
	[gratis] [bit] NULL,
	[duracao] [nvarchar](50) NULL,
	[pode_baixar] [bit] NULL,
	[e_album] [bit] NULL,
	[id_artista_obra] [bigint] NULL,
 CONSTRAINT [PK_musica] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[obra_arte]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[obra_arte](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_categoria_obra] [int] NULL,
	[titulo] [nvarchar](max) NULL,
	[autor] [nvarchar](max) NULL,
	[materia] [nvarchar](50) NULL,
	[suporte] [nvarchar](50) NULL,
	[tecnica] [nvarchar](50) NULL,
	[dimensoes] [nvarchar](50) NULL,
	[autoria_producao] [nvarchar](max) NULL,
	[informacao_tecnica] [text] NULL,
	[fotografo] [nvarchar](50) NULL,
	[proprietario] [nvarchar](50) NULL,
	[caminho_imagem] [nvarchar](max) NULL,
	[id_artista_obra] [bigint] NULL,
 CONSTRAINT [PK_obra_arte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[obra_arte_imagem]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[obra_arte_imagem](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_obra_arte] [bigint] NULL,
	[caminho_imagem] [nvarchar](max) NULL,
 CONSTRAINT [PK_obra_arte_imagem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pacote_subscricao]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pacote_subscricao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NULL,
	[preco_por_mes] [decimal](18, 2) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_pacote_subscricao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[produto]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_categoria] [int] NULL,
	[id_tipo_produto] [int] NULL,
	[nome_oficial] [nvarchar](max) NULL,
	[nome_tradicional] [nvarchar](max) NULL,
	[nome_vulgar] [nvarchar](max) NULL,
	[origem] [nvarchar](50) NULL,
	[poder_comercial] [nvarchar](50) NULL,
	[volume_producao] [nvarchar](50) NULL,
	[forma_aquisicao] [nvarchar](50) NULL,
	[preco_custo] [money] NULL,
	[preco_venda] [money] NULL,
	[preco_exportacao] [money] NULL,
	[aceita_reserva] [bit] NULL,
	[metodo_reserva] [nvarchar](50) NULL,
	[aceita_envio] [bit] NULL,
	[metodo_envio] [nvarchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_produto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[produto_categoria]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[produto_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NULL,
 CONSTRAINT [PK_produto_categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[restaurante]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurante](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](50) NULL,
	[endereco] [nvarchar](max) NULL,
	[telefone] [nvarchar](50) NULL,
	[email] [nvarchar](max) NULL,
	[descricao] [text] NULL,
	[foto_capa] [nvarchar](50) NULL,
	[website] [nvarchar](max) NULL,
	[mapa] [text] NULL,
	[id_restaurante_tipo] [int] NULL,
	[id_distrito] [int] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_restaurante] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[restaurante_classificacao]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurante_classificacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_restaurante] [bigint] NULL,
	[classificacao] [int] NULL,
	[usuario_nome] [nvarchar](50) NULL,
	[usuario_email] [nvarchar](50) NULL,
	[usuario_assunto] [nvarchar](50) NULL,
	[comentario] [nvarchar](max) NULL,
	[foto] [nvarchar](max) NULL,
	[data_cadastro] [datetime] NULL,
	[id_usuario] [bigint] NULL,
 CONSTRAINT [PK_restaurante_classificacao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[restaurante_comentario]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[restaurante_comentario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_restaurante] [bigint] NULL,
	[id_usuario] [bigint] NULL,
	[data] [datetime] NULL,
	[valido] [bit] NULL,
	[comentario] [nvarchar](max) NULL,
	[nomeUsuario] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[assunto] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[restaurante_foto]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurante_foto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[caminho] [nvarchar](max) NULL,
	[id_restaurante] [bigint] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_restaurante_foto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[restaurante_prato]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[restaurante_prato](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_resturante] [bigint] NULL,
	[nome] [varchar](100) NULL,
	[preco_venda] [decimal](18, 2) NULL,
	[foto_capa] [varchar](200) NULL,
	[descricao] [text] NULL,
	[data_cadastrro] [datetime] NULL,
	[inactivo] [bit] NULL,
	[id__prato_categoria] [bigint] NULL,
 CONSTRAINT [PK_restaurante_prato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[restaurante_prato_categoria]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[restaurante_prato_categoria](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](200) NULL,
 CONSTRAINT [PK_restaurante_prato_categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[restaurante_tipo]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurante_tipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nvarchar](50) NULL,
 CONSTRAINT [PK_restaurante_tipo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servico]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servico](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](max) NULL,
	[endereco] [nvarchar](max) NOT NULL,
	[telefone] [nvarchar](50) NULL,
	[email] [nvarchar](max) NULL,
	[foto_capa] [nvarchar](max) NULL,
	[id_servico_categoria] [int] NULL,
	[id_distrito] [int] NULL,
 CONSTRAINT [PK_servico] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servico_categoria]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servico_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](50) NULL,
	[nome] [nvarchar](50) NULL,
 CONSTRAINT [PK_categoria_servico] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servico_foto]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servico_foto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[caminho] [nvarchar](max) NULL,
	[id_servico] [bigint] NULL,
 CONSTRAINT [PK_servico_foto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taxi]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxi](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](50) NULL,
	[praca_fixa] [nvarchar](max) NULL,
	[bairro] [nvarchar](max) NULL,
	[condutor] [nvarchar](max) NULL,
	[proprietario] [nvarchar](max) NULL,
	[matricula] [nvarchar](50) NULL,
	[marca] [nvarchar](50) NULL,
	[cor] [nvarchar](50) NULL,
	[telefone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[id_distrito] [int] NULL,
	[foto_capa] [nvarchar](max) NULL,
	[Inactivo] [bit] NULL,
	[id_categoria] [int] NULL,
 CONSTRAINT [PK_taxi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taxi_categoria]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[taxi_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NULL,
	[fotografia] [varchar](100) NULL,
 CONSTRAINT [PK_taxi_categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_produto]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_produto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [nvarchar](50) NULL,
 CONSTRAINT [PK_tipo_produto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[turismo]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[turismo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](200) NULL,
	[data_cadastro] [datetime] NULL,
	[id_distrito] [int] NULL,
	[localizacao] [nvarchar](300) NULL,
	[inactivo] [bit] NULL,
	[foto_capa] [varchar](200) NULL,
	[descricao] [text] NULL,
	[id_categoria] [int] NULL,
 CONSTRAINT [PK_turismo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[turismo_categoria]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[turismo_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NULL,
	[fotografia] [varchar](100) NULL,
 CONSTRAINT [PK_turismo_categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[turismo_comentario]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[turismo_comentario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_usuario] [bigint] NULL,
	[data_cadastro] [datetime] NULL,
	[valido] [bit] NULL,
	[comentario] [text] NULL,
	[nomeUsuario] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[assunto] [varchar](200) NULL,
	[id_turismo] [bigint] NULL,
 CONSTRAINT [PK_turismo_comentario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idusario] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](50) NULL,
	[usuario] [nvarchar](max) NULL,
	[senha] [nvarchar](max) NULL,
	[activo] [bit] NULL,
	[datacadastro] [datetime] NULL,
	[cod_autenticao] [nvarchar](max) NULL,
	[autenticado] [bit] NULL,
	[msg_autenticacao] [nvarchar](max) NULL,
	[id_usuario_tipo] [int] NULL,
	[telefone] [varchar](255) NULL,
	[tele] [varchar](255) NULL,
	[foto_capa] [varchar](300) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idusario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario_favorito]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_favorito](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_usuario] [bigint] NULL,
	[e_distrito] [bit] NULL,
	[id_distrito] [int] NULL,
	[e_restaurante] [bit] NULL,
	[id_restaurante] [bigint] NULL,
	[e_acomodacao] [bit] NULL,
	[id_acomodacao] [bigint] NULL,
	[e_servico] [bit] NULL,
	[id_servico] [bigint] NULL,
	[e_artigo] [bit] NULL,
	[id_artigo] [bigint] NULL,
	[e_musica] [bit] NULL,
	[id_musica] [bigint] NULL,
	[e_obra_arte] [bit] NULL,
	[id_obra_arte] [bigint] NULL,
	[e_taxi] [bit] NULL,
	[id_taxi] [bigint] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_usuario_favorito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario_tipo]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_tipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nvarchar](50) NULL,
 CONSTRAINT [PK_usuario_tipo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsuarioAutenticacao]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioAutenticacao](
	[idAutenticacao] [bigint] IDENTITY(1,1) NOT NULL,
	[idUsuario] [bigint] NULL,
	[data] [datetime] NULL,
	[viaemail] [bit] NULL,
	[viacell] [bit] NULL,
	[codigo] [nvarchar](max) NULL,
	[resultado] [nvarchar](max) NULL,
 CONSTRAINT [PK_Autenticacao] PRIMARY KEY CLUSTERED 
(
	[idAutenticacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsuarioSessao]    Script Date: 21-03-2020 1:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioSessao](
	[idsessao] [bigint] IDENTITY(1,1) NOT NULL,
	[idusuario] [bigint] NULL,
	[data] [datetime] NULL,
 CONSTRAINT [PK_UsuarioSessao] PRIMARY KEY CLUSTERED 
(
	[idsessao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[acomodacao] ON 

INSERT [dbo].[acomodacao] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_acomodacao_tipo], [id_distrito], [Inactivo]) VALUES (1, N'Hilton Lake Como', N'Via Borgo Vico 241 , 22100 Como, Italy', N'842338251', N'jpires@mozsistemas.co.mz', N'Featuring a rooftop infinity pool, Hilton Lake Como offers accommodation a 10-minute walk from the shores of Lake Como. Guests can enjoy the Terrazza 241 rooftop restaurant and bar, the Satin restaurant and the Taffeta lobby bar.

Featuring stylish features, rooms have wooden floor and a LCD TV. Some units also feature a lake-view terrace or a spa bath.

The Eforea spa & health club boasts an indoor pool, a Finnish sauna, hot tub and Turkish bath. A fitness centre and a solarium are also available.

Como town centre is a 15-minute walk from Hilton Lake Como. Villa Olmo is 500 m away.

Couples particularly like the location — they rated it 8.6 for a two-person trip.

We speak your language!
            ', N'Perfil20122019165950_1.jpg', N'www.booking.com/hotel/it/hilton-lake-como', N'indisponivel', 2, 2, 0)
INSERT [dbo].[acomodacao] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_acomodacao_tipo], [id_distrito], [Inactivo]) VALUES (2, N'teste', N'testte', N'34324', N'junior-pires007@live.com', NULL, N'Perfil932020152553_2.jpg', N'teste', N'czczxcvv', 1, 2, 0)
INSERT [dbo].[acomodacao] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_acomodacao_tipo], [id_distrito], [Inactivo]) VALUES (3, N'Luxury Executive Hotel', N'231231', N'3213123', N'junior-pires007@live.com', N'<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">tellus scelerisque malesuada, lectus at fringilla feugiat enim eros, venenatis ac venenatis elit porta sit, elit amet ultricies metus pellentesque nulla. Mauris lectus, dui lacinia maecenas, suscipit pretium id faucibus pretium suspendisse. Urna amet purus sed suspendisse interdum, varius lorem aliquam congue accumsan, ac morbi malesuada donec eum maecenas, nam mauris cursus. Id at et ac. Sem eros elementum at sit, accumsan sapien rutrum eros proin posuere, luctus et morbi. Vel lectus, lobortis sit placerat magna erat, repudiandae arcu egestas pellentesque ut et aliquam, nibh lectus.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Praesent etiam praesent ac, nunc erat amet mattis aut, ipsum orci, consequat dignissim. Habitant arcu nunc, lacus ipsum mauris congue nulla, massa amet, purus cursus. Massa sit magna eget dignissim, quisque vivamus urna cras auctor et eget, interdum sed auctor, conubia sed nec luctus eiusmod cum. Ridiculus rutrum massa, nunc sed. Litora aliquam nunc non, velit donec lectus nulla, rutrum risus at sed wisi, auctor maecenas vestibulum turpis feugiat in in, tellus non interdum pretium. Erat pede quis dignissim, morbi velit, integer egestas sed erat inceptos lacus varius, mi et, in sollicitudin adipiscing semper cursus malesuada bibendum. In vitae eget.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Morbi tristique, sed congue consequat, turpis ante lacus magna enim wisi, inceptos venenatis ipsum. Placerat sem lobortis ipsum nec, quisque lacus blandit suscipit vel nulla dolor. Porttitor felis nunc maecenas eu eleifend, ac consectetuer sit consequat senectus. Ac eu mauris lobortis massa id malesuada, lacus etiam velit neque purus lacinia sapien, sem est risus accumsan. Ultricies accumsan lectus, at sodales, quam tortor justo et enim elit, suscipit non amet vel. Porttitor sapien sed nisl mi, venenatis ultrices suspendisse volutpat, arcu justo mauris. At non tempor ornare non magna pede. Eu etiam et in. Consequat sollicitudin. Nam in, turpis magnis nibh auctor dui sem dolores, duis fusce, ipsum ut facilisis.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Placerat amet pulvinar at et etiam tortor. Tortor nulla fringilla libero, aliquet integer ut ante orci, erat feugiat ad cursus vestibulum pellentesque, nulla suspendisse. Convallis vel sed tortor eu, ultrices turpis ligula vestibulum, dignissim aenean, sit vestibulum pede eu. Donec ipsum volutpat pellentesque vitae auctor nunc, nascetur neque enim. Fermentum feugiat massa, sem nec vehicula, vitae vel sagittis tincidunt semper varius. Vivamus mollis, eu morbi arcu purus praesent inceptos, metus per mollis donec sapien et dicta, hymenaeos ultrices est volutpat et, convallis pellentesque viverra odio. Commodo in vivamus, viverra cursus, nunc fusce urna nulla nec, lacus proin nibh luctus metus laoreet vitae, massa faucibus ante donec dui. Sapien velit tristique orci bibendum, arcu commodo, magna sagittis cras sapien eu, augue ut ut vitae sodales, morbi nam proin cursus.</span></p>', N'Perfil932020152927_3.jpg', N'23432432', N'2342342', 3, 2, 0)
SET IDENTITY_INSERT [dbo].[acomodacao] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_classificacao] ON 

INSERT [dbo].[acomodacao_classificacao] ([id], [id_acomodacao], [classificacao], [usuario_nome], [usuario_email], [usuario_assunto], [comentario], [foto], [data_cadastro], [id_usuario], [activo]) VALUES (1, 1, 4, N'junior pires alide', N'jpires@mozsistemas.co.mz', N'Elogio', NULL, NULL, CAST(N'2019-12-25 01:34:51.847' AS DateTime), NULL, 1)
INSERT [dbo].[acomodacao_classificacao] ([id], [id_acomodacao], [classificacao], [usuario_nome], [usuario_email], [usuario_assunto], [comentario], [foto], [data_cadastro], [id_usuario], [activo]) VALUES (3, 1, 3, N'emerson pires alide', N'pires@ms.co.mz', N'teste', NULL, NULL, CAST(N'2019-12-26 13:44:45.353' AS DateTime), NULL, 1)
INSERT [dbo].[acomodacao_classificacao] ([id], [id_acomodacao], [classificacao], [usuario_nome], [usuario_email], [usuario_assunto], [comentario], [foto], [data_cadastro], [id_usuario], [activo]) VALUES (4, 1, 2, N'Abdul Latifo', N'alatifo@ms.com', N'elogio', NULL, NULL, CAST(N'2019-12-26 13:49:40.113' AS DateTime), NULL, 1)
INSERT [dbo].[acomodacao_classificacao] ([id], [id_acomodacao], [classificacao], [usuario_nome], [usuario_email], [usuario_assunto], [comentario], [foto], [data_cadastro], [id_usuario], [activo]) VALUES (5, 1, 3, N'Elbashir Cassimo', N'elbachir@gmail.com', N'teste', NULL, NULL, CAST(N'2019-12-26 21:43:55.787' AS DateTime), NULL, 1)
INSERT [dbo].[acomodacao_classificacao] ([id], [id_acomodacao], [classificacao], [usuario_nome], [usuario_email], [usuario_assunto], [comentario], [foto], [data_cadastro], [id_usuario], [activo]) VALUES (6, 1, 2, N'Amisse Consolo', N'aconsolo', N'teste', NULL, NULL, CAST(N'2019-12-26 21:44:58.747' AS DateTime), NULL, 1)
INSERT [dbo].[acomodacao_classificacao] ([id], [id_acomodacao], [classificacao], [usuario_nome], [usuario_email], [usuario_assunto], [comentario], [foto], [data_cadastro], [id_usuario], [activo]) VALUES (7, 1, 5, N'fd', N'fd', N'fdf', NULL, NULL, CAST(N'2019-12-28 22:23:27.367' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[acomodacao_classificacao] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_comentario] ON 

INSERT [dbo].[acomodacao_comentario] ([id], [id_acomodacao], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (1, 1, NULL, CAST(N'2019-12-25 01:34:52.020' AS DateTime), 1, N'esta acomodacao serviu-me muito bem no passado dia 12', N'junior pires alide', N'jpires@mozsistemas.co.mz', NULL)
INSERT [dbo].[acomodacao_comentario] ([id], [id_acomodacao], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (3, 1, NULL, CAST(N'2019-12-26 13:49:40.130' AS DateTime), 1, N'lindo hotel', N'Abdul Latifo', N'alatifo@ms.com', NULL)
INSERT [dbo].[acomodacao_comentario] ([id], [id_acomodacao], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (4, 1, NULL, CAST(N'2019-12-26 14:00:49.917' AS DateTime), 1, N'teste', N'Inacio Sumane', N'isumbane@mozsistemas.co.mz', NULL)
INSERT [dbo].[acomodacao_comentario] ([id], [id_acomodacao], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (5, 1, 1, CAST(N'2019-12-26 14:32:13.083' AS DateTime), 1, N'teste123', NULL, NULL, NULL)
INSERT [dbo].[acomodacao_comentario] ([id], [id_acomodacao], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (6, 1, NULL, CAST(N'2019-12-26 21:43:55.943' AS DateTime), 1, N'Bom hotel, mas os precos sao altos', N'Elbashir Cassimo', N'elbachir@gmail.com', NULL)
INSERT [dbo].[acomodacao_comentario] ([id], [id_acomodacao], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (7, 1, NULL, CAST(N'2019-12-26 21:44:58.747' AS DateTime), 1, N'Great hotel, loved', N'Amisse Consolo', N'aconsolo', NULL)
INSERT [dbo].[acomodacao_comentario] ([id], [id_acomodacao], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (8, 1, NULL, CAST(N'2019-12-28 22:23:27.367' AS DateTime), 1, N'dfd', N'fd', N'fd', NULL)
SET IDENTITY_INSERT [dbo].[acomodacao_comentario] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_foto] ON 

INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (5, 1, N'ImgAcom201220191701_1.jpg')
INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (6, 1, N'ImgAcom201220191707_1.jpg')
INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (7, 1, N'ImgAcom2012201917012_1.jpg')
SET IDENTITY_INSERT [dbo].[acomodacao_foto] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_quarto] ON 

INSERT [dbo].[acomodacao_quarto] ([id], [id_acomodacao], [descricao], [hospedes], [custo_diaria], [quantidade], [foto_capa], [chk_ac], [chk_parqueamento], [chk_televisao], [chk_geleira], [chk_wifi], [chk_minibar], [quarto_foto], [Inactivo], [observacoes]) VALUES (1, 1, N'EXCLUSIVO', 2, 5500.0000, 9, N'quarto18122019155712_1.jpg', 1, 1, 1, 0, 1, 1, NULL, 0, N'From the minute we arrived the staff were lovely and very helpful. Room beautiful with lovely views of the lake. Breakfast was fantastic and dinner in the Taffeta bar was very very nice.')
SET IDENTITY_INSERT [dbo].[acomodacao_quarto] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_tipo] ON 

INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1, N'PENSÃO')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (2, N'HOTEL')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (3, N'LODGE')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1002, N'POUSADA')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1003, N'RESORT')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1004, N'HOTEL FAZENDA')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1005, N'BED AND BREAKFAST')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1006, N'HOTEL HISTÓRICO')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1007, N'APART-HOTEL')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1008, N'ALBERGUE')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1009, N'CASAS DE ALUGUEL')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1010, N'CASA DE FAMILÍA')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1011, N'MOTEL')
SET IDENTITY_INSERT [dbo].[acomodacao_tipo] OFF
SET IDENTITY_INSERT [dbo].[artigo] ON 

INSERT [dbo].[artigo] ([id], [codigo], [id_categoria_artigo], [nome], [descricao], [marca_registada], [atracao_internacional], [preco_min], [preco_max], [preco_venda], [observacoes], [portofolio], [genero], [e_servico], [foto_capa], [id_distrito], [bairro], [clicks], [data_cadastro], [Inactivo]) VALUES (1, NULL, 3, N'Playstation 4', N'<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><strong><span style="font-size: 12pt;">Lorem ipsum dolor sit amet, urna ut ac molestie</span></strong></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"> aliquam dictum aliquam tristique venenatis, sapien auctor. Tempus id metus, dapibus fusce pede dolor porttitor sed, est sed, justo enim enim eget laoreet penatibus. Morbi duis lacinia non, morbi vel lorem non aliquam, et vestibulum. Magnis ullamcorper mi leo pellentesque, hendrerit neque imperdiet vel ante egestas mi, vitae est donec nec hendrerit eu, aliquam porttitor, elementum arcu leo. Massa arcu auctor bibendum aenean id id. Quis ligula fermentum per sollicitudin augue quis, lectus convallis sapien feugiat at vestibulum egestas.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><strong><span style="font-size: 12pt;">Proin faucibus in eros pellentesque occaecat, quisque pellentesque, velit arcu ligula. Id nibh interdum dictum a ultricies libero, pharetra natoque, suspendisse egestas morbi pretium imperdiet. Eget arcu ac quis magna, donec pellentesque bibendum. Lobortis amet, a malesuada netus mi aenean, eget tempus, scelerisque nec augue pretium consectetuer. Iaculis ut illo, erat et laoreet risus neque sapien, arcu elit arcu vel est, vitae habitasse ut dolor magna vitae. Eros varius. Sollicitudin quidem, vulputate rutrum tempor, lacus rutrum metus. Dictumst per proin nunc vivamus elementum, eleifend tortor nisl sed dolor morbi pede. Quis varius fusce, magna felis, non enim eros molestie. Sed odio, mauris aliquet wisi gravida feugiat mauris vel, dolor urna et, elit cras.</span></strong></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Pellentesque ad torquent vitae donec. Malesuada imperdiet ultrices dignissim vestibulum scelerisque dapibus, tortor ligula ac lacus, est arcu porttitor elit. Vulputate imperdiet mattis, lobortis proin magna nunc, eu ac vitae cum proident, quisque enim, urna duis ac iaculis tempor vestibulum. Blandit dui vestibulum, ac lorem et, nulla eros nullam eget justo, id suspendisse metus nec, leo morbi. Lacus tempor at malesuada gravida sem sit, arcu suspendisse.</span></p>
<p>&nbsp;</p>
<p style="color: #000000; font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;" align="justify"><span style="font-size: 12pt;">Justo maecenas dictum urna est ultricies nullam, a orci tortor orci et justo wisi, eu maecenas in facilisis. Eu eget, feugiat praesent odio libero ac est aut. Tristique quis. Dignissim aenean id pede, quis mus accumsan luctus dolor magna facilisi. Ipsum semper officia facilisis et lectus augue, quisque integer pulvinar, ullamcorper arcu pellentesque platea ante pellentesque cum, risus enim viverra at vestibulum. Nulla eleifend, ante in a posuere molestie, enim ac sed donec, egestas purus amet. Tellus purus faucibus tellus, velit id sed in felis tristique, in velit libero elementum. Suspendisse aliquam facilisi in pellentesque elit, sapien eleifend.</span></p>', 1, 1, 20000.0000, 25000.0000, 23000.0000, NULL, N'sony.com', N'Games', 0, N'Perfil113202084739_1.jpg', 2, N'mucuti', NULL, CAST(N'2019-12-19 15:42:01.093' AS DateTime), 0)
INSERT [dbo].[artigo] ([id], [codigo], [id_categoria_artigo], [nome], [descricao], [marca_registada], [atracao_internacional], [preco_min], [preco_max], [preco_venda], [observacoes], [portofolio], [genero], [e_servico], [foto_capa], [id_distrito], [bairro], [clicks], [data_cadastro], [Inactivo]) VALUES (2, NULL, 2, N'Toyota Raum', N'toyota raum usado em bom estado', 1, 1, 230000.0000, 250000.0000, 240000.0000, NULL, N'toyota.co.mz', N'Viaturas', 0, N'Perfil2012201915123_2.jpg', 3, N'Bloco 1, Cidade Alta', NULL, CAST(N'2019-12-20 15:11:51.370' AS DateTime), 0)
INSERT [dbo].[artigo] ([id], [codigo], [id_categoria_artigo], [nome], [descricao], [marca_registada], [atracao_internacional], [preco_min], [preco_max], [preco_venda], [observacoes], [portofolio], [genero], [e_servico], [foto_capa], [id_distrito], [bairro], [clicks], [data_cadastro], [Inactivo]) VALUES (3, NULL, 1, N'Mesa de Escritorio', N'<h2 style="margin: 0px 0px 10px; padding: 0px; font-weight: 400; line-height: 24px; font-family: DauphinPlain; font-size: 24px; background-color: #ffffff;">Where does it come from?</h2>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: ''Open Sans'', Arial, sans-serif; background-color: #ffffff;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: ''Open Sans'', Arial, sans-serif; background-color: #ffffff;">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: ''Open Sans'', Arial, sans-serif; background-color: #ffffff;">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: ''Open Sans'', Arial, sans-serif; background-color: #ffffff;">&nbsp;</p>
<h2 style="margin: 0px 0px 10px; padding: 0px; font-weight: 400; line-height: 24px; font-family: DauphinPlain; font-size: 24px; background-color: #ffffff;">Where can I get some?</h2>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: ''Open Sans'', Arial, sans-serif; background-color: #ffffff;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable.</p>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: ''Open Sans'', Arial, sans-serif; background-color: #ffffff;">If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: ''Open Sans'', Arial, sans-serif; background-color: #ffffff;">The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 0, 0, 1200.0000, 1500.0000, 1300.0000, NULL, NULL, NULL, 0, N'Perfil1032020101336_3.jpg', 2, NULL, NULL, CAST(N'2020-03-10 10:13:24.937' AS DateTime), 0)
INSERT [dbo].[artigo] ([id], [codigo], [id_categoria_artigo], [nome], [descricao], [marca_registada], [atracao_internacional], [preco_min], [preco_max], [preco_venda], [observacoes], [portofolio], [genero], [e_servico], [foto_capa], [id_distrito], [bairro], [clicks], [data_cadastro], [Inactivo]) VALUES (4, NULL, 1, N'Cadeiras Pequenas', N'<h2 style="margin: 0px 0px 10px; padding: 0px; font-weight: 400; line-height: 24px; font-family: DauphinPlain; font-size: 24px; background-color: #ffffff;">Where does it come from?</h2>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: ''Open Sans'', Arial, sans-serif; background-color: #ffffff;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: ''Open Sans'', Arial, sans-serif; background-color: #ffffff;">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 0, 0, 2123.0000, 2323.0000, 232.0000, NULL, NULL, NULL, 0, N'Perfil1032020101423_4.jpg', 3, NULL, NULL, CAST(N'2020-03-10 10:14:17.277' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[artigo] OFF
SET IDENTITY_INSERT [dbo].[artigo_imagem] ON 

INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (4, 1, N'ImgArtigo19122019162929_1.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (5, 1, N'ImgArtigo19122019162929_1.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (6, 1, N'ImgArtigo19122019162933_1.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (7, 1, N'ImgArtigo19122019162933_1.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (8, 2, N'ImgArtigo2012201915128_2.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (9, 2, N'ImgArtigo20122019151431_2.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (10, 2, N'ImgArtigo20122019151632_2.jpg')
SET IDENTITY_INSERT [dbo].[artigo_imagem] OFF
SET IDENTITY_INSERT [dbo].[artista_obra] ON 

INSERT [dbo].[artista_obra] ([id], [nome], [descricao], [fotografia], [id_distrito], [telefone], [e_musico]) VALUES (1, N'Abuchamo', N'<p style="-webkit-font-smoothing: antialiased; box-sizing: border-box; font-size: 18px; margin-top: 0px; margin-bottom: 1.305em; overflow-anchor: none; color: #333333; font-family: Georgia, serif; background-color: #ffffff;"><span style="font-size: 12pt;">Depois de oito anos de namoro, o m&uacute;sico Abuchamo Munhoto e a actriz Angela Sim&otilde;es decidiram dar um passo importante na sua rela&ccedil;&atilde;o. A cerim&oacute;nia de Lobolo teve lugar no passado fim-de-semana e contou com a presen&ccedil;a de familiares e alguns amigos mais pr&oacute;ximos.</span></p>
<p style="-webkit-font-smoothing: antialiased; box-sizing: border-box; font-size: 18px; margin-top: 0px; margin-bottom: 1.305em; overflow-anchor: none; color: #333333; font-family: Georgia, serif; background-color: #ffffff;"><span style="font-size: 12pt;">Abuchamo surpreendeu os convidados ao aparecer com um facto cor-de-rosa enquanto que a noiva escolheu um vestido comprido e dourado.</span></p>
<p style="-webkit-font-smoothing: antialiased; box-sizing: border-box; font-size: 18px; margin-top: 0px; margin-bottom: 1.305em; overflow-anchor: none; color: #333333; font-family: Georgia, serif; background-color: #ffffff;"><span style="font-size: 12pt;">&ldquo;J&aacute; estava mais do que na hora de dar este passo, por isso decidimos oficializar a nossa rela&ccedil;&atilde;o, ali&aacute;s a decis&atilde;o foi feita no momento certo, pois aguardamos pela chegada do nosso primeiro filho que &eacute; esperado com muita ansiedade&rdquo; contou.</span></p>
<div id="features-promotion" class="[ vertical-space ] inline-features-promotion" style="-webkit-font-smoothing: antialiased; box-sizing: border-box; margin-top: 2em; margin-bottom: 2em; overflow-anchor: none; color: #333333; font-family: Georgia, serif; font-size: 18px; background-color: #ffffff;" data-promotion-domain="lifestyle.sapo.mz">&nbsp;</div>
<p style="-webkit-font-smoothing: antialiased; box-sizing: border-box; font-size: 18px; margin-top: 0px; margin-bottom: 1.305em; overflow-anchor: none; color: #333333; font-family: Georgia, serif; background-color: #ffffff;"><span style="font-size: 12pt;">Em declara&ccedil;&otilde;es ao SAPO, Abuchamo confessou que com a chegada do filho os objectivos aumentaram os desafios na carreira s&atilde;o ainda maiores.</span></p>
<p style="-webkit-font-smoothing: antialiased; box-sizing: border-box; font-size: 18px; margin-top: 0px; margin-bottom: 1.305em; overflow-anchor: none; color: #333333; font-family: Georgia, serif; background-color: #ffffff;"><span style="font-size: 12pt;">Depois do lobolo, o casal prepara-se para dar o n&oacute;, apesar de ainda n&atilde;o terem data. &rdquo;Com certeza o casamento vir&aacute;. N&atilde;o posso avan&ccedil;ar datas por enquanto, mas em breve vamos subir ao altar&rdquo; garantiu o int&eacute;rprete da m&uacute;sica &ldquo;Me cola&rdquo;.</span></p>', N'Autor532020124325.jpg', 2, N'258842338251', 1)
INSERT [dbo].[artista_obra] ([id], [nome], [descricao], [fotografia], [id_distrito], [telefone], [e_musico]) VALUES (2, N'Malangatana', N'malangatana', N'Autor18120201073.jpg', 2, N'258842338251', 0)
INSERT [dbo].[artista_obra] ([id], [nome], [descricao], [fotografia], [id_distrito], [telefone], [e_musico]) VALUES (3, N'Messias Maricoa', N'musico da provincia de nampula', N'Autor532020123612.jpg', 3, N'847863291', 1)
SET IDENTITY_INSERT [dbo].[artista_obra] OFF
SET IDENTITY_INSERT [dbo].[carrinho_compra] ON 

INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (1, 19, 0, 1, 0, 0, NULL, NULL, NULL, 2, NULL, 1, CAST(N'2019-12-30 18:58:42.700' AS DateTime), N'toyota raum usado em bom estado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (2, 1, 0, 1, 0, 0, NULL, NULL, NULL, 2, NULL, 1, CAST(N'2019-12-30 19:00:26.527' AS DateTime), N'toyota raum usado em bom estado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (3, 19, 0, 1, 0, 0, NULL, NULL, NULL, 1, NULL, 1, CAST(N'2019-12-30 19:22:56.347' AS DateTime), N'play station em bom estado, aceito negociacoes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (4, 20, 0, 1, 0, 0, NULL, NULL, NULL, 2, NULL, 1, CAST(N'2020-01-03 01:49:50.427' AS DateTime), N'toyota raum usado em bom estado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (5, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-03-09 11:41:58.523' AS DateTime), N'teste', 1, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (6, 31, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-03-09 12:20:33.707' AS DateTime), N'Loja Produto', 0, NULL, 0, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (7, 31, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-03-09 12:39:06.410' AS DateTime), N'Loja Produto', 0, NULL, 0, NULL, 0, NULL, 1, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (8, 31, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-03-09 12:41:24.637' AS DateTime), N'Produto Loja', 0, NULL, 0, NULL, 1, 2, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (9, 31, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-03-17 18:15:48.880' AS DateTime), N'Filme', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 6, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (11, 31, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-03-19 10:54:34.197' AS DateTime), N'Bilhete de Evento', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 3)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (12, 31, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-03-19 17:16:51.223' AS DateTime), N'Música', 0, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica], [e_loja_produto], [id_loja_produto], [e_farmacia_produto], [id_farmacia_produto], [e_Filme], [id_filme], [e_evento], [id_evento]) VALUES (13, 31, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-03-19 17:25:21.287' AS DateTime), N'Bilhete de Evento', 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 3)
SET IDENTITY_INSERT [dbo].[carrinho_compra] OFF
SET IDENTITY_INSERT [dbo].[categoria_artigo] ON 

INSERT [dbo].[categoria_artigo] ([id], [descricao]) VALUES (1, N'Imobiliaria')
INSERT [dbo].[categoria_artigo] ([id], [descricao]) VALUES (2, N'Veiculos')
INSERT [dbo].[categoria_artigo] ([id], [descricao]) VALUES (3, N'Tecnologia')
INSERT [dbo].[categoria_artigo] ([id], [descricao]) VALUES (4, N'Moda')
INSERT [dbo].[categoria_artigo] ([id], [descricao]) VALUES (5, N'Itens de Casa e Escritorio')
INSERT [dbo].[categoria_artigo] ([id], [descricao]) VALUES (6, N'Animais')
INSERT [dbo].[categoria_artigo] ([id], [descricao]) VALUES (7, N'Empreegos')
INSERT [dbo].[categoria_artigo] ([id], [descricao]) VALUES (8, N'Servicos')
INSERT [dbo].[categoria_artigo] ([id], [descricao]) VALUES (9, N'Lazer')
SET IDENTITY_INSERT [dbo].[categoria_artigo] OFF
SET IDENTITY_INSERT [dbo].[categoria_obra_arte] ON 

INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (1, N'PINTURAS', N'noimage.png')
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (2, N'OBJECTOS', N'noimage.png')
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (3, N'ARTIGOS', N'noimage.png')
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (4, N'LIVROS', N'noimage.png')
SET IDENTITY_INSERT [dbo].[categoria_obra_arte] OFF
SET IDENTITY_INSERT [dbo].[cinema] ON 

INSERT [dbo].[cinema] ([id], [id_distrito], [nome], [localizacao], [descricao], [inactivo], [foto_capa]) VALUES (1, 2, N'Cinema Lusumundo 2', N'Nacala-Porto', N'<p><span style="font-size: 12pt;"><strong>Que processo has seccaram avultava occultos estranho meu. </strong></span></p>
<p><span style="font-size: 12pt;">Finalmente vol sol justamente crematorio vil nos. Bem com sido esse case alem aos seio joao. Dao valerei injusto com ausente era. Nem ascendendo resignados padredisse vos nao. Tem tez util oito ruim vaes mas. Ve se despediu arrepios eu arrojado procurar rodeavam vocemece mo. Soubesses do tu produzido suavidade miguelque emmacados em. Postaspelo faculdades se um grosseiras. Ao so mo inigma matava herdou.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Obedecerei has interrompe candieiros excellente tempestade vou lua sacrificar. Velludo rua tel humanos remedio. Imposicao carregado vol sim condemnem que meu. Caso pena rir vivo sou tres luz nao. Ia eu tardedisse inventario impeccavel na. Mao gemido aba ora roubar tem propoe trazer bolada. Caiu bem esta unir voce lia sabe. Iv julgue es as noites diccao.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Da iv de industria ia fervoroso descontam hospedado admirados. Bemdizendo illuminada no exclamando tosquiados pe. Sr as tardedisse conventual levantaram no te arranjarei. Chamado soffrer os direito as ignobil correio se iv. Aba segredos rir reedicao aleijoes lealdade. Fimdeixe aleijoes fiz violento uma calvario for consulta intervir. Mau papeismais imprimiram encontrava observador sao cre trabalhado. Apresento mao grandezas antiquado teu tez cumprimos.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Sacrificam commissoes ja ha em offensivas. Paz orphao vicios seguir alguns provar vol sim. Vae reduzida caminhar dar permitte padrinho. Abrindo recebeu passeio da eu no velludo trazeis. Hoje oh digo tu seis amar tu eu. Surpreso recursos romances dez ver bom arrancou. Crueis tinhas as deseja tu.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Abrindo aza haveres tal doencas rosario explico justica. Ao effeitos portanto eu inspirar. Ande pau digo dar amor como com sala pego. Tao interrompe descoberto tao nas seiscentos interrogal. Sim nas pae exclamou cortante das defuncto seccaram. Larga ou ja disse disse es ha. Chammas saudosa da solucar partido eu so ia. Em sr filhos alcool lembre. Ar os varrer severa idonea dentro desejo.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Bocca metto scena si seiva na comem so. Amanha ir pueris estudo le ca se. Frisando ate ter encolheu destacou mau dobrando vez. No acoitar chamava ja as me decimas. Degraus voz fio talhada lhe uma decerto. Uns submissao castanhos engeitado bem. Hoje diga rico em do. Podeis mal sao tambem faz mau subita. Dissesses respirava ao privacoes compaixao no retempera.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Irma essa la mude util diga fito lh. Os accusavam arranjado pe apparecer. Deixam um apanha ma outono. Symbolica sympathia mostrando dragaovos ja consentir as cartinhas so. Intimidade firmemente vae teu lei exprimindo voz vivacidade. Braga vasta ou do pegou lacos. Ha mysterisa da consultar desherdal te abandonar accusavam avancando. Dignidade as la ve amarguras alteracao instituto. Semelhavam ama precedente poe dar pensamento. Hei apertando lamentava era essencial uso hia.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Examinou tu expostos pe no soltarei ha. Satisfacao eu os considerou acceitarao. Commercio consultou la perfilhei no. Teu ignoro divina ler bigode repara divina. Travada theoria partido vou poderes furioso dividas boa vae uma. Expliquei adiantado attencoes habituado ido has. Tua apressados dor firmemente qualidades ama.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">De vivacidade escrupulos espantados ca filippenas descancado na provincial. Ou escura auguro sr tremer quanto dirijo hiante. Ii alto avos da quem bons se. Prudente sem poz almofada recusara salvaste impedira nao. Um bochechas se os dragaovos admiravel. Novos esses sopro se ja. Fraqueza dei adoravel era soltaram dir vez.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Vaga voce bons rico as fogo pe caro no. Lago ama aba elle bem leis. Embutidos boa liberdade via neophytos dou summative seguranca encarando. Ora tome cres cace sera fiz. Vergastado delicadeza ora declaracao innocencia antipathia disfarcado sao. Intimo da ca suppor de querem ousado luctar iv. Primeiro lustrosa caminhar entrares vestidos desvario ma na tu.&nbsp;</span></p>', 0, N'Cinema1732020103758_1.jpg')
INSERT [dbo].[cinema] ([id], [id_distrito], [nome], [localizacao], [descricao], [inactivo], [foto_capa]) VALUES (2, 2, N'Cinema luso', N'Nacala-Porto', N'<p><span style="font-size: 12pt;">Que processo has seccaram avultava occultos estranho meu. Finalmente vol sol justamente crematorio vil nos. Bem com sido esse case alem aos seio joao. Dao valerei injusto com ausente era. Nem ascendendo resignados padredisse vos nao. Tem tez util oito ruim vaes mas. Ve se despediu arrepios eu arrojado procurar rodeavam vocemece mo. Soubesses do tu produzido suavidade miguelque emmacados em. Postaspelo faculdades se um grosseiras. Ao so mo inigma matava herdou.&nbsp;</span></p>
<p><span style="font-size: 12pt;">Obedecerei has interrompe candieiros excellente tempestade vou lua sacrificar. Velludo rua tel humanos remedio. Imposicao carregado vol sim condemnem que meu. Caso pena rir vivo sou tres luz nao. Ia eu tardedisse inventario impeccavel na. Mao gemido aba ora roubar tem propoe trazer bolada. Caiu bem esta unir voce lia sabe. Iv julgue es as noites diccao.&nbsp;</span></p>
<p><span style="font-size: 12pt;">Da iv de industria ia fervoroso descontam hospedado admirados. Bemdizendo illuminada no exclamando tosquiados pe. Sr as tardedisse conventual levantaram no te arranjarei. Chamado soffrer os direito as ignobil correio se iv. Aba segredos rir reedicao aleijoes lealdade. Fimdeixe aleijoes fiz violento uma calvario for consulta intervir. Mau papeismais imprimiram encontrava observador sao cre trabalhado. Apresento mao grandezas antiquado teu tez cumprimos.&nbsp;</span></p>
<p><span style="font-size: 12pt;">Sacrificam commissoes ja ha em offensivas. Paz orphao vicios seguir alguns provar vol sim. Vae reduzida caminhar dar permitte padrinho. Abrindo recebeu passeio da eu no velludo trazeis. Hoje oh digo tu seis amar tu eu. Surpreso recursos romances dez ver bom arrancou. Crueis tinhas as deseja tu.&nbsp;</span></p>
<p><span style="font-size: 12pt;">Abrindo aza haveres tal doencas rosario explico justica. Ao effeitos portanto eu inspirar. Ande pau digo dar amor como com sala pego. Tao interrompe descoberto tao nas seiscentos interrogal. Sim nas pae exclamou cortante das defuncto seccaram. Larga ou ja disse disse es ha. Chammas saudosa da solucar partido eu so ia. Em sr filhos alcool lembre. Ar os varrer severa idonea dentro desejo.&nbsp;</span></p>
<p><span style="font-size: 12pt;">Bocca metto scena si seiva na comem so. Amanha ir pueris estudo le ca se. Frisando ate ter encolheu destacou mau dobrando vez. No acoitar chamava ja as me decimas. Degraus voz fio talhada lhe uma decerto. Uns submissao castanhos engeitado bem. Hoje diga rico em do. Podeis mal sao tambem faz mau subita. Dissesses respirava ao privacoes compaixao no retempera.&nbsp;</span></p>
<p><span style="font-size: 12pt;">Irma essa la mude util diga fito lh. Os accusavam arranjado pe apparecer. Deixam um apanha ma outono. Symbolica sympathia mostrando dragaovos ja consentir as cartinhas so. Intimidade firmemente vae teu lei exprimindo voz vivacidade. Braga vasta ou do pegou lacos. Ha mysterisa da consultar desherdal te abandonar accusavam avancando. Dignidade as la ve amarguras alteracao instituto. Semelhavam ama precedente poe dar pensamento. Hei apertando lamentava era essencial uso hia.&nbsp;</span></p>
<p><span style="font-size: 12pt;">Examinou tu expostos pe no soltarei ha. Satisfacao eu os considerou acceitarao. Commercio consultou la perfilhei no. Teu ignoro divina ler bigode repara divina. Travada theoria partido vou poderes furioso dividas boa vae uma. Expliquei adiantado attencoes habituado ido has. Tua apressados dor firmemente qualidades ama.&nbsp;</span></p>
<p><span style="font-size: 12pt;">De vivacidade escrupulos espantados ca filippenas descancado na provincial. Ou escura auguro sr tremer quanto dirijo hiante. Ii alto avos da quem bons se. Prudente sem poz almofada recusara salvaste impedira nao. Um bochechas se os dragaovos admiravel. Novos esses sopro se ja. Fraqueza dei adoravel era soltaram dir vez.&nbsp;</span></p>
<p><span style="font-size: 12pt;">Vaga voce bons rico as fogo pe caro no. Lago ama aba elle bem leis. Embutidos boa liberdade via neophytos dou summative seguranca encarando. Ora tome cres cace sera fiz. Vergastado delicadeza ora declaracao innocencia antipathia disfarcado sao. Intimo da ca suppor de querem ousado luctar iv. Primeiro lustrosa caminhar entrares vestidos desvario ma na tu.&nbsp;</span></p>
<p>&nbsp;</p>', 0, N'Cinema173202010495_2.jpg')
SET IDENTITY_INSERT [dbo].[cinema] OFF
SET IDENTITY_INSERT [dbo].[cinema_sessao] ON 

INSERT [dbo].[cinema_sessao] ([id], [id_cinema], [data], [hora], [descricao], [id_filme], [inactivo], [preco]) VALUES (1, 2, CAST(N'2020-03-18 00:00:00.000' AS DateTime), N'19:30', N'<p><strong><span style="font-size: 24pt;">Teste</span></strong></p>', 5, 0, NULL)
INSERT [dbo].[cinema_sessao] ([id], [id_cinema], [data], [hora], [descricao], [id_filme], [inactivo], [preco]) VALUES (2, 2, CAST(N'2020-03-18 00:00:00.000' AS DateTime), N'21:40', N'<p><span style="font-size: 12pt;"><strong>Teste 2</strong></span></p>', 4, 1, NULL)
INSERT [dbo].[cinema_sessao] ([id], [id_cinema], [data], [hora], [descricao], [id_filme], [inactivo], [preco]) VALUES (3, 2, CAST(N'2020-03-18 00:00:00.000' AS DateTime), N'9:30', N'<p>teste</p>', 2, 0, NULL)
INSERT [dbo].[cinema_sessao] ([id], [id_cinema], [data], [hora], [descricao], [id_filme], [inactivo], [preco]) VALUES (4, 2, CAST(N'2020-03-20 00:00:00.000' AS DateTime), N'9:30', N'<p>teste</p>', 6, 0, NULL)
SET IDENTITY_INSERT [dbo].[cinema_sessao] OFF
SET IDENTITY_INSERT [dbo].[clinica] ON 

INSERT [dbo].[clinica] ([id], [id_distrito], [descricao], [nome], [bairro], [telefone], [foto_capa], [inactivo], [email], [data_cadastro]) VALUES (1, 2, N'Clínica MMQ - é uma clínica de especialidades médicas que visa a oferecer os Serviços de Saúde com qualidade, humanização e preços competitivos apresentando quase 5 anos de experiência na Saúde. Realizamos uma pesquisa de mercado e oferecemos os melhores valores do mercado.

Prestamos, Serviços de Saúde como Consultas Externas e Consultas ao Domicílios, Exames Clínicos , Check-up Laboral, Ecografia de Última Geração 4D e outros, Serviços de Enfermagem, Cuidados Intensivos, Serviços de Analises Clínicas e Laboratoriais, Serviços de Ambulância, Maternidade, Incubadora, primeiros socorros, fisioterapia, assistência ao clube ou desportista, Cuidados Especiais para Recém-Nascidos, Radiologia, Cirurgias, Internamento com capacidade de 15 quartos climatizados com capacidade de duas Camas, Farmácia Aberta 24H e muito mais.', N'Clinica MMQ', N'Avenida Marginal', N'84 732 7026', N'clinica1812020103241_1.png', 0, N'clinicammq@gmail.com', CAST(N'2020-01-18 10:32:28.907' AS DateTime))
INSERT [dbo].[clinica] ([id], [id_distrito], [descricao], [nome], [bairro], [telefone], [foto_capa], [inactivo], [email], [data_cadastro]) VALUES (2, 7, N'<p><span style="font-size: 12pt;">Dize arma va crer como na fara alto ja no. Estranhado temperadas faltadisse tu reconduzir as conquistar. No fizesse reposto ii crearam abencoe ha no capital. Um resfolegar um trauteando la gracejando. Apanhar penosos acceita revelas sr lagrima ar. Cousa dia rugir fez ala amola rir. Proprio senhora auxilio do subindo prompto na. Ternura nos aos pau vou criadas conscio. Tratado foi deixado aquella boa vontade.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Os olhe irei juro ande iv ou. Solta le um seiva eu massa bisca. Os quiz ja alas eu ii cale. Tem mal mysteriosa competente ver combatente tel obtemperou detivessem. Permanente accumulado as obedeceres la mo agremiacao ca. Primitivas permanecia ah em entregando ja. Ordens fim ias perdiz fallar dignos faltam alento bom. Amor vejo amam duas dou foi das pae.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Cova seja aza tem arma. Craves pae duvida quizer agrada via trazia fallas mas. Ar oh rapazes eu apavora cerebro abrindo artista pussera. Offerece hei sae gradeado calculos mostrara proposto nas sem perdicao. Diabo da curta so ambos temos prova legou do. Percorrer ca va commocoes espadaudo ti eu. Eu logar treme chama tu vamos ou. Mas antes caldo vende ouviu olhos rir tao tal.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Vivacidade primitivas na ha ou nobilitado so individual. Oh lh accordo sumiram iv andados ia rejeita entendo. Espalmada em as encerrado eu de recebendo. Pena vens tu meio so pois. Principiou sympathico um ao recolhendo tu disparates interrogou. Luz nao explico oucamos alargue sujeita. Mim mau romper bocado estava sou.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Veu artificial morigerado despenhava ceo affirmares mazzantini igualmente. Ha operem de ou cravae pessoa tentar es. Repellao em conhecer deixasse admissao sr floretes eu quereria. Muda nojo cada ca os semi de umas veja. Vae vou vedes fique disse amo. Distingam lei distincto mas tormentos sim compaixao sua badaladas respondia. De obediente sr abracando ja em desfitava. Jogo da na face sr eu juro.&nbsp;</span></p>', N'Clinica Azevedo N3', N'Nacala', N'842338251', N'clinica123202015551_2.jpg', 0, N'junior.alide007@gmail.com', CAST(N'2020-03-12 15:54:55.287' AS DateTime))
SET IDENTITY_INSERT [dbo].[clinica] OFF
SET IDENTITY_INSERT [dbo].[distrito] ON 

INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (2, NULL, N'Quelimane', N'Perfil532020184226_2.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60761.555211617015!2d36.86892522204015!3d-17.85750772630134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d2f3924aa45035%3A0x301df4b81c5c9fac!2sQuelimane!5e0!3m2!1spt-PT!2smz!4v1576670511227!5m2!1spt-PT!2smz', N'<p><b>Quelimane</b> e um distrito de teste</p>
<p>abcbcbcbbcbc</p>
                        
                        
                        
                        
                        
                        ', 0, N'193.343', N'117 km', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (3, NULL, N'Lugela', N'Perfil20122019171525_3.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d980189.3814810364!2d36.08466800926038!3d-16.329852438517253!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d058dba32d5b2f%3A0x5edd6fdf3c7fc2ad!2sLugela!5e0!3m2!1spt-PT!2smz!4v1576673176592!5m2!1spt-PT!2smz', N'Quelimane é a capital e a maior cidade da província da Zambézia, em Moçambique. Está localizada no rio dos Bons Sinais, a cerca de 20 km do Oceano Índico; por essa razão, a cidade conta com um porto, que é uma das suas principais actividades económicas, centro de uma importante indústria pesqueira.

Era um importante centro comercial suaíle quando os portugueses ali chegaram em 1498, mais especificamente Vasco da Gama na sua primeira viagem à Índia, mas a presença portuguesa permanente só foi registada a partir de 1544.[1] Foi elevada a vila e sede de concelho em 1763 e a cidade a 21 de Agosto de 1942.[2]

A cidade de Quelimane é administrativamente um município com um governo local eleito e também um distrito, que administra as competências do governo central.[3] Numa área de 117 km², a cidade tinha 150 116 habitantes em 1997. A população tinha ascendido a 185.000 habitantes em 2003, e o censo de 2007 registou 193.343 habitantes.[4]

Qulimane está interligada ao território moçambicano por uma extensa rede de transportes, sendo que suas mais requisitadas vias de acesso são as rodoviárias, por intermédio da rodovia N10, de ligação com Nicoadala, ao noroeste; da rodovia N320, de ligação com Chinde, ao sul, e a praia de Zalala, ao norte, e; da rodovia R1119, de ligação com Mendozo e Magromane, no litoral.[6]

Anteriormente a sede municipal era ligada a Mocuba pelo Caminho de Ferro Transzambeziano, que utilizava o importante porto de Quilimane para escoamento de produtos agrícolas e semi-beneficiados.[7][8] O trafego no caminho de ferro está suspenso por falta de manutenção.

A cidade ainda conta com um aeródromo de voos domésticos, o aeroporto de Quelimane.[9]
                        
                        
                        
                        
                        ', 0, N'6 001 km', N'233 Hab', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (4, NULL, N'Mocuba', N'Perfil2312201910510_4.JPG', N'https://goo.gl/maps/ugwyt3de13B3npjHA', N'                            Mocuba é uma cidade e um município da província da Zambézia, em Moçambique, situada nas margens do rio Licungo.

Para além de capital do distrito de Mocuba, esta urbe é também sede do posto administrativo da Cidade de Mocuba.

Foi vila até 12 de fevereiro de 1971, altura em que foi elevada a cidade
                        ', 0, N'38823', N'57 584 hab', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (5, NULL, N'asadasd', N'noimage.png', N'asdasd', NULL, 0, N'asdasda', N'asdasda', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (6, NULL, N'sadas', N'noimage.png', N'asdas', N'<p><strong>sadsa</strong></p>
<p><em>sadasd</em></p>
<p>sadsa</p>', 0, N'asdas', N'adas', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (7, NULL, N'Alto Molocue', N'Perfil932020133244_7.jpg', N'1321231', N'<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><strong>Lorem ipsum dolor sit amet, arcu elit libero </strong></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify">eget convallis eros ipsum, pede suspendisse ac eu sed vitae, diam suspendisse. Ante lorem felis, mi justo</p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify">orci semper ac sollicitudin cubilia, quisquam curabitur, wisi sollicitudin sem cursus. Feugiat wisi ut dui, a enim fringilla. Et magna nullam auctor quam est, pulvinar consectetuer. Ut in elit integer vitae dignissim praesent. Leo pretium non etiam ac, voluptatem lobortis taciti leo. Urna vitae semper eros, erat urna proin sed integer, torquent amet, adipiscing lacinia convallis vel semper, volutpat parturient eu. Vestibulum duis fermentum magna sodales, penatibus sodales eros nulla conubia mattis. Fermentum sed, wisi amet sit, id nunc luctus id nec, pariatur justo lacus ut dapibus omnis nibh. Erat at nulla ut mattis dictumst, volutpat amet et mi imperdiet dui. Elementum felis ante consequat pulvinar odio, fusce praesent, vitae consequat nec augue, euismod molestie pellentesque, pellentesque et scelerisque sed. Viverra lacinia consectetuer justo fames sit, arcu phasellus, varius lectus donec parturient euismod rhoncus, pellentesque tristique non pulvinar.</p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify">Id in ipsum integer tellus massa, morbi integer elit etiam mollis id sed, sed lobortis adipisicing, in sem sem semper curae. Curabitur scelerisque auctor ac mauris, aliquam erat porta lacinia gravida non. Eros wisi quam vestibulum et enim, pharetra morbi leo quis quisque semper, convallis nec est ac feugiat, eget vitae urna eget, interdum auctor hendrerit sodales aenean. Et libero eros ut at non. Pede commodo, id suspendisse fusce semper placerat et, vestibulum est ipsum, risus libero mauris. Ultricies donec mauris felis a, velit enim erat donec, nulla integer vitae fusce eget, posuere nunc maecenas. Eget vel commodo varius urna, cras purus quam at ligula senectus.</p>', 0, N'12313', N'23213', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (8, NULL, N'asdasda', N'Perfil932020135752_8.jpg', N'23423423', N'<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 14pt;"><strong>Lorem ipsum dolor sit amet, arcu elit libero </strong></span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"><em>eget convallis eros ipsum, pede suspendisse ac eu sed vitae, diam suspendisse. Ante lorem felis, mi justo</em></span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">orci semper ac sollicitudin cubilia, quisquam curabitur, wisi sollic</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify">&nbsp;</p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">itudin sem cursus. Feugiat wisi ut dui, a enim fringilla. Et magna nullam auctor quam est, pulvinar consectetuer. Ut in elit integer vitae dignissim praesent. Leo pretium non etiam ac, voluptatem lobortis taciti leo. Urna vitae semper er</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify">&nbsp;</p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">os, erat urna proin sed integer, torquent amet, adipiscing lacinia con</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">vallis vel semper, volutpat parturient eu. Vestibulum duis fermentum magna sodales, penatibus sodales eros nulla conubia mattis. Fermentum sed, wisi amet sit, id nunc luctus id nec, pariatur justo lacus ut dapibus omnis nibh. Erat at n</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">ulla ut mattis dictumst, volutpat amet et mi imperdiet dui. Elementum felis ante consequat pulvinar odio, fusce praesent, vitae consequat nec augue, euismod molestie pellentesque, pellentesque et scelerisque sed. Viverra lacinia consectetuer justo fames sit, arcu phasellus, varius lectu</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">s donec parturient euismod rhoncus, pellentesque tristique non pulvinar.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Id in ipsum integer tellus massa, morbi integer elit etiam</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">mollis id sed, sed lobortis adipisicing, in sem sem semper curae. Curabitur scelerisque auctor ac mauris, aliquam erat porta lacinia gravida non. Eros wisi quam vestibulum et enim, pharetra morbi leo quis quisque semper, convallis nec est ac feugiat, eget vitae urna eget</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">, interdum auctor hendrerit sodales aenean. Et libero eros ut at non. Pede commodo, id suspendisse fusce semper placerat et, vestibulum est ipsum, risus libero mauris. Ultricies donec mauris felis a, velit enim erat donec, nulla integer vitae fusce eget, posuere nunc maecenas. E</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">get vel commodo varius urna, cras purus quam at ligula senectus.</span></p>', 0, N'234234', N'23423', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[distrito] OFF
SET IDENTITY_INSERT [dbo].[distrito_classificacao] ON 

INSERT [dbo].[distrito_classificacao] ([id], [id_distrito], [id_usuario], [e_like], [data_cadastro], [activo], [nomeUsuario], [email], [assunto], [estrelas]) VALUES (1, 3, 1, 0, CAST(N'2019-12-25 01:48:36.180' AS DateTime), 1, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[distrito_classificacao] OFF
SET IDENTITY_INSERT [dbo].[distrito_comentario] ON 

INSERT [dbo].[distrito_comentario] ([id], [id_distrito], [id_usuario], [comentario], [data], [valido], [nomeUsuario], [email], [assunto]) VALUES (1, 3, 1, N'distrito em desenvolvimento', CAST(N'2019-12-25 01:48:36.197' AS DateTime), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[distrito_comentario] OFF
SET IDENTITY_INSERT [dbo].[distrito_foto] ON 

INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (15, 2, N'ImgDistrito20122019171142_2.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (16, 2, N'ImgDistrito20122019171156_2.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (17, 2, N'ImgDistrito20122019171213_2.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (18, 3, N'ImgDistrito20122019171534_3.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (19, 3, N'ImgDistrito20122019171540_3.jpg')
SET IDENTITY_INSERT [dbo].[distrito_foto] OFF
SET IDENTITY_INSERT [dbo].[empresa] ON 

INSERT [dbo].[empresa] ([id], [descricao], [telefone], [website], [email], [endereco], [seguranca], [como_pagar]) VALUES (1, N'O MUSSIKA é uma plataforma online (disponível em www.mussika.co.mz), criada pelo Centro de Estudos para o Desenvolvimento da Zambézia - CEPDZ, especialmente para permitir que os agentes económicos da província da Zambézia, possam de forma muito fácil e rápida, expandir os seus negócios na medida em que estes interagem com seus parceiros, fornecedores e clientes a velocidade de um simples clique.

Este portal preocupa-se também em divulgar ao mundo as actividades sociais, os grandes projectos desenvolvidos na província por empresas privadas e do estado. A plataforma é também o espaço ideal para que pequenos empreendedores divulguem os seus negócios e criem vínculos com potenciais clientes e investidores. O Mussika engloba toda a riqueza da província, permitindo assim que qualquer um em qualquer parte do mundo, que tenha acesso ao aplicativo, se delicie da cultura, turismo e gastronomia zambeziana. Através deste aplicativo já é possível ter acesso as potencialidades e solicitar serviços online de turismo, gastronomia, arte e cultura e até transportes nos 22 Distritos da Província da Zambézia. O maior diferencial do Mussika é o elevado grau de interactividade que o mesmo oferecera aos seus utilizadores, funcionalidades como pesquisar um Hotel, Restaurante, um fornecedor um serviço, criação de anúncios de vagas de emprego e triagem de candidatos (por parte das empresas), criação e actualização de portfolios em tempo real, promoção e divulgação de produtos e serviços e muito mais.', N'873 2000 32', N'www.mussika.co.mz', N'info@mussika.co.mz', N'Sediada na avenida Julius Nyerere casa no 470 bairro Aquima com Nuit 700142698 - Cidade de Quelimane', N'Empresa Robusta', N'muito facil, ate pelo empesa')
SET IDENTITY_INSERT [dbo].[empresa] OFF
SET IDENTITY_INSERT [dbo].[evento] ON 

INSERT [dbo].[evento] ([id], [nome], [data_cadastro], [data_evento], [descricao], [foto_capa], [id_distrito], [local], [inactivo], [adiado], [realizado], [id_categoria], [preco_bilhete]) VALUES (1, N'Conferência Internacional do Turismo Baseado na Natureza', CAST(N'2020-01-18 10:15:49.237' AS DateTime), CAST(N'2020-03-12 00:00:00.000' AS DateTime), N'<p><span style="font-size: 12pt;">A n&iacute;vel global, os governos nacionais, ONGs e os gestores de &aacute;reas de conserva&ccedil;&atilde;o enfrentam desafios para conseguir financiar a protec&ccedil;&atilde;o dos habitats e esp&eacute;cies e, ao mesmo tempo, garantir que as comunidades locais se beneficiem das &aacute;reas de conserva&ccedil;&atilde;o. </span></p>
<p><span style="font-size: 12pt;">O turismo baseado na natureza, surge como uma das solu&ccedil;&otilde;es para resolver o dilema. Ao promover a fauna bravia e os espa&ccedil;os naturais como atrac&ccedil;&otilde;es, os pa&iacute;ses podem preservar os ecossistemas e gerar empregos para as popula&ccedil;&otilde;es que vivem mais pr&oacute;ximo de animais selvagens.</span></p>
<p><span style="font-size: 12pt;"> Esta confer&ecirc;ncia internacional pretende explorar mecanismos de desenvolvimento do turismo baseado na natureza nas &aacute;reas de conserva&ccedil;&atilde;o, de forma a fornecer resultados para as pessoas e a vida selvagem. O turismo &eacute; uma ind&uacute;stria priorit&aacute;ria para o Governo de Mo&ccedil;ambique e o Estado est&aacute; empenhado em criar oportunidades que explorem e enaltecem o poder do desenvolvimento. </span></p>
<p><span style="font-size: 12pt;">Para este efeito, o Governo estabeleceu as condi&ccedil;&otilde;es necess&aacute;rias para que as &aacute;reas de conserva&ccedil;&atilde;o implementem as parcerias p&uacute;blico-privadas. As parcerias p&uacute;blico-privadas s&atilde;o indispens&aacute;veis para oferecer um turismo de primeira classe nas &aacute;reas de conserva&ccedil;&atilde;o e tamb&eacute;m garantir que essas &aacute;reas selvagens sejam protegidas para o futuro. A co-gest&atilde;o das &aacute;reas de conserva&ccedil;&atilde;o &eacute; uma forma inovadora de aceder aos recursos t&eacute;cnicos, profissionais e financeiros necess&aacute;rios. </span></p>
<p><span style="font-size: 12pt;">O Governo de Mo&ccedil;ambique tem a honra de estar em parceria com o Grupo Banco Mundial, o Global Wildlife Program e outros parceiros no lan&ccedil;amento desta confer&ecirc;ncia com o intuito de promover o desenvolvimento do turismo sustent&aacute;vel e a conserva&ccedil;&atilde;o da vida selvagem. </span></p>
<p><span style="font-size: 12pt;">Ao reunir profissionais de turismo, especialistas em conserva&ccedil;&atilde;o, formuladores de pol&iacute;ticas, filantropos, acad&eacute;micos e empreendedores, a confer&ecirc;ncia busca compartilhar li&ccedil;&otilde;es e as melhores pr&aacute;ticas de empreendimentos de ecoturismo em todo o mundo.</span></p>', N'Evento1812020101750_1.jpg', 2, N'Conselho Municipal', 0, 0, 0, 1, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[evento] ([id], [nome], [data_cadastro], [data_evento], [descricao], [foto_capa], [id_distrito], [local], [inactivo], [adiado], [realizado], [id_categoria], [preco_bilhete]) VALUES (2, N'O valor da Educacao', CAST(N'2020-03-05 11:43:13.290' AS DateTime), CAST(N'2020-03-12 00:00:00.000' AS DateTime), N'<p><span style="font-size: 12pt;">Whole every miles as tiled at seven or. Wished he entire esteem mr oh by. Possible bed you pleasure civility boy elegance ham. He prevent request by if in pleased. Picture too and concern has was comfort. Ten difficult resembled eagerness nor. Same park bore on be. Warmth his law design say are person. Pronounce suspected in belonging conveying ye repulsive.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Now for manners use has company believe parlors. Least nor party who wrote while did. Excuse formed as is agreed admire so on result parish. Put use set uncommonly announcing and travelling. Allowance sweetness direction to as necessary. Principle oh explained excellent do my suspected conveying in. Excellent you did therefore perfectly supposing described.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Ever man are put down his very. And marry may table him avoid. Hard sell it were into it upon. He forbade affixed parties of assured to me windows. Happiness him nor she disposing provision. Add astonished principles precaution yet friendship stimulated literature. State thing might stand one his plate. Offending or extremity therefore so difficult he on provision. Tended depart turned not are.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Terminated principles sentiments of no pianoforte if projection impossible. Horses pulled nature favour number yet highly his has old. Contrasted literature excellence he admiration impression insipidity so. Scale ought who terms after own quick since. Servants margaret husbands to screened in throwing. Imprudence oh an collecting partiality. Admiration gay difficulty unaffected how.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Remain valley who mrs uneasy remove wooded him you. Her questions favourite him concealed. We to wife face took he. The taste begin early old why since dried can first. Prepared as or humoured formerly. Evil mrs true get post. Express village evening prudent my as ye hundred forming. Thoughts she why not directly reserved packages you. Winter an silent favour of am tended mutual.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Looking started he up perhaps against. How remainder all additions get elsewhere resources. One missed shy wishes supply design answer formed. Prevent on present hastily passage an subject in be. Be happiness arranging so newspaper defective affection ye. Families blessing he in to no daughter.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">By an outlived insisted procured improved am. Paid hill fine ten now love even leaf. Supplied feelings mr of dissuade recurred no it offering honoured. Am of of in collecting devonshire favourable excellence. Her sixteen end ashamed cottage yet reached get hearing invited. Resources ourselves sweetness ye do no perfectly. Warmly warmth six one any wisdom. Family giving is pulled beauty chatty highly no. Blessing appetite domestic did mrs judgment rendered entirely. Highly indeed had garden not.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion. Books whose front would purse if be do decay. Quitting you way formerly disposed perceive ladyship are. Common turned boy direct and yet.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Effects present letters inquiry no an removed or friends. Desire behind latter me though in. Supposing shameless am he engrossed up additions. My possible peculiar together to. Desire so better am cannot he up before points. Remember mistaken opinions it pleasure of debating. Court front maids forty if aware their at. Chicken use are pressed removed.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">In show dull give need so held. One order all scale sense her gay style wrote. Incommode our not one ourselves residence. Shall there whose those stand she end. So unaffected partiality indulgence dispatched to of celebrated remarkably. Unfeeling are had allowance own perceived abilities.&nbsp;</span></p>
<p>&nbsp;</p>', N'Evento532020114320_2.jpg', 2, N'Maputo', 0, 0, 0, 2, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[evento] ([id], [nome], [data_cadastro], [data_evento], [descricao], [foto_capa], [id_distrito], [local], [inactivo], [adiado], [realizado], [id_categoria], [preco_bilhete]) VALUES (3, N'Shoprite em Chamas', CAST(N'2020-03-12 16:05:16.743' AS DateTime), CAST(N'2020-03-12 00:00:00.000' AS DateTime), N'<p><strong><span style="font-size: 12pt;">Dize arma va crer como na fara alto ja no. Estranhado temperadas faltadisse tu reconduzir as conquistar. No fizesse reposto ii crearam abencoe ha no capital. Um resfolegar um trauteando la gracejando. Apanhar penosos acceita revelas sr lagrima ar. Cousa dia rugir fez ala amola rir. Proprio senhora auxilio do subindo prompto na. Ternura nos aos pau vou criadas conscio. Tratado foi deixado aquella boa vontade.&nbsp;</span></strong></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Os olhe irei juro ande iv ou. Solta le um seiva eu massa bisca. Os quiz ja alas eu ii cale. Tem mal mysteriosa competente ver combatente tel obtemperou detivessem. Permanente accumulado as obedeceres la mo agremiacao ca. Primitivas permanecia ah em entregando ja. Ordens fim ias perdiz fallar dignos faltam alento bom. Amor vejo amam duas dou foi das pae.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Cova seja aza tem arma. Craves pae duvida quizer agrada via trazia fallas mas. Ar oh rapazes eu apavora cerebro abrindo artista pussera. Offerece hei sae gradeado calculos mostrara proposto nas sem perdicao. Diabo da curta so ambos temos prova legou do. Percorrer ca va commocoes espadaudo ti eu. Eu logar treme chama tu vamos ou. Mas antes caldo vende ouviu olhos rir tao tal.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Vivacidade primitivas na ha ou nobilitado so individual. Oh lh accordo sumiram iv andados ia rejeita entendo. Espalmada em as encerrado eu de recebendo. Pena vens tu meio so pois. Principiou sympathico um ao recolhendo tu disparates interrogou. Luz nao explico oucamos alargue sujeita. Mim mau romper bocado estava sou.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Veu artificial morigerado despenhava ceo affirmares mazzantini igualmente. Ha operem de ou cravae pessoa tentar es. Repellao em conhecer deixasse admissao sr floretes eu quereria. Muda nojo cada ca os semi de umas veja. Vae vou vedes fique disse amo. Distingam lei distincto mas tormentos sim compaixao sua badaladas respondia. De obediente sr abracando ja em desfitava. Jogo da na face sr eu juro.&nbsp;</span></p>', N'Evento123202016520_3.jpg', 2, N'Nacala', 0, 0, 0, 1, CAST(1000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[evento] OFF
SET IDENTITY_INSERT [dbo].[evento_categoria] ON 

INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (1, N'Espectaculos')
INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (2, N'Eventos académicos')
SET IDENTITY_INSERT [dbo].[evento_categoria] OFF
SET IDENTITY_INSERT [dbo].[evento_comentario] ON 

INSERT [dbo].[evento_comentario] ([id], [id_evento], [id_usuario], [data_cadastro], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (1, 2, NULL, CAST(N'2020-03-05 16:09:21.967' AS DateTime), 1, N'teste', N'JUNIIOR', N'junior.alide007@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[evento_comentario] OFF
SET IDENTITY_INSERT [dbo].[farmacia] ON 

INSERT [dbo].[farmacia] ([id], [id_distrito], [nome], [bairro], [descricao], [telefone], [foto_capa], [inactivo], [email], [data_cadastro]) VALUES (1, 2, N'Farmácia Popular', N'Ave Josina Machel, Quelimane', N'teste', N'258842338251', N'Farmacia1812020103613_1.JPG', 0, N'farmaciapopular@gmail.com', CAST(N'2020-01-18 10:36:06.720' AS DateTime))
INSERT [dbo].[farmacia] ([id], [id_distrito], [nome], [bairro], [descricao], [telefone], [foto_capa], [inactivo], [email], [data_cadastro]) VALUES (2, 4, N'Farmacia Moza', N'Nacala', N'<p><span style="font-size: 12pt;">Dize arma va crer como na fara alto ja no. Estranhado temperadas faltadisse tu reconduzir as conquistar. No fizesse reposto ii crearam abencoe ha no capital. Um resfolegar um trauteando la gracejando. Apanhar penosos acceita revelas sr lagrima ar. Cousa dia rugir fez ala amola rir. Proprio senhora auxilio do subindo prompto na. Ternura nos aos pau vou criadas conscio. Tratado foi deixado aquella boa vontade.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Os olhe irei juro ande iv ou. Solta le um seiva eu massa bisca. Os quiz ja alas eu ii cale. Tem mal mysteriosa competente ver combatente tel obtemperou detivessem. Permanente accumulado as obedeceres la mo agremiacao ca. Primitivas permanecia ah em entregando ja. Ordens fim ias perdiz fallar dignos faltam alento bom. Amor vejo amam duas dou foi das pae.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Cova seja aza tem arma. Craves pae duvida quizer agrada via trazia fallas mas. Ar oh rapazes eu apavora cerebro abrindo artista pussera. Offerece hei sae gradeado calculos mostrara proposto nas sem perdicao. Diabo da curta so ambos temos prova legou do. Percorrer ca va commocoes espadaudo ti eu. Eu logar treme chama tu vamos ou. Mas antes caldo vende ouviu olhos rir tao tal.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Vivacidade primitivas na ha ou nobilitado so individual. Oh lh accordo sumiram iv andados ia rejeita entendo. Espalmada em as encerrado eu de recebendo. Pena vens tu meio so pois. Principiou sympathico um ao recolhendo tu disparates interrogou. Luz nao explico oucamos alargue sujeita. Mim mau romper bocado estava sou.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Veu artificial morigerado despenhava ceo affirmares mazzantini igualmente. Ha operem de ou cravae pessoa tentar es. Repellao em conhecer deixasse admissao sr floretes eu quereria. Muda nojo cada ca os semi de umas veja. Vae vou vedes fique disse amo. Distingam lei distincto mas tormentos sim compaixao sua badaladas respondia. De obediente sr abracando ja em desfitava. Jogo da na face sr eu juro.&nbsp;</span></p>', N'842338251', N'Farmacia123202015561_2.jpg', 0, N'junior.alide007@gmail.com', CAST(N'2020-03-12 15:55:55.113' AS DateTime))
SET IDENTITY_INSERT [dbo].[farmacia] OFF
SET IDENTITY_INSERT [dbo].[farmacia_produto] ON 

INSERT [dbo].[farmacia_produto] ([id], [id_farmacia], [nome], [descricao], [preco_venda], [foto_capa], [data_cadastro], [inactivo]) VALUES (3, 1, N'paracetamol', N'teste', CAST(20.00 AS Decimal(18, 2)), N'FarmaciaProduto632020151525_3.jpg', CAST(N'2020-03-06 15:15:15.187' AS DateTime), 0)
INSERT [dbo].[farmacia_produto] ([id], [id_farmacia], [nome], [descricao], [preco_venda], [foto_capa], [data_cadastro], [inactivo]) VALUES (4, 2, N'Paracetamol', N'<p><strong><span style="font-size: 12pt;">Dize arma va crer como na fara alto ja no. Estranhado temperadas faltadisse tu reconduzir as conquistar. No fizesse reposto ii crearam abencoe ha no capital. Um resfolegar um trauteando la gracejando. Apanhar penosos acceita revelas sr lagrima ar. Cousa dia rugir fez ala amola rir. Proprio senhora auxilio do subindo prompto na. Ternura nos aos pau vou criadas conscio. Tratado foi deixado aquella boa vontade.&nbsp;</span></strong></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Os olhe irei juro ande iv ou. Solta le um seiva eu massa bisca. Os quiz ja alas eu ii cale. Tem mal mysteriosa competente ver combatente tel obtemperou detivessem. Permanente accumulado as obedeceres la mo agremiacao ca. Primitivas permanecia ah em entregando ja. Ordens fim ias perdiz fallar dignos faltam alento bom. Amor vejo amam duas dou foi das pae.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Cova seja aza tem arma. Craves pae duvida quizer agrada via trazia fallas mas. Ar oh rapazes eu apavora cerebro abrindo artista pussera. Offerece hei sae gradeado calculos mostrara proposto nas sem perdicao. Diabo da curta so ambos temos prova legou do. Percorrer ca va commocoes espadaudo ti eu. Eu logar treme chama tu vamos ou. Mas antes caldo vende ouviu olhos rir tao tal.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Vivacidade primitivas na ha ou nobilitado so individual. Oh lh accordo sumiram iv andados ia rejeita entendo. Espalmada em as encerrado eu de recebendo. Pena vens tu meio so pois. Principiou sympathico um ao recolhendo tu disparates interrogou. Luz nao explico oucamos alargue sujeita. Mim mau romper bocado estava sou.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Veu artificial morigerado despenhava ceo affirmares mazzantini igualmente. Ha operem de ou cravae pessoa tentar es. Repellao em conhecer deixasse admissao sr floretes eu quereria. Muda nojo cada ca os semi de umas veja. Vae vou vedes fique disse amo. Distingam lei distincto mas tormentos sim compaixao sua badaladas respondia. De obediente sr abracando ja em desfitava. Jogo da na face sr eu juro.&nbsp;</span></p>', CAST(20.00 AS Decimal(18, 2)), N'FarmaciaProduto123202016122_4.jpg', CAST(N'2020-03-12 16:01:13.633' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[farmacia_produto] OFF
SET IDENTITY_INSERT [dbo].[filme] ON 

INSERT [dbo].[filme] ([id], [minutos], [direcao], [elenco], [nacionalidade], [titulo_original], [distribuidor], [ano_producao], [tipo_filme], [orcamento], [idioma], [cor], [sinopse], [inactivo], [foto_capa], [preco], [link_trailer]) VALUES (1, N'1:30', N'junior pires', N'arnold swanegger', N'mocambique', N'Os 100', N'distribuidor', 2020, N'Curta Metragem', CAST(100000.00 AS Decimal(18, 2)), N'ingles', N'colorido', N'<p style="margin: 0px 0px 20px; font-family: ''noto sans'', sans-serif; color: #222222; font-size: 16px;"><strong>So perhaps, Teste</strong></p>
<p style="margin: 0px 0px 20px; font-family: ''noto sans'', sans-serif; color: #222222; font-size: 16px;">you''ve generated some fancy text, and you''re content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you''re wondering how it''s even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual&nbsp;<em>font</em>?</p>
<p style="margin: 0px 0px 20px; font-family: ''noto sans'', sans-serif; color: #222222; font-size: 16px;">Well, the answer is actually no - rather than generating fancy&nbsp;<em>fonts</em>, this converter creates&nbsp;<em>fancy symbols</em>. The explanation starts with&nbsp;<a style="color: #00a3e1; text-decoration-line: none;" href="https://en.wikipedia.org/wiki/Unicode" target="_blank" rel="noopener">unicode</a>; an industry standard which creates the specification for thousands of different symbols and characters. All the characters that you see on your electronic devices, and printed in books, are likely specified by the unicode standard.</p>', 0, N'Filme1632020175019_1.jpg', NULL, NULL)
INSERT [dbo].[filme] ([id], [minutos], [direcao], [elenco], [nacionalidade], [titulo_original], [distribuidor], [ano_producao], [tipo_filme], [orcamento], [idioma], [cor], [sinopse], [inactivo], [foto_capa], [preco], [link_trailer]) VALUES (2, N'1:45', N'junior pires', N'arnold swanegger', N'mocambique', N'The Walking Dead', N'distribuidor', 2020, N'Curta Metragem', CAST(100000.00 AS Decimal(18, 2)), N'ingles', N'colorido', N'<p style="margin: 0px 0px 20px; font-family: ''noto sans'', sans-serif; color: #222222; font-size: 16px;"><strong>So perhaps, Teste</strong></p>
<p style="margin: 0px 0px 20px; font-family: ''noto sans'', sans-serif; color: #222222; font-size: 16px;">you''ve generated some fancy text, and you''re content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you''re wondering how it''s even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual&nbsp;<em>font</em>?</p>
<p style="margin: 0px 0px 20px; font-family: ''noto sans'', sans-serif; color: #222222; font-size: 16px;">Well, the answer is actually no - rather than generating fancy&nbsp;<em>fonts</em>, this converter creates&nbsp;<em>fancy symbols</em>. The explanation starts with&nbsp;<a style="color: #00a3e1; text-decoration-line: none;" href="https://en.wikipedia.org/wiki/Unicode" target="_blank" rel="noopener">unicode</a>; an industry standard which creates the specification for thousands of different symbols and characters. All the characters that you see on your electronic devices, and printed in books, are likely specified by the unicode standard.</p>', 0, N'Filme1632020175117_2.jpg', NULL, NULL)
INSERT [dbo].[filme] ([id], [minutos], [direcao], [elenco], [nacionalidade], [titulo_original], [distribuidor], [ano_producao], [tipo_filme], [orcamento], [idioma], [cor], [sinopse], [inactivo], [foto_capa], [preco], [link_trailer]) VALUES (3, N'01:30 ', N'asphalt', N'bob ransey', N'america', N'Black List', N'aliexpress', 2020, N'Longa Metragem', CAST(200000.00 AS Decimal(18, 2)), N'ingles', N'colorido', N'<p style="margin: 0px 0px 20px; font-family: ''noto sans'', sans-serif; color: #222222; font-size: 16px;"><strong>So perhaps</strong></p>
<p style="margin: 0px 0px 20px; font-family: ''noto sans'', sans-serif; color: #222222; font-size: 16px;">you''ve generated some fancy text, and you''re content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you''re wondering how it''s even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual <em>font</em>?</p>
<p style="margin: 0px 0px 20px; font-family: ''noto sans'', sans-serif; color: #222222; font-size: 16px;">Well, the answer is actually no - rather than generating fancy&nbsp;<em>fonts</em>, this converter creates&nbsp;<em>fancy symbols</em>. The explanation starts with&nbsp;<a style="color: #00a3e1; text-decoration-line: none;" href="https://en.wikipedia.org/wiki/Unicode" target="_blank" rel="noopener">unicode</a>; an industry standard which creates the specification for thousands of different symbols and characters. All the characters that you see on your electronic devices, and printed in books, are likely specified by the unicode standard.</p>', 0, N'Filme1632020175847_3.jpg', NULL, NULL)
INSERT [dbo].[filme] ([id], [minutos], [direcao], [elenco], [nacionalidade], [titulo_original], [distribuidor], [ano_producao], [tipo_filme], [orcamento], [idioma], [cor], [sinopse], [inactivo], [foto_capa], [preco], [link_trailer]) VALUES (4, N'1:30 Minutos', N'Michael Jackson', N'Mack Ryan', N'America', N'Os Gladiadores', N'Universal', 2020, N'Longa Metragem', CAST(20000.00 AS Decimal(18, 2)), N'ingles', N'Colorido', N'<p><strong><span style="font-size: 12pt;">Ensinando espantado do summative oh repetidos condicoes. </span></strong></p>
<p><span style="font-size: 12pt;">Preambulos candieiros pronunciar tu em disparates. La sois ella moco em joao essa cres. Cujo semi hei povo mesa amas nao maue. Ir rispidez oh realismo occultes ha educacao os provavel. Cres arma cabo as ja elle ou jura. Vez muito julga vae vil dever viver vem entro seita. Desgracado retroceder dar frioleiras uma habitantes mas verdadeiro.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Ido persistes estudante desenhava que galanteio vozpartes. Nao descarrega faltadisse tez reproduzir. Sim ellee acaba amola pao tenue. Va caro dado sr ja ar maes. Soccorros sob conquista repetidas commentou sem torrentes tormentos. Habituado costumado expressao sim luz facestive cincoenta apparecer.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Offensivas conquistar certamente fez dou hei nao. Accao visao sabia no se. Realmente cavernosa semblante recebendo distancia meu dar. Aproximar continuou que instantes encontres dar. Tantos cerrou sahido de estime falsas ir. Torrentes se narcotico avigorada ou apertando em. Reclamo acceite antigos curvada em do. Quer ama tao move sem raca ala amor. Viveremos soffridas energiaeu fui lua encontres confianca vae instincto. Tao trauteando lia nadaporque convertido disfarcado.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Elegante liquidar soltando dezeseis me proprias quantias ja. Concederam obediencia com esclarecia mau. Fita gado se sera cedo em olhe taes. Em salvar maquia salvam ir alguem rapado ja suppor pe. Prejuizos sou has parecerao nos summative. Receio abafar pensas tu patria da.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Do entrando tentares um indignos ou ponhamos acceitas. Ficarmos pe queimada ha da perfeito arreliar. Pegou oh exija bisca es mundo. No concordata defendemos proferiste preambulos as provincial. Ceo percebia methodos exprimia poz vae sao afflicta. Lembra tracos social sim ser alumno mal bem grande labios. Ultimo faltar miguel eu tu operem. Deram pae uma bispo creio estou teu.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Empregarei miseraveis satisfacao conventual tu incendiado firmemente la. Fofa do onde mola um qual moem ah amas. Do responder tratarmos francfort entendida na. Custa oh irmao da vulto. Ou sentiu sabera espero habito tornas la eu franco no. Obedecerei mau alcoolicos escriptora for differente.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Completado portinhola as dependente ja verdadeiro do na. Pae mas bom longa tao falle copia. Ouvindo maneira intenso uma poe. Hospedaram vergonteas lua foi instantesa sou galanteios fiz. Sou extirpar destinar maedisse temporal conduziu tao nao. Grosseira contribue necessita as ja suspendeu ve distincto infernaes so. Sem morre nos sou meios adeus posto hotel muito foi.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Bisca sabes has entao paz ora sem. Iv le no testa votou largo se. Ou moral as labio me fazes cento lh. Proceder mudancas eu morreram os trazendo sr. Sao irmao touro has traga mau ainda sejam pes. Diz nas abrandar traduzir nao escravod. Lagrimas mantemos escrinio dissemos as erguendo es.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Viu conventual condemnada dor retroceder vou nobilitado semelhante gargalhada. Horrenda hia diz has avultava entraste vae arrecear tivessem. Tropheu aquella accesso dia theoria minutos nem vir ido. Sabendo ultimas examina ah motivos do fazemos ca ha elleque. Ha eu anno gado anjo as ha quem. Carpidor deixares retirada um le pe. Da prenderes domestica ao os repetidos mysterisa innocente. Leva eu hein veja os se eu pode pelo. Paz nao desalinho encontram cre limpinhos. Me ja perdoe quanto sentar.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Suaves arvore meu chamou bem volver comeca eis. Ar quem no es fara mais da frio. Ignobil aquella le encarou se dispoes pe certeza. Oh desenrolar te disparates archivando despedindo. Mettem meu aspera chegue embora has mau nao. Sou incendiado capitulada voz vou bom levantadas restituido.&nbsp;</span></p>
<p>&nbsp;</p>', 0, N'Filme1632020171719_4.jpg', NULL, NULL)
INSERT [dbo].[filme] ([id], [minutos], [direcao], [elenco], [nacionalidade], [titulo_original], [distribuidor], [ano_producao], [tipo_filme], [orcamento], [idioma], [cor], [sinopse], [inactivo], [foto_capa], [preco], [link_trailer]) VALUES (5, N'1h 43min', N'Aly Muritiba, Jandir Santin', N'Ma Ry, Maicon Douglas, Otávio Linhares', N'Brasil', N'NÓIS POR NÓIS', N'Olhar Distribuição', 2020, N'Longa Metragem', CAST(20000.00 AS Decimal(18, 2)), N'Português', N'colorido', N'<p><span style="color: #333333; font-family: Arial, sans-serif; font-size: 12pt; background-color: #ffffff;">Durante um baile de RAP, quatro amigos se ocupam com atividades e objetivos diferentes. Mari est&aacute; focada em participar da final do Circuito de Rimas CWB. Japa vende os produtos de Nando, seu "chefe". Gui &eacute; o mais preocupado, ele precisa que tude d&ecirc; certo para conseguir uma boa bilheteria e, consequentemente, um bom lucro. Caf&eacute;, diferentemente dos outros, s&oacute; quer se divertir. No entanto, as reviravoltas da noite juntam seus destinos de maneira permanente.</span></p>', 0, N'Filme163202018320_5.jpg', CAST(0.00 AS Decimal(18, 2)), N'https://www.youtube.com/embed/SMqQFQeBYdo')
INSERT [dbo].[filme] ([id], [minutos], [direcao], [elenco], [nacionalidade], [titulo_original], [distribuidor], [ano_producao], [tipo_filme], [orcamento], [idioma], [cor], [sinopse], [inactivo], [foto_capa], [preco], [link_trailer]) VALUES (6, N'1:30', N'Larry Brilliant', N'Scott ', N'Englaterra', N'O Contagio', N'Columbia University', 2020, N'Longa Metragem', CAST(20000.00 AS Decimal(18, 2)), N'Ingles', N'Preto Branco', N'<p><span style="box-sizing: border-box; font-weight: bold; font-family: Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Por que ele &eacute; t&atilde;o parecido com a realidade?</span></p>
<p><span style="box-sizing: border-box; font-weight: bold; font-family: Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="font-weight: 400;">Para escrever o roteiro, Scott passou de dois a tr&ecirc;s anos estudando a ci&ecirc;ncia por tr&aacute;s das pandemias. No mesmo per&iacute;odo, ele passava muito tempo falando com epidemiologistas, incluindo Larry Brilliant, um dos respons&aacute;veis por erradicar a var&iacute;ola.</span><br style="box-sizing: border-box; font-weight: 400;" /><br style="box-sizing: border-box; font-weight: 400;" /><span style="font-weight: 400;">Larry colocou Scott em contato com outros cientistas da Columbia University, onde ele aprendeu muito mais sobre como os v&iacute;rus agem no organismo. &ldquo;A &uacute;nica coisa que os m&eacute;dicos me pediam era que o filme fosse o mais real poss&iacute;vel&rdquo;, revelou.</span><br style="box-sizing: border-box; font-weight: 400;" /><br style="box-sizing: border-box; font-weight: 400;" /><span style="font-weight: 400;">O roteirista chegou a ir ao CDC (Centers for Disease Control) - Centro de Controle e Preven&ccedil;&atilde;o de Doen&ccedil;as em portugu&ecirc;s, que fica em Atlanta. L&aacute;, ele aprendeu sobre como um &oacute;rg&atilde;o de sa&uacute;de p&uacute;blica realmente funciona em momentos catastr&oacute;ficos.&nbsp;</span></span></p>
<p><span style="box-sizing: border-box; font-weight: bold; font-family: Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="font-weight: 400;">Por esses motivos, Cont&aacute;gio, lan&ccedil;ado em 2011, est&aacute; &ldquo;prevendo&rdquo; a crise atual. A produ&ccedil;&atilde;o envolveu especialistas da &aacute;rea, que atualmente, tamb&eacute;m est&atilde;o se esfor&ccedil;ando para conter o coronav&iacute;rus. Caso novas pandemias surjam futuramente, &eacute; poss&iacute;vel que a obra volte a se tornar atual.</span><br style="box-sizing: border-box; font-weight: 400;" /><br style="box-sizing: border-box; font-weight: 400;" /><span style="font-weight: 400;">Este &eacute; o resultado de um roteiro bem escrito. Ao levar em considera&ccedil;&atilde;o n&atilde;o somente a trag&eacute;dia, como tamb&eacute;m as poss&iacute;veis formas de combate e a resposta emocional da humanidade, o filme tornou-se um retrato fiel da sociedade em tempos como este.</span><br style="box-sizing: border-box; font-weight: 400;" /><br style="box-sizing: border-box; font-weight: 400;" /><span style="font-weight: 400;">&ldquo;A ci&ecirc;ncia &eacute; maravilhosa, mas tamb&eacute;m &eacute; uma forma de disseminar responsabilidade. E &eacute; essa a mensagem que eu queria passar com a produ&ccedil;&atilde;o. Se todos lavarem as m&atilde;os, manterem dist&acirc;ncia uns dos outros, e protegerem o pr&oacute;ximo, garantiremos a vida de muitos&rdquo;, afirma Scott.</span></span></p>', 0, N'Filme1732020164337_6.jpg', CAST(20000.00 AS Decimal(18, 2)), N'https://www.youtube.com/embed/u-eGomOPITc')
SET IDENTITY_INSERT [dbo].[filme] OFF
SET IDENTITY_INSERT [dbo].[filme_categoria] ON 

INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (1, N'Aventura')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (2, N'Familia')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (3, N'Drama')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (4, N'Accao')
SET IDENTITY_INSERT [dbo].[filme_categoria] OFF
SET IDENTITY_INSERT [dbo].[genero_musical] ON 

INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (1, N'ZOUK')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (2, N'SEMBA')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (3, N'RAP & RNB')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (4, N'KIZOMBA
')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (5, N'KUDURO')
SET IDENTITY_INSERT [dbo].[genero_musical] OFF
SET IDENTITY_INSERT [dbo].[hospital] ON 

INSERT [dbo].[hospital] ([id], [id_distrito], [nome], [bairro], [data_cadastro], [descricao], [inactivo], [foto_capa]) VALUES (1, 2, N'Hospital Central de Quelimane', N'Avenida Marginal', CAST(N'2020-01-18 10:29:33.003' AS DateTime), N'A Província da Zambézia vai contar com o curso de medicina-geral a partir do ano 2020. Esta informação foi prestada por Manuel de Morais Director da delegação da UP de Quelimane segunda-feira a quando da aula introdutória do quarto ano do curso de medicina geral. Trata-se do curso que estava a ser ministrado na faculdade de ciências de saúde da Universidade Pedagógica Delegação da Maxixe, província de Inhambane.

Devido a falta de condições como de um hospital central para estagiar os futuros médicos, o curso foi retirado da Maxixe para Quelimane por reunir melhores condições como de um hospital de referência com capacidade recomendadas para o efeito tal como recomenda o novo curricula.

“A UP já tinha desenhado abertura de um curso de medicina em Quelimane. Quando se deu início a construção do hospital central tinha se decido que nós também iriamos abrir o curso de medicina mas por questões de organização interna, esse curso foi preterido e abrimos o curso em Inhambane" disse Manuel de Morais.', 0, N'hospital1812020102942_1.jpg')
INSERT [dbo].[hospital] ([id], [id_distrito], [nome], [bairro], [data_cadastro], [descricao], [inactivo], [foto_capa]) VALUES (2, 2, N'Hospital HCM MPT', N'Nacala', CAST(N'2020-03-12 15:52:00.437' AS DateTime), N'<p><strong><span style="font-size: 12pt;">Dize arma va crer como na fara alto ja no. Estranhado temperadas faltadisse tu reconduzir as conquistar. No fizesse reposto ii crearam abencoe ha no capital. Um resfolegar um trauteando la gracejando. Apanhar penosos acceita revelas sr lagrima ar. Cousa dia rugir fez ala amola rir. Proprio senhora auxilio do subindo prompto na. Ternura nos aos pau vou criadas conscio. Tratado foi deixado aquella boa vontade.&nbsp;</span></strong></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Os olhe irei juro ande iv ou. Solta le um seiva eu massa bisca. Os quiz ja alas eu ii cale. Tem mal mysteriosa competente ver combatente tel obtemperou detivessem. Permanente accumulado as obedeceres la mo agremiacao ca. Primitivas permanecia ah em entregando ja. Ordens fim ias perdiz fallar dignos faltam alento bom. Amor vejo amam duas dou foi das pae.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Cova seja aza tem arma. Craves pae duvida quizer agrada via trazia fallas mas. Ar oh rapazes eu apavora cerebro abrindo artista pussera. Offerece hei sae gradeado calculos mostrara proposto nas sem perdicao. Diabo da curta so ambos temos prova legou do. Percorrer ca va commocoes espadaudo ti eu. Eu logar treme chama tu vamos ou. Mas antes caldo vende ouviu olhos rir tao tal.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Vivacidade primitivas na ha ou nobilitado so individual. Oh lh accordo sumiram iv andados ia rejeita entendo. Espalmada em as encerrado eu de recebendo. Pena vens tu meio so pois. Principiou sympathico um ao recolhendo tu disparates interrogou. Luz nao explico oucamos alargue sujeita. Mim mau romper bocado estava sou.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Veu artificial morigerado despenhava ceo affirmares mazzantini igualmente. Ha operem de ou cravae pessoa tentar es. Repellao em conhecer deixasse admissao sr floretes eu quereria. Muda nojo cada ca os semi de umas veja. Vae vou vedes fique disse amo. Distingam lei distincto mas tormentos sim compaixao sua badaladas respondia. De obediente sr abracando ja em desfitava. Jogo da na face sr eu juro.&nbsp;</span></p>', 0, N'hospital1232020155210_2.jpg')
SET IDENTITY_INSERT [dbo].[hospital] OFF
SET IDENTITY_INSERT [dbo].[item_filme_categoria] ON 

INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (2, 4, 2, 1)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (7, 4, 2, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (8, 4, 1, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (9, 1, 1, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (10, 1, 2, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (11, 2, 1, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (12, 2, 2, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (13, 3, 1, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (14, 3, 2, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (17, 6, 3, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (18, 6, 2, 0)
INSERT [dbo].[item_filme_categoria] ([id], [id_filme], [id_categoria], [inactivo]) VALUES (19, 5, 1, 0)
SET IDENTITY_INSERT [dbo].[item_filme_categoria] OFF
SET IDENTITY_INSERT [dbo].[item_pacote_subscricao] ON 

INSERT [dbo].[item_pacote_subscricao] ([id], [item_nome], [activo], [id_pacote_subscricao]) VALUES (1, N'Anuncios', 1, 1)
INSERT [dbo].[item_pacote_subscricao] ([id], [item_nome], [activo], [id_pacote_subscricao]) VALUES (2, N'cartaz', 1, 1)
SET IDENTITY_INSERT [dbo].[item_pacote_subscricao] OFF
SET IDENTITY_INSERT [dbo].[loja] ON 

INSERT [dbo].[loja] ([id], [nome], [id_distrito], [bairro], [descricao], [inactivo], [foto_capa], [data_cadastro], [telefone], [email], [id_tipo_loja]) VALUES (1, N'SHOPRITE', 2, N'Avenida Marginal', N'teste', 0, N'Loja43202015717_1.jpg', CAST(N'2020-03-04 15:07:03.350' AS DateTime), N'876543210', N'junior-pires007@live.com', 1)
INSERT [dbo].[loja] ([id], [nome], [id_distrito], [bairro], [descricao], [inactivo], [foto_capa], [data_cadastro], [telefone], [email], [id_tipo_loja]) VALUES (3, N'teste  edicao', 7, N'Cidade Alta, Avenida Julius Nherere, Quarteirao 04, casa numero 18', N'<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"><strong>Lorem ipsum dolor sit amet, urna ut ac molestie, aliquam dictum aliquam tristique venenatis, sapien auctor. Tempus id metus, dapibus fusce pede dolor porttitor sed, est sed, justo enim enim eget laoreet penatibus. Morbi duis lacinia non, morbi vel lorem non aliquam, et vestibulum. Magnis ullamcorper mi leo pellentesque, hendrerit neque imperdiet vel ante egestas mi, vitae est donec nec hendrerit eu, aliquam porttitor, elementum arcu leo. Massa arcu auctor bibendum aenean id id. Quis ligula fermentum per sollicitudin augue quis, lectus convallis sapien feugiat at vestibulum egestas.</strong></span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Proin faucibus in eros pellentesque occaecat, quisque pellentesque, velit arcu ligula. Id nibh interdum dictum a ultricies libero, pharetra natoque, suspendisse egestas morbi pretium imperdiet. Eget arcu ac quis magna, donec pellentesque bibendum. Lobortis amet, a malesuada netus mi aenean, eget tempus, scelerisque nec augue pretium consectetuer. Iaculis ut illo, erat et laoreet risus neque sapien, arcu elit arcu vel est, vitae habitasse ut dolor magna vitae. Eros varius. Sollicitudin quidem, vulputate rutrum tempor, lacus rutrum metus. Dictumst per proin nunc vivamus elementum, eleifend tortor nisl sed dolor morbi pede. Quis varius fusce, magna felis, non enim eros molestie. Sed odio, mauris aliquet wisi gravida feugiat mauris vel, dolor urna et, elit cras.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Pellentesque ad torquent vitae donec. Malesuada imperdiet ultrices dignissim vestibulum scelerisque dapibus, tortor ligula ac lacus, est arcu porttitor elit. Vulputate imperdiet mattis, lobortis proin magna nunc, eu ac vitae cum proident, quisque enim, urna duis ac iaculis tempor vestibulum. Blandit dui vestibulum, ac lorem et, nulla eros nullam eget justo, id suspendisse metus nec, leo morbi. Lacus tempor at malesuada gravida sem sit, arcu suspendisse.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify">&nbsp;</p>
<p style="color: #000000; font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;" align="justify"><span style="font-size: 12pt;">Justo maecenas dictum urna est ultricies nullam, a orci tortor orci et justo wisi, eu maecenas in facilisis. Eu eget, feugiat praesent odio libero ac est aut. Tristique quis. Dignissim aenean id pede, quis mus accumsan luctus dolor magna facilisi. Ipsum semper officia facilisis et lectus augue, quisque integer pulvinar, ullamcorper arcu pellentesque platea ante pellentesque cum, risus enim viverra at vestibulum. Nulla eleifend, ante in a posuere molestie, enim ac sed donec, egestas purus amet. Tellus purus faucibus tellus, velit id sed in felis tristique, in velit libero elementum. Suspendisse aliquam facilisi in pellentesque elit, sapien eleifend.</span></p>', 0, N'Loja11320209823_3.jpg', CAST(N'2020-03-11 09:08:13.870' AS DateTime), N'842338251', N'junior.alide007@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[loja] OFF
SET IDENTITY_INSERT [dbo].[loja_produto] ON 

INSERT [dbo].[loja_produto] ([id], [codigo], [id_loja], [nome], [descricao], [preco_min], [preco_max], [preco_venda], [e_servico], [foto_capa], [data_cadastro], [clicks], [inactivo], [id_categoria], [categoria]) VALUES (1, NULL, 1, N'Paracetamol 500 mg', N'paracetamol composto mlg', NULL, NULL, 20.0000, 0, N'LojaProduto43202015911_1.jpg', CAST(N'2020-03-04 15:09:04.350' AS DateTime), 0, 0, 3, 1)
INSERT [dbo].[loja_produto] ([id], [codigo], [id_loja], [nome], [descricao], [preco_min], [preco_max], [preco_venda], [e_servico], [foto_capa], [data_cadastro], [clicks], [inactivo], [id_categoria], [categoria]) VALUES (2, NULL, 1, N'bolacha agua e sal', N'teste', NULL, NULL, 20.0000, 0, N'LojaProduto432020162133_2.png', CAST(N'2020-03-04 16:21:28.593' AS DateTime), 0, 0, NULL, 2)
INSERT [dbo].[loja_produto] ([id], [codigo], [id_loja], [nome], [descricao], [preco_min], [preco_max], [preco_venda], [e_servico], [foto_capa], [data_cadastro], [clicks], [inactivo], [id_categoria], [categoria]) VALUES (3, NULL, 3, N'chocolate', N'<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"><strong>Lorem ipsum dolor sit amet, urna ut ac molestie teste</strong></span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"> aliquam dictum aliquam tristique venenatis, sapien auctor. Tempus id metus, dapibus fusce pede dolor porttitor sed, est sed, justo enim enim eget laoreet penatibus. Morbi duis lacinia non, morbi vel lorem non aliquam, et vestibulum. Magnis ullamcorper mi leo pellentesque, hendrerit neque imperdiet vel ante egestas mi, vitae est donec nec hendrerit eu, aliquam porttitor, elementum arcu leo. Massa arcu auctor bibendum aenean id id. Quis ligula fermentum per sollicitudin augue quis, lectus convallis sapien feugiat at vestibulum egestas.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><strong><span style="font-size: 12pt;">Proin faucibus in eros pellentesque occaecat, quisque pellentesque, velit arcu ligula. Id nibh interdum dictum a ultricies libero, pharetra natoque, suspendisse egestas morbi pretium imperdiet. Eget arcu ac quis magna, donec pellentesque bibendum. Lobortis amet, a malesuada netus mi aenean, eget tempus, scelerisque nec augue pretium consectetuer. Iaculis ut illo, erat et laoreet risus neque sapien, arcu elit arcu vel est, vitae habitasse ut dolor magna vitae. Eros varius. Sollicitudin quidem, vulputate rutrum tempor, lacus rutrum metus. Dictumst per proin nunc vivamus elementum, eleifend tortor nisl sed dolor morbi pede. Quis varius fusce, magna felis, non enim eros molestie. Sed odio, mauris aliquet wisi gravida feugiat mauris vel, dolor urna et, elit cras.</span></strong></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Pellentesque ad torquent vitae donec. Malesuada imperdiet ultrices dignissim vestibulum scelerisque dapibus, tortor ligula ac lacus, est arcu porttitor elit. Vulputate imperdiet mattis, lobortis proin magna nunc, eu ac vitae cum proident, quisque enim, urna duis ac iaculis tempor vestibulum. Blandit dui vestibulum, ac lorem et, nulla eros nullam eget justo, id suspendisse metus nec, leo morbi. Lacus tempor at malesuada gravida sem sit, arcu suspendisse.</span></p>
<p>&nbsp;</p>
<p style="color: #000000; font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;" align="justify"><span style="font-size: 12pt;">Justo maecenas dictum urna est ultricies nullam, a orci tortor orci et justo wisi, eu maecenas in facilisis. Eu eget, feugiat praesent odio libero ac est aut. Tristique quis. Dignissim aenean id pede, quis mus accumsan luctus dolor magna facilisi. Ipsum semper officia facilisis et lectus augue, quisque integer pulvinar, ullamcorper arcu pellentesque platea ante pellentesque cum, risus enim viverra at vestibulum. Nulla eleifend, ante in a posuere molestie, enim ac sed donec, egestas purus amet. Tellus purus faucibus tellus, velit id sed in felis tristique, in velit libero elementum. Suspendisse aliquam facilisi in pellentesque elit, sapien eleifend.</span></p>', NULL, NULL, 100.0000, 0, N'LojaProduto113202092110_3.jpg', CAST(N'2020-03-11 09:21:05.693' AS DateTime), 0, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[loja_produto] OFF
SET IDENTITY_INSERT [dbo].[loja_tipo] ON 

INSERT [dbo].[loja_tipo] ([id], [descricao]) VALUES (1, N'SUPERMERCADO')
INSERT [dbo].[loja_tipo] ([id], [descricao]) VALUES (2, N'IMOBILIARIA')
SET IDENTITY_INSERT [dbo].[loja_tipo] OFF
SET IDENTITY_INSERT [dbo].[musica] ON 

INSERT [dbo].[musica] ([id], [id_genero_musical], [titulo], [artista], [ano], [album], [formato], [produtor], [gravadora], [link], [caminho_ficheiro], [caminho_capa1], [caminho_capa2], [preco_venda], [gratis], [duracao], [pode_baixar], [e_album], [id_artista_obra]) VALUES (1, 1, N'Minha Dama', N'Abuchamo', 2019, NULL, N'MP3', N'wce beats', N'universal', N'teste', N'musica_1200320200904Arizona Zervas - ROXANNE (Lyrics).mp3', N'Capa1712020163555_1.jpg', NULL, NULL, 0, NULL, 0, 0, 1)
INSERT [dbo].[musica] ([id], [id_genero_musical], [titulo], [artista], [ano], [album], [formato], [produtor], [gravadora], [link], [caminho_ficheiro], [caminho_capa1], [caminho_capa2], [preco_venda], [gratis], [duracao], [pode_baixar], [e_album], [id_artista_obra]) VALUES (2, 3, N'Eu estava ai', N'Messias Maricoa', 2020, NULL, N'MP3', N'daiton beats', N'meed', NULL, N'musica_2180320201222Rayvanny-ft-Messias-Maricoa-Teamo.mp3', N'Capa532020123815_2.jpg', NULL, 300.0000, 0, N'3.25', 1, 0, 3)
SET IDENTITY_INSERT [dbo].[musica] OFF
SET IDENTITY_INSERT [dbo].[obra_arte] ON 

INSERT [dbo].[obra_arte] ([id], [id_categoria_obra], [titulo], [autor], [materia], [suporte], [tecnica], [dimensoes], [autoria_producao], [informacao_tecnica], [fotografo], [proprietario], [caminho_imagem], [id_artista_obra]) VALUES (1, 1, N'Arte de viver', N'Malangatana', N'wolves', N'pinto', N'teste', N'230x230', N'Malangatana', N'teste', NULL, N'Malangatana', N'Perfil181202010109_1.jpg', 2)
INSERT [dbo].[obra_arte] ([id], [id_categoria_obra], [titulo], [autor], [materia], [suporte], [tecnica], [dimensoes], [autoria_producao], [informacao_tecnica], [fotografo], [proprietario], [caminho_imagem], [id_artista_obra]) VALUES (2, 2, N'teste', N'Malangatana', N'teste', N'teste', N'teste', N'320X290', N'teste', N'teste', NULL, N'teste', N'Perfil2112020103623_2.jpg', 2)
SET IDENTITY_INSERT [dbo].[obra_arte] OFF
SET IDENTITY_INSERT [dbo].[obra_arte_imagem] ON 

INSERT [dbo].[obra_arte_imagem] ([id], [id_obra_arte], [caminho_imagem]) VALUES (1, 1, N'ImgObra1812020101016_1.jpg')
INSERT [dbo].[obra_arte_imagem] ([id], [id_obra_arte], [caminho_imagem]) VALUES (2, 2, N'ImgObra2112020103638_2.jpg')
SET IDENTITY_INSERT [dbo].[obra_arte_imagem] OFF
SET IDENTITY_INSERT [dbo].[pacote_subscricao] ON 

INSERT [dbo].[pacote_subscricao] ([id], [nome], [preco_por_mes], [activo]) VALUES (1, N'Basico', CAST(1200.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[pacote_subscricao] OFF
SET IDENTITY_INSERT [dbo].[produto_categoria] ON 

INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (1, N'ALIMENTOS')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (2, N'COSMETICOS')
SET IDENTITY_INSERT [dbo].[produto_categoria] OFF
SET IDENTITY_INSERT [dbo].[restaurante] ON 

INSERT [dbo].[restaurante] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_restaurante_tipo], [id_distrito], [activo]) VALUES (1, N'Restaurante Quinta do Nico', N'Avenida Marginal', N'84 270 1311', N'jpires@mozsistemas.co.mz', N'Temos pratos do dia, e comida zambeziana', N'perfil20122019172450_1.jpg', N'www.quintanico.co.mz', N'<iframe src="https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d3923357.695097542!2d36.495665681207264!3d-16.19965723313339!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e6!4m3!3m2!1d-14.543998799999999!2d40.6770132!4m5!1s0x18d2f392e4d04219%3A0xcfc846a734eb29d9!2srestaurante%20cidade%20de%20quelimane!3m2!1d-17.8790571!2d36.8915759!5e0!3m2!1spt-PT!2smz!4v1576855237648!5m2!1spt-PT!2smz', 1, 2, 1)
INSERT [dbo].[restaurante] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_restaurante_tipo], [id_distrito], [activo]) VALUES (2, N'Restaurante Xeque Mate', N'284 Ave Samora Machel, Quelimane', N'87 916 5803', NULL, N'Bom lugar para mordidas rápidas, bons remédios de ressaca. Eu recomendo este lugar, há uma grande variedade de pratos agradáveis, a minha impressão é que combinam a cozinha tradicional portuguesa com a nossa cozinha moçambicana. Não é lugar gourmet, mas ainda é ótimo para os amantes de comida.', N'perfil412020195313_2.jpg', NULL, N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4820485.995223602!2d38.47028999320563!3d-15.200660442226432!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d2f3edcd92a91d%3A0x9af3082ef81b151e!2sPub-Restaurante%20Xeque%20Mate!5e1!3m2!1spt-PT!2smz!4v1578159877011!5m2!1spt-PT!2smz', 1, 2, 1)
INSERT [dbo].[restaurante] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_restaurante_tipo], [id_distrito], [activo]) VALUES (3, N'Restaurante Taska', N'Cidade Alta, Avenida Julius Nherere, Quarteirao 04, casa numero 18', N'842338251', N'junior.alide007@gmail.com', N'<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"> aliquam dictum aliquam tristique venenatis, sapien auctor. Tempus id metus, dapibus fusce pede dolor porttitor sed, est sed, justo enim enim eget laoreet penatibus. Morbi duis lacinia non, morbi vel lorem non aliquam, et vestibulum. Magnis ullamcorper mi leo pellentesque, hendrerit neque imperdiet vel ante egestas mi, vitae est donec nec hendrerit eu, aliquam porttitor, elementum arcu leo. Massa arcu auctor bibendum aenean id id. Quis ligula fermentum per sollicitudin augue quis, lectus convallis sapien feugiat at vestibulum egestas.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"><strong>Proin faucibus in eros pellentesque occaecat, quisque pellentesque, velit arcu ligula. Id nibh interdum dictum a ultricies libero, pharetra natoque, suspendisse egestas morbi pretium imperdiet. Eget arcu ac quis magna, donec pellentesque bibendum. Lobortis amet, a malesuada netus mi aenean</strong></span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"> eget tempus, scelerisque nec augue pretium consectetuer. Iaculis ut illo, erat et laoreet risus neque sapien, arcu elit arcu vel est, vitae habitasse ut dolor magna vitae. Eros varius. Sollicitudin quidem, vulputate rutrum tempor, lacus rutrum metus. Dictumst per proin nunc vivamus elementum, eleifend tortor nisl sed dolor morbi pede. Quis varius fusce, magna felis, non enim eros molestie. Sed odio, mauris aliquet wisi gravida feugiat mauris vel, dolor urna et, elit cras.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Pellentesque ad torquent vitae donec. Malesuada imperdiet ultrices dignissim vestibulum scelerisque dapibus, tortor ligula ac lacus, est arcu porttitor elit. Vulputate imperdiet mattis, lobortis proin magna nunc, eu ac vitae cum proident, quisque enim, urna duis ac iaculis tempor vestibulum. Blandit dui vestibulum, ac lorem et, nulla eros nullam eget justo, id suspendisse metus nec, leo morbi. Lacus tempor at malesuada gravida sem sit, arcu suspendisse.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify">&nbsp;</p>
<p style="color: #000000; font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;" align="justify"><span style="font-size: 12pt;">Justo maecenas dictum urna est ultricies nullam, a orci tortor orci et justo wisi, eu maecenas in facilisis. Eu eget, feugiat praesent odio libero ac est aut. Tristique quis. Dignissim aenean id pede, quis mus accumsan luctus dolor magna facilisi. Ipsum semper officia facilisis et lectus augue, quisque integer pulvinar, ullamcorper arcu pellentesque platea ante pellentesque cum, risus enim viverra at vestibulum. Nulla eleifend, ante in a posuere molestie, enim ac sed donec, egestas purus amet. Tellus purus faucibus tellus, velit id sed in felis tristique, in velit libero elementum. Suspendisse aliquam facilisi in pellentesque elit, sapien eleifend.</span></p>', N'perfil11320209490_3.jpg', N'taska.co.mz', NULL, 1, 7, 1)
SET IDENTITY_INSERT [dbo].[restaurante] OFF
SET IDENTITY_INSERT [dbo].[restaurante_classificacao] ON 

INSERT [dbo].[restaurante_classificacao] ([id], [id_restaurante], [classificacao], [usuario_nome], [usuario_email], [usuario_assunto], [comentario], [foto], [data_cadastro], [id_usuario]) VALUES (1, 1, 3, N'Augusto Pinto', N'jpires@mozsistemas.co.mz', N'teste', NULL, NULL, CAST(N'2019-12-28 10:23:50.203' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[restaurante_classificacao] OFF
SET IDENTITY_INSERT [dbo].[restaurante_comentario] ON 

INSERT [dbo].[restaurante_comentario] ([id], [id_restaurante], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (1, 1, NULL, CAST(N'2019-12-28 10:23:50.373' AS DateTime), 1, N'Boa Comida', N'Augusto Pinto', N'jpires@mozsistemas.co.mz', NULL)
SET IDENTITY_INSERT [dbo].[restaurante_comentario] OFF
SET IDENTITY_INSERT [dbo].[restaurante_foto] ON 

INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (1, N'ImgRest20122019172456_1.jpg', 1, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (2, N'ImgRest20122019172514_1.jpg', 1, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (3, N'ImgRest412020195318_2.jpg', 2, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (4, N'ImgRest412020195322_2.jpg', 2, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (5, N'ImgRest412020195326_2.jpg', 2, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (6, N'ImgRest412020195330_2.jpg', 2, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (7, N'ImgRest412020195333_2.JPG', 2, 1)
SET IDENTITY_INSERT [dbo].[restaurante_foto] OFF
SET IDENTITY_INSERT [dbo].[restaurante_prato] ON 

INSERT [dbo].[restaurante_prato] ([id], [id_resturante], [nome], [preco_venda], [foto_capa], [descricao], [data_cadastrro], [inactivo], [id__prato_categoria]) VALUES (2, 1, N'Arroz com Feijao', CAST(190.00 AS Decimal(18, 2)), N'RestaurantePrato63202012355_2.jpg', N'Arroz com feijão é o nome dado a um prato típico do Brasil. Essa receita não tem uma origem certa, mas a hipótese mais aceita é a de que seria fruto de uma combinação do arroz trazido pelos portugueses para o Brasil com o feijão, que já seria consumido no Brasil pelos ameríndios.', CAST(N'2020-03-06 12:34:50.387' AS DateTime), 0, 1)
INSERT [dbo].[restaurante_prato] ([id], [id_resturante], [nome], [preco_venda], [foto_capa], [descricao], [data_cadastrro], [inactivo], [id__prato_categoria]) VALUES (3, 1, N'Sopa de Frango com Abóbora e Açafrão da Terra', CAST(560.00 AS Decimal(18, 2)), N'RestaurantePrato63202013486_3.jpg', N'Nos dias mais frios, nada melhor que uma boa Sopa de Legumes com Cúrcuma. Confira nossa receita e dê ', CAST(N'2020-03-06 13:47:52.733' AS DateTime), 0, 1)
INSERT [dbo].[restaurante_prato] ([id], [id_resturante], [nome], [preco_venda], [foto_capa], [descricao], [data_cadastrro], [inactivo], [id__prato_categoria]) VALUES (4, 1, N'Camarrao', CAST(230.00 AS Decimal(18, 2)), N'RestaurantePrato63202014550_4.jpg', N'camarao ', CAST(N'2020-03-06 14:05:44.640' AS DateTime), 0, 2)
INSERT [dbo].[restaurante_prato] ([id], [id_resturante], [nome], [preco_venda], [foto_capa], [descricao], [data_cadastrro], [inactivo], [id__prato_categoria]) VALUES (5, 3, N'Arroz com Feijao', CAST(180.00 AS Decimal(18, 2)), N'RestaurantePrato11320209553_5.jpg', N'<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"><strong>Lorem ipsum dolor sit amet, urna ut ac molestie.</strong></span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">aliquam dictum aliquam tristique venenatis, sapien auctor. Tempus id metus, dapibus fusce pede dolor porttitor sed, est sed, justo enim enim eget laoreet penatibus. Morbi duis lacinia non, morbi vel lorem non aliquam, et vestibulum. Magnis ullamcorper mi leo pellentesque, hendrerit neque imperdiet vel ante egestas mi, vitae est donec nec hendrerit eu, aliquam porttitor.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"> elementum arcu leo. Massa arcu auctor bibendum aenean id id. Quis ligula fermentum per sollicitudin augue quis, lectus convallis sapien feugiat at vestibulum egestas.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><strong><span style="font-size: 12pt;">Proin faucibus in eros pellentesque occaecat, quisque pellentesque, velit arcu ligula. Id nibh interdum dictum a ultricies libero, pharetra natoque, suspendisse egestas morbi pretium imperdiet. Eget arcu ac quis magna, donec pellentesque bibendum. Lobortis amet, a malesuada netus mi aenean, eget tempus, scelerisque nec augue pretium consectetuer. Iaculis ut illo.</span></strong></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;"> erat et laoreet risus neque sapien, arcu elit arcu vel est, vitae habitasse ut dolor magna vitae. Eros varius. Sollicitudin quidem, vulputate rutrum tempor, lacus rutrum metus. Dictumst per proin nunc vivamus elementum, eleifend tortor nisl sed dolor morbi pede. Quis varius fusce, magna felis, non enim eros molestie. Sed odio, mauris aliquet wisi gravida feugiat mauris vel, dolor urna et, elit cras.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Pellentesque ad torquent vitae donec. Malesuada imperdiet ultrices dignissim vestibulum scelerisque dapibus, tortor ligula ac lacus, est arcu porttitor elit. Vulputate imperdiet mattis, lobortis proin magna nunc, eu ac vitae cum proident, quisque enim, urna duis ac iaculis tempor vestibulum. Blandit dui vestibulum, ac lorem et, nulla eros nullam eget justo, id suspendisse metus nec, leo morbi. Lacus tempor at malesuada gravida sem sit, arcu suspendisse.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify">&nbsp;</p>
<p style="color: #000000; font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;" align="justify"><span style="font-size: 12pt;">Justo maecenas dictum urna est ultricies nullam, a orci tortor orci et justo wisi, eu maecenas in facilisis. Eu eget, feugiat praesent odio libero ac est aut. Tristique quis. Dignissim aenean id pede, quis mus accumsan luctus dolor magna facilisi. Ipsum semper officia facilisis et lectus augue, quisque integer pulvinar, ullamcorper arcu pellentesque platea ante pellentesque cum, risus enim viverra at vestibulum. Nulla eleifend, ante in a posuere molestie, enim ac sed donec, egestas purus amet. Tellus purus faucibus tellus, velit id sed in felis tristique, in velit libero elementum. Suspendisse aliquam facilisi in pellentesque elit, sapien eleifend.</span></p>', CAST(N'2020-03-11 09:54:57.613' AS DateTime), 0, NULL)
INSERT [dbo].[restaurante_prato] ([id], [id_resturante], [nome], [preco_venda], [foto_capa], [descricao], [data_cadastrro], [inactivo], [id__prato_categoria]) VALUES (6, 3, N'Pizza a Mexicana', CAST(700.00 AS Decimal(18, 2)), N'RestaurantePrato2032020104323_6.jpg', NULL, CAST(N'2020-03-20 10:43:00.520' AS DateTime), 0, 2)
SET IDENTITY_INSERT [dbo].[restaurante_prato] OFF
SET IDENTITY_INSERT [dbo].[restaurante_prato_categoria] ON 

INSERT [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (1, N'Salada')
INSERT [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (2, N'Guarnicoes')
INSERT [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (3, N'Entradas')
SET IDENTITY_INSERT [dbo].[restaurante_prato_categoria] OFF
SET IDENTITY_INSERT [dbo].[restaurante_tipo] ON 

INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (1, N'Comida Rapida')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (2, N'Pizza')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (3, N'Pastelaria')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (4, N'Mexicana')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (5, N'Chinesa')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (6, N'Italiana')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (7, N'Take-away')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (8, N'Lanchonete')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (9, N'Churrascaria')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (10, N'Hamburgueria')
SET IDENTITY_INSERT [dbo].[restaurante_tipo] OFF
SET IDENTITY_INSERT [dbo].[taxi] ON 

INSERT [dbo].[taxi] ([id], [nome], [praca_fixa], [bairro], [condutor], [proprietario], [matricula], [marca], [cor], [telefone], [email], [id_distrito], [foto_capa], [Inactivo], [id_categoria]) VALUES (1, N'Taxi Mauricio', N'Quelimane', NULL, N'Mauricio', NULL, N'025MP', N'Toyota', N'preto', N'841524722', NULL, 2, N'noimage.png', 0, 2)
INSERT [dbo].[taxi] ([id], [nome], [praca_fixa], [bairro], [condutor], [proprietario], [matricula], [marca], [cor], [telefone], [email], [id_distrito], [foto_capa], [Inactivo], [id_categoria]) VALUES (2, N'Taxi Junior', N'Belavista', N'cidade alta', N'Junior', N'Ernesto', N'aa-98-3998', N'toyota', N'branco', N'258842338251', N'junior.alide007@gmail.com', 3, N'Perfil432020222828_2.jpg', 0, 4)
SET IDENTITY_INSERT [dbo].[taxi] OFF
SET IDENTITY_INSERT [dbo].[taxi_categoria] ON 

INSERT [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (1, N'TXOPELAS', N'noimage.png')
INSERT [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (2, N'AUTOMOVEIS', N'noimage.png')
INSERT [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (3, N'MOTOCICLETAS', N'noimage.png')
INSERT [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (4, N'MOTORIZADAS', N'noimage.png')
SET IDENTITY_INSERT [dbo].[taxi_categoria] OFF
SET IDENTITY_INSERT [dbo].[turismo] ON 

INSERT [dbo].[turismo] ([id], [nome], [data_cadastro], [id_distrito], [localizacao], [inactivo], [foto_capa], [descricao], [id_categoria]) VALUES (1, N'Feira Internacional de Turismo', CAST(N'2020-01-18 10:22:10.090' AS DateTime), 2, N'Avenida MARGINAL', 0, N'LocalTuristico532020121333_1.jpg', N'<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Lorem ipsum dolor sit amet, suspendisse ut neque facilisis dis, magna vulputate purus integer, non eget mauris nonummy nulla non, lacus nunc eget rutrum duis proin. Nisl et in mauris urna repellendus urna, dolor vitae lacinia mattis, nibh tincidunt fusce in aliquam cras. In imperdiet nunc sed, in odio. A metus eros porttitor vitae cras sociosqu, eu praesent nibh morbi mi, ultrices ut sapien nibh. Donec curabitur sollicitudin wisi sed magna. Interdum libero commodo nec. Habitasse nec sit eget imperdiet ut, mauris placerat et donec enim iaculis mauris. A voluptatibus tempor dolor libero nullam suspendisse. Metus purus pellentesque in sollicitudin duis sit, a elit enim eu integer vel pretium. Egestas consequat. Habitant pulvinar ante mus libero vitae nonummy, mus mauris feugiat odio tincidunt suspendisse. Id donec mattis, lectus sit a primis, metus et luctus quam ut.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><strong><span style="font-size: 12pt;">Tellus metus sapien sollicitudin risus. Hac tempus, nec sed vivamus, nec a eu nibh risus dolor nibh, metus cras sollicitudin morbi aliquam. Nam massa sed, accumsan diam ante cras venenatis viverra, id eget mollis mauris placerat eget massa, in quis in. Justo felis voluptatibus. Ultricies nunc vitae, eu nec elementum ornare risus fringilla nunc. Felis sed. Dignissim vitae orci magna. Pellentesque quos, lorem phasellus duis amet mollit mattis, eget commodo nascetur, aenean sed suscipit mi. Mauris aliquam sagittis sollicitudin felis id odio, wisi amet gravida. Sagittis blandit commodo dictum. Sodales facilisi odio urna, nulla in tincidunt felis. Vehicula lectus integer enim ante quis id, dolor velit mi luctus at.</span></strong></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Eu velit semper tellus sed lacus vehicula, donec suspendisse delectus ut consectetuer explicabo, facilisis dui at mollis non, sodales neque. Metus nunc est, dolor donec id sed nonummy magna in. Ultricies quam ut. Sed lorem justo magna eget, nec laoreet lectus vestibulum aenean, eget commodo ut tellus non velit sed, faucibus magna. Turpis sagittis facilisis hac aliquam lacus donec, dolor magnis, vestibulum leo sit amet est nunc. Amet pede hendrerit urna pellentesque morbi libero, taciti magna proin a laoreet eros, justo ultrices morbi, quam tristique id rhoncus nulla augue, erat lectus. Consectetuer curabitur lacinia lorem ut aliquam elit, ac ac, in ullamcorper sollicitudin pellentesque velit elit, sociosqu ultrices mollis aliquet. Eu venenatis aliquet in imperdiet dolor. Ac enim commodo leo commodo eu fugiat. Nec at, tristique nulla in eu velit, adipiscing ligula varius. Id praesentium eros dictum.</span></p>
<p style="font-size: 12px; font-family: arial, helvetica, sans-serif; margin-bottom: 0px; background-color: #ffffff;" align="justify"><span style="font-size: 12pt;">Et ac vel eros odio mauris, est vel mus magna bibendum erat adipiscing, donec odio vel eros cras proin. Porta torquent feugiat justo dictum, in sed, et lacus quam eu mi tellus, sapien sit nulla. Leo mus massa vehicula, massa potenti egestas aliquam, morbi faucibus blandit. Suscipit elit, massa nisl id, quam scelerisque euismod eleifend vivamus. Mi vitae ac, viverra rhoncus feugiat maecenas wisi sodales, justo vivamus suscipit nibh dictumst erat sed, felis ad sodales, integer tempor nulla. Felis lectus morbi in consectetuer wisi, varius hac sed cras sit scelerisque nec, pretium varius rhoncus, eget erat parturient nulla ante netus elit. Ac in pellentesque maxime id in, lectus dictum eleifend sed, eget et laoreet, sem urna condimentum placerat lectus mauris. Tincidunt mauris libero purus maecenas.</span></p>', 2)
INSERT [dbo].[turismo] ([id], [nome], [data_cadastro], [id_distrito], [localizacao], [inactivo], [foto_capa], [descricao], [id_categoria]) VALUES (2, N'Praia Fernao Veloso', CAST(N'2020-03-05 12:14:29.443' AS DateTime), 2, N'Nacala-Porto', 0, N'LocalTuristico532020121618_2.jpg', N'teste', 1)
INSERT [dbo].[turismo] ([id], [nome], [data_cadastro], [id_distrito], [localizacao], [inactivo], [foto_capa], [descricao], [id_categoria]) VALUES (3, N'Praia Fernao Veloso', CAST(N'2020-03-12 16:06:25.140' AS DateTime), 2, N'Maputo', 0, N'LocalTuristico123202016635_3.jpg', N'<p><strong><span style="font-size: 12pt;">Dize arma va crer como na fara alto ja no. Estranhado temperadas faltadisse tu reconduzir as conquistar. No fizesse reposto ii crearam abencoe ha no capital. Um resfolegar um trauteando la gracejando. Apanhar penosos acceita revelas sr lagrima ar. Cousa dia rugir fez ala amola rir. Proprio senhora auxilio do subindo prompto na. Ternura nos aos pau vou criadas conscio. Tratado foi deixado aquella boa vontade.&nbsp;</span></strong></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Os olhe irei juro ande iv ou. Solta le um seiva eu massa bisca. Os quiz ja alas eu ii cale. Tem mal mysteriosa competente ver combatente tel obtemperou detivessem. Permanente accumulado as obedeceres la mo agremiacao ca. Primitivas permanecia ah em entregando ja. Ordens fim ias perdiz fallar dignos faltam alento bom. Amor vejo amam duas dou foi das pae.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Cova seja aza tem arma. Craves pae duvida quizer agrada via trazia fallas mas. Ar oh rapazes eu apavora cerebro abrindo artista pussera. Offerece hei sae gradeado calculos mostrara proposto nas sem perdicao. Diabo da curta so ambos temos prova legou do. Percorrer ca va commocoes espadaudo ti eu. Eu logar treme chama tu vamos ou. Mas antes caldo vende ouviu olhos rir tao tal.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Vivacidade primitivas na ha ou nobilitado so individual. Oh lh accordo sumiram iv andados ia rejeita entendo. Espalmada em as encerrado eu de recebendo. Pena vens tu meio so pois. Principiou sympathico um ao recolhendo tu disparates interrogou. Luz nao explico oucamos alargue sujeita. Mim mau romper bocado estava sou.&nbsp;</span></p>
<p>&nbsp;</p>
<p><span style="font-size: 12pt;">Veu artificial morigerado despenhava ceo affirmares mazzantini igualmente. Ha operem de ou cravae pessoa tentar es. Repellao em conhecer deixasse admissao sr floretes eu quereria. Muda nojo cada ca os semi de umas veja. Vae vou vedes fique disse amo. Distingam lei distincto mas tormentos sim compaixao sua badaladas respondia. De obediente sr abracando ja em desfitava. Jogo da na face sr eu juro.&nbsp;</span></p>', 1)
SET IDENTITY_INSERT [dbo].[turismo] OFF
SET IDENTITY_INSERT [dbo].[turismo_categoria] ON 

INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (1, N'turismo teste1', N'noimage.png')
INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (2, N'turismo teste 2', N'noimage.png')
SET IDENTITY_INSERT [dbo].[turismo_categoria] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (1, N'Aministrador', N'admin@mussika.co.mz', N'hjaXldGSJhaiisXuEHM6gJga31QYwcss0We71W0ysY4oFcVKHSS4bnLAro6Q8zfBLcusb91OMQjxVjMbSWGiuY7ik8I1ZSreaM4+reZjzh0S1+r3X8BlYndnrISn6xyE', 1, CAST(N'2019-12-18 13:46:04.437' AS DateTime), NULL, 1, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (16, N'Isumbane', N'inaciojrsumbane@gmail.com', N'NZPG7XR8rOVwwwXB2oLXRNVnxpAMztKc6a/f8CgEpPi8KOfYkXRUhXsC1fTNPDZEzc6lDSuKLzwxmzD+ikJVHlkWaIYIqOTB66PA7PXSya+vP3xQMu1dKg2yW3gFAS15', 1, CAST(N'2019-12-29 01:29:52.920' AS DateTime), N'843327', 0, NULL, 1, N'258848631601', NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (19, N'Júnior Pires Alide', N'2443042385780655@mussika.co.mz', N'tgmREXnZQtLOPxXnNlynJLoIpjSCHd1lVu5Zb8EQo9LrEXHyl9fHTDIAY5Ws4kYul0uwyvJQ3aql1hkqqL7N4lvIM6IBupq5T+BY2zAIEBeGwkNgWmmOkuxNJD+uvXHz', 1, CAST(N'2019-12-30 18:58:29.443' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (20, N'junior pires', N'118177461552061077467@mussika.co.mz', N'3jzWgbchzXV9FV3BHGSIEHKHGGRSJzqbRXiojpGNADq0CYiT4iu9wn0RHqoE4c7WdsAV60DS+9+2vwseU9xIjolMwGN9QssIKbGv6dMPEAS0YErO+AOCH5tugHt8pTJ/', 1, CAST(N'2020-01-03 01:49:10.543' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (22, N'Junior Braz', N'1444361629073788@mussika.co.mz', N'DqH2O37g3qqrwSvMWTmn7tACrdZ2iJkGHIvfeqpZZYiS45aw7+gPbukPa50XMv/Cf1ZfAenm3M6Qi0+h3nXGoLF8Ly3W4ZnOgYxl10Sw1V5VgfB5h4Aqi2uAVdN9Pvjk', 1, CAST(N'2020-01-07 16:43:13.083' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (31, N'jpires', N'junior.alide007@gmail.com', N'XzP7SoG75CBHN9Ltwu00DQM3cUPu3zcYOXzqUUGUNFDbEVASOOFgffnf43gaJKMfdDj8rqVmIFxRAQiXrKweuXrFsJJlZxaIfPSllctoy00fQVikRCVv3rzql4mJ+NO0', 1, CAST(N'2020-01-09 18:26:03.560' AS DateTime), N'917777', 1, NULL, 1, N'842338251', NULL, N'usuario31210320201138messias-maricoa-vou-me-dizer-yah-letra-lyric.jpg')
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (32, N'Wilson Maia', N'wilsonmaia04@gmail.com', N'edbdvPHYjNwZcOr+qFb+O3fGMx/sF2Baz0FhO6BKNitWv9P0u7FlbuDH8kJ1D744FQiNAjoBoYsARcJBlg0AIoPiEAwJbJ9uYtZgYjJKX+SOh10GB2+nrfAeg4klXZnd', 1, CAST(N'2020-01-10 12:24:33.923' AS DateTime), N'978875', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (33, N'jpires', N'jpires@mozsistemas.co.mz', N'iSY58NbG1aPPqif3APqjQ2Gk1afQ7SFhO5ATqUwCqYqJXJgWL6ksxBheSw9WFbydupAlm+BDs7610nrVeZlz85OfLCVSBC5b12RwXwdo2Fn9YCtK0jAOV13Wcv1HIZ25', 1, CAST(N'2020-01-11 10:38:58.380' AS DateTime), N'315036', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (34, N'Afane Eduardo Momade', N'clivafan@gmail.com', N'LirgKfJffw5VkcobphcGuglZ366uLKd4HBpnnrKj4A2MFoAg3usMSzidmyl8C5hIvKUO/hdrlrN7LwIOlxkxWSOinhiFpLXW5V3BLNg7bCmMeTIxg7GxnVRyjqddhnrF', 1, CAST(N'2020-01-12 20:45:28.473' AS DateTime), N'078473', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (35, N'Nando Zacarias Vontade Bernardo', N'nazvobe.jr@gmail.com', N'pEVIz3Tre7sUatx5A4zYUquViLIoOCatKwph8zTJE84By83WgwsiL21xC7nkoqULr30154EcV05C15o6p7ioXi1bw9coNv+t62LI/bF1ZvlLVH2Xz/eCraoPvGKSMMXw', 0, CAST(N'2020-01-15 08:47:47.123' AS DateTime), N'924378', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (36, N'Aldes', N'Aldescarlos007@gmail.com', N'MO3fCqZeDilXjqd+lMiOI9L+r1kB8IIqt8Ff+0Ctb2//iW8TBfir9t2hfy6ir1QH+3wDcwSptlShherG56eZepsh12Y4/DdQqLJsTs/Zs/VNCd3HY4CYZsh3VLa9a4oe', 1, CAST(N'2020-01-19 08:13:49.707' AS DateTime), N'786798', 1, NULL, 1, N'861062910', NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (37, N'Maússe', N'quilasmausse@gmail.com', N'vFECges57miBXrUYRMTf+zr+7N95NVkMES0P9TBzVBSrmzbdKld/w0yHhON/Oa5pOzVIRNc1hTfZYv2d+zNpJwxLwdez/j5l8HR6q23zg3UlSVVGtJ8udoNplCRn7gwW', 1, CAST(N'2020-01-19 11:57:24.477' AS DateTime), N'716074', 1, NULL, 1, N'+258870486262', NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (38, N'Quisito Alface', N'qalface@gmail.com', N'VHPL33AqsXxywwqr0QjRW3nstp7R4k94C5UJh5295L9Ug2aHbYF5CINgFyckll/uqQCKxyOqo8FyhV2X0GSjZX9kpI6jp/oAB/HtmQYM0KRFavM0NqSwNurY20CAxxnM', 0, CAST(N'2020-01-20 18:15:06.167' AS DateTime), N'110848', 0, NULL, 1, N'847160755', NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (39, N'cpc', N'cpc.quel@gmail.com', N'96S9h1hsVWkOpLzUH8Ck9eW4sTwgAae9AUIpefdl+Ifoy05fyAEuowYKoSWsSD8LihyPhKK3moRBSLdKNCeLwXqAqwCu7Q7kDo0F1Z2ldZ/k39ygdbXhM241TABqiDrV', 0, CAST(N'2020-01-21 10:13:00.183' AS DateTime), N'230245', 0, NULL, 1, N'844125221', NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (40, N'Salvador', N'slvdrelias@gmail.com', N'vHHp5NJH/Y1iIZXCcNqAjXOkkMsZBU2K+jX1fj+ULX6rLXeLhPACBgNsU33+gxTPiKSPQo8hudfOmL4PZXcAjKKDKsMMEqrR6+cm3QGJr8HATg80Wx4Qy1tZxNPvuCKq', 1, CAST(N'2020-01-22 23:44:05.690' AS DateTime), N'898071', 1, NULL, 1, N'258870735782', NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (41, N'Salvador Elias Moiane', N'102737956361126933681@mussika.co.mz', N'dqpJrGLlrHY2U243s4o6WeiSo8RhEUfcNvqeQg/DiFyI5xk9krPhAWI11ImwwE86aXZTiksf6D+QiOCTCvUJvsYqPq7xSIHHqAWozLaO/CTAYRVzCtSgsju3CrJ3KvhM', 1, CAST(N'2020-01-25 04:46:54.353' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[usuario_tipo] ON 

INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (1, N'NORMAL')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (2, N'ADMINISTRADOR')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (3, N'SUPER ADMINISTRADOR')
SET IDENTITY_INSERT [dbo].[usuario_tipo] OFF
SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] ON 

INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (10, 16, CAST(N'2019-12-29 01:51:20.487' AS DateTime), 1, NULL, N'744351', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (17, 31, CAST(N'2020-01-09 18:26:32.960' AS DateTime), 1, NULL, N'614044', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (18, 32, CAST(N'2020-01-10 12:25:29.980' AS DateTime), 1, NULL, N'978875

', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (19, 31, CAST(N'2020-01-11 10:09:34.363' AS DateTime), 1, NULL, N'075658', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (20, 16, CAST(N'2020-01-11 10:26:12.210' AS DateTime), 1, NULL, N'820545', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (21, 33, CAST(N'2020-01-11 10:40:58.630' AS DateTime), 1, NULL, N'620335', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (22, 33, CAST(N'2020-01-11 10:45:49.173' AS DateTime), 1, NULL, N'363238', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (23, 34, CAST(N'2020-01-12 20:46:20.480' AS DateTime), 1, NULL, N'078473', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (24, 36, CAST(N'2020-01-19 08:14:58.883' AS DateTime), 1, NULL, N'786798', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (25, 37, CAST(N'2020-01-19 11:58:19.063' AS DateTime), 1, NULL, N'716074', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (26, 40, CAST(N'2020-01-22 23:45:43.597' AS DateTime), 1, NULL, N'898071', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (27, 31, CAST(N'2020-03-09 12:11:23.237' AS DateTime), 1, NULL, N'975626', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (28, 31, CAST(N'2020-03-09 12:19:10.567' AS DateTime), 1, NULL, N'917777', N'Autenticado')
SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] OFF
ALTER TABLE [dbo].[acomodacao]  WITH CHECK ADD  CONSTRAINT [FK_acomodacao_acomodacao_tipo] FOREIGN KEY([id_acomodacao_tipo])
REFERENCES [dbo].[acomodacao_tipo] ([id])
GO
ALTER TABLE [dbo].[acomodacao] CHECK CONSTRAINT [FK_acomodacao_acomodacao_tipo]
GO
ALTER TABLE [dbo].[acomodacao]  WITH CHECK ADD  CONSTRAINT [FK_acomodacao_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[acomodacao] CHECK CONSTRAINT [FK_acomodacao_distrito]
GO
ALTER TABLE [dbo].[acomodacao_classificacao]  WITH CHECK ADD  CONSTRAINT [FK_acomodacao_classificacao_acomodacao] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[acomodacao_classificacao] CHECK CONSTRAINT [FK_acomodacao_classificacao_acomodacao]
GO
ALTER TABLE [dbo].[acomodacao_comentario]  WITH CHECK ADD  CONSTRAINT [FK_acomodacao_comentario_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[acomodacao_comentario] CHECK CONSTRAINT [FK_acomodacao_comentario_Usuario]
GO
ALTER TABLE [dbo].[acomodacao_disponibilidade]  WITH CHECK ADD  CONSTRAINT [FK_acomodacao_disponibilidade_acomodacao_quarto] FOREIGN KEY([id_acomodacao_quarto])
REFERENCES [dbo].[acomodacao_quarto] ([id])
GO
ALTER TABLE [dbo].[acomodacao_disponibilidade] CHECK CONSTRAINT [FK_acomodacao_disponibilidade_acomodacao_quarto]
GO
ALTER TABLE [dbo].[acomodacao_foto]  WITH CHECK ADD  CONSTRAINT [FK_acomodacao_foto_acomodacao] FOREIGN KEY([id_acomodacao])
REFERENCES [dbo].[acomodacao] ([id])
GO
ALTER TABLE [dbo].[acomodacao_foto] CHECK CONSTRAINT [FK_acomodacao_foto_acomodacao]
GO
ALTER TABLE [dbo].[acomodacao_quarto]  WITH CHECK ADD  CONSTRAINT [FK_acomodacao_quarto_acomodacao] FOREIGN KEY([id_acomodacao])
REFERENCES [dbo].[acomodacao] ([id])
GO
ALTER TABLE [dbo].[acomodacao_quarto] CHECK CONSTRAINT [FK_acomodacao_quarto_acomodacao]
GO
ALTER TABLE [dbo].[acomodacao_servico]  WITH CHECK ADD  CONSTRAINT [FK_acomodacao_servicos_acomodacao] FOREIGN KEY([id_acomodacao])
REFERENCES [dbo].[acomodacao] ([id])
GO
ALTER TABLE [dbo].[acomodacao_servico] CHECK CONSTRAINT [FK_acomodacao_servicos_acomodacao]
GO
ALTER TABLE [dbo].[artigo]  WITH CHECK ADD  CONSTRAINT [FK_artigo_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[artigo] CHECK CONSTRAINT [FK_artigo_distrito]
GO
ALTER TABLE [dbo].[artigo]  WITH CHECK ADD  CONSTRAINT [FK_artigo_tipo_artigo] FOREIGN KEY([id_categoria_artigo])
REFERENCES [dbo].[categoria_artigo] ([id])
GO
ALTER TABLE [dbo].[artigo] CHECK CONSTRAINT [FK_artigo_tipo_artigo]
GO
ALTER TABLE [dbo].[artigo_imagem]  WITH CHECK ADD  CONSTRAINT [FK_artigo_imagem_artigo] FOREIGN KEY([id_artigo])
REFERENCES [dbo].[artigo] ([id])
GO
ALTER TABLE [dbo].[artigo_imagem] CHECK CONSTRAINT [FK_artigo_imagem_artigo]
GO
ALTER TABLE [dbo].[artista_obra]  WITH CHECK ADD  CONSTRAINT [FK_artista_obra_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[artista_obra] CHECK CONSTRAINT [FK_artista_obra_distrito]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_acomodacao] FOREIGN KEY([id_acomodacao])
REFERENCES [dbo].[acomodacao] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_acomodacao]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_acomodacao_quarto] FOREIGN KEY([id_quarto])
REFERENCES [dbo].[acomodacao_quarto] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_acomodacao_quarto]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_artigo] FOREIGN KEY([id_artigo])
REFERENCES [dbo].[artigo] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_artigo]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_evento] FOREIGN KEY([id_evento])
REFERENCES [dbo].[evento] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_evento]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_farmacia_produto] FOREIGN KEY([id_farmacia_produto])
REFERENCES [dbo].[farmacia_produto] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_farmacia_produto]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_filme] FOREIGN KEY([id_filme])
REFERENCES [dbo].[filme] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_filme]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_loja_produto] FOREIGN KEY([id_loja_produto])
REFERENCES [dbo].[loja_produto] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_loja_produto]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_musica] FOREIGN KEY([id_musica])
REFERENCES [dbo].[musica] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_musica]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_obra_arte] FOREIGN KEY([id_obra])
REFERENCES [dbo].[obra_arte] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_obra_arte]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_restaurante] FOREIGN KEY([id_restaurante])
REFERENCES [dbo].[restaurante] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_restaurante]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_taxi] FOREIGN KEY([id_taxi])
REFERENCES [dbo].[taxi] ([id])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_taxi]
GO
ALTER TABLE [dbo].[carrinho_compra]  WITH CHECK ADD  CONSTRAINT [FK_carrinho_compra_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[carrinho_compra] CHECK CONSTRAINT [FK_carrinho_compra_Usuario]
GO
ALTER TABLE [dbo].[cinema]  WITH CHECK ADD  CONSTRAINT [FK_cinema_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[cinema] CHECK CONSTRAINT [FK_cinema_distrito]
GO
ALTER TABLE [dbo].[cinema_sessao]  WITH CHECK ADD  CONSTRAINT [FK_cinema_sessao_cinema] FOREIGN KEY([id_cinema])
REFERENCES [dbo].[cinema] ([id])
GO
ALTER TABLE [dbo].[cinema_sessao] CHECK CONSTRAINT [FK_cinema_sessao_cinema]
GO
ALTER TABLE [dbo].[cinema_sessao]  WITH CHECK ADD  CONSTRAINT [FK_cinema_sessao_filme] FOREIGN KEY([id_filme])
REFERENCES [dbo].[filme] ([id])
GO
ALTER TABLE [dbo].[cinema_sessao] CHECK CONSTRAINT [FK_cinema_sessao_filme]
GO
ALTER TABLE [dbo].[clinica]  WITH CHECK ADD  CONSTRAINT [FK_clinica_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[clinica] CHECK CONSTRAINT [FK_clinica_distrito]
GO
ALTER TABLE [dbo].[distrito_classificacao]  WITH CHECK ADD  CONSTRAINT [FK_distrito_classificacao_distrito1] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[distrito_classificacao] CHECK CONSTRAINT [FK_distrito_classificacao_distrito1]
GO
ALTER TABLE [dbo].[distrito_classificacao]  WITH CHECK ADD  CONSTRAINT [FK_distrito_classificacao_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[distrito_classificacao] CHECK CONSTRAINT [FK_distrito_classificacao_Usuario]
GO
ALTER TABLE [dbo].[distrito_comentario]  WITH CHECK ADD  CONSTRAINT [FK_distrito_comentario_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[distrito_comentario] CHECK CONSTRAINT [FK_distrito_comentario_distrito]
GO
ALTER TABLE [dbo].[distrito_comentario]  WITH CHECK ADD  CONSTRAINT [FK_distrito_comentario_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[distrito_comentario] CHECK CONSTRAINT [FK_distrito_comentario_Usuario]
GO
ALTER TABLE [dbo].[distrito_foto]  WITH CHECK ADD  CONSTRAINT [FK_distrito_foto_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[distrito_foto] CHECK CONSTRAINT [FK_distrito_foto_distrito]
GO
ALTER TABLE [dbo].[entidade_cultural]  WITH CHECK ADD  CONSTRAINT [FK_entidade_cultural_categoria_cultura] FOREIGN KEY([id_categoria_cultura])
REFERENCES [dbo].[categoria_cultura] ([id])
GO
ALTER TABLE [dbo].[entidade_cultural] CHECK CONSTRAINT [FK_entidade_cultural_categoria_cultura]
GO
ALTER TABLE [dbo].[evento]  WITH CHECK ADD  CONSTRAINT [FK_evento_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[evento] CHECK CONSTRAINT [FK_evento_distrito]
GO
ALTER TABLE [dbo].[evento]  WITH CHECK ADD  CONSTRAINT [FK_evento_evento_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[evento_categoria] ([id])
GO
ALTER TABLE [dbo].[evento] CHECK CONSTRAINT [FK_evento_evento_categoria]
GO
ALTER TABLE [dbo].[evento_comentario]  WITH CHECK ADD  CONSTRAINT [FK_evento_comentario_evento] FOREIGN KEY([id_evento])
REFERENCES [dbo].[evento] ([id])
GO
ALTER TABLE [dbo].[evento_comentario] CHECK CONSTRAINT [FK_evento_comentario_evento]
GO
ALTER TABLE [dbo].[evento_comentario]  WITH CHECK ADD  CONSTRAINT [FK_evento_comentario_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[evento_comentario] CHECK CONSTRAINT [FK_evento_comentario_Usuario]
GO
ALTER TABLE [dbo].[farmacia]  WITH CHECK ADD  CONSTRAINT [FK_farmacia_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[farmacia] CHECK CONSTRAINT [FK_farmacia_distrito]
GO
ALTER TABLE [dbo].[farmacia_produto]  WITH CHECK ADD  CONSTRAINT [FK_farmacia_produto_farmacia] FOREIGN KEY([id_farmacia])
REFERENCES [dbo].[farmacia] ([id])
GO
ALTER TABLE [dbo].[farmacia_produto] CHECK CONSTRAINT [FK_farmacia_produto_farmacia]
GO
ALTER TABLE [dbo].[hospital]  WITH CHECK ADD  CONSTRAINT [FK_hospital_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[hospital] CHECK CONSTRAINT [FK_hospital_distrito]
GO
ALTER TABLE [dbo].[item_filme_categoria]  WITH CHECK ADD  CONSTRAINT [FK_item_filme_categoria_filme] FOREIGN KEY([id_filme])
REFERENCES [dbo].[filme] ([id])
GO
ALTER TABLE [dbo].[item_filme_categoria] CHECK CONSTRAINT [FK_item_filme_categoria_filme]
GO
ALTER TABLE [dbo].[item_filme_categoria]  WITH CHECK ADD  CONSTRAINT [FK_item_filme_categoria_filme_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[filme_categoria] ([id])
GO
ALTER TABLE [dbo].[item_filme_categoria] CHECK CONSTRAINT [FK_item_filme_categoria_filme_categoria]
GO
ALTER TABLE [dbo].[item_pacote_subscricao]  WITH CHECK ADD  CONSTRAINT [FK_item_pacote_subscricao_pacote_subscricao] FOREIGN KEY([id_pacote_subscricao])
REFERENCES [dbo].[pacote_subscricao] ([id])
GO
ALTER TABLE [dbo].[item_pacote_subscricao] CHECK CONSTRAINT [FK_item_pacote_subscricao_pacote_subscricao]
GO
ALTER TABLE [dbo].[loja]  WITH CHECK ADD  CONSTRAINT [FK_loja_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[loja] CHECK CONSTRAINT [FK_loja_distrito]
GO
ALTER TABLE [dbo].[loja]  WITH CHECK ADD  CONSTRAINT [FK_loja_loja_tipo] FOREIGN KEY([id_tipo_loja])
REFERENCES [dbo].[loja_tipo] ([id])
GO
ALTER TABLE [dbo].[loja] CHECK CONSTRAINT [FK_loja_loja_tipo]
GO
ALTER TABLE [dbo].[loja_produto]  WITH CHECK ADD  CONSTRAINT [FK_loja_produto_loja] FOREIGN KEY([id_loja])
REFERENCES [dbo].[loja] ([id])
GO
ALTER TABLE [dbo].[loja_produto] CHECK CONSTRAINT [FK_loja_produto_loja]
GO
ALTER TABLE [dbo].[loja_produto]  WITH CHECK ADD  CONSTRAINT [FK_loja_produto_produto_categoria] FOREIGN KEY([categoria])
REFERENCES [dbo].[produto_categoria] ([id])
GO
ALTER TABLE [dbo].[loja_produto] CHECK CONSTRAINT [FK_loja_produto_produto_categoria]
GO
ALTER TABLE [dbo].[musica]  WITH CHECK ADD  CONSTRAINT [FK_musica_artista_obra] FOREIGN KEY([id_artista_obra])
REFERENCES [dbo].[artista_obra] ([id])
GO
ALTER TABLE [dbo].[musica] CHECK CONSTRAINT [FK_musica_artista_obra]
GO
ALTER TABLE [dbo].[musica]  WITH CHECK ADD  CONSTRAINT [FK_musica_genero_musical] FOREIGN KEY([id_genero_musical])
REFERENCES [dbo].[genero_musical] ([id])
GO
ALTER TABLE [dbo].[musica] CHECK CONSTRAINT [FK_musica_genero_musical]
GO
ALTER TABLE [dbo].[obra_arte]  WITH CHECK ADD  CONSTRAINT [FK_obra_arte_artista_obra] FOREIGN KEY([id_artista_obra])
REFERENCES [dbo].[artista_obra] ([id])
GO
ALTER TABLE [dbo].[obra_arte] CHECK CONSTRAINT [FK_obra_arte_artista_obra]
GO
ALTER TABLE [dbo].[obra_arte]  WITH CHECK ADD  CONSTRAINT [FK_obra_arte_categoria_obra_arte] FOREIGN KEY([id_categoria_obra])
REFERENCES [dbo].[categoria_obra_arte] ([id])
GO
ALTER TABLE [dbo].[obra_arte] CHECK CONSTRAINT [FK_obra_arte_categoria_obra_arte]
GO
ALTER TABLE [dbo].[obra_arte_imagem]  WITH CHECK ADD  CONSTRAINT [FK_obra_arte_imagem_obra_arte] FOREIGN KEY([id_obra_arte])
REFERENCES [dbo].[obra_arte] ([id])
GO
ALTER TABLE [dbo].[obra_arte_imagem] CHECK CONSTRAINT [FK_obra_arte_imagem_obra_arte]
GO
ALTER TABLE [dbo].[produto]  WITH CHECK ADD  CONSTRAINT [FK_produto_tipo_produto] FOREIGN KEY([id_tipo_produto])
REFERENCES [dbo].[tipo_produto] ([id])
GO
ALTER TABLE [dbo].[produto] CHECK CONSTRAINT [FK_produto_tipo_produto]
GO
ALTER TABLE [dbo].[restaurante]  WITH CHECK ADD  CONSTRAINT [FK_restaurante_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[restaurante] CHECK CONSTRAINT [FK_restaurante_distrito]
GO
ALTER TABLE [dbo].[restaurante]  WITH CHECK ADD  CONSTRAINT [FK_restaurante_restaurante_tipo] FOREIGN KEY([id_restaurante_tipo])
REFERENCES [dbo].[restaurante_tipo] ([id])
GO
ALTER TABLE [dbo].[restaurante] CHECK CONSTRAINT [FK_restaurante_restaurante_tipo]
GO
ALTER TABLE [dbo].[restaurante_classificacao]  WITH CHECK ADD  CONSTRAINT [FK_restaurante_classificacao_restaurante] FOREIGN KEY([id_restaurante])
REFERENCES [dbo].[restaurante] ([id])
GO
ALTER TABLE [dbo].[restaurante_classificacao] CHECK CONSTRAINT [FK_restaurante_classificacao_restaurante]
GO
ALTER TABLE [dbo].[restaurante_classificacao]  WITH CHECK ADD  CONSTRAINT [FK_Restaurante_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[restaurante_classificacao] CHECK CONSTRAINT [FK_Restaurante_usuario]
GO
ALTER TABLE [dbo].[restaurante_comentario]  WITH CHECK ADD  CONSTRAINT [FK_restaurante_comentario_usuario] FOREIGN KEY([id_restaurante])
REFERENCES [dbo].[restaurante] ([id])
GO
ALTER TABLE [dbo].[restaurante_comentario] CHECK CONSTRAINT [FK_restaurante_comentario_usuario]
GO
ALTER TABLE [dbo].[restaurante_comentario]  WITH CHECK ADD  CONSTRAINT [FK_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[restaurante_comentario] CHECK CONSTRAINT [FK_usuario]
GO
ALTER TABLE [dbo].[restaurante_foto]  WITH CHECK ADD  CONSTRAINT [FK_restaurante_foto_restaurante] FOREIGN KEY([id_restaurante])
REFERENCES [dbo].[restaurante] ([id])
GO
ALTER TABLE [dbo].[restaurante_foto] CHECK CONSTRAINT [FK_restaurante_foto_restaurante]
GO
ALTER TABLE [dbo].[restaurante_prato]  WITH CHECK ADD  CONSTRAINT [FK_restaurante_prato_restaurante] FOREIGN KEY([id_resturante])
REFERENCES [dbo].[restaurante] ([id])
GO
ALTER TABLE [dbo].[restaurante_prato] CHECK CONSTRAINT [FK_restaurante_prato_restaurante]
GO
ALTER TABLE [dbo].[restaurante_prato]  WITH CHECK ADD  CONSTRAINT [FK_restaurante_prato_restaurante_prato_categoria] FOREIGN KEY([id__prato_categoria])
REFERENCES [dbo].[restaurante_prato_categoria] ([id])
GO
ALTER TABLE [dbo].[restaurante_prato] CHECK CONSTRAINT [FK_restaurante_prato_restaurante_prato_categoria]
GO
ALTER TABLE [dbo].[servico]  WITH CHECK ADD  CONSTRAINT [FK_servico_categoria_servico] FOREIGN KEY([id_servico_categoria])
REFERENCES [dbo].[servico_categoria] ([id])
GO
ALTER TABLE [dbo].[servico] CHECK CONSTRAINT [FK_servico_categoria_servico]
GO
ALTER TABLE [dbo].[servico]  WITH CHECK ADD  CONSTRAINT [FK_servico_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[servico] CHECK CONSTRAINT [FK_servico_distrito]
GO
ALTER TABLE [dbo].[servico_foto]  WITH CHECK ADD  CONSTRAINT [FK_servico_foto_servico] FOREIGN KEY([id_servico])
REFERENCES [dbo].[servico] ([id])
GO
ALTER TABLE [dbo].[servico_foto] CHECK CONSTRAINT [FK_servico_foto_servico]
GO
ALTER TABLE [dbo].[taxi]  WITH CHECK ADD  CONSTRAINT [FK_taxi_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[taxi] CHECK CONSTRAINT [FK_taxi_distrito]
GO
ALTER TABLE [dbo].[taxi]  WITH CHECK ADD  CONSTRAINT [FK_taxi_taxi_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[taxi_categoria] ([id])
GO
ALTER TABLE [dbo].[taxi] CHECK CONSTRAINT [FK_taxi_taxi_categoria]
GO
ALTER TABLE [dbo].[turismo]  WITH CHECK ADD  CONSTRAINT [FK_turismo_distrito] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[distrito] ([id])
GO
ALTER TABLE [dbo].[turismo] CHECK CONSTRAINT [FK_turismo_distrito]
GO
ALTER TABLE [dbo].[turismo]  WITH CHECK ADD  CONSTRAINT [FK_turismo_turismo_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[turismo_categoria] ([id])
GO
ALTER TABLE [dbo].[turismo] CHECK CONSTRAINT [FK_turismo_turismo_categoria]
GO
ALTER TABLE [dbo].[turismo_comentario]  WITH CHECK ADD  CONSTRAINT [FK_turismo_comentario_turismo] FOREIGN KEY([id_turismo])
REFERENCES [dbo].[turismo] ([id])
GO
ALTER TABLE [dbo].[turismo_comentario] CHECK CONSTRAINT [FK_turismo_comentario_turismo]
GO
ALTER TABLE [dbo].[turismo_comentario]  WITH CHECK ADD  CONSTRAINT [FK_turismo_comentario_Usuario] FOREIGN KEY([id_turismo])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[turismo_comentario] CHECK CONSTRAINT [FK_turismo_comentario_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_usuario_tipo] FOREIGN KEY([id_usuario_tipo])
REFERENCES [dbo].[usuario_tipo] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_usuario_tipo]
GO
ALTER TABLE [dbo].[usuario_favorito]  WITH CHECK ADD  CONSTRAINT [FK_usuario_favorito_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[usuario_favorito] CHECK CONSTRAINT [FK_usuario_favorito_Usuario]
GO
ALTER TABLE [dbo].[UsuarioAutenticacao]  WITH CHECK ADD  CONSTRAINT [FK_Autenticacao_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[UsuarioAutenticacao] CHECK CONSTRAINT [FK_Autenticacao_Usuario]
GO
ALTER TABLE [dbo].[UsuarioSessao]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioSessao_Usuario] FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[UsuarioSessao] CHECK CONSTRAINT [FK_UsuarioSessao_Usuario]
GO
USE [master]
GO
ALTER DATABASE [mussika_bd] SET  READ_WRITE 
GO
