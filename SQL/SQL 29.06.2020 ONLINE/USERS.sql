USE [mussikac_bd]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29-06-2020 12:32:28 PM ******/
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
/****** Object:  Table [dbo].[usuario_favorito]    Script Date: 29-06-2020 12:32:31 PM ******/
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
/****** Object:  Table [dbo].[usuario_provedor]    Script Date: 29-06-2020 12:32:31 PM ******/
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
/****** Object:  Table [dbo].[usuario_tipo]    Script Date: 29-06-2020 12:32:31 PM ******/
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
/****** Object:  Table [dbo].[UsuarioAutenticacao]    Script Date: 29-06-2020 12:32:31 PM ******/
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
