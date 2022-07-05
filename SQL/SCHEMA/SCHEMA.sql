/*
 Navicat Premium Data Transfer

 Source Server         : Mussika_Online
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Host           : wsrv1.mozdomains.com\MSSQLSERVER2017:1433
 Source Catalog        : mussikac_bd
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

 Date: 12/06/2020 16:25:41
*/


-- ----------------------------
-- Table structure for acomodacao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[acomodacao]') AND type IN ('U'))
	DROP TABLE [dbo].[acomodacao]
GO

CREATE TABLE [dbo].[acomodacao] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [nome] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [endereco] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [telefone] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto_capa] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [website] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [mapa] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_acomodacao_tipo] int  NULL,
  [id_distrito] int  NULL,
  [Inactivo] bit  NULL
)
GO

ALTER TABLE [dbo].[acomodacao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for acomodacao_classificacao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[acomodacao_classificacao]') AND type IN ('U'))
	DROP TABLE [dbo].[acomodacao_classificacao]
GO

CREATE TABLE [dbo].[acomodacao_classificacao] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_acomodacao] bigint  NULL,
  [classificacao] int  NULL,
  [usuario_nome] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [usuario_email] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [usuario_assunto] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [comentario] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL,
  [id_usuario] bigint  NULL,
  [activo] bit  NULL
)
GO

ALTER TABLE [dbo].[acomodacao_classificacao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for acomodacao_comentario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[acomodacao_comentario]') AND type IN ('U'))
	DROP TABLE [dbo].[acomodacao_comentario]
GO

CREATE TABLE [dbo].[acomodacao_comentario] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_acomodacao] bigint  NULL,
  [id_usuario] bigint  NULL,
  [data] datetime  NULL,
  [valido] bit  NULL,
  [comentario] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nomeUsuario] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [assunto] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[acomodacao_comentario] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for acomodacao_disponibilidade
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[acomodacao_disponibilidade]') AND type IN ('U'))
	DROP TABLE [dbo].[acomodacao_disponibilidade]
GO

CREATE TABLE [dbo].[acomodacao_disponibilidade] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_acomodacao_quarto] bigint  NULL,
  [checkin] date  NULL,
  [checkout] date  NULL,
  [quantidade] int  NULL
)
GO

ALTER TABLE [dbo].[acomodacao_disponibilidade] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for acomodacao_foto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[acomodacao_foto]') AND type IN ('U'))
	DROP TABLE [dbo].[acomodacao_foto]
GO

CREATE TABLE [dbo].[acomodacao_foto] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_acomodacao] bigint  NULL,
  [caminho] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[acomodacao_foto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for acomodacao_quarto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[acomodacao_quarto]') AND type IN ('U'))
	DROP TABLE [dbo].[acomodacao_quarto]
GO

CREATE TABLE [dbo].[acomodacao_quarto] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_acomodacao] bigint  NULL,
  [descricao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [hospedes] int  NULL,
  [custo_diaria] money  NULL,
  [quantidade] int  NULL,
  [foto_capa] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [chk_ac] bit  NULL,
  [chk_parqueamento] bit  NULL,
  [chk_televisao] bit  NULL,
  [chk_geleira] bit  NULL,
  [chk_wifi] bit  NULL,
  [chk_minibar] bit  NULL,
  [quarto_foto] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Inactivo] bit  NULL,
  [observacoes] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[acomodacao_quarto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for acomodacao_reserva
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[acomodacao_reserva]') AND type IN ('U'))
	DROP TABLE [dbo].[acomodacao_reserva]
GO

CREATE TABLE [dbo].[acomodacao_reserva] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_acomodacao_quarto] bigint  NULL,
  [data_reserva] datetime  NULL,
  [checkin] datetime  NULL,
  [checkout] datetime  NULL,
  [preco] float(53)  NULL,
  [iva] float(53)  NULL,
  [total] float(53)  NULL,
  [nome_hospede] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [apelido_hospede] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [telefone] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [endereco] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [confirmado] bit  NULL,
  [cancelado] bit  NULL
)
GO

ALTER TABLE [dbo].[acomodacao_reserva] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for acomodacao_servico
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[acomodacao_servico]') AND type IN ('U'))
	DROP TABLE [dbo].[acomodacao_servico]
GO

CREATE TABLE [dbo].[acomodacao_servico] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [descricao] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_acomodacao] bigint  NULL
)
GO

ALTER TABLE [dbo].[acomodacao_servico] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for acomodacao_tipo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[acomodacao_tipo]') AND type IN ('U'))
	DROP TABLE [dbo].[acomodacao_tipo]
GO

CREATE TABLE [dbo].[acomodacao_tipo] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [tipo] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[acomodacao_tipo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of acomodacao_tipo
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[acomodacao_tipo] ON
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1', N'Pensão')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'2', N'Hotel')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'3', N'Lodge')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1002', N'Pousada')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1003', N'Resort')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1004', N'Hotel Fazenda')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1005', N'Bed and Breakfast')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1006', N'Hotel Histórico')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1007', N'Apart-Hotel')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1008', N'Albergue')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1009', N'Casa de aluguel')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1010', N'Casa de Família')
GO

INSERT INTO [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (N'1011', N'Motel')
GO

SET IDENTITY_INSERT [dbo].[acomodacao_tipo] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for artigo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[artigo]') AND type IN ('U'))
	DROP TABLE [dbo].[artigo]
GO

CREATE TABLE [dbo].[artigo] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [codigo] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_categoria_artigo] int  NULL,
  [nome] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [marca_registada] bit  NULL,
  [atracao_internacional] bit  NULL,
  [preco_min] money  NULL,
  [preco_max] money  NULL,
  [preco_venda] money  NULL,
  [observacoes] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [portofolio] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [genero] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [e_servico] bit  NULL,
  [foto_capa] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_distrito] int  NULL,
  [bairro] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [clicks] bigint  NULL,
  [data_cadastro] datetime  NULL,
  [Inactivo] bit  NULL
)
GO

ALTER TABLE [dbo].[artigo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for artigo_imagem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[artigo_imagem]') AND type IN ('U'))
	DROP TABLE [dbo].[artigo_imagem]
GO

CREATE TABLE [dbo].[artigo_imagem] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_artigo] bigint  NULL,
  [caminho] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[artigo_imagem] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for artista_obra
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[artista_obra]') AND type IN ('U'))
	DROP TABLE [dbo].[artista_obra]
GO

CREATE TABLE [dbo].[artista_obra] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [nome] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [fotografia] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_distrito] int  NULL,
  [telefone] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [e_musico] bit  NULL
)
GO

ALTER TABLE [dbo].[artista_obra] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of artista_obra
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[artista_obra] ON
GO

INSERT INTO [dbo].[artista_obra] ([id], [nome], [descricao], [fotografia], [id_distrito], [telefone], [e_musico]) VALUES (N'2', N'Humberto Luis', N'<p>Humberto Luis</p>', N'Autor1062020165545.jpg', N'22', N'843333333', N'1')
GO

SET IDENTITY_INSERT [dbo].[artista_obra] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for carrinho_compra
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[carrinho_compra]') AND type IN ('U'))
	DROP TABLE [dbo].[carrinho_compra]
GO

CREATE TABLE [dbo].[carrinho_compra] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_usuario] bigint  NULL,
  [e_restaurante] bit  NULL,
  [e_artigo] bit  NULL,
  [e_acomodacao] bit  NULL,
  [e_taxi] bit  NULL,
  [id_restaurante] bigint  NULL,
  [id_acomodacao] bigint  NULL,
  [id_quarto] bigint  NULL,
  [id_artigo] bigint  NULL,
  [id_taxi] bigint  NULL,
  [activo] bit  NULL,
  [data_cadastro] datetime  NULL,
  [descricao] varchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [e_obra] bit  NULL,
  [id_obra] bigint  NULL,
  [e_musica] bit  NULL,
  [id_musica] bigint  NULL,
  [e_loja_produto] bit  NULL,
  [id_loja_produto] bigint  NULL,
  [e_farmacia_produto] bit  NULL,
  [id_farmacia_produto] bigint  NULL,
  [e_Filme] bit  NULL,
  [id_filme] bigint  NULL,
  [e_evento] bit  NULL,
  [id_evento] bigint  NULL
)
GO

ALTER TABLE [dbo].[carrinho_compra] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for categoria_artigo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[categoria_artigo]') AND type IN ('U'))
	DROP TABLE [dbo].[categoria_artigo]
GO

CREATE TABLE [dbo].[categoria_artigo] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[categoria_artigo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of categoria_artigo
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[categoria_artigo] ON
GO

INSERT INTO [dbo].[categoria_artigo] ([id], [descricao]) VALUES (N'1', N'Imobiliaria')
GO

INSERT INTO [dbo].[categoria_artigo] ([id], [descricao]) VALUES (N'2', N'Veiculos')
GO

INSERT INTO [dbo].[categoria_artigo] ([id], [descricao]) VALUES (N'3', N'Tecnologia')
GO

INSERT INTO [dbo].[categoria_artigo] ([id], [descricao]) VALUES (N'4', N'Moda')
GO

INSERT INTO [dbo].[categoria_artigo] ([id], [descricao]) VALUES (N'5', N'Itens de Casa e Escritorio')
GO

INSERT INTO [dbo].[categoria_artigo] ([id], [descricao]) VALUES (N'6', N'Animais')
GO

INSERT INTO [dbo].[categoria_artigo] ([id], [descricao]) VALUES (N'7', N'Empreegos')
GO

INSERT INTO [dbo].[categoria_artigo] ([id], [descricao]) VALUES (N'8', N'Servicos')
GO

INSERT INTO [dbo].[categoria_artigo] ([id], [descricao]) VALUES (N'9', N'Lazer')
GO

SET IDENTITY_INSERT [dbo].[categoria_artigo] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for categoria_cultura
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[categoria_cultura]') AND type IN ('U'))
	DROP TABLE [dbo].[categoria_cultura]
GO

CREATE TABLE [dbo].[categoria_cultura] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[categoria_cultura] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for categoria_obra_arte
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[categoria_obra_arte]') AND type IN ('U'))
	DROP TABLE [dbo].[categoria_obra_arte]
GO

CREATE TABLE [dbo].[categoria_obra_arte] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [fotografia] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[categoria_obra_arte] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of categoria_obra_arte
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[categoria_obra_arte] ON
GO

INSERT INTO [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (N'1', N'Literatura', NULL)
GO

INSERT INTO [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (N'2', N'Artes Plásticas', NULL)
GO

INSERT INTO [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (N'3', N'Escultura', NULL)
GO

INSERT INTO [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (N'4', N'Artesanato', NULL)
GO

INSERT INTO [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (N'5', N'Teatro', NULL)
GO

INSERT INTO [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (N'6', N'Dança', NULL)
GO

INSERT INTO [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (N'8', N'Grafites', NULL)
GO

SET IDENTITY_INSERT [dbo].[categoria_obra_arte] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for categoria_produto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[categoria_produto]') AND type IN ('U'))
	DROP TABLE [dbo].[categoria_produto]
GO

CREATE TABLE [dbo].[categoria_produto] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[categoria_produto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for cinema
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cinema]') AND type IN ('U'))
	DROP TABLE [dbo].[cinema]
GO

CREATE TABLE [dbo].[cinema] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_distrito] int  NULL,
  [nome] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [localizacao] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [inactivo] bit  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[cinema] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for cinema_sessao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cinema_sessao]') AND type IN ('U'))
	DROP TABLE [dbo].[cinema_sessao]
GO

CREATE TABLE [dbo].[cinema_sessao] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_cinema] bigint  NULL,
  [data] datetime  NULL,
  [hora] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_filme] bigint  NULL,
  [inactivo] bit  NULL,
  [preco] decimal(18,2)  NULL
)
GO

ALTER TABLE [dbo].[cinema_sessao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for clinica
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[clinica]') AND type IN ('U'))
	DROP TABLE [dbo].[clinica]
GO

CREATE TABLE [dbo].[clinica] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_distrito] int  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nome] varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [bairro] varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [telefone] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [inactivo] bit  NULL,
  [email] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL
)
GO

ALTER TABLE [dbo].[clinica] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for compra
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[compra]') AND type IN ('U'))
	DROP TABLE [dbo].[compra]
GO

CREATE TABLE [dbo].[compra] (
  [id_compra] bigint  IDENTITY(1,1) NOT NULL,
  [id_usuario] bigint  NOT NULL,
  [oque_e] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_produto] bigint  NULL,
  [valor] decimal(18,2)  NULL,
  [data_cadastro] datetime  NULL,
  [inactivo] bit  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [confirmado] bit  NULL,
  [modo_pagamento] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[compra] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of compra
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[compra] ON
GO

INSERT INTO [dbo].[compra] ([id_compra], [id_usuario], [oque_e], [id_produto], [valor], [data_cadastro], [inactivo], [descricao], [confirmado], [modo_pagamento]) VALUES (N'12', N'45', N'musica', N'2', N'500.00', N'2020-06-10 18:18:05.270', N'0', N'musica de Humberto Luis', N'1', N'mpesa')
GO

INSERT INTO [dbo].[compra] ([id_compra], [id_usuario], [oque_e], [id_produto], [valor], [data_cadastro], [inactivo], [descricao], [confirmado], [modo_pagamento]) VALUES (N'13', N'54', N'musica', N'2', N'500.00', N'2020-06-10 19:41:34.750', N'0', N'musica de Humberto Luis', N'1', N'mpesa')
GO

INSERT INTO [dbo].[compra] ([id_compra], [id_usuario], [oque_e], [id_produto], [valor], [data_cadastro], [inactivo], [descricao], [confirmado], [modo_pagamento]) VALUES (N'14', N'45', N'musicaVideo', N'2', N'530.00', N'2020-06-10 20:46:02.113', N'0', N'Música de Humberto Luis', N'1', N'paypal')
GO

INSERT INTO [dbo].[compra] ([id_compra], [id_usuario], [oque_e], [id_produto], [valor], [data_cadastro], [inactivo], [descricao], [confirmado], [modo_pagamento]) VALUES (N'15', N'1', N'musica', N'2', N'500.00', N'2020-06-11 09:56:36.283', N'0', N'musica de Humberto Luis', N'1', N'mpesa')
GO

INSERT INTO [dbo].[compra] ([id_compra], [id_usuario], [oque_e], [id_produto], [valor], [data_cadastro], [inactivo], [descricao], [confirmado], [modo_pagamento]) VALUES (N'18', N'43', N'musica', N'2', N'530.00', N'2020-06-11 12:25:35.763', N'0', N'Música de Humberto Luis', N'1', N'mpesa')
GO

SET IDENTITY_INSERT [dbo].[compra] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for distrito
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[distrito]') AND type IN ('U'))
	DROP TABLE [dbo].[distrito]
GO

CREATE TABLE [dbo].[distrito] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [codigo] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nome] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto_capa] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [linkmapa] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [activar_galeria] bit  NULL,
  [area] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [populacao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [longitude] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [latitude] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [visitas] bigint  NULL
)
GO

