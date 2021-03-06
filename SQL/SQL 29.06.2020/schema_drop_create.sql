USE [mussika_bd]
GO
ALTER TABLE [dbo].[UsuarioSessao] DROP CONSTRAINT [FK_UsuarioSessao_Usuario]
GO
ALTER TABLE [dbo].[UsuarioAutenticacao] DROP CONSTRAINT [FK_Autenticacao_Usuario]
GO
ALTER TABLE [dbo].[usuario_provedor] DROP CONSTRAINT [FK_usuario_provedor_Usuario]
GO
ALTER TABLE [dbo].[usuario_favorito] DROP CONSTRAINT [FK_usuario_favorito_Usuario]
GO
ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_Usuario1]
GO
ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_usuario_tipo]
GO
ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_Usuario]
GO
ALTER TABLE [dbo].[turismo_comentario] DROP CONSTRAINT [FK_turismo_comentario_Usuario]
GO
ALTER TABLE [dbo].[turismo_comentario] DROP CONSTRAINT [FK_turismo_comentario_turismo]
GO
ALTER TABLE [dbo].[turismo] DROP CONSTRAINT [FK_turismo_turismo_categoria]
GO
ALTER TABLE [dbo].[turismo] DROP CONSTRAINT [FK_turismo_distrito]
GO
ALTER TABLE [dbo].[taxi] DROP CONSTRAINT [FK_taxi_taxi_categoria]
GO
ALTER TABLE [dbo].[taxi] DROP CONSTRAINT [FK_taxi_distrito]
GO
ALTER TABLE [dbo].[servico_foto] DROP CONSTRAINT [FK_servico_foto_servico]
GO
ALTER TABLE [dbo].[servico] DROP CONSTRAINT [FK_servico_distrito]
GO
ALTER TABLE [dbo].[servico] DROP CONSTRAINT [FK_servico_categoria_servico]
GO
ALTER TABLE [dbo].[restaurante_prato] DROP CONSTRAINT [FK_restaurante_prato_restaurante_prato_categoria]
GO
ALTER TABLE [dbo].[restaurante_prato] DROP CONSTRAINT [FK_restaurante_prato_restaurante]
GO
ALTER TABLE [dbo].[restaurante_foto] DROP CONSTRAINT [FK_restaurante_foto_restaurante]
GO
ALTER TABLE [dbo].[restaurante_comentario] DROP CONSTRAINT [FK_usuario]
GO
ALTER TABLE [dbo].[restaurante_comentario] DROP CONSTRAINT [FK_restaurante_comentario_usuario]
GO
ALTER TABLE [dbo].[restaurante_classificacao] DROP CONSTRAINT [FK_Restaurante_usuario]
GO
ALTER TABLE [dbo].[restaurante_classificacao] DROP CONSTRAINT [FK_restaurante_classificacao_restaurante]
GO
ALTER TABLE [dbo].[restaurante] DROP CONSTRAINT [FK_restaurante_restaurante_tipo]
GO
ALTER TABLE [dbo].[restaurante] DROP CONSTRAINT [FK_restaurante_distrito]
GO
ALTER TABLE [dbo].[produto] DROP CONSTRAINT [FK_produto_tipo_produto]
GO
ALTER TABLE [dbo].[obra_arte_imagem] DROP CONSTRAINT [FK_obra_arte_imagem_obra_arte]
GO
ALTER TABLE [dbo].[obra_arte] DROP CONSTRAINT [FK_obra_arte_categoria_obra_arte]
GO
ALTER TABLE [dbo].[obra_arte] DROP CONSTRAINT [FK_obra_arte_artista_obra]
GO
ALTER TABLE [dbo].[musica] DROP CONSTRAINT [FK_musica_genero_musical]
GO
ALTER TABLE [dbo].[musica] DROP CONSTRAINT [FK_musica_artista_obra]
GO
ALTER TABLE [dbo].[loja_produto] DROP CONSTRAINT [FK_loja_produto_produto_categoria]
GO
ALTER TABLE [dbo].[loja_produto] DROP CONSTRAINT [FK_loja_produto_loja]
GO
ALTER TABLE [dbo].[loja] DROP CONSTRAINT [FK_loja_loja_tipo]
GO
ALTER TABLE [dbo].[loja] DROP CONSTRAINT [FK_loja_distrito]
GO
ALTER TABLE [dbo].[item_pacote_subscricao] DROP CONSTRAINT [FK_item_pacote_subscricao_pacote_subscricao]
GO
ALTER TABLE [dbo].[item_filme_categoria] DROP CONSTRAINT [FK_item_filme_categoria_filme_categoria]
GO
ALTER TABLE [dbo].[item_filme_categoria] DROP CONSTRAINT [FK_item_filme_categoria_filme]
GO
ALTER TABLE [dbo].[hospital] DROP CONSTRAINT [FK_hospital_distrito]
GO
ALTER TABLE [dbo].[farmacia_produto] DROP CONSTRAINT [FK_farmacia_produto_farmacia]
GO
ALTER TABLE [dbo].[farmacia] DROP CONSTRAINT [FK_farmacia_distrito]
GO
ALTER TABLE [dbo].[evento_comentario] DROP CONSTRAINT [FK_evento_comentario_Usuario]
GO
ALTER TABLE [dbo].[evento_comentario] DROP CONSTRAINT [FK_evento_comentario_evento]
GO
ALTER TABLE [dbo].[evento] DROP CONSTRAINT [FK_evento_evento_categoria]
GO
ALTER TABLE [dbo].[evento] DROP CONSTRAINT [FK_evento_distrito]
GO
ALTER TABLE [dbo].[entidade_cultural] DROP CONSTRAINT [FK_entidade_cultural_categoria_cultura]
GO
ALTER TABLE [dbo].[distrito_foto] DROP CONSTRAINT [FK_distrito_foto_distrito]
GO
ALTER TABLE [dbo].[distrito_comentario] DROP CONSTRAINT [FK_distrito_comentario_Usuario]
GO
ALTER TABLE [dbo].[distrito_comentario] DROP CONSTRAINT [FK_distrito_comentario_distrito]
GO
ALTER TABLE [dbo].[distrito_classificacao] DROP CONSTRAINT [FK_distrito_classificacao_Usuario]
GO
ALTER TABLE [dbo].[distrito_classificacao] DROP CONSTRAINT [FK_distrito_classificacao_distrito1]
GO
ALTER TABLE [dbo].[compra] DROP CONSTRAINT [FK_compra_Usuario]
GO
ALTER TABLE [dbo].[clinica] DROP CONSTRAINT [FK_clinica_distrito]
GO
ALTER TABLE [dbo].[cinema_sessao] DROP CONSTRAINT [FK_cinema_sessao_filme]
GO
ALTER TABLE [dbo].[cinema_sessao] DROP CONSTRAINT [FK_cinema_sessao_cinema]
GO
ALTER TABLE [dbo].[cinema] DROP CONSTRAINT [FK_cinema_distrito]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_Usuario]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_taxi]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_restaurante]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_obra_arte]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_musica]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_loja_produto]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_filme]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_farmacia_produto]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_evento]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_artigo]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_acomodacao_quarto]
GO
ALTER TABLE [dbo].[carrinho_compra] DROP CONSTRAINT [FK_carrinho_compra_acomodacao]
GO
ALTER TABLE [dbo].[artista_obra] DROP CONSTRAINT [FK_artista_obra_distrito]
GO
ALTER TABLE [dbo].[artigo_imagem] DROP CONSTRAINT [FK_artigo_imagem_artigo]
GO
ALTER TABLE [dbo].[artigo] DROP CONSTRAINT [FK_artigo_tipo_artigo]
GO
ALTER TABLE [dbo].[artigo] DROP CONSTRAINT [FK_artigo_distrito]
GO
ALTER TABLE [dbo].[acomodacao_servico] DROP CONSTRAINT [FK_acomodacao_servicos_acomodacao]
GO
ALTER TABLE [dbo].[acomodacao_quarto] DROP CONSTRAINT [FK_acomodacao_quarto_acomodacao]
GO
ALTER TABLE [dbo].[acomodacao_foto] DROP CONSTRAINT [FK_acomodacao_foto_acomodacao]
GO
ALTER TABLE [dbo].[acomodacao_disponibilidade] DROP CONSTRAINT [FK_acomodacao_disponibilidade_acomodacao_quarto]
GO
ALTER TABLE [dbo].[acomodacao_comentario] DROP CONSTRAINT [FK_acomodacao_comentario_Usuario]
GO
ALTER TABLE [dbo].[acomodacao_classificacao] DROP CONSTRAINT [FK_acomodacao_classificacao_acomodacao]
GO
ALTER TABLE [dbo].[acomodacao] DROP CONSTRAINT [FK_acomodacao_distrito]
GO
ALTER TABLE [dbo].[acomodacao] DROP CONSTRAINT [FK_acomodacao_acomodacao_tipo]
GO
/****** Object:  Table [dbo].[UsuarioSessao]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[UsuarioSessao]
GO
/****** Object:  Table [dbo].[UsuarioAutenticacao]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[UsuarioAutenticacao]
GO
/****** Object:  Table [dbo].[usuario_tipo]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[usuario_tipo]
GO
/****** Object:  Table [dbo].[usuario_provedor]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[usuario_provedor]
GO
/****** Object:  Table [dbo].[usuario_favorito]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[usuario_favorito]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[turismo_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[turismo_comentario]
GO
/****** Object:  Table [dbo].[turismo_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[turismo_categoria]
GO
/****** Object:  Table [dbo].[turismo]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[turismo]
GO
/****** Object:  Table [dbo].[tipo_produto]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[tipo_produto]
GO
/****** Object:  Table [dbo].[taxi_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[taxi_categoria]
GO
/****** Object:  Table [dbo].[taxi]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[taxi]
GO
/****** Object:  Table [dbo].[servico_foto]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[servico_foto]
GO
/****** Object:  Table [dbo].[servico_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[servico_categoria]
GO
/****** Object:  Table [dbo].[servico]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[servico]
GO
/****** Object:  Table [dbo].[restaurante_tipo]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[restaurante_tipo]
GO
/****** Object:  Table [dbo].[restaurante_prato_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[restaurante_prato_categoria]
GO
/****** Object:  Table [dbo].[restaurante_prato]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[restaurante_prato]
GO
/****** Object:  Table [dbo].[restaurante_foto]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[restaurante_foto]
GO
/****** Object:  Table [dbo].[restaurante_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[restaurante_comentario]
GO
/****** Object:  Table [dbo].[restaurante_classificacao]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[restaurante_classificacao]
GO
/****** Object:  Table [dbo].[restaurante]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[restaurante]
GO
/****** Object:  Table [dbo].[produto_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[produto_categoria]
GO
/****** Object:  Table [dbo].[produto]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[produto]
GO
/****** Object:  Table [dbo].[pacote_subscricao]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[pacote_subscricao]
GO
/****** Object:  Table [dbo].[obra_arte_imagem]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[obra_arte_imagem]
GO
/****** Object:  Table [dbo].[obra_arte]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[obra_arte]
GO
/****** Object:  Table [dbo].[musica]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[musica]
GO
/****** Object:  Table [dbo].[loja_tipo]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[loja_tipo]
GO
/****** Object:  Table [dbo].[loja_produto]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[loja_produto]
GO
/****** Object:  Table [dbo].[loja]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[loja]
GO
/****** Object:  Table [dbo].[item_pacote_subscricao]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[item_pacote_subscricao]
GO
/****** Object:  Table [dbo].[item_filme_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[item_filme_categoria]
GO
/****** Object:  Table [dbo].[hospital]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[hospital]
GO
/****** Object:  Table [dbo].[genero_musical]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[genero_musical]
GO
/****** Object:  Table [dbo].[filme_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[filme_categoria]
GO
/****** Object:  Table [dbo].[filme]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[filme]
GO
/****** Object:  Table [dbo].[farmacia_produto]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[farmacia_produto]
GO
/****** Object:  Table [dbo].[farmacia]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[farmacia]
GO
/****** Object:  Table [dbo].[evento_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[evento_comentario]
GO
/****** Object:  Table [dbo].[evento_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[evento_categoria]
GO
/****** Object:  Table [dbo].[evento]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[evento]
GO
/****** Object:  Table [dbo].[entidade_cultural]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[entidade_cultural]
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[empresa]
GO
/****** Object:  Table [dbo].[distrito_foto]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[distrito_foto]
GO
/****** Object:  Table [dbo].[distrito_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[distrito_comentario]
GO
/****** Object:  Table [dbo].[distrito_classificacao]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[distrito_classificacao]
GO
/****** Object:  Table [dbo].[distrito]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[distrito]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[compra]
GO
/****** Object:  Table [dbo].[clinica]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[clinica]
GO
/****** Object:  Table [dbo].[cinema_sessao]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[cinema_sessao]
GO
/****** Object:  Table [dbo].[cinema]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[cinema]
GO
/****** Object:  Table [dbo].[categoria_obra_arte]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[categoria_obra_arte]
GO
/****** Object:  Table [dbo].[categoria_cultura]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[categoria_cultura]
GO
/****** Object:  Table [dbo].[categoria_artigo]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[categoria_artigo]
GO
/****** Object:  Table [dbo].[carrinho_compra]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[carrinho_compra]
GO
/****** Object:  Table [dbo].[artista_obra]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[artista_obra]
GO
/****** Object:  Table [dbo].[artigo_imagem]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[artigo_imagem]
GO
/****** Object:  Table [dbo].[artigo]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[artigo]
GO
/****** Object:  Table [dbo].[acomodacao_tipo]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[acomodacao_tipo]
GO
/****** Object:  Table [dbo].[acomodacao_servico]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[acomodacao_servico]
GO
/****** Object:  Table [dbo].[acomodacao_reserva]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[acomodacao_reserva]
GO
/****** Object:  Table [dbo].[acomodacao_quarto]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[acomodacao_quarto]
GO
/****** Object:  Table [dbo].[acomodacao_foto]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[acomodacao_foto]
GO
/****** Object:  Table [dbo].[acomodacao_disponibilidade]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[acomodacao_disponibilidade]
GO
/****** Object:  Table [dbo].[acomodacao_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[acomodacao_comentario]
GO
/****** Object:  Table [dbo].[acomodacao_classificacao]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[acomodacao_classificacao]
GO
/****** Object:  Table [dbo].[acomodacao]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP TABLE [dbo].[acomodacao]
GO
USE [master]
GO
/****** Object:  Database [mussika_bd]    Script Date: 29-06-2020 1:14:33 PM ******/
DROP DATABASE [mussika_bd]
GO
/****** Object:  Database [mussika_bd]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[acomodacao]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[acomodacao_classificacao]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[acomodacao_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[acomodacao_disponibilidade]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[acomodacao_foto]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[acomodacao_quarto]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[acomodacao_reserva]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[acomodacao_servico]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[acomodacao_tipo]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[artigo]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[artigo_imagem]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[artista_obra]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[carrinho_compra]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[categoria_artigo]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[categoria_cultura]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[categoria_obra_arte]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[cinema]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[cinema_sessao]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[clinica]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[compra]    Script Date: 29-06-2020 1:14:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[compra](
	[id_compra] [bigint] IDENTITY(1,1) NOT NULL,
	[id_usuario] [bigint] NOT NULL,
	[oque_e] [varchar](200) NULL,
	[id_produto] [bigint] NULL,
	[valor] [decimal](18, 2) NULL,
	[data_cadastro] [datetime] NULL,
	[inactivo] [bit] NULL,
	[descricao] [text] NULL,
	[confirmado] [bit] NULL,
	[modo_pagamento] [varchar](100) NULL,
 CONSTRAINT [PK_compra] PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distrito]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[distrito_classificacao]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[distrito_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[distrito_foto]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[empresa]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[entidade_cultural]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[evento]    Script Date: 29-06-2020 1:14:33 PM ******/
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
	[preco_bilhete_vip] [decimal](18, 2) NULL,
	[orador] [varchar](200) NULL,
	[moderador] [varchar](200) NULL,
	[part_assistente] [varchar](200) NULL,
	[nr_participantes] [int] NULL,
 CONSTRAINT [PK_eventos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[evento_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[evento_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[farmacia]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[farmacia_produto]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[filme]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[filme_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[genero_musical]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[hospital]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[item_filme_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[item_pacote_subscricao]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[loja]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[loja_produto]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[loja_tipo]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[musica]    Script Date: 29-06-2020 1:14:33 PM ******/
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
	[preco_video] [decimal](18, 2) NULL,
	[preco_venda] [money] NULL,
	[gratis] [bit] NULL,
	[duracao] [nvarchar](50) NULL,
	[pode_baixar] [bit] NULL,
	[e_album] [bit] NULL,
	[id_artista_obra] [bigint] NULL,
	[id_provedor] [bigint] NULL,
 CONSTRAINT [PK_musica] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[obra_arte]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[obra_arte_imagem]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[pacote_subscricao]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[produto]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[produto_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[restaurante]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[restaurante_classificacao]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[restaurante_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[restaurante_foto]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[restaurante_prato]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[restaurante_prato_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[restaurante_tipo]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[servico]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[servico_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[servico_foto]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[taxi]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[taxi_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[tipo_produto]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[turismo]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[turismo_categoria]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[turismo_comentario]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 29-06-2020 1:14:33 PM ******/
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
	[e_provedor] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idusario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario_favorito]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[usuario_provedor]    Script Date: 29-06-2020 1:14:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario_provedor](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_usuario] [bigint] NULL,
	[musica] [bit] NULL,
	[bazar] [bit] NULL,
	[loja] [bit] NULL,
	[acomodacao] [bit] NULL,
	[taxi] [bit] NULL,
	[restaurante] [bit] NULL,
	[arte_cultura] [bit] NULL,
	[evento] [bit] NULL,
	[turismo] [bit] NULL,
	[farmacia] [bit] NULL,
	[clinica] [bit] NULL,
	[pagamento_servico] [bit] NULL,
	[referencia] [varchar](100) NULL,
 CONSTRAINT [PK_usuario_provedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario_tipo]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[UsuarioAutenticacao]    Script Date: 29-06-2020 1:14:33 PM ******/
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
/****** Object:  Table [dbo].[UsuarioSessao]    Script Date: 29-06-2020 1:14:33 PM ******/
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
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [FK_compra_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [FK_compra_Usuario]
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
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Usuario] FOREIGN KEY([idusario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_usuario_tipo] FOREIGN KEY([id_usuario_tipo])
REFERENCES [dbo].[usuario_tipo] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_usuario_tipo]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Usuario1] FOREIGN KEY([idusario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Usuario1]
GO
ALTER TABLE [dbo].[usuario_favorito]  WITH CHECK ADD  CONSTRAINT [FK_usuario_favorito_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[usuario_favorito] CHECK CONSTRAINT [FK_usuario_favorito_Usuario]
GO
ALTER TABLE [dbo].[usuario_provedor]  WITH CHECK ADD  CONSTRAINT [FK_usuario_provedor_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([idusario])
GO
ALTER TABLE [dbo].[usuario_provedor] CHECK CONSTRAINT [FK_usuario_provedor_Usuario]
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
