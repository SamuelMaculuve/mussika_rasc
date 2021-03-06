USE [mussikac_bd]
GO
SET IDENTITY_INSERT [dbo].[acomodacao_tipo] ON 

INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1, N'Pensão')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (2, N'Hotel')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (3, N'Lodge')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1002, N'Pousada')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1003, N'Resort')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1004, N'Hotel Fazenda')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1005, N'Bed and Breakfast')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1006, N'Hotel Histórico')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1007, N'Apart-Hotel')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1008, N'Albergue')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1009, N'Casa de aluguel')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1010, N'Casa de Família')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1011, N'Motel')
SET IDENTITY_INSERT [dbo].[acomodacao_tipo] OFF
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

INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (1, N'Literatura', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (2, N'Artes Plásticas', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (3, N'Escultura', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (4, N'Artesanato', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (5, N'Teatro', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (6, N'Dança', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (8, N'Grafites', NULL)
SET IDENTITY_INSERT [dbo].[categoria_obra_arte] OFF
SET IDENTITY_INSERT [dbo].[evento_categoria] ON 

INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (1, N'Espectaculos')
INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (2, N'Eventos académicos')
INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (3, N'Congresso')
INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (4, N'Simpósio')
INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (5, N'Colóquio')
INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (6, N'Fórum')
INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (7, N'Mesa Redonda')
INSERT [dbo].[evento_categoria] ([id], [descricao]) VALUES (8, N'Outro')
SET IDENTITY_INSERT [dbo].[evento_categoria] OFF
SET IDENTITY_INSERT [dbo].[filme_categoria] ON 

INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (1, N'Acçao')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (2, N'Animação')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (3, N'Aventura')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (4, N'Biografia')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (5, N'Clássico')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (6, N'Comédia')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (7, N'Crime')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (8, N'Documentos')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (9, N'Drama')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (10, N'Desporto')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (11, N'Familía')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (12, N'Fantasia')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (13, N'Faroste')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (14, N'Ficção Cientifica')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (15, N'Gospel')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (16, N'Guerra')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (17, N'Herói')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (18, N'História')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (19, N'Horror')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (20, N'Terror')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (21, N'Suspence')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (22, N'Romance')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (23, N'Nacional')
INSERT [dbo].[filme_categoria] ([id], [descricao]) VALUES (24, N'Musical')
SET IDENTITY_INSERT [dbo].[filme_categoria] OFF
SET IDENTITY_INSERT [dbo].[genero_musical] ON 

INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (1, N'Zouk')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (2, N'Semba')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (3, N'RAP & RNB')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (4, N'Kizomba')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (5, N'Kuduro')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (6, N'Marrabenta')
SET IDENTITY_INSERT [dbo].[genero_musical] OFF
SET IDENTITY_INSERT [dbo].[loja_tipo] ON 

INSERT [dbo].[loja_tipo] ([id], [descricao]) VALUES (1, N'Supermercado')
INSERT [dbo].[loja_tipo] ([id], [descricao]) VALUES (2, N'Imobiliária')
INSERT [dbo].[loja_tipo] ([id], [descricao]) VALUES (3, N'Mercearia')
SET IDENTITY_INSERT [dbo].[loja_tipo] OFF
SET IDENTITY_INSERT [dbo].[produto_categoria] ON 

INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (1, N'Vegetais')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (2, N'Carnes')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (3, N'Electronicos')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (4, N'Alimentos e Bebidas')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (5, N'Apps e Jogos')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (6, N'Automotivo')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (7, N'Bebês')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (8, N'Beleza')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (9, N'Bolsas, Malas e Mochilas')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (10, N'Brinquedos e Jogos')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (11, N'Casa')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (12, N'CD e Vinil')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (13, N'Computadores e Informática')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (14, N'Cozinha')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (15, N'DVD e Blu-Ray')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (16, N'Eletrodomésticos')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (17, N'Eletrônicos')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (18, N'Desporto e Aventura')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (19, N'Ferramentas e Materiais de Construção')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (20, N'Games')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (21, N'Jardim e Piscina')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (22, N'Livros')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (23, N'Material para Escritório e Papelaria')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (24, N'Móveis e Decoração')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (25, N'Pet Shop')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (27, N'Roupas, Calçados e Joias')
INSERT [dbo].[produto_categoria] ([id], [descricao]) VALUES (28, N'Saúde e Cuidados Pessoais')
SET IDENTITY_INSERT [dbo].[produto_categoria] OFF
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
SET IDENTITY_INSERT [dbo].[taxi_categoria] ON 

INSERT [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (1, N'Txopela', NULL)
INSERT [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (2, N'Motorizadas', NULL)
INSERT [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (3, N'Automóveis', NULL)
INSERT [dbo].[taxi_categoria] ([id], [descricao], [fotografia]) VALUES (4, N'Bicicleta', NULL)
SET IDENTITY_INSERT [dbo].[taxi_categoria] OFF
SET IDENTITY_INSERT [dbo].[turismo_categoria] ON 

INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (1, N'TURISMO CULTURAL', NULL)
INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (2, N'TURISMO RELIGIOSO', NULL)
INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (3, N'TURISMO CONSUMO', NULL)
INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (4, N'TURISMO DESPORTIVO', NULL)
INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (5, N'TURISMO DE NEGÓCIOS', NULL)
INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (6, N'TURISMO GASTRONÔMICO', NULL)
INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (7, N'TURISMO ECOLÓGICO', NULL)
INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (8, N'TURISMO AVENTURA', NULL)
INSERT [dbo].[turismo_categoria] ([id], [descricao], [fotografia]) VALUES (9, N'TURISMO SAÚDE', NULL)
SET IDENTITY_INSERT [dbo].[turismo_categoria] OFF
SET IDENTITY_INSERT [dbo].[usuario_tipo] ON 

INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (1, N'NORMAL')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (2, N'ADMINISTRADOR')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (3, N'SUPER ADMINISTRADOR')
SET IDENTITY_INSERT [dbo].[usuario_tipo] OFF