ALTER TABLE [dbo].[distrito] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of distrito
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[distrito] ON
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'1', NULL, N'Alto Molócuè', N'Perfil2452020135638_1.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d983214.1883745013!2d37.05402848377117!3d-15.715103968497798!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18c55fbbf53d7923%3A0xfb663fd7dd3fcd6b!2zQWx0byBNb2zDs2N1w6g!5e0!3m2!1spt-PT!2smz!4v1590320959210!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na vila de&nbsp;Alto Mol&oacute;cu&egrave;. Tem limite, a norte com os distritos de&nbsp;Ribau&eacute;&nbsp;e&nbsp;Malema, ambos da prov&iacute;ncia de&nbsp;Nampula, a oeste com o distrito de&nbsp;Guru&eacute;, a sul e sudoeste com o distrito de&nbsp;Ile&nbsp;e a leste com o distrito de&nbsp;Gil&eacute;.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Demografia</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 272&nbsp;482 residentes. Com uma &aacute;rea de 6386&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 42,67&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 185&nbsp;224 habitantes, daqui resultando uma densidade populacional de 29,0&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em dois postos administrativos (Alto Mol&oacute;cu&egrave;&nbsp;e&nbsp;Nauela), compostos pelas seguintes localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Alto Mol&oacute;cu&egrave;:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Vila de&nbsp;Alto Mol&oacute;cu&egrave;</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Caiaia</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Chapala</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Ecole</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Malua</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mutala</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nacuaca</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nimala</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nivava</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Novanana</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Nauela:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mohiua</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nauela</li>
</ul>
</li>
</ul>
</div>', N'0', N'6386  km²', N'272482', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'2', NULL, N'Chinde', N'Perfil2452020161659_2.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15127.262291396602!2d36.45375247895459!3d-18.582351597967254!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1f2cd246532faa87%3A0xac781e6e3e2f52f4!2sChinde!5e0!3m2!1spt-PT!2smz!4v1590329770632!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na vila de&nbsp;Chinde. Tem limite, a norte com o distrito de&nbsp;Mopeia, a oeste com o distrito de&nbsp;Marromeu&nbsp;da prov&iacute;ncia de&nbsp;Sofala, a sul e sudeste com o&nbsp;Oceano &Iacute;ndico&nbsp;e a nordeste com o distrito de&nbsp;Inhassunge.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Demografia</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 119&nbsp;898 residentes. Com uma &aacute;rea de 4403&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 27,23&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 129&nbsp;115 habitantes, daqui resultando uma densidade populacional de 29,3&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em tr&ecirc;s postos administrativos (Chinde,&nbsp;Luabo&nbsp;e&nbsp;Micaune) compostos pelas seguintes localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Chinde:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Vila de&nbsp;Chinde</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Matilde</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mucuandaia</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Pambane</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Luabo:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Luabo</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mangige</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nzama</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Rovuma</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Samora Machel</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">25 de Setembro</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Micaune:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Arijuane</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Magaza</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Micaune</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mitange</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nhamatamanga</li>
</ul>
</li>
</ul>
</div>', N'0', N'4403  km²', N'119898', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'3', NULL, N'Derre', N'Perfil2452020163819_3.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7632.505654074893!2d36.12218857090578!3d-16.96210965333889!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d13842c4cea1e1%3A0x484eda43b830ce14!2sDerre!5e0!3m2!1spt-PT!2smz!4v1590331006564!5m2!1spt-PT!2smz', N'<p style="text-align: justify; line-height: 150%; background: white; margin: 6.0pt 0in 6.0pt 0in;"><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT; mso-bidi-font-weight: bold;">Derre</span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;&eacute; um distrito da prov&iacute;ncia da&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Zamb&eacute;zia" href="https://pt.wikipedia.org/wiki/Zamb%C3%A9zia"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Zamb&eacute;zia</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">, em&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Mo&ccedil;ambique" href="https://pt.wikipedia.org/wiki/Mo%C3%A7ambique"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Mo&ccedil;ambique</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">, com sede na povoa&ccedil;&atilde;o de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Derre (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=Derre&amp;action=edit&amp;redlink=1"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Derre</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">. Foi criado em 2013, com a eleva&ccedil;&atilde;o a distrito do posto administrativo do Derre que pertencia ao distrito de Morrumbala.</span></p>
<p style="text-align: start; line-height: 150%; background: white; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 6.0pt 0in 6.0pt 0in;"><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">Tem limites a norte com o distrito de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Milange (distrito)" href="https://pt.wikipedia.org/wiki/Milange_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Milange</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">, a oeste com os distritos de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Morrumbala (distrito)" href="https://pt.wikipedia.org/wiki/Morrumbala_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Morrumbala</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;e&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Mopeia (distrito)" href="https://pt.wikipedia.org/wiki/Mopeia_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Mopeia</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;da prov&iacute;ncia de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Tete (prov&iacute;ncia)" href="https://pt.wikipedia.org/wiki/Tete_(prov%C3%ADncia)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Tete</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">, a sul com o distrito de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Inhassunge (distrito)" href="https://pt.wikipedia.org/wiki/Inhassunge_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Inhassunge</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;e a leste com os distritos de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Mocuba (distrito)" href="https://pt.wikipedia.org/wiki/Mocuba_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Mocuba</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;e&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Nicoadala (distrito)" href="https://pt.wikipedia.org/wiki/Nicoadala_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Nicoadala</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">.</span></p>
<p style="text-align: start; line-height: 150%; background: white; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 6.0pt 0in 6.0pt 0in;"><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">Em 2012, o distrito tinha uma popula&ccedil;&atilde;o estimada em 85&nbsp;385 habitantes. </span></p>', N'0', NULL, N'85385', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'4', NULL, N'Gilé', N'Perfil2452020164457_4.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d982451.2955091988!2d37.809614904182446!3d-15.872337560377467!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18cf406a8c66d9bf%3A0xc549658101626d96!2zR2lsw6k!5e0!3m2!1spt-PT!2smz!4v1590331450505!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de&nbsp;Gil&eacute;. Tem limite, a norte com o distrito de&nbsp;Ribau&eacute;&nbsp;da prov&iacute;ncia de&nbsp;Nampula, a oeste com o distrito de&nbsp;Alto Mol&oacute;cue, a sudoeste com o distrito de&nbsp;Ile, a sul com o distrito de&nbsp;Pebane, a leste com os distritos de&nbsp;Mogovolas&nbsp;e&nbsp;Moma, ambos da prov&iacute;ncia de&nbsp;Nampula) e a nordeste com o distrito de&nbsp;Murrupula, tamb&eacute;m da prov&iacute;ncia de&nbsp;Nampula</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Demografia</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 169&nbsp;285 residentes. Com uma &aacute;rea de 8875&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 19,07&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 126&nbsp;988 habitantes, daqui resultando uma densidade populacional de 14,3&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Este distrito foi uma circunscri&ccedil;&atilde;o administrativa at&eacute;&nbsp;1975.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em dois postos administrativos (Alto Ligonha&nbsp;e&nbsp;Gil&eacute;), compostos pelas seguintes localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Alto Ligonha:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Alto Ligonha</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Inxotcha</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mirali</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Muiane</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namihali</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namireco</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Pury</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Gil&eacute;:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Gil&eacute;</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Kaiane</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mamala</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Manhope</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Moniea</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Naheche</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Uape</li>
</ul>
</li>
</ul>
</div>', N'0', N'8875  km²', N'169285', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'5', NULL, N'Gurué', N'Perfil2452020165030_5.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d61523.96715677099!2d36.950882925902086!3d-15.471089648595438!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18dac198752a2077%3A0xd129804853ee5057!2zR3VydcOp!5e0!3m2!1spt-PT!2smz!4v1590331699649!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na cidade de&nbsp;Guru&eacute;. Tem limite a norte com o distrito de&nbsp;Malema&nbsp;da prov&iacute;ncia de&nbsp;Nampula, a noroeste com o distrito de&nbsp;Cuamba&nbsp;da prov&iacute;ncia de&nbsp;Niassa, a sudoeste com o distrito de&nbsp;Milange, a sul com os distritos de&nbsp;Namarroi&nbsp;e&nbsp;Ile&nbsp;e a leste com o distrito de&nbsp;Alto Mol&oacute;cue.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Demografia</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 297&nbsp;935 residentes. Com uma &aacute;rea de 5606&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 53,15&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 197&nbsp;179 habitantes, daqui resultando uma densidade populacional de 35,2&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Clima</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O clima do Gur&uacute;&egrave; &eacute; considerado&nbsp;temperado. Os&nbsp;ver&otilde;es&nbsp;t&ecirc;m temperaturas entre os 30&nbsp;&nbsp;&deg;C&nbsp;e 40&nbsp;&deg;C. Os&nbsp;invernos&nbsp;t&ecirc;m temperaturas na ordem de 17&nbsp;&deg;C a 20&nbsp;&deg;C. Tal como para os climas tropicais, consideram-se somente duas esta&ccedil;&otilde;es: a&nbsp;&eacute;poca das chuvas&nbsp;para a esta&ccedil;&atilde;o mais quente e a&nbsp;&eacute;poca seca&nbsp;para a esta&ccedil;&atilde;o mais fria.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em dois postos administrativos (Lioma&nbsp;e&nbsp;Mepuagiua), compostos pelas seguintes localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Lioma:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Lioma</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Magige</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mualijane</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nintulo</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Tetete</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Mepuagiua:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Incize</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mepuagiua</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mugaveia</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nicoropale</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nipive</li>
</ul>
</li>
</ul>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De notar que em 1998 a cidade de&nbsp;<strong>Guru&eacute;</strong>, at&eacute; ent&atilde;o uma divis&atilde;o administrativa que compreendia v&aacute;rios postos administrativos, foi elevada &agrave; categoria de munic&iacute;pio.</p>
</div>', N'0', N'5606  km²', N'297935', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'6', NULL, N'Ile', N'Perfil2452020165513_6.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d981181.2744105177!2d36.972533633915546!3d-16.13077866618607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18cfc3f35b6e7015%3A0x1610abbc728c87a2!2sIle!5e0!3m2!1spt-PT!2smz!4v1590332005757!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Ile</strong>&nbsp;&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de&nbsp;Ile. Tem limite, a norte e nordeste com o distrito de&nbsp;Alto Mol&oacute;cue, a noroeste com o distrito de&nbsp;Guru&eacute;, a oeste com os distritos de&nbsp;Namarroi&nbsp;e&nbsp;Lugela, a sul com os distritos de&nbsp;Mocuba,&nbsp;Maganja da Costa&nbsp;e&nbsp;Pebane&nbsp;e a leste com o distrito de&nbsp;Gil&eacute;.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Demografia</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 289&nbsp;891 residentes. Com uma &aacute;rea de 5589&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 51,87&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 224&nbsp;167 habitantes, daqui resultando uma densidade populacional de 40,1&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">At&eacute;&nbsp;1975&nbsp;o distrito constitu&iacute;a uma circunscri&ccedil;&atilde;o administrativa.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em tr&ecirc;s postos administrativos (Ile,&nbsp;Mulevala&nbsp;e&nbsp;Socone), compostos pelas seguintes localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Ile:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Ile</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Calaia</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mungulama/Hatxue</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namanda</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nampexo</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nipiode</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Palane/Vieriva</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Mulevala:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Chiraco</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Micalane</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mucata</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namigonha</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Ruge</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Tebo</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Socone:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Curruane (Macopola)</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Socone</li>
</ul>
</li>
</ul>
</div>', N'0', N'5589  km²', N'5589  ', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'7', NULL, N'Inhassunge', N'Perfil2452020171218_7.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d485526.62008064444!2d36.530341653835926!3d-18.063371962928418!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d2e8ce1d140f95%3A0xf69271b32c4389f9!2sInhassunge!5e0!3m2!1spt-PT!2smz!4v1590332199460!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de&nbsp;Mucupia. Algumas vezes &eacute; mencionada como&nbsp;<strong>vila sede de Inhassunge</strong>. Tem limite, a norte com o munic&iacute;pio de&nbsp;Quelimane&nbsp;e com o distrito de&nbsp;Nicoadala, a oeste com o distrito de&nbsp;Mopeia, a sul com o distrito de&nbsp;Chinde&nbsp;e a leste com o&nbsp;Oceano &Iacute;ndico.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Demografia</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 91&nbsp;196 residentes. Com uma &aacute;rea de 745&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 122,41&nbsp;habitantes por km&sup2;,</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 87&nbsp;396 habitantes, daqui resultando uma densidade populacional de 117,3&nbsp;habitantes por km&sup2;, fazendo deste distrito o mais pequeno e mais densamente povoado da Zamb&eacute;zia.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em dois postos administrativos (Gonhane&nbsp;e&nbsp;Mucupia), compostos pelas seguintes localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Gonhane:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Gonhane</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Mucupia:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Chirimane</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Ilova</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mucupia</li>
</ul>
</li>
</ul>
</div>', N'0', N'745  km²', N'91 196', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'8', NULL, N'Luabo', N'Perfil2452020171844_8.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30287.2719748799!2d36.081805067472246!3d-18.39699244877053!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d344c5a6ff1bf9%3A0xfb78074ce0b18e8c!2sLuabo!5e0!3m2!1spt-PT!2smz!4v1590333414651!5m2!1spt-PT!2smz', N'<p>&nbsp;</p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Luabo &eacute; um distrito da prov&iacute;ncia da Zamb&eacute;zia, em Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de Luabo. Foi criado em 2013, com a eleva&ccedil;&atilde;o a distrito do posto administrativo do Luabo que pertencia ao distrito de Chinde.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Tem limite, a norte com os distritos de Mopeia e Inhassunge, a este e sul com o distrito de Chinde e a oeste com o distrito de Marromeu da prov&iacute;ncia de Sofala, do qual est&aacute; separado pelo rio Zambeze.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">De acordo com o censo de 2007, o distrito tinha uma popula&ccedil;&atilde;o de 48 459 habitantes e uma &aacute;rea de 1 108 km&sup2;, daqui resultando uma densidade populacional de 43,7 habitantes por km&sup2;.</span></p>
<p class="MsoNormal">&nbsp;</p>
<h2 style="background: none #ffffff; font-weight: normal; margin: 1em 0px 0.25em; overflow: hidden; padding: 0px; border-bottom: 1px solid #a2a9b1; font-family: ''Linux Libertine'', Georgia, Times, serif; line-height: 1.3;"><span id="Divis&atilde;o_administrativa" class="mw-headline">Divis&atilde;o administrativa</span></h2>
<p style="margin: 0.5em 0px; color: #202122; font-family: sans-serif; background-color: #ffffff;">O distrito est&aacute; dividido nos&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Posto administrativo" href="https://pt.wikipedia.org/wiki/Posto_administrativo">postos administrativos</a>&nbsp;de&nbsp;<a class="new" style="text-decoration-line: none; color: #a55858; background: none;" title="Chimbazo (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=Chimbazo&amp;action=edit&amp;redlink=1">Chimbazo</a>&nbsp;e&nbsp;<a class="new" style="text-decoration-line: none; color: #a55858; background: none;" title="Luabo (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=Luabo&amp;action=edit&amp;redlink=1">Luabo</a>&nbsp;composto pelas seguintes&nbsp;<a style="text-decoration-line: none; color: #0b0080; background: none;" title="Localidade" href="https://pt.wikipedia.org/wiki/Localidade">localidades</a>:</p>
<p>&nbsp;</p>
<ul style="list-style-image: url(''../w/skins/Vector/resources/skins.vector.styles/images/bullet-icon.svg?d4515''); margin: 0.3em 0px 0px 1.6em; padding: 0px; color: #202122; font-family: sans-serif; background-color: #ffffff;">
<li style="margin-bottom: 0.1em;">Posto Administrativo de&nbsp;<a class="new" style="text-decoration-line: none; color: #a55858; background: none;" title="Chimbazo (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=Chimbazo&amp;action=edit&amp;redlink=1">Chimbazo</a>
<ul style="list-style-image: url(''../w/skins/Vector/resources/skins.vector.styles/images/bullet-icon.svg?d4515''); margin: 0.3em 0px 0px 1.6em; padding: 0px;">
<li style="margin-bottom: 0.1em;"><a class="new" style="text-decoration-line: none; color: #a55858; background: none;" title="25 de Setembro (localidade) (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=25_de_Setembro_(localidade)&amp;action=edit&amp;redlink=1">25 de Setembro</a></li>
<li style="margin-bottom: 0.1em;">Nzama</li>
<li style="margin-bottom: 0.1em;">Manginge</li>
<li style="margin-bottom: 0.1em;">Chinsamba</li>
</ul>
</li>
</ul>
<ul style="list-style-image: url(''../w/skins/Vector/resources/skins.vector.styles/images/bullet-icon.svg?d4515''); margin: 0.3em 0px 0px 1.6em; padding: 0px; color: #202122; font-family: sans-serif; background-color: #ffffff;">
<li style="margin-bottom: 0.1em;">Posto Administrativo de&nbsp;<a class="new" style="text-decoration-line: none; color: #a55858; background: none;" title="Luabo (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=Luabo&amp;action=edit&amp;redlink=1">Luabo</a>:
<ul style="list-style-image: url(''../w/skins/Vector/resources/skins.vector.styles/images/bullet-icon.svg?d4515''); margin: 0.3em 0px 0px 1.6em; padding: 0px;">
<li style="margin-bottom: 0.1em;"><a class="new" style="text-decoration-line: none; color: #a55858; background: none;" title="Luabo (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=Luabo&amp;action=edit&amp;redlink=1">Luabo</a></li>
<li style="margin-bottom: 0.1em;"><a class="new" style="text-decoration-line: none; color: #a55858; background: none;" title="Rovuma (localidade) (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=Rovuma_(localidade)&amp;action=edit&amp;redlink=1">Rovuma</a></li>
<li style="margin-bottom: 0.1em;"><a class="new" style="text-decoration-line: none; color: #a55858; background: none;" title="Samora Machel (localidade) (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=Samora_Machel_(localidade)&amp;action=edit&amp;redlink=1">Samora Machel</a></li>
</ul>
</li>
</ul>
<p class="MsoNormal">&nbsp;</p>
<p style="margin: 0.5em 0px; color: #202122; font-family: sans-serif; background-color: #ffffff;">O posto administrativo de Chimbazo foi criado em 2017.</p>', N'0', N'1 108 km²', N'48 459', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'9', NULL, N'Lugela', N'Perfil2452020172226_9.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d980189.3822840508!2d36.0846073168982!3d-16.32985227830752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d058dba32d5b2f%3A0x5edd6fdf3c7fc2ad!2sLugela!5e0!3m2!1spt-PT!2smz!4v1590333698465!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de&nbsp;Lugela. Tem limite, a norte e nordeste com o distrito de&nbsp;Namarroi, a norte e a oeste com o distrito de&nbsp;Milange, a sul e leste com o distrito de&nbsp;Mocuba&nbsp;e a leste com o distrito de&nbsp;Ile.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Demografia</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 135&nbsp;485 residentes. Com uma &aacute;rea de 6178&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 21,93&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 106&nbsp;770 habitantes, daqui resultando uma densidade populacional de 17,3&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em quatro postos administrativos (Lugela,&nbsp;Muabanama,&nbsp;Munhamade&nbsp;e&nbsp;Tacuane), compostos pelas seguintes localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Lugela:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Lugela</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mussengane</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nagobo</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Phutine</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Taba</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Muabanama:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Comone</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">M''Pemula</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Muabanama</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Munhamade:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Alto Lugela</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Cuba</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mulide</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Munhamade</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Tenede</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Tacuane:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Ebide</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mabu</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Tacuane</li>
</ul>
</li>
</ul>
</div>', N'0', N'6178  km²', N'135 485', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'10', NULL, N'Maganja da Costa', N'Perfil2452020172657_10.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d976489.7518700757!2d37.06076892193535!3d-17.052434856275166!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18cddc209393219b%3A0xf18a60bbf082c023!2sMaganja%20da%20Costa!5e0!3m2!1spt-PT!2smz!4v1590333871071!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na vila de&nbsp;Maganja da Costa. Tem limite, a norte com o distrito de&nbsp;Ile, a noroeste e oeste com o distrito de&nbsp;Mocuba, a sudoeste com o distrito de&nbsp;Namacurra, a sul e sudeste com o&nbsp;Oceano &Iacute;ndico&nbsp;e a leste com o distrito de&nbsp;Pebane.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Demografia</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 276&nbsp;881 residentes. Com uma &aacute;rea de 7597&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondaria os 36,45&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o censo de 1997, o distrito tinha 229&nbsp;230 habitantes e uma &aacute;rea de 7597&nbsp;km&sup2;, daqui resultando uma densidade populacional de 30,2&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em quatro postos administrativos,&nbsp;Bajone,&nbsp;Maganja da Costa,&nbsp;Mocubela&nbsp;e&nbsp;Nante, compostos por um total de 14 localidades e a vila de&nbsp;Maganja:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Bajone:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Missal</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nacuda</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Naico</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Maganja da Costa:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Vila de&nbsp;Maganja da Costa</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Bala</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Cabuir</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Cariua</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Mocubela:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Maneia</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mocubela</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Muzo</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Nante/Baixo Licungo:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Alto Mutola</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Moneia</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mu&ocirc;loa</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nante</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nomiua</li>
</ul>
</li>
</ul>
</div>', N'0', N'7597  km²', N'276 881', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'11', NULL, N'Milange', N'Perfil2452020172849_11.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d982042.6934254143!2d35.3792045881147!3d-15.955930255123144!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18da026d2101bbcb%3A0x5b4a51262a9cdbbf!2sMilange!5e0!3m2!1spt-PT!2smz!4v1590334093158!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na vila de&nbsp;Milange. Tem limite, a norte com o distrito de&nbsp;Mecanhelas&nbsp;da prov&iacute;ncia de&nbsp;Niassa, a oeste com o&nbsp;Malawi, a sul com o distrito de&nbsp;Morrumbala, a sudeste com o distrito de&nbsp;Mocuba, a leste com os distritos de&nbsp;Lugela&nbsp;e&nbsp;Namarroi&nbsp;e a nordeste com o distrito de&nbsp;Guru&eacute;.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Com 498&nbsp;635 habitantes, em 2007, Milange continuava a ser o distrito da Zamb&eacute;zia com mais popula&ccedil;&atilde;o, superando os seus vizinhos Morrumbala e Mocuba.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Popula&ccedil;&atilde;o</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 498&nbsp;635 residentes. Com uma &aacute;rea de 9842&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 50,66&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 335&nbsp;728 habitantes e uma &aacute;rea de 9794&nbsp;km&sup2;, daqui resultando uma densidade populacional de 34,3&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito, em 2007, estava dividido em quatro postos administrativos:&nbsp;Majaua,&nbsp;Milange,&nbsp;Molumbo&nbsp;e&nbsp;Mongue. Estes, por sua vez, eram compostos por 14 localidades e um munic&iacute;pio,&nbsp;Milange:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Majaua:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Dachudua</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Majaua</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Zalimba</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Milange:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Chitambo</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Corromana</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Liciro</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Munic&iacute;pio de&nbsp;Milange</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Tengua</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Vulalo</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Molumbo:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Capit&atilde;o Mor</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nangoma</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Molumbo</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Mongue:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Dulanha</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mongue</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Sabelua</li>
</ul>
</li>
</ul>
</div>', N'0', N'9842  km²', N'498 635', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'12', NULL, N'Mocuba', N'Perfil2452020173113_12.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d61097.89181042387!2d36.92612083222935!3d-16.84528468169019!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d1ead139f4a2f3%3A0x665aa404b3e10dee!2sMocuba!5e0!3m2!1spt-PT!2smz!4v1590334222316!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito situado no centro da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na cidade de&nbsp;Mocuba. Tem limite, a norte com o distrito de&nbsp;Lugela, a noroeste com o distrito de&nbsp;Milange, a oeste com o distrito de&nbsp;Morrumbala, a sul com os distritos de&nbsp;Nicoadala&nbsp;e&nbsp;Namacurra, a leste com o distrito de&nbsp;Maganja da Costa&nbsp;e a nordeste com o distrito de&nbsp;Ile.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007 Mocuba, com 300&nbsp;628 residentes, era o terceiro distrito com mais popula&ccedil;&atilde;o na Zamb&eacute;zia, s&oacute; sendo ultrapassado pelos vizinhos Milange e Morrumbala.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Popula&ccedil;&atilde;o</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 300&nbsp;628 residentes. Com uma &aacute;rea de 8803&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 34,15&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 214&nbsp;748 habitantes e uma &aacute;rea de 8867&nbsp;km&sup2;, daqui resultando uma densidade populacional de 24,2&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Divis&atilde;o administrativa</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito possui um munic&iacute;pio,&nbsp;Mocuba, e est&aacute; dividido por tr&ecirc;s postos administrativos:&nbsp;Mocuba,&nbsp;Mugeba&nbsp;e&nbsp;Namajavira. Estes estavam, em 2007, subdivididos em 5&nbsp;localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Munic&iacute;pio de&nbsp;Mocuba</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Mocuba:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Munhiba</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Mugeba:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Maguia&nbsp;</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mugeba</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Namajavira:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Alto Benfica</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namajavira</li>
</ul>
</li>
</ul>
</div>', N'0', N'8803  km²', N'300 628', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'13', NULL, N'Mocubela', N'Perfil2452020173419_13.jpg', NULL, N'<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Mocubela &eacute; um distrito da prov&iacute;ncia da Zamb&eacute;zia, em Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de Mocubela. Foi criado em 2013, com a eleva&ccedil;&atilde;o a distrito do posto administrativo do Mocubela, mais o posto administrativo de Bajone, que pertenciam ao distrito de Maganja da Costa.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Tem limite, a norte com o distrito de Mulevala, a noroeste e oeste com o distrito de Mocuba, a oeste com o distrito de Maganja da Costa, a sul com o Oceano &Iacute;ndico e a leste com o distrito de Pebane.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Em 2012, o distrito tinha uma popula&ccedil;&atilde;o estimada em 114 830 habitantes.</span></p>', N'0', NULL, N'114 830', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'14', NULL, N'Molumbo', N'Perfil245202017375_14.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7689.83622287347!2d36.26831537080044!3d-15.488836306966853!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18da4823422500a9%3A0x142bdd62f6f9dc61!2sMolumbo!5e0!3m2!1spt-PT!2smz!4v1590334561377!5m2!1spt-PT!2smz', N'<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Molumbo &eacute; um distrito da prov&iacute;ncia da Zamb&eacute;zia, em Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de Molumbo. Foi criado em 2013, com a eleva&ccedil;&atilde;o a distrito do posto administrativo do Molumbo que pertencia ao distrito de Milange.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Tem limite, a norte com o distrito de Mecanhelas da prov&iacute;ncia de Niassa, a oeste com o Malawi, a sul com os distritos de Milange e Lugela, e a oeste com os distritos de Namarroi e Guru&eacute;.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Em 2012, o distrito tinha uma popula&ccedil;&atilde;o estimada em 101 664 habitantes.</span></p>', N'0', NULL, N'101 664 ', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'15', NULL, N'Mopeia', N'Perfil245202017404_15.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30360.365837073135!2d35.68977331693315!3d-17.976609314576!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d4637272861e03%3A0xd529aae737e28b90!2sMopeia!5e0!3m2!1spt-PT!2smz!4v1590334723165!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de&nbsp;Mopeia. Tem limite, a norte com o distrito de&nbsp;Morrumbala, a oeste com o distrito de&nbsp;Mutarara&nbsp;da prov&iacute;ncia de&nbsp;Tete, a oeste e sudoeste com os distritos de&nbsp;Caia&nbsp;e&nbsp;Marromeu, ambos da prov&iacute;ncia de&nbsp;Sofala, a sul com o distrito de&nbsp;Chinde&nbsp;e a leste com os distritos de&nbsp;Inhassunge&nbsp;e&nbsp;Nicoadala.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, Mopeia era o distrito da Zamb&eacute;zia com menor&nbsp;densidade populacional, com 15,03&nbsp;habitantes por&nbsp;km&sup2;. Um estatuto alcan&ccedil;ado sobretudo pelo n&uacute;mero de 115&nbsp;291 residentes, que na prov&iacute;ncia era apenas superior ao apresentado por&nbsp;Inhassunge. Curiosamente, Inhassunge era o distrito com a maior densidade populacional da prov&iacute;ncia devido sobretudo a ter o mais pequeno territ&oacute;rio.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&nbsp;</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Popula&ccedil;&atilde;o</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 115&nbsp;291 residentes. Com uma &aacute;rea de 7671&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 15,03&nbsp;habitantes por km&sup2;. Um valor que coloca Mopeia como o distrito da Zamb&eacute;zia com menor densidade populacional.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 71&nbsp;535 habitantes e uma &aacute;rea de 7614&nbsp;km&sup2;, daqui resultando uma densidade populacional de 9,4&nbsp;habitantes por km&sup2;, a mais baixa da prov&iacute;ncia.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito de Mopeia est&aacute; dividido em dois postos administrativos:&nbsp;Campo&nbsp;e&nbsp;Mopeia. Estes, por sua vez, eram constitu&iacute;dos por um total de 8&nbsp;localidades, em 2005:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Campo:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Campo</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Catale</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Luala</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mungane</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Mopeia:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Chimuara</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mopeia</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">N''Zanza</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Rovuma</li>
</ul>
</li>
</ul>
</div>', N'0', N'7671  km²', N'115 291', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'16', NULL, N'Morrumbala', N'Perfil245202017432_16.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d976754.4974319214!2d35.24390479646055!3d-17.00171801699607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d6c90c9a1b05a9%3A0xe5831f16af36da8c!2sMorrumbala!5e0!3m2!1spt-PT!2smz!4v1590334901395!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na vila de&nbsp;Morrumbala.<br />Tem limites a norte com o distrito de&nbsp;Milange, a oeste com o&nbsp;Malawi&nbsp;e com o distrito de&nbsp;Mutarara&nbsp;da prov&iacute;ncia de&nbsp;Tete, a sul com o distrito de&nbsp;Mopeia&nbsp;e a leste com os distritos de&nbsp;Inhassunge&nbsp;e&nbsp;Nicoadala.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Com uma &aacute;rea de 12&nbsp;801&nbsp;&nbsp;km&sup2;, Morrumbala &eacute; o maior distrito da prov&iacute;ncia da Zamb&eacute;zia, possuindo, em 2007, o segundo maior n&uacute;mero de residentes, 358&nbsp;913, um valor s&oacute; suplantado pelo vizinho&nbsp;Milange.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Popula&ccedil;&atilde;o</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 358&nbsp;913 residentes. Com uma &aacute;rea de 12&nbsp;801&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 28,04&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 243&nbsp;751 habitantes e uma &aacute;rea de 12&nbsp;972&nbsp;km&sup2;, daqui resultando uma densidade populacional de 18,8&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">At&eacute; 1975, Morrumbala constitu&iacute;a uma "circunscri&ccedil;&atilde;o administrativa", na at&eacute; ent&atilde;o denominada&nbsp;Prov&iacute;ncia de Mo&ccedil;ambique, criada em 1832.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito de Morrumbala foi dividido em quatro&nbsp;postos administrativos:&nbsp;Chire,&nbsp;Derre,&nbsp;Megaza&nbsp;e&nbsp;Morrumbala. Estes, por sua vez, eram compostos, em 2007, por 13&nbsp;localidades<span style="position: relative; font-size: 10.5px; line-height: 0; vertical-align: baseline; top: -0.5em;">.</span></p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Chire:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Chilomo</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Chire</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Gorro</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Derre:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Derre</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Guerissa</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Machindo</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Megaza:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Megaza</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Pinda</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Sabe</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Morrumbala
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Boroma</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mepinha</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Morrumbala</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Muandiua</li>
</ul>
</li>
</ul>
</div>', N'0', N'12 801  km²', N'358 913', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'17', NULL, N'Mulevala', N'Perfil2452020174649_17.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30614.024994246374!2d37.560539065062365!3d-16.43735992386555!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18ce342ac363d971%3A0xcb316e605b2891!2sMulevala!5e0!3m2!1spt-PT!2smz!4v1590335133774!5m2!1spt-PT!2smz', N'<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Mulevala &eacute; um distrito da prov&iacute;ncia da Zamb&eacute;zia, em Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de Mulevala. Foi criado em 2013, com a eleva&ccedil;&atilde;o a distrito do posto administrativo do Mulevala que pertencia ao distrito de Ile.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Tem limite, a norte com os distritos de Alto Mol&oacute;cue e Ile, a oeste com o distrito de Mocuba, a sul com os distritos de Mocubela e Pebane e a leste com o distrito de Gil&eacute;.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Em 2012, o distrito tinha uma popula&ccedil;&atilde;o estimada em 81 967 habitantes.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">O distrito est&aacute; dividido nos postos administrativos de Chiraco e Mulevala compostos pelas seguintes localidades:</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">&nbsp;</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Posto Administrativo de Chiraco</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Posto Administrativo de Mulevala:</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Micalane</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Mucata</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Namigonha</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Ruge</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Tebo</span></p>', N'0', NULL, N'81 967', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'18', NULL, N'Namacura', N'Perfil2452020175040_18.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d487097.1850709666!2d36.77521634995751!3d-17.48617432864227!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d26c4867cd0c29%3A0x2b087df939866b4f!2sNamacurra!5e0!3m2!1spt-PT!2smz!4v1590335333228!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; uma vila da prov&iacute;ncia da&nbsp;Zamb&eacute;zia&nbsp;em&nbsp;Mo&ccedil;ambique, sede do&nbsp;distrito do mesmo nome.A vila de Namacurra tem, de acordo com o censo de 1997, uma popula&ccedil;&atilde;o de 2 873 habitantes.O Posto Administrativo de Namacurra, de acordo com o Censo de 2007, incluia uma popula&ccedil;&atilde;o de 94&nbsp;693 residentes.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Hist&oacute;ria</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Namacurra surge referenciado como "circunscri&ccedil;&atilde;o" administrativa em 1960, um patamar da administra&ccedil;&atilde;o local mantido aquando da revis&atilde;o do "Estatuto Pol&iacute;tico-Administrativo da Prov&iacute;ncia de Mo&ccedil;ambique", em 1963, por imposi&ccedil;&atilde;o da "Lei Org&acirc;nica do Ultramar" do estado portugu&ecirc;s desse mesmo ano.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 1986, transitaram do distrito de Namacurra para a cria&ccedil;&atilde;o&nbsp;do distrito de&nbsp;Nicoadala&nbsp;um total de 3 localidades:&nbsp;Munhonha,&nbsp;Nhafuba&nbsp;e&nbsp;Nicoadala.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Popula&ccedil;&atilde;o</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 186&nbsp;410 residentes. Com uma &aacute;rea de 2028&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 91,92&nbsp;habitantes por km&sup2;. Este &eacute; um valor s&oacute; superado na prov&iacute;ncia no seu distrito mais pequeno:&nbsp;Inhassunge.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 160&nbsp;879 habitantes e uma &aacute;rea de 1798&nbsp;km&sup2;, daqui resultando uma densidade populacional de 89,5&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De notar que em 1980, a &aacute;rea definida para o distrito de Namacurra era de 3941&nbsp;km&sup2;. Um valor que, conjugado com 163&nbsp;128 habitantes, resultava numa densidade populacional de 41,4&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em dois postos administrativos:&nbsp;Macusse&nbsp;e&nbsp;Namacurra. Estes postos, por sua vez, eram compostos por um total de 9 localidades, em 2007:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Macusse:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Furquia</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Macusse</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Maxixine</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mbaua</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Namacurra:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Malei</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Muebele</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mutange</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namacurra</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Pida</li>
</ul>
</li>
</ul>
</div>', N'0', N'2028  km²', N'94 693', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'19', NULL, N'Namarroi', N'Perfil245202017535_19.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d982484.5681441476!2d36.24995946201338!3d-15.865511681608494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18da9d1334bbcf29%3A0xc93bad25bf06c3c9!2sNamarroi!5e0!3m2!1spt-PT!2smz!4v1590335533564!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de&nbsp;Namarroi. Tem limite, a norte com o distrito de&nbsp;Guru&eacute;, a oeste com o distrito de&nbsp;Milange, a sul e sudoeste com o distrito de&nbsp;Lugela&nbsp;e a leste com o distrito de&nbsp;Ile.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Popula&ccedil;&atilde;o</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 125&nbsp;999 residentes. Com uma &aacute;rea de 3071&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 41,03&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 95&nbsp;257 habitantes e uma &aacute;rea de 3019&nbsp;km&sup2;, daqui resultando uma densidade populacional de 31,6&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em dois postos administrativos:&nbsp;Namarroi&nbsp;e&nbsp;Regone. Estes, por sua vez, s&atilde;o compostos por um total de 7 localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Namarroi:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Lipilali</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Marea</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mudine</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Muemue</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namarroi</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Regone:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mutatala</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Regone</li>
</ul>
</li>
</ul>
</div>', N'0', N'3071  km²', N'125 999', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'20', NULL, N'Nicoadala', N'Perfil2452020175536_20.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d973649.2325176746!2d36.24171963149291!3d-17.58766063491082!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d24572de459395%3A0x879b5879f17c5227!2sNicoadala!5e0!3m2!1spt-PT!2smz!4v1590335688256!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de&nbsp;Nicoadala. O seu territ&oacute;rio &eacute; limitado, a norte com o distrito de&nbsp;Mocuba, a oeste com os distritos de&nbsp;Morrumbala&nbsp;e&nbsp;Mopeia, a sul com o distrito de&nbsp;Inhassunge&nbsp;e o munic&iacute;pio de&nbsp;Quelimane, a leste com o&nbsp;Oceano &Iacute;ndico&nbsp;e a nordeste com o distrito de&nbsp;Namacurra.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito de Nicoadala foi criado em 1986 conjuntamente com mais 25 distritos, a n&iacute;vel nacional, e a par de&nbsp;Inhassunge, na Zamb&eacute;zia.&nbsp;Nesta altura, para o seu territ&oacute;rio transitaram um total de 10 localidades, com&nbsp;Munhonha,&nbsp;Nhafuba&nbsp;e&nbsp;Nicoadala, origin&aacute;rias do distrito de&nbsp;Namacurra, enquanto que do ent&atilde;o distrito de&nbsp;Quelimane&nbsp;transitaram&nbsp;Ionge,&nbsp;Madal,&nbsp;Maquival,&nbsp;Marrongane&nbsp;Nangoela,&nbsp;Namacata&nbsp;e&nbsp;Ilova.&nbsp;Esta &uacute;ltima localidade, Ilova, j&aacute; n&atilde;o vem referida no perfil do distrito apresentado pelo Portal do Governo, datado de 2005.</p>
<a id="eztoc37026_0_0_1" style="color: #008c64;" name="eztoc37026_0_0_1"></a>
<h4 style="color: #008c64; text-rendering: optimizelegibility; border-bottom: 1px solid #d6d6d6; margin: 1em 0px; line-height: 31.5px; font-size: 18px;">Popula&ccedil;&atilde;o</h4>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 231&nbsp;850 residentes. Com uma &aacute;rea de 3392&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 68,35&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 135 275 habitantes e uma &aacute;rea de 3582 km&sup2;, daqui resultando uma densidade populacional de 37,8 habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&nbsp;</p>
<h3 style="color: #008c64; text-rendering: optimizelegibility; border-bottom: 1px solid #d6d6d6; margin: 1em 0px; line-height: 31.5px; font-size: 18px;">Divis&atilde;o administrativa</h3>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em dois postos administrativos:&nbsp;Maquival&nbsp;e&nbsp;Nicoadala. Estes, por sua vez, s&atilde;o compostos por um total de 9 localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Maquival:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Ionge</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Madal</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Maquival</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Marrongane</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nangoela</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Nicoadala:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Munhonha</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namacata</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nhafuba</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nicoadala</li>
</ul>
</li>
</ul>
</div>', N'0', N'3392  km²', N'231 850 ', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'21', NULL, N'Pebane', N'Perfil245202017590_21.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30479.37669799247!2d38.13919341605544!3d-17.271003941483617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18cc45fce1e5dfc1%3A0xa8a128cc4b6c777a!2sPebane!5e0!3m2!1spt-PT!2smz!4v1590335806215!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;">&eacute; um distrito da prov&iacute;ncia da&nbsp;Zamb&eacute;zia, em&nbsp;Mo&ccedil;ambique, com sede na vila de&nbsp;Pebane.<br />Tem limite, a norte com o distrito de&nbsp;Gil&eacute;, a oeste com os distritos de&nbsp;Ile&nbsp;e&nbsp;Maganja da Costa, a sul com o&nbsp;Oceano &Iacute;ndico&nbsp;e a leste com o distrito de&nbsp;Moma&nbsp;da prov&iacute;ncia de&nbsp;Nampula.</p>
</div>
<div class="attribute-long" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Popula&ccedil;&atilde;o</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">Em 2007, o&nbsp;Censo&nbsp;indicou uma popula&ccedil;&atilde;o de 185&nbsp;333 residentes. Com uma &aacute;rea de 10&nbsp;182&nbsp;&nbsp;km&sup2;, a&nbsp;densidade populacional&nbsp;rondava os 18,20&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">De acordo com o Censo de 1997, o distrito tinha 198&nbsp;451 habitantes e uma &aacute;rea de 9985&nbsp;km&sup2;, daqui resultando uma densidade populacional de 19,9&nbsp;habitantes por km&sup2;.</p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;"><strong>Divis&atilde;o administrativa</strong></p>
<p style="margin: 0px 0px 10.5px; line-height: 21px;">O distrito est&aacute; dividido em tr&ecirc;s postos administrativos:&nbsp;Mulela Mualama,&nbsp;Naburi&nbsp;e&nbsp;Pebane. Estes, por sua vez, eram compostos, 2007, por um total de 14 localidades:</p>
<ul style="padding: 0px; margin: 0.5em 0px 10.5px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Mulela Mualama:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Alto Maganha</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Malema</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mulela</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mucocoro</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namanla</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Naburi:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Mihecue</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Naburi</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Namahipe</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Tomeia</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Txalalane</li>
</ul>
</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Posto Administrativo de&nbsp;Pebane:
<ul style="padding: 0px; margin: 0.5em 0px 0px 1em; list-style: none;">
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Pebane</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Impaca</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Magiga</li>
<li style="line-height: 21px; margin-bottom: 0.5em; position: relative;">Nicadine</li>
</ul>
</li>
</ul>
</div>', N'0', N'10 182  km²', N'185 333', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (N'22', NULL, N'Quelimane', N'Perfil245202018143_22.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60761.55521163133!2d36.8689249872236!3d-17.85750772625945!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d2f3924aa45035%3A0x301df4b81c5c9fac!2sQuelimane!5e0!3m2!1spt-PT!2smz!4v1590336066880!5m2!1spt-PT!2smz', N'<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Quelimane &eacute; a capital e a maior cidade da prov&iacute;ncia da Zamb&eacute;zia, em Mo&ccedil;ambique. Est&aacute; localizada no rio dos Bons Sinais, a cerca de 20 km do Oceano &Iacute;ndico; por essa raz&atilde;o, a cidade conta com um porto, que &eacute; uma das suas principais actividades econ&oacute;micas, centro de uma importante ind&uacute;stria pesqueira.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">A cidade de Quelimane &eacute; administrativamente um munic&iacute;pio com um governo local eleito e tamb&eacute;m um distrito, que administra as compet&ecirc;ncias do governo central.[1] Numa &aacute;rea de 117 km&sup2;, a cidade tinha 150 116 habitantes em 1997. A popula&ccedil;&atilde;o tinha ascendido a 185.000 habitantes em 2003, e o censo de 2007 registou 193.343 habitantes.</span></p>', N'0', NULL, NULL, NULL, NULL, N'0')
GO

SET IDENTITY_INSERT [dbo].[distrito] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for distrito_classificacao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[distrito_classificacao]') AND type IN ('U'))
	DROP TABLE [dbo].[distrito_classificacao]
GO

CREATE TABLE [dbo].[distrito_classificacao] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_distrito] int  NULL,
  [id_usuario] bigint  NULL,
  [e_like] bit  NULL,
  [data_cadastro] datetime  NULL,
  [activo] bit  NULL,
  [nomeUsuario] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [assunto] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [estrelas] int  NULL
)
GO

ALTER TABLE [dbo].[distrito_classificacao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for distrito_comentario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[distrito_comentario]') AND type IN ('U'))
	DROP TABLE [dbo].[distrito_comentario]
GO

CREATE TABLE [dbo].[distrito_comentario] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_distrito] int  NULL,
  [id_usuario] bigint  NULL,
  [comentario] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data] datetime  NULL,
  [valido] bit  NULL,
  [nomeUsuario] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [assunto] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[distrito_comentario] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for distrito_foto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[distrito_foto]') AND type IN ('U'))
	DROP TABLE [dbo].[distrito_foto]
GO

CREATE TABLE [dbo].[distrito_foto] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_distrito] int  NULL,
  [caminho] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[distrito_foto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for empresa
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[empresa]') AND type IN ('U'))
	DROP TABLE [dbo].[empresa]
GO

CREATE TABLE [dbo].[empresa] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [telefone] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [website] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [endereco] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [seguranca] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [como_pagar] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[empresa] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for entidade_cultural
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[entidade_cultural]') AND type IN ('U'))
	DROP TABLE [dbo].[entidade_cultural]
GO

CREATE TABLE [dbo].[entidade_cultural] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_categoria_cultura] int  NULL,
  [nome] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [origem] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [praticantes] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [publico] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modalidade] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [conhecidaanivel] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [impacto] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [publicado] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[entidade_cultural] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for evento
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[evento]') AND type IN ('U'))
	DROP TABLE [dbo].[evento]
GO

CREATE TABLE [dbo].[evento] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [nome] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL,
  [data_evento] datetime  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_distrito] int  NULL,
  [local] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [inactivo] bit  NULL,
  [adiado] bit  NULL,
  [realizado] bit  NULL,
  [id_categoria] int  NULL,
  [preco_bilhete] decimal(18,2)  NULL,
  [preco_bilhete_vip] decimal(18,2)  NULL,
  [orador] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [moderador] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [part_assistente] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nr_participantes] int  NULL
)
GO

ALTER TABLE [dbo].[evento] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for evento_categoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[evento_categoria]') AND type IN ('U'))
	DROP TABLE [dbo].[evento_categoria]
GO

CREATE TABLE [dbo].[evento_categoria] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[evento_categoria] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of evento_categoria
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[evento_categoria] ON
GO

INSERT INTO [dbo].[evento_categoria] ([id], [descricao]) VALUES (N'1', N'Espectaculos')
GO

INSERT INTO [dbo].[evento_categoria] ([id], [descricao]) VALUES (N'2', N'Eventos académicos')
GO

INSERT INTO [dbo].[evento_categoria] ([id], [descricao]) VALUES (N'3', N'Congresso')
GO

INSERT INTO [dbo].[evento_categoria] ([id], [descricao]) VALUES (N'4', N'Simpósio')
GO

INSERT INTO [dbo].[evento_categoria] ([id], [descricao]) VALUES (N'5', N'Colóquio')
GO

INSERT INTO [dbo].[evento_categoria] ([id], [descricao]) VALUES (N'6', N'Fórum')
GO

INSERT INTO [dbo].[evento_categoria] ([id], [descricao]) VALUES (N'7', N'Mesa Redonda')
GO

INSERT INTO [dbo].[evento_categoria] ([id], [descricao]) VALUES (N'8', N'Outro')
GO

SET IDENTITY_INSERT [dbo].[evento_categoria] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for evento_comentario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[evento_comentario]') AND type IN ('U'))
	DROP TABLE [dbo].[evento_comentario]
GO

CREATE TABLE [dbo].[evento_comentario] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_evento] bigint  NULL,
  [id_usuario] bigint  NULL,
  [data_cadastro] datetime  NULL,
  [valido] bit  NULL,
  [comentario] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nomeUsuario] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [assunto] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[evento_comentario] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for farmacia
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[farmacia]') AND type IN ('U'))
	DROP TABLE [dbo].[farmacia]
GO

CREATE TABLE [dbo].[farmacia] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_distrito] int  NULL,
  [nome] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [bairro] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [telefone] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [inactivo] bit  NULL,
  [email] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL
)
GO

ALTER TABLE [dbo].[farmacia] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for farmacia_produto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[farmacia_produto]') AND type IN ('U'))
	DROP TABLE [dbo].[farmacia_produto]
GO

CREATE TABLE [dbo].[farmacia_produto] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_farmacia] bigint  NULL,
  [nome] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [preco_venda] decimal(18,2)  NULL,
  [foto_capa] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL,
  [inactivo] bit  NULL
)
GO

ALTER TABLE [dbo].[farmacia_produto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for filme
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[filme]') AND type IN ('U'))
	DROP TABLE [dbo].[filme]
GO

CREATE TABLE [dbo].[filme] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [minutos] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [direcao] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [elenco] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nacionalidade] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [titulo_original] varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [distribuidor] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ano_producao] int  NULL,
  [tipo_filme] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [orcamento] decimal(18,2)  NULL,
  [idioma] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [cor] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [sinopse] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [inactivo] bit  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [preco] decimal(18,2)  NULL,
  [link_trailer] varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[filme] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for filme_categoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[filme_categoria]') AND type IN ('U'))
	DROP TABLE [dbo].[filme_categoria]
GO

CREATE TABLE [dbo].[filme_categoria] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [descricao] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[filme_categoria] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of filme_categoria
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[filme_categoria] ON
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'1', N'Acçao')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'2', N'Animação')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'3', N'Aventura')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'4', N'Biografia')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'5', N'Clássico')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'6', N'Comédia')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'7', N'Crime')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'8', N'Documentos')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'9', N'Drama')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'10', N'Desporto')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'11', N'Familía')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'12', N'Fantasia')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'13', N'Faroste')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'14', N'Ficção Cientifica')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'15', N'Gospel')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'16', N'Guerra')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'17', N'Herói')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'18', N'História')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'19', N'Horror')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'20', N'Terror')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'21', N'Suspence')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'22', N'Romance')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'23', N'Nacional')
GO

INSERT INTO [dbo].[filme_categoria] ([id], [descricao]) VALUES (N'24', N'Musical')
GO

SET IDENTITY_INSERT [dbo].[filme_categoria] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for genero_musical
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[genero_musical]') AND type IN ('U'))
	DROP TABLE [dbo].[genero_musical]
GO

CREATE TABLE [dbo].[genero_musical] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[genero_musical] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of genero_musical
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[genero_musical] ON
GO

INSERT INTO [dbo].[genero_musical] ([id], [descricao]) VALUES (N'1', N'Zouk')
GO

INSERT INTO [dbo].[genero_musical] ([id], [descricao]) VALUES (N'2', N'Semba')
GO

INSERT INTO [dbo].[genero_musical] ([id], [descricao]) VALUES (N'3', N'RAP & RNB')
GO

INSERT INTO [dbo].[genero_musical] ([id], [descricao]) VALUES (N'4', N'Kizomba')
GO

INSERT INTO [dbo].[genero_musical] ([id], [descricao]) VALUES (N'5', N'Kuduro')
GO

INSERT INTO [dbo].[genero_musical] ([id], [descricao]) VALUES (N'6', N'Marrabenta')
GO

SET IDENTITY_INSERT [dbo].[genero_musical] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for hospital
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[hospital]') AND type IN ('U'))
	DROP TABLE [dbo].[hospital]
GO

CREATE TABLE [dbo].[hospital] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_distrito] int  NULL,
  [nome] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [bairro] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [inactivo] bit  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[hospital] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for item_filme_categoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[item_filme_categoria]') AND type IN ('U'))
	DROP TABLE [dbo].[item_filme_categoria]
GO

CREATE TABLE [dbo].[item_filme_categoria] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_filme] bigint  NULL,
  [id_categoria] bigint  NULL,
  [inactivo] bit  NULL
)
GO

ALTER TABLE [dbo].[item_filme_categoria] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for item_pacote_subscricao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[item_pacote_subscricao]') AND type IN ('U'))
	DROP TABLE [dbo].[item_pacote_subscricao]
GO

CREATE TABLE [dbo].[item_pacote_subscricao] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [item_nome] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [activo] bit  NULL,
  [id_pacote_subscricao] int  NULL
)
GO

ALTER TABLE [dbo].[item_pacote_subscricao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for loja
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[loja]') AND type IN ('U'))
	DROP TABLE [dbo].[loja]
GO

CREATE TABLE [dbo].[loja] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [nome] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_distrito] int  NULL,
  [bairro] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [inactivo] bit  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL,
  [telefone] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_tipo_loja] int  NULL
)
GO

ALTER TABLE [dbo].[loja] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for loja_produto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[loja_produto]') AND type IN ('U'))
	DROP TABLE [dbo].[loja_produto]
GO

CREATE TABLE [dbo].[loja_produto] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [codigo] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_loja] bigint  NULL,
  [nome] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [preco_min] money  NULL,
  [preco_max] money  NULL,
  [preco_venda] money  NULL,
  [e_servico] bit  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL,
  [clicks] int  NULL,
  [inactivo] bit  NULL,
  [id_categoria] int  NULL,
  [categoria] int  NULL
)
GO

ALTER TABLE [dbo].[loja_produto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for loja_tipo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[loja_tipo]') AND type IN ('U'))
	DROP TABLE [dbo].[loja_tipo]
GO

CREATE TABLE [dbo].[loja_tipo] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[loja_tipo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of loja_tipo
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[loja_tipo] ON
GO

INSERT INTO [dbo].[loja_tipo] ([id], [descricao]) VALUES (N'1', N'Supermercado')
GO

INSERT INTO [dbo].[loja_tipo] ([id], [descricao]) VALUES (N'2', N'Imobiliária')
GO

INSERT INTO [dbo].[loja_tipo] ([id], [descricao]) VALUES (N'3', N'Mercearia')
GO

SET IDENTITY_INSERT [dbo].[loja_tipo] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for musica
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[musica]') AND type IN ('U'))
	DROP TABLE [dbo].[musica]
GO

CREATE TABLE [dbo].[musica] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_genero_musical] int  NULL,
  [titulo] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [artista] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ano] int  NULL,
  [album] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [formato] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [produtor] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [gravadora] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [link] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [caminho_ficheiro] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [caminho_capa1] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [caminho_capa2] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [preco_venda] money  NULL,
  [gratis] bit  NULL,
  [duracao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [pode_baixar] bit  NULL,
  [e_album] bit  NULL,
  [id_artista_obra] bigint  NULL
)
GO

ALTER TABLE [dbo].[musica] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of musica
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[musica] ON
GO

INSERT INTO [dbo].[musica] ([id], [id_genero_musical], [titulo], [artista], [ano], [album], [formato], [produtor], [gravadora], [link], [caminho_ficheiro], [caminho_capa1], [caminho_capa2], [preco_venda], [gratis], [duracao], [pode_baixar], [e_album], [id_artista_obra]) VALUES (N'2', N'1', N'Mereço ', N'Humberto Luis', N'2016', NULL, N'MP3', N'-', N'-', N'', N'musica_2100620201710.mp3', N'Capa106202017117_2.jpg', NULL, N'500.0000', N'0', N'3:23', N'0', N'0', N'2')
GO

SET IDENTITY_INSERT [dbo].[musica] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for obra_arte
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[obra_arte]') AND type IN ('U'))
	DROP TABLE [dbo].[obra_arte]
GO

CREATE TABLE [dbo].[obra_arte] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_categoria_obra] int  NULL,
  [titulo] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [autor] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [materia] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [suporte] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [tecnica] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [dimensoes] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [autoria_producao] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [informacao_tecnica] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [fotografo] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [proprietario] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [caminho_imagem] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_artista_obra] bigint  NULL
)
GO

ALTER TABLE [dbo].[obra_arte] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for obra_arte_imagem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[obra_arte_imagem]') AND type IN ('U'))
	DROP TABLE [dbo].[obra_arte_imagem]
GO

CREATE TABLE [dbo].[obra_arte_imagem] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_obra_arte] bigint  NULL,
  [caminho_imagem] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[obra_arte_imagem] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for pacote_subscricao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[pacote_subscricao]') AND type IN ('U'))
	DROP TABLE [dbo].[pacote_subscricao]
GO

CREATE TABLE [dbo].[pacote_subscricao] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nome] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [preco_por_mes] decimal(18,2)  NULL,
  [activo] bit  NULL
)
GO

ALTER TABLE [dbo].[pacote_subscricao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for produto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[produto]') AND type IN ('U'))
	DROP TABLE [dbo].[produto]
GO

CREATE TABLE [dbo].[produto] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_categoria] int  NULL,
  [id_tipo_produto] int  NULL,
  [nome_oficial] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nome_tradicional] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nome_vulgar] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [origem] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [poder_comercial] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [volume_producao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [forma_aquisicao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [preco_custo] money  NULL,
  [preco_venda] money  NULL,
  [preco_exportacao] money  NULL,
  [aceita_reserva] bit  NULL,
  [metodo_reserva] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [aceita_envio] bit  NULL,
  [metodo_envio] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [activo] bit  NULL
)
GO

ALTER TABLE [dbo].[produto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for produto_categoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[produto_categoria]') AND type IN ('U'))
	DROP TABLE [dbo].[produto_categoria]
GO

CREATE TABLE [dbo].[produto_categoria] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[produto_categoria] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of produto_categoria
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[produto_categoria] ON
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'1', N'Vegetais')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'2', N'Carnes')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'3', N'Electronicos')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'4', N'Alimentos e Bebidas')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'5', N'Apps e Jogos')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'6', N'Automotivo')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'7', N'Bebês')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'8', N'Beleza')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'9', N'Bolsas, Malas e Mochilas')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'10', N'Brinquedos e Jogos')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'11', N'Casa')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'12', N'CD e Vinil')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'13', N'Computadores e Informática')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'14', N'Cozinha')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'15', N'DVD e Blu-Ray')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'16', N'Eletrodomésticos')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'17', N'Eletrônicos')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'18', N'Desporto e Aventura')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'19', N'Ferramentas e Materiais de Construção')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'20', N'Games')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'21', N'Jardim e Piscina')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'22', N'Livros')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'23', N'Material para Escritório e Papelaria')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'24', N'Móveis e Decoração')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'25', N'Pet Shop')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'27', N'Roupas, Calçados e Joias')
GO

INSERT INTO [dbo].[produto_categoria] ([id], [descricao]) VALUES (N'28', N'Saúde e Cuidados Pessoais')
GO

SET IDENTITY_INSERT [dbo].[produto_categoria] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for restaurante
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[restaurante]') AND type IN ('U'))
	DROP TABLE [dbo].[restaurante]
GO

CREATE TABLE [dbo].[restaurante] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [nome] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [endereco] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [telefone] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto_capa] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [website] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [mapa] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_restaurante_tipo] int  NULL,
  [id_distrito] int  NULL,
  [activo] bit  NULL
)
GO

ALTER TABLE [dbo].[restaurante] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for restaurante_classificacao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[restaurante_classificacao]') AND type IN ('U'))
	DROP TABLE [dbo].[restaurante_classificacao]
GO

CREATE TABLE [dbo].[restaurante_classificacao] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_restaurante] bigint  NULL,
  [classificacao] int  NULL,
  [usuario_nome] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [usuario_email] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [usuario_assunto] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [comentario] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL,
  [id_usuario] bigint  NULL
)
GO

ALTER TABLE [dbo].[restaurante_classificacao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for restaurante_comentario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[restaurante_comentario]') AND type IN ('U'))
	DROP TABLE [dbo].[restaurante_comentario]
GO

CREATE TABLE [dbo].[restaurante_comentario] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_restaurante] bigint  NULL,
  [id_usuario] bigint  NULL,
  [data] datetime  NULL,
  [valido] bit  NULL,
  [comentario] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nomeUsuario] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [assunto] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[restaurante_comentario] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for restaurante_foto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[restaurante_foto]') AND type IN ('U'))
	DROP TABLE [dbo].[restaurante_foto]
GO

CREATE TABLE [dbo].[restaurante_foto] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [caminho] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_restaurante] bigint  NULL,
  [activo] bit  NULL
)
GO

ALTER TABLE [dbo].[restaurante_foto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for restaurante_prato
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[restaurante_prato]') AND type IN ('U'))
	DROP TABLE [dbo].[restaurante_prato]
GO

CREATE TABLE [dbo].[restaurante_prato] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_resturante] bigint  NULL,
  [nome] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [preco_venda] decimal(18,2)  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastrro] datetime  NULL,
  [inactivo] bit  NULL,
  [id__prato_categoria] bigint  NULL
)
GO

ALTER TABLE [dbo].[restaurante_prato] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for restaurante_prato_categoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[restaurante_prato_categoria]') AND type IN ('U'))
	DROP TABLE [dbo].[restaurante_prato_categoria]
GO

CREATE TABLE [dbo].[restaurante_prato_categoria] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [descricao] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[restaurante_prato_categoria] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of restaurante_prato_categoria
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[restaurante_prato_categoria] ON
GO

INSERT INTO [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (N'1', N'Entradas ')
GO

INSERT INTO [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (N'2', N'Sopas')
GO

INSERT INTO [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (N'3', N'Saladas e Massas')
GO

INSERT INTO [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (N'4', N'Peixes Crustáceos')
GO

INSERT INTO [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (N'5', N'Carnes')
GO

INSERT INTO [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (N'6', N'Guarnições')
GO

INSERT INTO [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (N'7', N'Queijos')
GO

INSERT INTO [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (N'8', N'Doces e Frutas')
GO

INSERT INTO [dbo].[restaurante_prato_categoria] ([id], [descricao]) VALUES (N'9', N'Especialidades')
GO

SET IDENTITY_INSERT [dbo].[restaurante_prato_categoria] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for restaurante_tipo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[restaurante_tipo]') AND type IN ('U'))
	DROP TABLE [dbo].[restaurante_tipo]
GO

CREATE TABLE [dbo].[restaurante_tipo] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [tipo] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[restaurante_tipo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of restaurante_tipo
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[restaurante_tipo] ON
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'1', N'Comida Rapida')
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'2', N'Pizza')
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'3', N'Pastelaria')
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'4', N'Mexicana')
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'5', N'Chinesa')
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'6', N'Italiana')
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'7', N'Take-away')
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'8', N'Lanchonete')
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'9', N'Churrascaria')
GO

INSERT INTO [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (N'10', N'Hamburgueria')
GO

SET IDENTITY_INSERT [dbo].[restaurante_tipo] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for servico
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[servico]') AND type IN ('U'))
	DROP TABLE [dbo].[servico]
GO

CREATE TABLE [dbo].[servico] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [nome] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [endereco] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [telefone] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto_capa] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_servico_categoria] int  NULL,
  [id_distrito] int  NULL
)
GO

ALTER TABLE [dbo].[servico] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for servico_categoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[servico_categoria]') AND type IN ('U'))
	DROP TABLE [dbo].[servico_categoria]
GO

CREATE TABLE [dbo].[servico_categoria] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [codigo] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nome] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[servico_categoria] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for servico_foto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[servico_foto]') AND type IN ('U'))
	DROP TABLE [dbo].[servico_foto]
GO

CREATE TABLE [dbo].[servico_foto] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [caminho] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_servico] bigint  NULL
)
GO

ALTER TABLE [dbo].[servico_foto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for taxi
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[taxi]') AND type IN ('U'))
	DROP TABLE [dbo].[taxi]
GO

CREATE TABLE [dbo].[taxi] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [nome] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [praca_fixa] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [bairro] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [condutor] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [proprietario] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [matricula] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [marca] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [cor] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [telefone] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_distrito] int  NULL,
  [foto_capa] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Inactivo] bit  NULL,
  [id_categoria] int  NULL
)
GO

ALTER TABLE [dbo].[taxi] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for taxi_categoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[taxi_categoria]') AND type IN ('U'))
	DROP TABLE [dbo].[taxi_categoria]
GO

CREATE TABLE [dbo].[taxi_categoria] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [fotografia] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[taxi_categoria] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of taxi_categoria
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[taxi_categoria] ON
GO

INSERT INTO [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (N'1', N'Txopela', NULL)
GO

INSERT INTO [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (N'2', N'Motorizadas', NULL)
GO

INSERT INTO [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (N'3', N'Automóveis', NULL)
GO

INSERT INTO [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (N'4', N'Bicicleta', NULL)
GO

SET IDENTITY_INSERT [dbo].[taxi_categoria] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for tipo_produto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tipo_produto]') AND type IN ('U'))
	DROP TABLE [dbo].[tipo_produto]
GO

CREATE TABLE [dbo].[tipo_produto] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[tipo_produto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for turismo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[turismo]') AND type IN ('U'))
	DROP TABLE [dbo].[turismo]
GO

CREATE TABLE [dbo].[turismo] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [nome] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [data_cadastro] datetime  NULL,
  [id_distrito] int  NULL,
  [localizacao] nvarchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [inactivo] bit  NULL,
  [foto_capa] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [descricao] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_categoria] int  NULL
)
GO

ALTER TABLE [dbo].[turismo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for turismo_categoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[turismo_categoria]') AND type IN ('U'))
	DROP TABLE [dbo].[turismo_categoria]
GO

CREATE TABLE [dbo].[turismo_categoria] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [descricao] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [fotografia] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[turismo_categoria] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of turismo_categoria
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[turismo_categoria] ON
GO

INSERT INTO [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (N'1', N'TURISMO CULTURAL', NULL)
GO

INSERT INTO [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (N'2', N'TURISMO RELIGIOSO', NULL)
GO

INSERT INTO [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (N'3', N'TURISMO CONSUMO', NULL)
GO

INSERT INTO [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (N'4', N'TURISMO DESPORTIVO', NULL)
GO

INSERT INTO [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (N'5', N'TURISMO DE NEGÓCIOS', NULL)
GO

INSERT INTO [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (N'6', N'TURISMO GASTRONÔMICO', NULL)
GO

INSERT INTO [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (N'7', N'TURISMO ECOLÓGICO', NULL)
GO

INSERT INTO [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (N'8', N'TURISMO AVENTURA', NULL)
GO

INSERT INTO [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (N'9', N'TURISMO SAÚDE', NULL)
GO

SET IDENTITY_INSERT [dbo].[turismo_categoria] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for turismo_comentario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[turismo_comentario]') AND type IN ('U'))
	DROP TABLE [dbo].[turismo_comentario]
GO

CREATE TABLE [dbo].[turismo_comentario] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_usuario] bigint  NULL,
  [data_cadastro] datetime  NULL,
  [valido] bit  NULL,
  [comentario] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [nomeUsuario] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [assunto] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_turismo] bigint  NULL
)
GO

ALTER TABLE [dbo].[turismo_comentario] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Usuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type IN ('U'))
	DROP TABLE [dbo].[Usuario]
GO

CREATE TABLE [dbo].[Usuario] (
  [idusario] bigint  IDENTITY(1,1) NOT NULL,
  [nome] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [usuario] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [senha] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [activo] bit  NULL,
  [datacadastro] datetime  NULL,
  [cod_autenticao] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [autenticado] bit  NULL,
  [msg_autenticacao] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_usuario_tipo] int  NULL,
  [telefone] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [tele] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [foto_capa] varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Usuario] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Usuario
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[Usuario] ON
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'1', N'Aministrador', N'admin@mussika.co.mz', N'hjaXldGSJhaiisXuEHM6gJga31QYwcss0We71W0ysY4oFcVKHSS4bnLAro6Q8zfBLcusb91OMQjxVjMbSWGiuY7ik8I1ZSreaM4+reZjzh0S1+r3X8BlYndnrISn6xyE', N'1', N'2019-12-18 13:46:04.437', NULL, N'1', NULL, N'3', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'19', N'Júnior Pires Alide', N'2443042385780655@mussika.co.mz', N'tgmREXnZQtLOPxXnNlynJLoIpjSCHd1lVu5Zb8EQo9LrEXHyl9fHTDIAY5Ws4kYul0uwyvJQ3aql1hkqqL7N4lvIM6IBupq5T+BY2zAIEBeGwkNgWmmOkuxNJD+uvXHz', N'1', N'2019-12-30 18:58:29.443', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'20', N'junior pires', N'118177461552061077467@mussika.co.mz', N'3jzWgbchzXV9FV3BHGSIEHKHGGRSJzqbRXiojpGNADq0CYiT4iu9wn0RHqoE4c7WdsAV60DS+9+2vwseU9xIjolMwGN9QssIKbGv6dMPEAS0YErO+AOCH5tugHt8pTJ/', N'1', N'2020-01-03 01:49:10.543', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'22', N'Junior Braz', N'1444361629073788@mussika.co.mz', N'DqH2O37g3qqrwSvMWTmn7tACrdZ2iJkGHIvfeqpZZYiS45aw7+gPbukPa50XMv/Cf1ZfAenm3M6Qi0+h3nXGoLF8Ly3W4ZnOgYxl10Sw1V5VgfB5h4Aqi2uAVdN9Pvjk', N'1', N'2020-01-07 16:43:13.083', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'33', N'jpires', N'jpires@mozsistemas.co.mz', N'iSY58NbG1aPPqif3APqjQ2Gk1afQ7SFhO5ATqUwCqYqJXJgWL6ksxBheSw9WFbydupAlm+BDs7610nrVeZlz85OfLCVSBC5b12RwXwdo2Fn9YCtK0jAOV13Wcv1HIZ25', N'1', N'2020-01-11 10:38:58.380', N'315036', N'0', NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'34', N'Afane Eduardo Momade', N'clivafan@gmail.com', N'LirgKfJffw5VkcobphcGuglZ366uLKd4HBpnnrKj4A2MFoAg3usMSzidmyl8C5hIvKUO/hdrlrN7LwIOlxkxWSOinhiFpLXW5V3BLNg7bCmMeTIxg7GxnVRyjqddhnrF', N'1', N'2020-01-12 20:45:28.473', N'078473', N'1', NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'35', N'Nando Zacarias Vontade Bernardo', N'nazvobe.jr@gmail.com', N'pEVIz3Tre7sUatx5A4zYUquViLIoOCatKwph8zTJE84By83WgwsiL21xC7nkoqULr30154EcV05C15o6p7ioXi1bw9coNv+t62LI/bF1ZvlLVH2Xz/eCraoPvGKSMMXw', N'0', N'2020-01-15 08:47:47.123', N'924378', N'0', NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'36', N'Aldes', N'Aldescarlos007@gmail.com', N'MO3fCqZeDilXjqd+lMiOI9L+r1kB8IIqt8Ff+0Ctb2//iW8TBfir9t2hfy6ir1QH+3wDcwSptlShherG56eZepsh12Y4/DdQqLJsTs/Zs/VNCd3HY4CYZsh3VLa9a4oe', N'1', N'2020-01-19 08:13:49.707', N'786798', N'1', NULL, N'1', N'861062910', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'37', N'Maússe', N'quilasmausse@gmail.com', N'vFECges57miBXrUYRMTf+zr+7N95NVkMES0P9TBzVBSrmzbdKld/w0yHhON/Oa5pOzVIRNc1hTfZYv2d+zNpJwxLwdez/j5l8HR6q23zg3UlSVVGtJ8udoNplCRn7gwW', N'1', N'2020-01-19 11:57:24.477', N'716074', N'1', NULL, N'1', N'+258870486262', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'38', N'Quisito Alface', N'qalface@gmail.com', N'VHPL33AqsXxywwqr0QjRW3nstp7R4k94C5UJh5295L9Ug2aHbYF5CINgFyckll/uqQCKxyOqo8FyhV2X0GSjZX9kpI6jp/oAB/HtmQYM0KRFavM0NqSwNurY20CAxxnM', N'0', N'2020-01-20 18:15:06.167', N'110848', N'0', NULL, N'1', N'847160755', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'39', N'cpc', N'cpc.quel@gmail.com', N'96S9h1hsVWkOpLzUH8Ck9eW4sTwgAae9AUIpefdl+Ifoy05fyAEuowYKoSWsSD8LihyPhKK3moRBSLdKNCeLwXqAqwCu7Q7kDo0F1Z2ldZ/k39ygdbXhM241TABqiDrV', N'0', N'2020-01-21 10:13:00.183', N'230245', N'0', NULL, N'1', N'844125221', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'40', N'Salvador', N'slvdrelias@gmail.com', N'vHHp5NJH/Y1iIZXCcNqAjXOkkMsZBU2K+jX1fj+ULX6rLXeLhPACBgNsU33+gxTPiKSPQo8hudfOmL4PZXcAjKKDKsMMEqrR6+cm3QGJr8HATg80Wx4Qy1tZxNPvuCKq', N'1', N'2020-01-22 23:44:05.690', N'898071', N'1', NULL, N'1', N'258870735782', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'41', N'Salvador Elias Moiane', N'102737956361126933681@mussika.co.mz', N'dqpJrGLlrHY2U243s4o6WeiSo8RhEUfcNvqeQg/DiFyI5xk9krPhAWI11ImwwE86aXZTiksf6D+QiOCTCvUJvsYqPq7xSIHHqAWozLaO/CTAYRVzCtSgsju3CrJ3KvhM', N'1', N'2020-01-25 04:46:54.353', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'42', N'Inácio Sumbane', N'3515927785144082@mussika.co.mz', N'ZoE5tylV6Izwnnm6I5mbjIyixOu8ptNuq4G7F4izZMlhFbjL3g3ScjFtM6wMrg1PQGpqr7+tukYhCO/GLSeCzY5ABavrL0tSBk7xfP9F6QImzhXnOx9HITUGbXNLvQxH', N'1', N'2020-03-03 15:09:17.717', NULL, N'1', NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'43', N'Ernesto Júnior Pires Alide', N'junior.alide007@gmail.com', N'NQ8s5Mvt7i/JAayiEC4JESeqTJbNKVm3RamHZZGbpAn8c5cSik4Gljta010vPFFVqQEBkd4rGpCxHzqWDPKyfIJk96vCWTWoJq8VapKoRfuFHkYpQIiqGFOaca+EWlrK', N'1', N'2020-03-12 16:43:48.433', N'811913', N'1', NULL, N'1', N'(+258)842-338-251', NULL, N'usuario43110520200020FB_IMG_1589025119434.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'44', N'Inácio Sumbane', N'inaciojrsumbane@gmail.com', N'Q0pqGQJV8dJvZaowQLyMvWZ+8t7gQqfoKEL48RcWXF71HdWqOa/5L82gV4SDupUwTDG8GjKlsiS5zm7ZaE3Y0lQ5aes7l6KaDH5e6molfHI4FeEQSfZA9fFDoAsS4nrj', N'1', N'2020-03-19 10:09:43.257', N'470153', N'1', NULL, N'1', N'(+258)486-316-01', NULL, N'usuario4409052020115523334024_1004280643045121_5024797573559815332_o.png')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'45', N'Paulo António Bonde ', N'bondepauloantonio@gmail.com', N'V9LeiNVvCIm890r/vsKxPCdgakrgPKDTECt8RnKH/UVjCfB8KHi1ztXyo89obyd+UGIHhEeJDiiw8qLmSmf2bQkPg3nAi/UpbFTeq2ueS5xmdulDR2zdtzdFabRWLcvf', N'1', N'2020-03-26 19:18:06.203', N'477934', N'1', NULL, N'1', N'861063201', NULL, N'usuario45260320202005FB_IMG_1584387786157.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'46', N'Arcanjo Eduardo Pinto', N'arcapinto@gmail.com', N'Qb3C4ilqNzbaj0MjskpvQbpYtbhj3DMGPE9gK3VG3TjUIu1rKnbl81C113GjDUYwC8eXT2EqXUdZ8xOP5ZHFF2CNV9GvIgRzN/qcWMk93z0ShgGk3SKvgvuIFG+ERWqc', N'1', N'2020-03-26 20:27:44.787', N'545294', N'1', NULL, N'1', N'258 861594876', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'47', N'Cesaria Moniz da Sailva Cossoma', N'cesariacossoma@gmail.com', N'kM2FfXPFVcIMj//vo74JfPNDje2WH7DGQmUOuThXsKiTqv/7vDUX1C4/c6Hagi9GUVeF5ZJSJWkCJmqq0Zk6oR4GIoFt7rcdt4pc0+8F0KbBnwVo1DJ5ko2jxoYEvo4b', N'1', N'2020-03-27 08:04:38.043', N'479084', N'1', NULL, N'1', N'876954719', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'48', N'Cesaria Cossoma', N'106690270601490199850@mussika.co.mz', N'p+TeM2IL/i5rCbPG0/+3cVrZmWRfnfoHuiArLEBP/h0WUKQfFZnWetYg254iz3kq+2WIR3jE55Ntt4F936Yc8B9UwE/F3n4KmzaGWAeJX/t/p+rhpdXgT5vUZInu3iFu', N'1', N'2020-03-27 08:06:33.977', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'49', N'Ângelo Fernando', N'angelofernandoheriquesashlerr@gmail.com', N'u3qhzbaxU/Ck4raCniIp83Mcbcpzym5e9eJDamsgsHgX/p/0NSuo8TudyCMeUwz5zuG9srNKyiZZ/ggSjFxDf1N/FgcqyRVvt/NWRjXuPFN+x0PeEzci1eKyX4TuPFSr', N'1', N'2020-03-27 08:17:58.670', N'030298', N'1', NULL, N'1', N'+258 845896567', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'50', N'Wil', N'wilsonmaia04@gmail.com', N'ttOHl4cCUzVAwKHz1dz9VbTK+Onc3EKpfcoJtxyRbzkJaC7DiiawiwQRZzFlOu6XSbb8Tx4dl4UCRZNFI6G4vcAyq0WFL8BARKwKFSPLcVPLM+zeJOvmfOYWd2gmsolh', N'1', N'2020-03-27 11:40:59.347', N'088902', N'1', NULL, N'1', N'258823201484', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'51', N'Amilcar Sabonete', N'amilcarsabonete@gmail.com', N'dMFQIhY10dklcp9ES5oV3xL/Ih3v2yE6i/J5Sty+F8e6bbcOlGne0zAb+A6VO7bivFNqR2a/q5iCeQjb2BNaWD8AnH7/30FFnwn/UqgOPzf2ej+dsZt13JGqe3z9iqcg', N'1', N'2020-04-03 11:11:00.157', N'592867', N'1', NULL, N'1', N'+258847151648', NULL, N'usuario51030420201138IMG_20200403_100121.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'52', N'domingostomo@gmail.com', N'domingostomo@gmail.com', N'0boAgy8p87DqxNmt6vxZe4vj3v4Ul9QrXwq5rG4CNWp4rSB/SNYJKQDtBMUFxZpHrwI9ppuJT8n9QuXtjeQ+WU4flqDrGQPx2SuDW9F3BoNVZEKe3mc13NIUTQ+F34fO', N'1', N'2020-04-03 15:07:24.533', N'855653', N'1', NULL, N'1', N'840272115', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'53', N'Leonor Tatcher Souchet', N'souchetleonor1@gamil.com', N'DRxioHTHWPogdvmJCvKSXTqZE3Bjnoa3dDfCEpAvIC1PIgzSV+eSRnDWuA2KkWHj2VHBauCjefHSSeAH042NGzOw5thysBT8ukjsXabZjzAy0BlMAcfTRMTLINdzR2zx', N'0', N'2020-04-05 22:56:59.387', N'325700', N'0', NULL, N'1', N'841918044', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'54', N'Leonor Tatcher Souchet', N'souchetleonor1@gmail.com', N'pAyICKv7GNIEbU4NEiAQS3WduFd36Smbjfq+41smgAfaROsDw5ugHYGIX5YFTRxWWI0FB4mX1dfIHBcz4e1AEkm9SsysDDiWGgJ+a5tGc3wCGjHU8SHv9AWBE54q77PM', N'1', N'2020-04-05 23:32:44.033', N'715142', N'1', NULL, N'1', N'841918044', NULL, N'usuario54080620202325FB_IMG_1584292485916.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'55', N'Pires alide', N'junior-pires007@live.com', N'5N+mIwZ+tcQZdue9IM0ncPPkXQhTOhq45aMkan7oaJaFu3LfZ1tQwFzwwSndS/x66oPZ3O/GmXO7FukgIJ6v+u+Eqyx6A0VyPDriz+6ud0aHiGYCXtX2jX7J9wlRtec3', N'1', N'2020-04-11 01:45:23.540', N'893995', N'1', NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'56', N'Vicente Artur Malunga', N'116977490456882746555@mussika.co.mz', N'x0B5qHF3FuGPZpYy19DK4oG+ck5G4zy3Cjkkmxv8EpITwPi6OIIZDXYeoZXQWpY0kd17iiMQZv1H/8xeK6yljvv7LFW2Qx+e1UCtqvCr/P9HdKAoPAnc/9wkKaAImfHx', N'1', N'2020-04-14 10:04:36.587', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'57', N'Nelson Valdez ', N'valdeznelson99@gmail.com', N'7Rzwmljvrug3hTwORBaokBm44zbwVU6eekFRbuWVtxI+8y8qvR3Y6YTFiWEna/wtPnaFDr4BEQL2UPqQZFXjPNh+Y6njirP/SG3LN7bCMNVYzW4G7McvP3aYnUe3BB0y', N'1', N'2020-04-19 18:34:47.707', N'246637', N'1', NULL, N'1', N'844136660', NULL, N'usuario57190420201857Foto passe.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'58', N'Helion Pires', N'115469487432470453921@mussika.co.mz', N'XCjgBxwbu8mhDLtRHA4FrjJqZNAiQeh7VAVAWTZlz6kETIzcwFLtv0iIRqYQIPi4fzXbLfKdNUQw8l1OShtPDYT3VWfGA2xk10qA+EeZ6xLg9HCMN08i/2HtkxymrkkS', N'1', N'2020-04-19 22:29:53.177', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'59', N'Belito Cassamo', N'bcassamo@gmail.com', N'0ktRVjat7IJVaSkb10I6CAhZ6MH4VvwK0++d5DN5CcECQV9t/gFB7T6KsjuvV9SdEBSs6P1IWCAMcEcirBH/HAsCSa98aqYFZPXtajamny/SKIGbybyyxLIEXsenTG66', N'1', N'2020-04-22 13:11:53.167', N'909199', N'1', NULL, N'1', N'842303700', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'60', N'Márcio', N'moraismarcio4@gmail.com', N'XzZWBXUTmOVMCAUTV9v57k1kPn+Gf8IO44GQlSqP+woB657BqOtRft7SyEUaZoL3EXZ9KKfKeHoSuqEjOYj0qDNbz9hB3QCMpB+FVgJlYTxtMTPQ2lTrHoAQXLvEGTT7', N'1', N'2020-04-22 15:40:21.547', N'854899', N'1', NULL, N'1', N'868218250', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'61', N'Intavez Pedro Caetano', N'intavez2014@gmail.com', N'2McHIR4mtIlqfGjTD7YwDhgiOBHbrttacuSqw582+ourwsTkOgmW+Y9mYLFzvbLjNKbsx6JzugFMbfz5PTYBXAZf2Y1ivDNpScOvQvaPqXx7zzZjVpp6WpnaUyX8ANc6', N'1', N'2020-04-23 11:00:10.713', N'292895', N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'62', N'Mwuiri', N'alessandrofusari@yahoo.it', N'rSOcVlC20ia0lHR+qeO6ZbHBlDgMsQaDFD89b59Pw9sbbMGtcx6kl+pe0xmckhSrPAAwS3RSY6tUMg9vUT3lrKpaG9yPda8o8c+iv9sXZx1F2+iHYXpP0GjDje5FZ6Cd', N'1', N'2020-04-23 18:51:49.157', N'340827', N'1', NULL, N'1', N'827718724', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'63', N'Kay On Ferreira', N'2855614217853836@mussika.co.mz', N'CJcoT6ut1g1dmtivqdrzPj91C1IiFfji+Zf5tSpLZ1ooo5QRZ4c4zZswaowyPeNURQlYWs1ooshCPm3iEUMC9xLZaiE8i1UuJ/3UffgK3Laefkm9D6+5dWprjGyBet+T', N'1', N'2020-04-23 21:12:02.217', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'64', N'mountsoche', N'ruijceita@gmail.com', N'fZkvQe5JSBCPC7J4ybxriroVvSfu3B7wQdonCiLGPYLpA1jKbVKVoCZzb+pcKnuF+Npv8mtKAUwNOhQnqx53WcU11suDVgsGtgoFwxT/qmVXSFVD5goQSI2Z2cq/Jh7N', N'1', N'2020-04-23 21:24:27.953', N'689682', N'1', NULL, N'1', N'258824242979', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'65', N'Lourenço Gany', N'Lourenco.Gany123@gmail.com', N'AU2DhQohSRITcMgRYjvYr5DIGI+ZTBMbTx/lOp/8e2SSIircAqEY/JYw73PUdDsDTRSqWujVCRiq2V+GPC49+O86YKdAt6YFIwoZSqrdBp4IFGJPO+uyjcCm3UXbJpNg', N'1', N'2020-04-24 16:29:28.850', N'054201', N'1', NULL, N'1', N'867096594', NULL, N'usuario652404202016331571825818791.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'66', N'Humberto Junior', N'rrplquel@gmail.com', N'46hA/r5hNB8HF+U6Ozg+pdRKAh7O+kUwPdrUfkpZ9Kv1xItAnWIk+870ypV1/Y0QKN5jvbJMHBLhric5nhb6NjGqPpWhBG/y121qORZNmibOiqe7CT/yveuYRiM/QwHs', N'1', N'2020-04-24 19:07:23.893', N'756248', N'1', NULL, N'1', N'258842620099', NULL, N'usuario66240420201910Inst-image-6.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'67', N'Remigio ', N'remigiotomo@gmail.com', N'V2TPWm/WREOpNV74tFCH3WgbWBUUjXxYzKC/NOxJDSREaDp7Nb6Clbyhbn2phBW1hsOt/gSLzlop5NlemjSvCGcF8wfOdQKAMmr4f96Q+S89i0b3XdLsfB3MxttCVOP9', N'1', N'2020-04-25 17:22:17.640', N'763734', N'1', NULL, N'1', N'+258864450000', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'68', N'Humberto Estevao Domingos', N'111208877726027145332@mussika.co.mz', N'+nQkLDERWUW72leAEqgBAqf90chOBBmglN0SGV6jmslqDrd4KmiPfML7gbNKjO/tI8HRlPtE0fUP13l+EF2GxuGyvikcuoCL2hOu2U6Mj54rGueYzE8zIfnIHbDz+UtL', N'1', N'2020-04-27 11:05:15.807', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'69', N'Ali Aboobacar ', N'alysaldicos@yahoo.com.br', N'RIMU97fCFjAHZCqzARq4uSPQrpW3EO9RJ1VC3exrX4nz98Pvp4R7mso+nF37QRkC8zvugWOQl1sJNO3KgrNe0/baDrQtzyxp9xlx7I8DoWAi8Ub9oQumcmdPApfNFYit', N'1', N'2020-04-27 12:51:09.517', N'010726', N'1', NULL, N'1', N'842975770', NULL, N'usuario69270420201306IMG-20200427-WA0193.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'70', N' Nelson Samuquela ', N'nelsonsamuquela@gmail.com', N'YRLA7jx8QGwWTB6Wkit/rE08v7hr2T2EbQhYX884nG55Xq2TW8GE1vk9ajLHKxr+T1eMKtQHX8B26QXotBpdCkRRhB4lQV0h+MAcOzIzPvo0Yh/uYnypnKIZEpd1IZ/I', N'1', N'2020-04-29 12:03:47.010', N'457590', N'1', NULL, N'1', N'848006370', NULL, N'usuario7029042020121020200428_201244.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'71', N'Amin Daud', N'mahamadd@gmail.com', N'xNDbddcppgOuIh5LP4NQSkI44t9JF/69wzHmwGA6FzhXw5qhwJTpQ0gPcimPRJpoLKM6szOchWiG5XOzncu5Cmk1ylqXh11tQfbuE+G3jDD6AWSoZfHEeiHCi014hjb2', N'1', N'2020-04-29 12:58:33.920', N'753014', N'1', NULL, NULL, N'', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'72', N'Adolfo Skipper', N'dji.gad.dg@gmail.com', N'bpjwWUdOYmE7x8rB2lGOYdoekxDLuySIbDQnvvDUSSwnXsSw/vffXRFLXmAQywEwbVkpoqhppkyYzKOHfnPBmX4l6TiImRJiIOBvGF+uGFdnkKRfl0xb0YTHkeCUDwJg', N'0', N'2020-04-29 14:06:32.543', N'001115', N'0', NULL, N'1', N'845278696', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'73', N'Bayake', N'brockmusik2@gmail.com', N'VAO8SOH+lxasvjDvBvkO3d/zxCu9h7CQIxHBUPP1OeMqNikCdWOz0M+bod1Yfd0mahWOJIe0sbm6ljd30uhxpzDOI5RxBHrOuB1BZGB6Vhc55bOzmEs1n3zqtpm4yfw2', N'0', N'2020-04-29 14:08:32.077', N'838038', N'0', NULL, N'1', N'+258849646827', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'74', N'Bayake', N'estefanynhipissa@gmail.com', N'0rCbunhtPUBWWSn0YuqSco6DRJ620q//4KOzch1ZLpENNroImhWaVOdoLYgQhfUEHARALFs/YG4XxlfrJ011cjnMrbocZiAQ1SYBcW8oQDFMFh+VYacVIy9n+sA8yUJ/', N'1', N'2020-04-29 14:09:40.537', N'094386', N'1', NULL, N'1', N'+258849646827', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'75', N'Gomes Adolfo Das cangas', N'114882340650485362128@mussika.co.mz', N'jxeIccAl2PpqcXzp39woXhmvfbCDrer2uiubQ8hrQbAIA0QWUz4nFsiG+fgsip64mAl6kvRaJZYr7sq4HXogsouxqHsltIdsGnJjvIfpm7cnDwhoxcDsqHvH21uwCzTo', N'1', N'2020-04-29 14:16:49.807', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'76', N'Belmiro António Mariano', N'belmariano1@gmail.com', N'HM1/KscADJ52MVuy/bFbdHBZkSyBdplcb8u0QwWm7g0KBZailDsFiagevFxpPmHYAxyQVkOrS/a8dBzLbHqw2CfqTdtIJNarejazv4qLrkV3K5QX7TZGSQaeOzfJUJ5x', N'1', N'2020-04-29 15:05:15.437', N'922390', N'1', NULL, N'1', N'867004700', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'77', N'Donaldino', N'donaldinojose@gmail.com', N'wXTJNAPoOt9jvz3eokWgQDVbfY9jdSjkPcKfh54kVIoo1XjV3ZnA0NnzDgfGJ16ndS9Ttj0fIxMTOW6aPJrdcFESqbawWW1PLI1HGomZjjnDztCCnFvQZasWVuKIg9kn', N'1', N'2020-04-29 15:14:59.020', N'054726', N'1', NULL, N'1', N'847292797', NULL, N'usuario77290420201530IMG_20190820_164301.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'78', N'king_secuestro', N'abdulbacarmussamussa7@gmail.com', N'5sbdm/m+Y2tSv5uqeCwofGOGytarJQA9u9MNn//9O/wDN20OIJFmd9IoFuG4mRoevMs6r2ejG445nCK4FKh86TsLxELBSm6SX6ATG3PmE9vcPj5ybZqC4cpA28HtfcKG', N'1', N'2020-04-29 16:55:25.750', N'152893', N'1', NULL, N'1', N'849187470', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'79', N'Keneth Soares', N'soareskeneth@gmail.com', N'jUMhztLdFLSEhqOXzKNUJdYsYTE7G4GxcNSeLObt1d8ypyqpp3C2cwNW/yIQ1nN1Jdg9YAdRllCNR+MoQ5i7e1EC9+1PI9mMAo8C/QyzwgZw5dcdQw4UXf2Fblcfbn5/', N'1', N'2020-04-29 21:53:45.857', N'419276', N'1', NULL, N'1', N'258 848530913', NULL, N'usuario79290420202157Keneth Soares ft Az Khinera- Te Quero de Volta (Prod. Willgeorge).jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'80', N'Nelson Jorge', N'nelsonjorgeofficial.mz@gmail.com', N'KJHjZ75JehOI+gcNOXoIvlvdUKQMo3WMLu47UGhf7f4QXrskznAPRGhW2o29hX/O/WdFPj3hwM3u9Z33Mg4gN55gCrybGOo865x89mJclNvy4cQ2UBDfYNVAjnu+wXT/', N'1', N'2020-04-29 21:58:41.327', N'911292', N'1', NULL, N'1', N'+258848112421', NULL, N'usuario80300420201405Nelson Jorge - Oficial Perfil.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'81', N'Gennio', N'erdecastro0318@gmail.com', N'JBqdEEz4J83saYXpFGF2c+AC4OqSVy4ZzCTlCXrO0NYmCSzsfuBAbSqqri9L9z1kpbbIMYcTygA/fEv51UBTm1eFwNMNhgR0A+sSPxgEVKfPJ4WuFFay4vu/zTW96Pw3', N'1', N'2020-04-29 22:03:11.700', N'405753', N'1', NULL, N'1', N'+258852993739', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'82', N'Enywan Cognitivo', N'marcosnhampa@gmail.com', N'fQ0BBcfj39Z1aOorBudDVFRap9ZMC5eVmjEdt9qbDYitFvigvEIN9nFf9jWCqgR+kkAaAmXDqQQ9o5Gz476dMzuwCiJaPXovyL6FEdURglYxKcFXilDaBCYd8KBhUcrH', N'1', N'2020-04-29 22:04:34.973', N'139542', N'1', NULL, N'1', N'+258 842306595', NULL, N'usuario822904202022141PERFIL-N1-FACE.png')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'83', N'Sophisticated ', N'Azariasmaqueu77@gmail.com', N'q2CCAPmUddSC7dP9L152Fp9jA0MJ/LOWVNHD5+2MZBWbbVwnt+5T5i2yCgy2g+Y2vefmwN/f1kXa8RvQNFvFFuJ5xlDRmGZyxUxuY0RuJizWFl6wLgTX/Fn/bgoUDkNz', N'1', N'2020-04-29 22:34:43.377', N'066811', N'1', NULL, N'1', N'258846836523', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'84', N'Marcos Nhampa', N'116115846318766736960@mussika.co.mz', N'1s9P+3wgLfmIhRT9ow0XwczYmQFOgY4WZsZnFgP1jEmc4UNHOZQpFM2z9B9PhlAxt2b6DAThK8YgNhVvLQDU3O5FsUP+ZSERccSLG9n464rDw99JxGTY01zGIHRPs82O', N'1', N'2020-04-29 23:21:27.727', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'85', N'Nelson Samuquela', N'116848137858847513622@mussika.co.mz', N'VliW/ZC2AD2UZCiZvQmIcV/OdIto3ypkfyOvl0lKp8Ra7ZsuMGdXBBeUwDm+EKdCY4DSm84jTG53ydN/UwrArjEY0LqU9wyB7gE4TUHPUKWOorY1+aE+5CxyarOLayUc', N'1', N'2020-04-30 11:16:15.107', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'86', N'Sabas boy Govinho', N'Gsabasboy@gmail.com', N'K/wye4a7PTdOZr0C8Xn7a49Y8yQZMR3yHYj9OYG42WLKWR2TWf70JtuapCppivvbsp6UtgJNKe0wK+EvjbybUX2DnpKLJHPL8JElZ2sx9KzDVGWf+gEDiZsrSe2KiajJ', N'0', N'2020-04-30 15:42:42.517', N'806472', N'0', NULL, N'1', N'845720767', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'87', N'Ercio', N'derciojossefamuchanga@gmail.com', N'RIqNgPq98aORbbzI/24UzTbrwWdGTc27bMSTN6sTBMWoUJD1gk91ikBm0ZW/5r5IYT3rRC1RFR1kfrGTi541lXYjaqaN1YUPZ12o2b1VdVbaGGbOiLsjvK031L7t72so', N'1', N'2020-05-01 00:05:42.067', N'355044', N'1', NULL, N'1', N'+258842004554', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'88', N'Nelson Vilanculo', N'nelsonvilanculo.nv@gmail.com', N'AKb+tHBV0d6kKB16wZg2JZJSY+lWvP3QTOHS/Cds8SMCE5Qw+J46kmwzfL1EkXpRi43DOfmczsKfwNQHo5R3+/FpgHUPUo82g+K3kxJmUnfD/cNx0zKsBqt6rwt3Qwsr', N'0', N'2020-05-02 14:37:02.990', N'156844', N'0', NULL, N'1', N'+258847009499', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'89', N'Januário Muigueia', N'muigueiajanuariovictor@gmail.com', N'ZyrDVdJOpmpwDPVvUIQsCUVQPNJ0kdV9e6Eh3An9L3wZpiD4bBOYfjS1b2m/Y3iJZS4hm6rDyhniItCCWEsf70T1jUiBb3mMazeZdhH06jISvGFSTl8ZDVugTY1r29Mm', N'1', N'2020-05-04 11:36:48.670', N'518754', N'1', NULL, N'1', N'258 843713977', NULL, N'usuario89040520201144IMG-20190905-WA0006.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'90', N'Ildo Vasco', N'115912057384944819814@mussika.co.mz', N'mFS0cCBkc88RP9ONJCJkv6Sb4iYp47hfN0P7uRrP6xVvpzexgqR3o9+kahGaYun+xV1UMgZQByi+t5ZC+ghNvw4tHEW/qZZjU/Toc5ToCLgj5I1pJ/XZWwtZHuT30L4q', N'1', N'2020-05-07 09:10:45.813', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'91', N'Tymóteo Francisco', N'155810825925835@mussika.co.mz', N'E7SZRIT30vIBxwjW/m8aBHFsuZcliOtqIQVNfuRdTlLqrAX/ByNmW39hF1q0ts84jR0GwWkRY5/FzTpUqQEjQs79ksARzkpOkUgAm9ylfjCzf7EqrWEdCh1E+uGfkkPG', N'1', N'2020-05-07 19:04:38.213', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'92', N'Freddy', N'freddy.jamal655@gmail.com', N'extT96eoZ8KUHYxqSAYi5X+ldy3lRACb1D8zgSzsq8Qqjo9aT08FEiPpJkKNT+rVAYEeoX20t1kdd1k+PY+m16aPc0VdLKU32IDrbGIyMWDnsySg2rbq/SWe9IGWNy/x', N'1', N'2020-05-09 18:03:55.850', N'588172', N'1', NULL, N'1', N'847289417', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'93', N'erdna', N'erdnamanjate@gmail.com', N'OsB65JuKCeF96Yqcz9z2633IaQK25d4Jr4iuzg/NIyygrINYyMrPhpQxcWT8mVNIrlhfNcyUjyoO74bVyKpQgLyWiHciIyOiZg7Dc4q2FtJLJDVX8k4o+iZCUFs0wNvH', N'0', N'2020-05-09 18:08:08.227', N'460881', N'0', NULL, N'1', N'258847631890', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'94', N'Agostinho Manhicana', N'683991835507213@mussika.co.mz', N'rhx46afKfqgj8o+3pIWwWt3VN+5dqehbAM+DTSsKTXvt0rWLmnrsB24eDuK2+tyivaKJH3dThoN053nucDB6AeBZu1X/je+UadInGI/D1aDsjBumEWd+PRQsbXd7v76x', N'1', N'2020-05-10 12:44:09.517', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'95', N'Maurício reis', N'mauricioreise@gmail.com', N'IAjFYvUbwpirNZQXxD/hzMzxyoKs0Fc2Gpco8q4HLOI/ZS7zx+xHmHwBZEb/ocWQ8m/Z4MXS75MuitlMPTKJhshntBlhHvDkTrB6aBkCR1p/ztwhFroGOYDEBF3AR9Rs', N'1', N'2020-05-10 18:07:44.127', N'984499', N'1', NULL, N'1', N'876097575', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'96', N'Barros Lucas Bazo', N'bazobarros84@gmail.com', N'iaXtty2lvYJ5AeXOvE+At//v22fEeMcTvLqdIeSXZNmU21wrpPSgchhZcHRB0Bf5s4ARHd9Xp5rx0jXVhsrm6DJjjrAdGHMV2ejQhriifTav1hWMlARw5wZG2X2bAFNh', N'0', N'2020-05-12 12:47:56.560', N'483337', N'0', NULL, N'1', N'+258843974784', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'97', N'Fidel Duarte', N'fpensaooo51@gmail.com', N'Xrljx+Kj5a/LqKeIXbFeJ+7ADNz8ZX/oP4fqshtB4+hWVoHv2EL23Gt+VxbRgEvRbr8mgtTY1T6OK0hTGcL0fJwYrk099lmMHq1towQPbc9rrnxo4PDt+5SULeHodXmE', N'1', N'2020-05-12 14:47:55.977', N'870872', N'1', NULL, N'1', N'258842314588', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'98', N'Jacinto J. Angelo Ernesto', N'110353556922613994850@mussika.co.mz', N'9NCzU+/e5AInd8BpQnTedCg8sKxlPID+IRtaqK5/3fi+yi40rykuTMFIKILQnHjA2TRyCjX5p5T+LOjyPOTQU0hibcDLIliHy0uXqdh1n1ujeUfhm1p2csRQ22U6bcFd', N'1', N'2020-05-12 19:40:01.653', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'99', N'Bartiloide Ricardo Ernesto', N'barteloidericardocuaranhiua@gmail.com', N'1giYjLjCUrLdcikT6TEtU3OXk6iTQzumI1IIdHncAxLJxv7Z8VDGU1lJYmXpBkUdJxHE4nzLbOMgXVa5CfluTJIs738YzBtjwTITd1dTJwrN8qQkJjlmPGsDUmKHjBZ1', N'1', N'2020-05-17 18:23:06.207', N'113345', N'1', NULL, N'1', N'258844415224', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'100', N'04.0531.2018', N'Ussene026@gmail.com', N'yysja+ExdrFYunybLeDb0KJg91A6fY8KXcTmj+7lRj3378FlLaBq4Hsh8nBiqLulb8X6H5vZebuzI9ER1QSJfaVJjEEGJIEBgx661+Mf29svFwY08K1OvdU9yywh+4N5', N'1', N'2020-05-18 03:10:17.233', N'978937', N'1', NULL, N'1', N'+258846445220', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'101', N'Dream gays', N'Eliseuaruni@gmail.com', N'+gjUw+GhOq+cDm21GIKKPzzNVdce3I5Gr+kZWaByzQff9UTnASpp9mkTi1doI2Y3NG0E+hI2kFI7JJH1mqt/6eDeZJZyM4AlmJChLwhPOr4GONVnITpYxP9V55955jzJ', N'0', N'2020-05-18 21:19:07.617', N'897759', N'0', NULL, N'1', N'848692180', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'102', N'Leonor Tatcher Souchet', N'Leonorsouchet1@gmail.com', N'MyihvVka2ZzeGSF/X8XNjxuN4JFjmUk7pq0Ra4n4rccqiYgFvjV8OZpI/raprcSbXUClau5kbPz6VqGxbFy3Upb6OSzqkyEMwXl+HYUthGcceC8OoQmfpMY2ESijs+zQ', N'0', N'2020-05-20 12:45:20.853', N'799003', N'0', NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'103', N'Leonor Tatcher Souchet', N'Leonorsouchet1@gmail.com', N'iH+ol8lTpdY1cBKSYxg9JcGBOahHcwXJxpfKCXOYt76iSQy06N1UJGyPnsEH6cnYo/+ucqDPnUZtSy32iGj/4g3Jye1Xww4UXQ9cTfIK0sKC3snfbAqXxrPuw5r0wOD5', N'0', N'2020-05-20 12:45:20.853', N'799003', N'0', NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'104', N'Edmilson Ramos', N'3067205930031134@mussika.co.mz', N'bdf6Nv7ZIlXCYzq++CMB0pnAOAoeoqBtYWZOwMhSFAvW/ntStvmkJ/Ll+LyXBLEsI4dDOzy8yTDsjsOQr9GVseEjwxkIePZ32kPFwaTthk0erH7qhSUGAWrhjeW/4zN0', N'1', N'2020-05-20 12:46:26.810', NULL, N'1', NULL, NULL, N'', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'105', N'Fluxos ímpios', N'medjessfluxoimpios@gmail.com', N'eReuOIJBX3jIozZHJSR+tLy+BQ7YtFPy6Fij53ZcNM5vUFsyIfIiO73nEE/uyU8cltCLDYw8LZK7aMfS3oUMtk8q8LbR7fH/tnKMTyhwx2jrctWThYqbgXFLu6chRtPz', N'0', N'2020-05-21 09:38:10.247', N'271858', N'0', NULL, N'1', N'+258849431417', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'106', N'Jeff', N'Jeftestb@gmail.com', N'C0ygRrLz/6xRpGljTgzxpaDrlhrAw7y7Fa+fZoL+yGKCJEGSZXXq797HZppzpmAvldT2SdXG2sF0hBSey+MnpEM9PVLOjIGV8eQg3kx+NPG63YnhFIKf4tpA5nOIwqK2', N'1', N'2020-05-21 15:13:43.747', N'195541', N'1', NULL, N'1', N'847324786', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'107', N'Silvano Mathe', N'silvanomathe@gmail.com', N'ZXiBH4fCY2vcZFAnlB0Au5FlVFpJHAodC3ErA51oE1wgT0QHAZxjvZEJYRe98jS8432Rs8oQiVKvHoJbmYr+miV64QQmc5pJmoIv6rU2CCYd1EcHrVRrBLXJ3HXIGHpm', N'1', N'2020-05-21 15:19:03.270', N'246779', N'1', NULL, N'1', N'+258847990200', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'108', N'Martins Manuel', N'martinsmanue98@gmail.com', N'1jSO8KKR/GSQsFeRX9xjr0KW5JNNcHOz0N1Fv/YbQkDvKxIyjHSX60UlnSikpwSJWBnqECImKThG6gMp4QwzMlXx8Q1Cq05NWxAPptdySZI4KXaSjgN5boV0+wJpo55w', N'0', N'2020-05-21 15:29:12.143', N'385457', N'0', NULL, N'1', N'+257863123477', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'109', N'José Leonardo', N'josemacieleonardo@gmail.com', N'l7xkg3cDOQnD6M7bQiAX3OYpbUAl1I57qdNcDytO8F5Xw4f4Vu7bXC6kstIsD31+CJeArVkVGAetEhGkBSOesW1prObt6SdcEfBLnjezdQ9ImJuF/o8kg1mSTdasu5wy', N'1', N'2020-05-21 15:32:20.083', N'431730', N'1', NULL, N'1', N'848150323', NULL, N'usuario10921052020154315900685400596239947910430136022.jpg')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'110', N'Nelson Esmael Ibraimo', N'nelson.v.orias@gmail.com', N'UXQ+3QFGQTDwdReCARxPcjbRpyQYMzTBl3YTukPbZI42PyaX6zt8b4jcO3B15Pf9fhJVX6miB6BEMpS2v8rAe9CHp09Jyi4QJ7yEOFXlsb8TrRS6oAe6LuBCHA0CApLv', N'0', N'2020-05-21 19:44:49.113', N'819545', N'0', NULL, N'1', N'842100950', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'111', N'Nelson Orias', N'114512839865055661985@mussika.co.mz', N'nlVpryn9WWMyDXPVV2ReqDO/TmJqB6T700Hzt+sOn2g0JV5jNl4VRbMERXJ+5l8mDD29Mbkrxqgyt2/DdDMQL11ZHWI80XjmEvwo/WF+axuyaC15qA6Sd3U/OtWssF1H', N'1', N'2020-05-21 19:47:00.193', NULL, N'1', NULL, N'1', N'842100950', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'112', N'Andre Naume', N'andrenaume@gmail.com', N'qISzZjxaGIP0q6sL5IS1z+iGuNJtgCTKImIQ/i8p79FfvuRzn6P43jYMyVwsrvS/YYDLyYbcmQd5FqynqjOa7XP+RhnMr97m9ohyEnzzaQyIYN5Hcf4rIi+VehxnsfKF', N'1', N'2020-05-22 10:47:36.043', N'764191', N'1', NULL, N'1', N'879618677', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'113', N'Mário ', N'mariocaetano177@gmail.com', N'3Y1V+RblbS1rTheCs9EfkrPqG3SxxABpeNeyJTZrdhRrVw/yL2YGGuTQJDWFZ5W3uvTGqQb5K7TjWYaGelNTKBEVgUmvveh+MdW99ZVCS935C6LR2xJwXbdr3+FvWuh8', N'1', N'2020-05-22 13:41:30.013', N'189277', N'1', NULL, N'1', N'258848748533', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'114', N'José ', N'josechacadepicardo26@gmail.com', N'CDnkEoRkAIDqRBcte88TJ5FImrbLgwcPqexeDG3IHD1h112qm5edoqKGulEv3L+b4RuGVDvQxpyCOLEOJkPt99T5anJ139gBfReAbz0kbzM9UYM2Blr38ykwG/TIR9Q1', N'1', N'2020-05-22 13:43:36.657', N'078727', N'1', NULL, N'1', N'+258843961615', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'115', N'euridice', N'euridicedasilva91@gmail.com', N'16DP1ZDLfgjU2pukE2trO0+/p3hIQ6TNx27tcYuTvO0GYpdThCL0FyLKx/OiPyU63qa/MYjhCKSVoycUyZjbO4JAALWNDtjjd7XfCp8wIiG0dZTWpmLWym10kotBjmus', N'0', N'2020-05-22 13:45:06.900', N'126953', N'0', NULL, N'1', N'258849401820', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'116', N'Murilas', N'murilajaime@hotmail.com', N'lyQKwiP+Z7baOS8ZLGnI40Wfa4HWpTr2A1lK5D1T3t5R5WWmtBXBL4UvvbHzuacdfap1coQSaWQUnZ/loUiz1XedrCOq50nlEgFecGuYhtJoxMGogqt1y5ISFy6kGbUn', N'1', N'2020-05-25 12:54:02.047', N'481661', N'1', NULL, N'1', N'258848383817', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'117', N'Murilas', N'murilajaime@gmail.com', N'cA2c7F/2XEnZuAwf0z4d8dphIN6clcVWkV7DRLTvtrJRObM5u2wpbRPibsm471KV9YcIu5qWOi3Y5qsopoKwhzdi/m1SqqICD41HVwxuvyNNVqVoZ9cFZLkAsGY3HiKU', N'1', N'2020-05-25 12:54:38.623', N'343660', N'1', NULL, N'1', N'+258848383817', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'118', N'ussenedev', N'ussenedev@gmail.com', N'13ngCEH6On08IwDpa09lCvRSQCyfPg+4erjQHWHiV5rYcBmbNSSW8PUH7bNnx20/LjKOqMBW37kzsdgsoCI0oL2f7UtKEuDWr/Ur83vovXwM1n5m8rRlOjCU/Ur/yHQ2', N'1', N'2020-05-26 08:27:21.530', N'067283', N'1', NULL, N'1', N'+258846445220', NULL, N'usuario118260520200841santosussene3.png')
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'119', N'Delto Zacarias António', N'deltozacariasantonio22@gmail.com', N'LLdrAZAxCSY8Sg40zoWMeJhy3AXb5lMR7cy8viZaOfmlxPv49QVk14aTgFa5IUwysKv3QFBO0731A1HwZF1JNC6sVAYl4dpWzqPXl8CJ8yiQ8YRXPBndSSew6uaFE5zS', N'1', N'2020-05-28 21:17:29.253', N'426587', N'1', NULL, N'1', N'+25887791232', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'120', N'Taro Eugénio', N'3104814679581245@mussika.co.mz', N'kSgtAOhVxel3E4DsGkJ/WBYjWGb0PrtTpmMCcuH/Wf7qw3g/k/7kBTIl5u6R3QeQ1N2VH+wnOxv/uwRi75xevTZUA33Tbi1OzpjQ54M6k4f86HRcdVzsjhr1cSBgoK++', N'1', N'2020-05-31 09:45:12.793', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'121', N'Nelsyd Aniceto ', N'nelsidioaniceto@gmail.com', N'eP9BgvMdF4JRNJk4Di3gedH1knbIl/xTb4Zm+H24ngm5RcskodBRPk99bbiadow33URdQUFFn2ud+tAED8bn/2iU4aH3Euge32tDOkBJ4MO+uLRkbCHEq5cTSCdNEQrn', N'0', N'2020-06-01 09:42:52.683', N'654617', N'0', NULL, N'1', N'+258 848750535', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'122', N'Haylton', N'hailtongfernandes@gmail.com', N'PHlibRFtMHU9mqoFg8Jd99nJV0GKmIl3epxAzNlR7So10ym1UKHFsQf5x+IyljaIDosrCxvHst51MngKLkiNAeiEy0dKlnwSHG4nQzME5RuMyreC06EMscgx6DVbIRra', N'1', N'2020-06-01 10:56:37.833', N'223894', N'1', NULL, N'1', N'846669766', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'123', N'Kally-De Lacerda Machado', N'amilcar_machado@yahoo.com.br', N'HFs0lv6Ed+Mfbj/wMmCgorwDZFWkkGUaYY+aY/oQDGvPLHrmlP4E123s4RNILCpHiTXWsv8VIbO5TIDvjF9hNLkDMi/v7YsoI/Rh5t+EsDIIbQAu8l8gT4I2P23Isfbx', N'1', N'2020-06-04 16:07:49.497', N'545847', N'1', NULL, N'1', N'00258849903658', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'124', N'Verazy', N'rfosvaldo5@gmail.com', N'2r1v8WXK+iV/Y6Mz3h5S3oBwkrHDsoDC4By2o3DXVpIXpg6uoEU2USOFNeajeFC5iIqC1opPewkTyKq9HCZ6bbZve1grZef6H/cglWYiJ8mcQfgo/eC5VEVyWcSALDOA', N'1', N'2020-06-07 13:30:34.877', N'596832', N'1', NULL, N'1', N'258845283596', NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa]) VALUES (N'125', N'Fernando Bonde', N'110986590712321955551@mussika.co.mz', N'u0PtMQJTCTNj61mJBoEVJum8VRT0Q36c+ee9y5q4evX644ZvuZbAfYONW9E2G/bvOIDbOU7HG0qnQKcpDprmypPIvFBFfBMxMEZhYGofqd6T8mMvYtTDFoIZH78fR1LT', N'1', N'2020-06-08 07:37:15.420', NULL, N'1', NULL, N'1', NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for usuario_favorito
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_favorito]') AND type IN ('U'))
	DROP TABLE [dbo].[usuario_favorito]
GO

CREATE TABLE [dbo].[usuario_favorito] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [id_usuario] bigint  NULL,
  [e_distrito] bit  NULL,
  [id_distrito] int  NULL,
  [e_restaurante] bit  NULL,
  [id_restaurante] bigint  NULL,
  [e_acomodacao] bit  NULL,
  [id_acomodacao] bigint  NULL,
  [e_servico] bit  NULL,
  [id_servico] bigint  NULL,
  [e_artigo] bit  NULL,
  [id_artigo] bigint  NULL,
  [e_musica] bit  NULL,
  [id_musica] bigint  NULL,
  [e_obra_arte] bit  NULL,
  [id_obra_arte] bigint  NULL,
  [e_taxi] bit  NULL,
  [id_taxi] bigint  NULL,
  [activo] bit  NULL
)
GO

ALTER TABLE [dbo].[usuario_favorito] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for usuario_tipo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_tipo]') AND type IN ('U'))
	DROP TABLE [dbo].[usuario_tipo]
GO

CREATE TABLE [dbo].[usuario_tipo] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [tipo] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[usuario_tipo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of usuario_tipo
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[usuario_tipo] ON
GO

INSERT INTO [dbo].[usuario_tipo] ([id], [tipo]) VALUES (N'1', N'NORMAL')
GO

INSERT INTO [dbo].[usuario_tipo] ([id], [tipo]) VALUES (N'2', N'ADMINISTRADOR')
GO

INSERT INTO [dbo].[usuario_tipo] ([id], [tipo]) VALUES (N'3', N'SUPER ADMINISTRADOR')
GO

SET IDENTITY_INSERT [dbo].[usuario_tipo] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for UsuarioAutenticacao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioAutenticacao]') AND type IN ('U'))
	DROP TABLE [dbo].[UsuarioAutenticacao]
GO

CREATE TABLE [dbo].[UsuarioAutenticacao] (
  [idAutenticacao] bigint  IDENTITY(1,1) NOT NULL,
  [idUsuario] bigint  NULL,
  [data] datetime  NULL,
  [viaemail] bit  NULL,
  [viacell] bit  NULL,
  [codigo] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [resultado] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[UsuarioAutenticacao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of UsuarioAutenticacao
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] ON
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'21', N'33', N'2020-01-11 10:40:58.630', N'1', NULL, N'620335', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'22', N'33', N'2020-01-11 10:45:49.173', N'1', NULL, N'363238', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'23', N'34', N'2020-01-12 20:46:20.480', N'1', NULL, N'078473', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'24', N'36', N'2020-01-19 08:14:58.883', N'1', NULL, N'786798', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'25', N'37', N'2020-01-19 11:58:19.063', N'1', NULL, N'716074', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'26', N'40', N'2020-01-22 23:45:43.597', N'1', NULL, N'898071', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'28', N'43', N'2020-03-12 16:44:13.697', N'1', NULL, N'982015', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'29', N'44', N'2020-03-19 10:10:16.577', N'1', NULL, N'470153', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'30', N'45', N'2020-03-26 19:19:04.643', N'1', NULL, N'477934', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'31', N'46', N'2020-03-26 20:29:54.413', N'1', NULL, N'545294', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'32', N'47', N'2020-03-27 08:09:50.950', N'1', NULL, N'479084', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'33', N'47', N'2020-03-27 08:13:38.030', N'1', NULL, N'479084', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'34', N'49', N'2020-03-27 08:21:04.833', N'1', NULL, N'030298', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'35', N'50', N'2020-03-27 11:42:51.297', N'1', NULL, N'088902', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'36', N'51', N'2020-04-03 11:29:52.340', N'1', NULL, N'592867', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'37', N'51', N'2020-04-03 11:50:14.707', N'1', NULL, N'592867', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'38', N'52', N'2020-04-03 15:09:14.763', N'1', NULL, N'855653', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'39', N'54', N'2020-04-05 23:36:05.137', N'1', NULL, N'715142', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'40', N'55', N'2020-04-11 01:48:37.290', N'1', NULL, N'893995', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'41', N'57', N'2020-04-19 18:53:19.420', N'1', NULL, N'246637', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'42', N'59', N'2020-04-22 13:15:30.257', N'1', NULL, N'909199', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'43', N'60', N'2020-04-22 15:41:04.687', N'1', NULL, N'854899', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'44', N'61', N'2020-04-23 11:01:28.503', N'1', NULL, N'292895', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'45', N'62', N'2020-04-23 18:57:22.337', N'1', NULL, N'340827', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'46', N'64', N'2020-04-23 21:25:28.043', N'1', NULL, N'689682', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'47', N'65', N'2020-04-24 16:30:49.553', N'1', NULL, N'054201', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'48', N'66', N'2020-04-24 19:08:02.120', N'1', NULL, N'756248', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'49', N'67', N'2020-04-25 17:23:12.373', N'1', NULL, N'763734', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'50', N'69', N'2020-04-27 13:03:02.297', N'1', NULL, N'010726', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'51', N'43', N'2020-04-27 22:19:05.643', N'1', NULL, N'905733', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'52', N'43', N'2020-04-27 23:06:36.933', N'1', NULL, N'238237', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'53', N'43', N'2020-04-27 23:12:42.313', N'1', NULL, N'633034', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'54', N'43', N'2020-04-27 23:14:10.467', N'1', NULL, N'509729', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'55', N'43', N'2020-04-27 23:19:38.623', N'1', NULL, N'811913', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'56', N'70', N'2020-04-29 12:04:22.907', N'1', NULL, N'457590', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'57', N'71', N'2020-04-29 12:59:59.293', N'1', NULL, N'753014', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'58', N'74', N'2020-04-29 14:16:09.927', N'1', NULL, N'094386', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'59', N'76', N'2020-04-29 15:06:14.483', N'1', NULL, N'922390', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'60', N'77', N'2020-04-29 15:15:49.627', N'1', NULL, N'054726', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'61', N'78', N'2020-04-29 16:58:41.580', N'1', NULL, N'152893', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'62', N'79', N'2020-04-29 21:54:40.453', N'1', NULL, N'419276', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'63', N'82', N'2020-04-29 22:09:57.400', N'1', NULL, N'139542', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'64', N'81', N'2020-04-29 22:16:20.087', N'1', NULL, N'405753', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'65', N'83', N'2020-04-29 22:35:27.213', N'1', NULL, N'066811', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'66', N'80', N'2020-04-30 14:03:57.487', N'1', NULL, N'911292', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'67', N'87', N'2020-05-01 00:06:59.817', N'1', NULL, N'355044', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'68', N'89', N'2020-05-04 11:38:50.150', N'1', NULL, N'518754', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'69', N'92', N'2020-05-09 18:04:43.930', N'1', NULL, N'588172', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'70', N'95', N'2020-05-16 22:24:33.313', N'1', NULL, N'984499', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'71', N'99', N'2020-05-17 18:24:23.600', N'1', NULL, N'113345', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'72', N'100', N'2020-05-18 03:11:01.917', N'1', NULL, N'978937', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'73', N'106', N'2020-05-21 15:14:27.243', N'1', NULL, N'195541', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'74', N'107', N'2020-05-21 15:33:38.063', N'1', NULL, N'246779', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'75', N'109', N'2020-05-21 15:37:55.253', N'1', NULL, N'431730', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'76', N'112', N'2020-05-22 10:48:42.693', N'1', NULL, N'764191', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'77', N'112', N'2020-05-22 10:51:11.293', N'1', NULL, N'764191', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'78', N'113', N'2020-05-22 13:43:15.940', N'1', NULL, N'189277', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'79', N'114', N'2020-05-22 13:47:31.773', N'1', NULL, N'078727', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'80', N'113', N'2020-05-22 14:16:47.077', N'1', NULL, N'189277', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'81', N'97', N'2020-05-22 15:35:45.783', N'1', NULL, N'870872', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'82', N'117', N'2020-05-25 12:55:47.170', N'1', NULL, N'343660', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'83', N'118', N'2020-05-26 08:33:48.807', N'1', NULL, N'067283', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'84', N'116', N'2020-05-28 16:53:40.343', N'1', NULL, N'481661', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'85', N'119', N'2020-05-28 21:21:21.433', N'1', NULL, N'426587', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'86', N'119', N'2020-05-28 21:21:48.433', N'1', NULL, N'426587', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'87', N'122', N'2020-06-01 10:57:13.037', N'1', NULL, N'223894', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'88', N'123', N'2020-06-04 16:08:50.193', N'1', NULL, N'545847', N'Autenticado')
GO

INSERT INTO [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (N'89', N'124', N'2020-06-07 13:33:02.877', N'1', NULL, N'596832', N'Autenticado')
GO

SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for UsuarioSessao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioSessao]') AND type IN ('U'))
	DROP TABLE [dbo].[UsuarioSessao]
GO

CREATE TABLE [dbo].[UsuarioSessao] (
  [idsessao] bigint  IDENTITY(1,1) NOT NULL,
  [idusuario] bigint  NULL,
  [data] datetime  NULL
)
GO

ALTER TABLE [dbo].[UsuarioSessao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Primary Key structure for table acomodacao
-- ----------------------------
ALTER TABLE [dbo].[acomodacao] ADD CONSTRAINT [PK_acomodacao] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table acomodacao_classificacao
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_classificacao] ADD CONSTRAINT [PK_acomodacao_classificacao] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table acomodacao_comentario
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_comentario] ADD CONSTRAINT [PK_acomodacao_comentario_1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table acomodacao_disponibilidade
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_disponibilidade] ADD CONSTRAINT [PK_acomodacao_disponibilidade] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table acomodacao_foto
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_foto] ADD CONSTRAINT [PK_acomodacao_foto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table acomodacao_quarto
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_quarto] ADD CONSTRAINT [PK_acomodacao_quarto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table acomodacao_reserva
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_reserva] ADD CONSTRAINT [PK_acomodacao_reserva] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table acomodacao_servico
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_servico] ADD CONSTRAINT [PK_acomodacao_servicos] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table acomodacao_tipo
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_tipo] ADD CONSTRAINT [PK_acomodacao_tipo] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table artigo
-- ----------------------------
ALTER TABLE [dbo].[artigo] ADD CONSTRAINT [PK_artigo] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table artigo_imagem
-- ----------------------------
ALTER TABLE [dbo].[artigo_imagem] ADD CONSTRAINT [PK_artigo_imagem] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table artista_obra
-- ----------------------------
ALTER TABLE [dbo].[artista_obra] ADD CONSTRAINT [PK_artista_obra] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table carrinho_compra
-- ----------------------------
ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [PK_carrinho_compra] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table categoria_artigo
-- ----------------------------
ALTER TABLE [dbo].[categoria_artigo] ADD CONSTRAINT [PK_tipo_artigo] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table categoria_cultura
-- ----------------------------
ALTER TABLE [dbo].[categoria_cultura] ADD CONSTRAINT [PK_tipo_cultura] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table categoria_obra_arte
-- ----------------------------
ALTER TABLE [dbo].[categoria_obra_arte] ADD CONSTRAINT [PK_categoria_obra_arte] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table categoria_produto
-- ----------------------------
ALTER TABLE [dbo].[categoria_produto] ADD CONSTRAINT [PK_categoria_produto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table cinema
-- ----------------------------
ALTER TABLE [dbo].[cinema] ADD CONSTRAINT [PK_cinema] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table cinema_sessao
-- ----------------------------
ALTER TABLE [dbo].[cinema_sessao] ADD CONSTRAINT [PK_cinema_sessao] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table clinica
-- ----------------------------
ALTER TABLE [dbo].[clinica] ADD CONSTRAINT [PK_clinica] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table compra
-- ----------------------------
ALTER TABLE [dbo].[compra] ADD CONSTRAINT [PK_compra] PRIMARY KEY CLUSTERED ([id_compra])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table distrito
-- ----------------------------
ALTER TABLE [dbo].[distrito] ADD CONSTRAINT [PK_distrito] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table distrito_classificacao
-- ----------------------------
ALTER TABLE [dbo].[distrito_classificacao] ADD CONSTRAINT [PK_distrito_classificacao] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table distrito_comentario
-- ----------------------------
ALTER TABLE [dbo].[distrito_comentario] ADD CONSTRAINT [PK_distrito_comentario] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table distrito_foto
-- ----------------------------
ALTER TABLE [dbo].[distrito_foto] ADD CONSTRAINT [PK_distrito_foto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table empresa
-- ----------------------------
ALTER TABLE [dbo].[empresa] ADD CONSTRAINT [PK_empresa] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table entidade_cultural
-- ----------------------------
ALTER TABLE [dbo].[entidade_cultural] ADD CONSTRAINT [PK_entidade_cultural] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table evento
-- ----------------------------
ALTER TABLE [dbo].[evento] ADD CONSTRAINT [PK_eventos] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table evento_categoria
-- ----------------------------
ALTER TABLE [dbo].[evento_categoria] ADD CONSTRAINT [PK_evento_categoria] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table evento_comentario
-- ----------------------------
ALTER TABLE [dbo].[evento_comentario] ADD CONSTRAINT [PK_evento_comentario] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table farmacia
-- ----------------------------
ALTER TABLE [dbo].[farmacia] ADD CONSTRAINT [PK_farmacia] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table farmacia_produto
-- ----------------------------
ALTER TABLE [dbo].[farmacia_produto] ADD CONSTRAINT [PK_farmacia_produto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table filme
-- ----------------------------
ALTER TABLE [dbo].[filme] ADD CONSTRAINT [PK_filme] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table filme_categoria
-- ----------------------------
ALTER TABLE [dbo].[filme_categoria] ADD CONSTRAINT [PK_filme_categoria] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table genero_musical
-- ----------------------------
ALTER TABLE [dbo].[genero_musical] ADD CONSTRAINT [PK_genero_musical] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table hospital
-- ----------------------------
ALTER TABLE [dbo].[hospital] ADD CONSTRAINT [PK_hospital] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table item_filme_categoria
-- ----------------------------
ALTER TABLE [dbo].[item_filme_categoria] ADD CONSTRAINT [PK_item_filme_categoria] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table item_pacote_subscricao
-- ----------------------------
ALTER TABLE [dbo].[item_pacote_subscricao] ADD CONSTRAINT [PK_item_pacote_subscricao] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table loja
-- ----------------------------
ALTER TABLE [dbo].[loja] ADD CONSTRAINT [PK_loja] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table loja_produto
-- ----------------------------
ALTER TABLE [dbo].[loja_produto] ADD CONSTRAINT [PK_loja_produto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table loja_tipo
-- ----------------------------
ALTER TABLE [dbo].[loja_tipo] ADD CONSTRAINT [PK_loja_tipo] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table musica
-- ----------------------------
ALTER TABLE [dbo].[musica] ADD CONSTRAINT [PK_musica] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table obra_arte
-- ----------------------------
ALTER TABLE [dbo].[obra_arte] ADD CONSTRAINT [PK_obra_arte] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table obra_arte_imagem
-- ----------------------------
ALTER TABLE [dbo].[obra_arte_imagem] ADD CONSTRAINT [PK_obra_arte_imagem] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table pacote_subscricao
-- ----------------------------
ALTER TABLE [dbo].[pacote_subscricao] ADD CONSTRAINT [PK_pacote_subscricao] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table produto
-- ----------------------------
ALTER TABLE [dbo].[produto] ADD CONSTRAINT [PK_produto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table produto_categoria
-- ----------------------------
ALTER TABLE [dbo].[produto_categoria] ADD CONSTRAINT [PK_produto_categoria] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table restaurante
-- ----------------------------
ALTER TABLE [dbo].[restaurante] ADD CONSTRAINT [PK_restaurante] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table restaurante_classificacao
-- ----------------------------
ALTER TABLE [dbo].[restaurante_classificacao] ADD CONSTRAINT [PK_restaurante_classificacao] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table restaurante_comentario
-- ----------------------------
ALTER TABLE [dbo].[restaurante_comentario] ADD CONSTRAINT [PK__restaura__3213E83F7C530CA2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table restaurante_foto
-- ----------------------------
ALTER TABLE [dbo].[restaurante_foto] ADD CONSTRAINT [PK_restaurante_foto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table restaurante_prato
-- ----------------------------
ALTER TABLE [dbo].[restaurante_prato] ADD CONSTRAINT [PK_restaurante_prato] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table restaurante_prato_categoria
-- ----------------------------
ALTER TABLE [dbo].[restaurante_prato_categoria] ADD CONSTRAINT [PK_restaurante_prato_categoria] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table restaurante_tipo
-- ----------------------------
ALTER TABLE [dbo].[restaurante_tipo] ADD CONSTRAINT [PK_restaurante_tipo] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table servico
-- ----------------------------
ALTER TABLE [dbo].[servico] ADD CONSTRAINT [PK_servico] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table servico_categoria
-- ----------------------------
ALTER TABLE [dbo].[servico_categoria] ADD CONSTRAINT [PK_categoria_servico] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table servico_foto
-- ----------------------------
ALTER TABLE [dbo].[servico_foto] ADD CONSTRAINT [PK_servico_foto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table taxi
-- ----------------------------
ALTER TABLE [dbo].[taxi] ADD CONSTRAINT [PK_taxi] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table taxi_categoria
-- ----------------------------
ALTER TABLE [dbo].[taxi_categoria] ADD CONSTRAINT [PK_taxi_categoria] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tipo_produto
-- ----------------------------
ALTER TABLE [dbo].[tipo_produto] ADD CONSTRAINT [PK_tipo_produto] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table turismo
-- ----------------------------
ALTER TABLE [dbo].[turismo] ADD CONSTRAINT [PK_turismo] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table turismo_categoria
-- ----------------------------
ALTER TABLE [dbo].[turismo_categoria] ADD CONSTRAINT [PK_turismo_categoria] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table turismo_comentario
-- ----------------------------
ALTER TABLE [dbo].[turismo_comentario] ADD CONSTRAINT [PK_turismo_comentario] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Usuario
-- ----------------------------
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED ([idusario])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table usuario_favorito
-- ----------------------------
ALTER TABLE [dbo].[usuario_favorito] ADD CONSTRAINT [PK_usuario_favorito] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table usuario_tipo
-- ----------------------------
ALTER TABLE [dbo].[usuario_tipo] ADD CONSTRAINT [PK_usuario_tipo] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table UsuarioAutenticacao
-- ----------------------------
ALTER TABLE [dbo].[UsuarioAutenticacao] ADD CONSTRAINT [PK_Autenticacao] PRIMARY KEY CLUSTERED ([idAutenticacao])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table UsuarioSessao
-- ----------------------------
ALTER TABLE [dbo].[UsuarioSessao] ADD CONSTRAINT [PK_UsuarioSessao] PRIMARY KEY CLUSTERED ([idsessao])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table acomodacao
-- ----------------------------
ALTER TABLE [dbo].[acomodacao] ADD CONSTRAINT [FK_acomodacao_acomodacao_tipo] FOREIGN KEY ([id_acomodacao_tipo]) REFERENCES [dbo].[acomodacao_tipo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[acomodacao] ADD CONSTRAINT [FK_acomodacao_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table acomodacao_classificacao
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_classificacao] ADD CONSTRAINT [FK_acomodacao_classificacao_acomodacao] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table acomodacao_comentario
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_comentario] ADD CONSTRAINT [FK_acomodacao_comentario_Usuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table acomodacao_disponibilidade
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_disponibilidade] ADD CONSTRAINT [FK_acomodacao_disponibilidade_acomodacao_quarto] FOREIGN KEY ([id_acomodacao_quarto]) REFERENCES [dbo].[acomodacao_quarto] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table acomodacao_foto
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_foto] ADD CONSTRAINT [FK_acomodacao_foto_acomodacao] FOREIGN KEY ([id_acomodacao]) REFERENCES [dbo].[acomodacao] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table acomodacao_quarto
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_quarto] ADD CONSTRAINT [FK_acomodacao_quarto_acomodacao] FOREIGN KEY ([id_acomodacao]) REFERENCES [dbo].[acomodacao] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table acomodacao_servico
-- ----------------------------
ALTER TABLE [dbo].[acomodacao_servico] ADD CONSTRAINT [FK_acomodacao_servicos_acomodacao] FOREIGN KEY ([id_acomodacao]) REFERENCES [dbo].[acomodacao] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table artigo
-- ----------------------------
ALTER TABLE [dbo].[artigo] ADD CONSTRAINT [FK_artigo_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[artigo] ADD CONSTRAINT [FK_artigo_tipo_artigo] FOREIGN KEY ([id_categoria_artigo]) REFERENCES [dbo].[categoria_artigo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table artigo_imagem
-- ----------------------------
ALTER TABLE [dbo].[artigo_imagem] ADD CONSTRAINT [FK_artigo_imagem_artigo] FOREIGN KEY ([id_artigo]) REFERENCES [dbo].[artigo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table artista_obra
-- ----------------------------
ALTER TABLE [dbo].[artista_obra] ADD CONSTRAINT [FK_artista_obra_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table carrinho_compra
-- ----------------------------
ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_acomodacao] FOREIGN KEY ([id_acomodacao]) REFERENCES [dbo].[acomodacao] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_acomodacao_quarto] FOREIGN KEY ([id_quarto]) REFERENCES [dbo].[acomodacao_quarto] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_artigo] FOREIGN KEY ([id_artigo]) REFERENCES [dbo].[artigo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_evento] FOREIGN KEY ([id_evento]) REFERENCES [dbo].[evento] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_farmacia_produto] FOREIGN KEY ([id_farmacia_produto]) REFERENCES [dbo].[farmacia_produto] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_filme] FOREIGN KEY ([id_filme]) REFERENCES [dbo].[filme] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_loja_produto] FOREIGN KEY ([id_loja_produto]) REFERENCES [dbo].[loja_produto] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_musica] FOREIGN KEY ([id_musica]) REFERENCES [dbo].[musica] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_obra_arte] FOREIGN KEY ([id_obra]) REFERENCES [dbo].[obra_arte] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_restaurante] FOREIGN KEY ([id_restaurante]) REFERENCES [dbo].[restaurante] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_taxi] FOREIGN KEY ([id_taxi]) REFERENCES [dbo].[taxi] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[carrinho_compra] ADD CONSTRAINT [FK_carrinho_compra_Usuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table cinema
-- ----------------------------
ALTER TABLE [dbo].[cinema] ADD CONSTRAINT [FK_cinema_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table cinema_sessao
-- ----------------------------
ALTER TABLE [dbo].[cinema_sessao] ADD CONSTRAINT [FK_cinema_sessao_cinema] FOREIGN KEY ([id_cinema]) REFERENCES [dbo].[cinema] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[cinema_sessao] ADD CONSTRAINT [FK_cinema_sessao_filme] FOREIGN KEY ([id_filme]) REFERENCES [dbo].[filme] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table clinica
-- ----------------------------
ALTER TABLE [dbo].[clinica] ADD CONSTRAINT [FK_clinica_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table compra
-- ----------------------------
ALTER TABLE [dbo].[compra] ADD CONSTRAINT [FK_compra_Usuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table distrito_classificacao
-- ----------------------------
ALTER TABLE [dbo].[distrito_classificacao] ADD CONSTRAINT [FK_distrito_classificacao_distrito1] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[distrito_classificacao] ADD CONSTRAINT [FK_distrito_classificacao_Usuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table distrito_comentario
-- ----------------------------
ALTER TABLE [dbo].[distrito_comentario] ADD CONSTRAINT [FK_distrito_comentario_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[distrito_comentario] ADD CONSTRAINT [FK_distrito_comentario_Usuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table distrito_foto
-- ----------------------------
ALTER TABLE [dbo].[distrito_foto] ADD CONSTRAINT [FK_distrito_foto_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table entidade_cultural
-- ----------------------------
ALTER TABLE [dbo].[entidade_cultural] ADD CONSTRAINT [FK_entidade_cultural_categoria_cultura] FOREIGN KEY ([id_categoria_cultura]) REFERENCES [dbo].[categoria_cultura] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table evento
-- ----------------------------
ALTER TABLE [dbo].[evento] ADD CONSTRAINT [FK_evento_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[evento] ADD CONSTRAINT [FK_evento_evento_categoria] FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[evento_categoria] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table evento_comentario
-- ----------------------------
ALTER TABLE [dbo].[evento_comentario] ADD CONSTRAINT [FK_evento_comentario_evento] FOREIGN KEY ([id_evento]) REFERENCES [dbo].[evento] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[evento_comentario] ADD CONSTRAINT [FK_evento_comentario_Usuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table farmacia
-- ----------------------------
ALTER TABLE [dbo].[farmacia] ADD CONSTRAINT [FK_farmacia_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table farmacia_produto
-- ----------------------------
ALTER TABLE [dbo].[farmacia_produto] ADD CONSTRAINT [FK_farmacia_produto_farmacia] FOREIGN KEY ([id_farmacia]) REFERENCES [dbo].[farmacia] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table hospital
-- ----------------------------
ALTER TABLE [dbo].[hospital] ADD CONSTRAINT [FK_hospital_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table item_filme_categoria
-- ----------------------------
ALTER TABLE [dbo].[item_filme_categoria] ADD CONSTRAINT [FK_item_filme_categoria_filme] FOREIGN KEY ([id_filme]) REFERENCES [dbo].[filme] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[item_filme_categoria] ADD CONSTRAINT [FK_item_filme_categoria_filme_categoria] FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[filme_categoria] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table item_pacote_subscricao
-- ----------------------------
ALTER TABLE [dbo].[item_pacote_subscricao] ADD CONSTRAINT [FK_item_pacote_subscricao_pacote_subscricao] FOREIGN KEY ([id_pacote_subscricao]) REFERENCES [dbo].[pacote_subscricao] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table loja
-- ----------------------------
ALTER TABLE [dbo].[loja] ADD CONSTRAINT [FK_loja_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[loja] ADD CONSTRAINT [FK_loja_loja_tipo] FOREIGN KEY ([id_tipo_loja]) REFERENCES [dbo].[loja_tipo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table loja_produto
-- ----------------------------
ALTER TABLE [dbo].[loja_produto] ADD CONSTRAINT [FK_loja_produto_loja] FOREIGN KEY ([id_loja]) REFERENCES [dbo].[loja] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[loja_produto] ADD CONSTRAINT [FK_loja_produto_produto_categoria] FOREIGN KEY ([categoria]) REFERENCES [dbo].[produto_categoria] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table musica
-- ----------------------------
ALTER TABLE [dbo].[musica] ADD CONSTRAINT [FK_musica_artista_obra] FOREIGN KEY ([id_artista_obra]) REFERENCES [dbo].[artista_obra] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[musica] ADD CONSTRAINT [FK_musica_genero_musical] FOREIGN KEY ([id_genero_musical]) REFERENCES [dbo].[genero_musical] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table obra_arte
-- ----------------------------
ALTER TABLE [dbo].[obra_arte] ADD CONSTRAINT [FK_obra_arte_artista_obra] FOREIGN KEY ([id_artista_obra]) REFERENCES [dbo].[artista_obra] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[obra_arte] ADD CONSTRAINT [FK_obra_arte_categoria_obra_arte] FOREIGN KEY ([id_categoria_obra]) REFERENCES [dbo].[categoria_obra_arte] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table obra_arte_imagem
-- ----------------------------
ALTER TABLE [dbo].[obra_arte_imagem] ADD CONSTRAINT [FK_obra_arte_imagem_obra_arte] FOREIGN KEY ([id_obra_arte]) REFERENCES [dbo].[obra_arte] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table produto
-- ----------------------------
ALTER TABLE [dbo].[produto] ADD CONSTRAINT [FK_produto_tipo_produto] FOREIGN KEY ([id_tipo_produto]) REFERENCES [dbo].[tipo_produto] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table restaurante
-- ----------------------------
ALTER TABLE [dbo].[restaurante] ADD CONSTRAINT [FK_restaurante_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[restaurante] ADD CONSTRAINT [FK_restaurante_restaurante_tipo] FOREIGN KEY ([id_restaurante_tipo]) REFERENCES [dbo].[restaurante_tipo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table restaurante_classificacao
-- ----------------------------
ALTER TABLE [dbo].[restaurante_classificacao] ADD CONSTRAINT [FK_restaurante_classificacao_restaurante] FOREIGN KEY ([id_restaurante]) REFERENCES [dbo].[restaurante] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[restaurante_classificacao] ADD CONSTRAINT [FK_Restaurante_usuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table restaurante_comentario
-- ----------------------------
ALTER TABLE [dbo].[restaurante_comentario] ADD CONSTRAINT [FK_restaurante_comentario_usuario] FOREIGN KEY ([id_restaurante]) REFERENCES [dbo].[restaurante] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[restaurante_comentario] ADD CONSTRAINT [FK_usuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table restaurante_foto
-- ----------------------------
ALTER TABLE [dbo].[restaurante_foto] ADD CONSTRAINT [FK_restaurante_foto_restaurante] FOREIGN KEY ([id_restaurante]) REFERENCES [dbo].[restaurante] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table restaurante_prato
-- ----------------------------
ALTER TABLE [dbo].[restaurante_prato] ADD CONSTRAINT [FK_restaurante_prato_restaurante] FOREIGN KEY ([id_resturante]) REFERENCES [dbo].[restaurante] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[restaurante_prato] ADD CONSTRAINT [FK_restaurante_prato_restaurante_prato_categoria] FOREIGN KEY ([id__prato_categoria]) REFERENCES [dbo].[restaurante_prato_categoria] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table servico
-- ----------------------------
ALTER TABLE [dbo].[servico] ADD CONSTRAINT [FK_servico_categoria_servico] FOREIGN KEY ([id_servico_categoria]) REFERENCES [dbo].[servico_categoria] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[servico] ADD CONSTRAINT [FK_servico_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table servico_foto
-- ----------------------------
ALTER TABLE [dbo].[servico_foto] ADD CONSTRAINT [FK_servico_foto_servico] FOREIGN KEY ([id_servico]) REFERENCES [dbo].[servico] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table taxi
-- ----------------------------
ALTER TABLE [dbo].[taxi] ADD CONSTRAINT [FK_taxi_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[taxi] ADD CONSTRAINT [FK_taxi_taxi_categoria] FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[taxi_categoria] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table turismo
-- ----------------------------
ALTER TABLE [dbo].[turismo] ADD CONSTRAINT [FK_turismo_distrito] FOREIGN KEY ([id_distrito]) REFERENCES [dbo].[distrito] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[turismo] ADD CONSTRAINT [FK_turismo_turismo_categoria] FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[turismo_categoria] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table turismo_comentario
-- ----------------------------
ALTER TABLE [dbo].[turismo_comentario] ADD CONSTRAINT [FK_turismo_comentario_turismo] FOREIGN KEY ([id_turismo]) REFERENCES [dbo].[turismo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[turismo_comentario] ADD CONSTRAINT [FK_turismo_comentario_Usuario] FOREIGN KEY ([id_turismo]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Usuario
-- ----------------------------
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [FK_Usuario_usuario_tipo] FOREIGN KEY ([id_usuario_tipo]) REFERENCES [dbo].[usuario_tipo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table usuario_favorito
-- ----------------------------
ALTER TABLE [dbo].[usuario_favorito] ADD CONSTRAINT [FK_usuario_favorito_Usuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([idusario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

