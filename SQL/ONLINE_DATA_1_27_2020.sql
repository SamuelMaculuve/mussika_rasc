USE [mussikac_bd]
GO
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
SET IDENTITY_INSERT [dbo].[distrito] ON 

INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (2, NULL, N'Quelimane', N'Perfil20122019171137_2.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60761.555211617015!2d36.86892522204015!3d-17.85750772630134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d2f3924aa45035%3A0x301df4b81c5c9fac!2sQuelimane!5e0!3m2!1spt-PT!2smz!4v1576670511227!5m2!1spt-PT!2smz', N'Quelimane e um distrito de teste
                        
                        
                        
                        
                        ', 0, N'193.343', N'117 km', N'36.901713', N'-17.854648', 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (3, NULL, N'Lugela', N'Perfil20122019171525_3.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d980189.3814810364!2d36.08466800926038!3d-16.329852438517253!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d058dba32d5b2f%3A0x5edd6fdf3c7fc2ad!2sLugela!5e0!3m2!1spt-PT!2smz!4v1576673176592!5m2!1spt-PT!2smz', N'Quelimane é a capital e a maior cidade da província da Zambézia, em Moçambique. Está localizada no rio dos Bons Sinais, a cerca de 20 km do Oceano Índico; por essa razão, a cidade conta com um porto, que é uma das suas principais actividades económicas, centro de uma importante indústria pesqueira.

Era um importante centro comercial suaíle quando os portugueses ali chegaram em 1498, mais especificamente Vasco da Gama na sua primeira viagem à Índia, mas a presença portuguesa permanente só foi registada a partir de 1544.[1] Foi elevada a vila e sede de concelho em 1763 e a cidade a 21 de Agosto de 1942.[2]

A cidade de Quelimane é administrativamente um município com um governo local eleito e também um distrito, que administra as competências do governo central.[3] Numa área de 117 km², a cidade tinha 150 116 habitantes em 1997. A população tinha ascendido a 185.000 habitantes em 2003, e o censo de 2007 registou 193.343 habitantes.[4]

Qulimane está interligada ao território moçambicano por uma extensa rede de transportes, sendo que suas mais requisitadas vias de acesso são as rodoviárias, por intermédio da rodovia N10, de ligação com Nicoadala, ao noroeste; da rodovia N320, de ligação com Chinde, ao sul, e a praia de Zalala, ao norte, e; da rodovia R1119, de ligação com Mendozo e Magromane, no litoral.[6]

Anteriormente a sede municipal era ligada a Mocuba pelo Caminho de Ferro Transzambeziano, que utilizava o importante porto de Quilimane para escoamento de produtos agrícolas e semi-beneficiados.[7][8] O trafego no caminho de ferro está suspenso por falta de manutenção.

A cidade ainda conta com um aeródromo de voos domésticos, o aeroporto de Quelimane.[9]
                        
                        
                        
                        
                        ', 0, N'6 001 km', N'233 Hab', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (4, NULL, N'Mocuba', N'Perfil2312201910510_4.JPG', N'https://goo.gl/maps/ugwyt3de13B3npjHA', N'Mocuba é uma cidade e um município da província da Zambézia, em Moçambique, situada nas margens do rio Licungo.

Para além de capital do distrito de Mocuba, esta urbe é também sede do posto administrativo da Cidade de Mocuba.

Foi vila até 12 de fevereiro de 1971, altura em que foi elevada a cidade', 0, NULL, N'57 584 hab', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[distrito] OFF
SET IDENTITY_INSERT [dbo].[acomodacao] ON 

INSERT [dbo].[acomodacao] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_acomodacao_tipo], [id_distrito], [Inactivo]) VALUES (1, N'Hilton Lake Como', N'Via Borgo Vico 241 , 22100 Como, Italy', N'842338251', N'jpires@mozsistemas.co.mz', N'Featuring a rooftop infinity pool, Hilton Lake Como offers accommodation a 10-minute walk from the shores of Lake Como. Guests can enjoy the Terrazza 241 rooftop restaurant and bar, the Satin restaurant and the Taffeta lobby bar.

Featuring stylish features, rooms have wooden floor and a LCD TV. Some units also feature a lake-view terrace or a spa bath.

The Eforea spa & health club boasts an indoor pool, a Finnish sauna, hot tub and Turkish bath. A fitness centre and a solarium are also available.

Como town centre is a 15-minute walk from Hilton Lake Como. Villa Olmo is 500 m away.

Couples particularly like the location — they rated it 8.6 for a two-person trip.

We speak your language!
            ', N'Perfil20122019165950_1.jpg', N'www.booking.com/hotel/it/hilton-lake-como', N'indisponivel', 2, 2, 0)
SET IDENTITY_INSERT [dbo].[acomodacao] OFF
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
SET IDENTITY_INSERT [dbo].[artigo] ON 

INSERT [dbo].[artigo] ([id], [codigo], [id_categoria_artigo], [nome], [descricao], [marca_registada], [atracao_internacional], [preco_min], [preco_max], [preco_venda], [observacoes], [portofolio], [genero], [e_servico], [foto_capa], [id_distrito], [bairro], [clicks], [data_cadastro], [Inactivo]) VALUES (1, NULL, 3, N'Playstation 4', N'play station em bom estado, aceito negociacoes', 1, 1, 20000.0000, 25000.0000, 23000.0000, NULL, N'sony.com', N'Games', 0, N'Perfil1912201916290_1.jpg', 2, N'mucuti', NULL, CAST(N'2019-12-19 15:42:01.093' AS DateTime), 0)
INSERT [dbo].[artigo] ([id], [codigo], [id_categoria_artigo], [nome], [descricao], [marca_registada], [atracao_internacional], [preco_min], [preco_max], [preco_venda], [observacoes], [portofolio], [genero], [e_servico], [foto_capa], [id_distrito], [bairro], [clicks], [data_cadastro], [Inactivo]) VALUES (2, NULL, 2, N'Toyota Raum', N'toyota raum usado em bom estado', 1, 1, 230000.0000, 250000.0000, 240000.0000, NULL, N'toyota.co.mz', N'Viaturas', 0, N'Perfil2012201915123_2.jpg', 3, N'Bloco 1, Cidade Alta', NULL, CAST(N'2019-12-20 15:11:51.370' AS DateTime), 0)
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

INSERT [dbo].[artista_obra] ([id], [nome], [descricao], [fotografia], [id_distrito], [telefone], [e_musico]) VALUES (1, N'Abuchamo', N'abuchamo e um musico', N'Autor1712020163039.jpg', 2, N'258842338251', 1)
INSERT [dbo].[artista_obra] ([id], [nome], [descricao], [fotografia], [id_distrito], [telefone], [e_musico]) VALUES (2, N'Malangatana', N'malangatana', N'Autor18120201073.jpg', 2, N'258842338251', 0)
SET IDENTITY_INSERT [dbo].[artista_obra] OFF
SET IDENTITY_INSERT [dbo].[genero_musical] ON 

INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (1, N'ZOUK')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (2, N'SEMBA')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (3, N'RAP & RNB')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (4, N'KIZOMBA
')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (5, N'KUDURO')
SET IDENTITY_INSERT [dbo].[genero_musical] OFF
SET IDENTITY_INSERT [dbo].[musica] ON 

INSERT [dbo].[musica] ([id], [id_genero_musical], [titulo], [artista], [ano], [album], [formato], [produtor], [gravadora], [link], [caminho_ficheiro], [caminho_capa1], [caminho_capa2], [preco_venda], [gratis], [duracao], [pode_baixar], [e_album], [id_artista_obra]) VALUES (1, 1, N'Minha Dama', N'Abuchamo', 2019, NULL, N'MP3', N'wce beats', N'universal', N'teste', NULL, N'Capa1712020163555_1.jpg', NULL, NULL, 1, NULL, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[musica] OFF
SET IDENTITY_INSERT [dbo].[categoria_obra_arte] ON 

INSERT [dbo].[categoria_obra_arte] ([id], [descricao]) VALUES (1, N'PINTURAS')
INSERT [dbo].[categoria_obra_arte] ([id], [descricao]) VALUES (2, N'OBJECTOS')
SET IDENTITY_INSERT [dbo].[categoria_obra_arte] OFF
SET IDENTITY_INSERT [dbo].[obra_arte] ON 

INSERT [dbo].[obra_arte] ([id], [id_categoria_obra], [titulo], [autor], [materia], [suporte], [tecnica], [dimensoes], [autoria_producao], [informacao_tecnica], [fotografo], [proprietario], [caminho_imagem], [id_artista_obra]) VALUES (1, 1, N'Arte de viver', N'Malangatana', N'wolves', N'pinto', N'teste', N'230x230', N'Malangatana', N'teste', NULL, N'Malangatana', N'Perfil181202010109_1.jpg', 2)
INSERT [dbo].[obra_arte] ([id], [id_categoria_obra], [titulo], [autor], [materia], [suporte], [tecnica], [dimensoes], [autoria_producao], [informacao_tecnica], [fotografo], [proprietario], [caminho_imagem], [id_artista_obra]) VALUES (2, 2, N'teste', N'Malangatana', N'teste', N'teste', N'teste', N'320X290', N'teste', N'teste', NULL, N'teste', N'Perfil2112020103623_2.jpg', 2)
SET IDENTITY_INSERT [dbo].[obra_arte] OFF
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
SET IDENTITY_INSERT [dbo].[restaurante] ON 

INSERT [dbo].[restaurante] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_restaurante_tipo], [id_distrito], [activo]) VALUES (1, N'Restaurante Quinta do Nico', N'Avenida Marginal', N'84 270 1311', N'jpires@mozsistemas.co.mz', N'Temos pratos do dia, e comida zambeziana', N'perfil20122019172450_1.jpg', N'www.quintanico.co.mz', N'<iframe src="https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d3923357.695097542!2d36.495665681207264!3d-16.19965723313339!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e6!4m3!3m2!1d-14.543998799999999!2d40.6770132!4m5!1s0x18d2f392e4d04219%3A0xcfc846a734eb29d9!2srestaurante%20cidade%20de%20quelimane!3m2!1d-17.8790571!2d36.8915759!5e0!3m2!1spt-PT!2smz!4v1576855237648!5m2!1spt-PT!2smz', 1, 2, 1)
INSERT [dbo].[restaurante] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_restaurante_tipo], [id_distrito], [activo]) VALUES (2, N'Restaurante Xeque Mate', N'284 Ave Samora Machel, Quelimane', N'87 916 5803', NULL, N'Bom lugar para mordidas rápidas, bons remédios de ressaca. Eu recomendo este lugar, há uma grande variedade de pratos agradáveis, a minha impressão é que combinam a cozinha tradicional portuguesa com a nossa cozinha moçambicana. Não é lugar gourmet, mas ainda é ótimo para os amantes de comida.', N'perfil412020195313_2.jpg', NULL, N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4820485.995223602!2d38.47028999320563!3d-15.200660442226432!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d2f3edcd92a91d%3A0x9af3082ef81b151e!2sPub-Restaurante%20Xeque%20Mate!5e1!3m2!1spt-PT!2smz!4v1578159877011!5m2!1spt-PT!2smz', 1, 2, 1)
SET IDENTITY_INSERT [dbo].[restaurante] OFF
SET IDENTITY_INSERT [dbo].[taxi] ON 

INSERT [dbo].[taxi] ([id], [nome], [praca_fixa], [bairro], [condutor], [proprietario], [matricula], [marca], [cor], [telefone], [email], [id_distrito], [foto_capa], [Inactivo]) VALUES (1, N'Taxi Mauricio', N'Quelimane', NULL, N'Mauricio', NULL, N'025MP', N'Toyota', N'preto', N'841524722', NULL, 2, N'noimage.png', 0)
SET IDENTITY_INSERT [dbo].[taxi] OFF
SET IDENTITY_INSERT [dbo].[usuario_tipo] ON 

INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (1, N'NORMAL')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (2, N'ADMINISTRADOR')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (3, N'SUPER ADMINISTRADOR')
SET IDENTITY_INSERT [dbo].[usuario_tipo] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (1, N'Aministrador', N'admin@mussika.co.mz', N'hjaXldGSJhaiisXuEHM6gJga31QYwcss0We71W0ysY4oFcVKHSS4bnLAro6Q8zfBLcusb91OMQjxVjMbSWGiuY7ik8I1ZSreaM4+reZjzh0S1+r3X8BlYndnrISn6xyE', 1, CAST(N'2019-12-18 13:46:04.437' AS DateTime), NULL, 1, NULL, 3, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (16, N'Isumbane', N'inaciojrsumbane@gmail.com', N'NZPG7XR8rOVwwwXB2oLXRNVnxpAMztKc6a/f8CgEpPi8KOfYkXRUhXsC1fTNPDZEzc6lDSuKLzwxmzD+ikJVHlkWaIYIqOTB66PA7PXSya+vP3xQMu1dKg2yW3gFAS15', 1, CAST(N'2019-12-29 01:29:52.920' AS DateTime), N'843327', 0, NULL, 1, N'258848631601', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (19, N'Júnior Pires Alide', N'2443042385780655@mussika.co.mz', N'tgmREXnZQtLOPxXnNlynJLoIpjSCHd1lVu5Zb8EQo9LrEXHyl9fHTDIAY5Ws4kYul0uwyvJQ3aql1hkqqL7N4lvIM6IBupq5T+BY2zAIEBeGwkNgWmmOkuxNJD+uvXHz', 1, CAST(N'2019-12-30 18:58:29.443' AS DateTime), NULL, 1, NULL, 1, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (20, N'junior pires', N'118177461552061077467@mussika.co.mz', N'3jzWgbchzXV9FV3BHGSIEHKHGGRSJzqbRXiojpGNADq0CYiT4iu9wn0RHqoE4c7WdsAV60DS+9+2vwseU9xIjolMwGN9QssIKbGv6dMPEAS0YErO+AOCH5tugHt8pTJ/', 1, CAST(N'2020-01-03 01:49:10.543' AS DateTime), NULL, 1, NULL, 1, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (22, N'Junior Braz', N'1444361629073788@mussika.co.mz', N'DqH2O37g3qqrwSvMWTmn7tACrdZ2iJkGHIvfeqpZZYiS45aw7+gPbukPa50XMv/Cf1ZfAenm3M6Qi0+h3nXGoLF8Ly3W4ZnOgYxl10Sw1V5VgfB5h4Aqi2uAVdN9Pvjk', 1, CAST(N'2020-01-07 16:43:13.083' AS DateTime), NULL, 1, NULL, 1, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (31, N'jpires', N'junior.alide007@gmail.com', N'Uiss77+id1Lqw/OFeIhNAfYH2MvavzeOl6EQZ1UCfdPq6VUsQPhbk5HoKfvxbsgzAhK0cn7x7/Qk8eYa8F6+2+uswSGuDoep2DqAbcg+eInmwxreFxgPs728mnCkUZbq', 1, CAST(N'2020-01-09 18:26:03.560' AS DateTime), N'665742', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (32, N'Wilson Maia', N'wilsonmaia04@gmail.com', N'edbdvPHYjNwZcOr+qFb+O3fGMx/sF2Baz0FhO6BKNitWv9P0u7FlbuDH8kJ1D744FQiNAjoBoYsARcJBlg0AIoPiEAwJbJ9uYtZgYjJKX+SOh10GB2+nrfAeg4klXZnd', 1, CAST(N'2020-01-10 12:24:33.923' AS DateTime), N'978875', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (33, N'jpires', N'jpires@mozsistemas.co.mz', N'iSY58NbG1aPPqif3APqjQ2Gk1afQ7SFhO5ATqUwCqYqJXJgWL6ksxBheSw9WFbydupAlm+BDs7610nrVeZlz85OfLCVSBC5b12RwXwdo2Fn9YCtK0jAOV13Wcv1HIZ25', 1, CAST(N'2020-01-11 10:38:58.380' AS DateTime), N'315036', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (34, N'Afane Eduardo Momade', N'clivafan@gmail.com', N'LirgKfJffw5VkcobphcGuglZ366uLKd4HBpnnrKj4A2MFoAg3usMSzidmyl8C5hIvKUO/hdrlrN7LwIOlxkxWSOinhiFpLXW5V3BLNg7bCmMeTIxg7GxnVRyjqddhnrF', 1, CAST(N'2020-01-12 20:45:28.473' AS DateTime), N'078473', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (35, N'Nando Zacarias Vontade Bernardo', N'nazvobe.jr@gmail.com', N'pEVIz3Tre7sUatx5A4zYUquViLIoOCatKwph8zTJE84By83WgwsiL21xC7nkoqULr30154EcV05C15o6p7ioXi1bw9coNv+t62LI/bF1ZvlLVH2Xz/eCraoPvGKSMMXw', 0, CAST(N'2020-01-15 08:47:47.123' AS DateTime), N'924378', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (36, N'Aldes', N'Aldescarlos007@gmail.com', N'MO3fCqZeDilXjqd+lMiOI9L+r1kB8IIqt8Ff+0Ctb2//iW8TBfir9t2hfy6ir1QH+3wDcwSptlShherG56eZepsh12Y4/DdQqLJsTs/Zs/VNCd3HY4CYZsh3VLa9a4oe', 1, CAST(N'2020-01-19 08:13:49.707' AS DateTime), N'786798', 1, NULL, 1, N'861062910', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (37, N'Maússe', N'quilasmausse@gmail.com', N'vFECges57miBXrUYRMTf+zr+7N95NVkMES0P9TBzVBSrmzbdKld/w0yHhON/Oa5pOzVIRNc1hTfZYv2d+zNpJwxLwdez/j5l8HR6q23zg3UlSVVGtJ8udoNplCRn7gwW', 1, CAST(N'2020-01-19 11:57:24.477' AS DateTime), N'716074', 1, NULL, 1, N'+258870486262', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (38, N'Quisito Alface', N'qalface@gmail.com', N'VHPL33AqsXxywwqr0QjRW3nstp7R4k94C5UJh5295L9Ug2aHbYF5CINgFyckll/uqQCKxyOqo8FyhV2X0GSjZX9kpI6jp/oAB/HtmQYM0KRFavM0NqSwNurY20CAxxnM', 0, CAST(N'2020-01-20 18:15:06.167' AS DateTime), N'110848', 0, NULL, 1, N'847160755', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (39, N'cpc', N'cpc.quel@gmail.com', N'96S9h1hsVWkOpLzUH8Ck9eW4sTwgAae9AUIpefdl+Ifoy05fyAEuowYKoSWsSD8LihyPhKK3moRBSLdKNCeLwXqAqwCu7Q7kDo0F1Z2ldZ/k39ygdbXhM241TABqiDrV', 0, CAST(N'2020-01-21 10:13:00.183' AS DateTime), N'230245', 0, NULL, 1, N'844125221', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (40, N'Salvador', N'slvdrelias@gmail.com', N'vHHp5NJH/Y1iIZXCcNqAjXOkkMsZBU2K+jX1fj+ULX6rLXeLhPACBgNsU33+gxTPiKSPQo8hudfOmL4PZXcAjKKDKsMMEqrR6+cm3QGJr8HATg80Wx4Qy1tZxNPvuCKq', 1, CAST(N'2020-01-22 23:44:05.690' AS DateTime), N'898071', 1, NULL, 1, N'258870735782', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele]) VALUES (41, N'Salvador Elias Moiane', N'102737956361126933681@mussika.co.mz', N'dqpJrGLlrHY2U243s4o6WeiSo8RhEUfcNvqeQg/DiFyI5xk9krPhAWI11ImwwE86aXZTiksf6D+QiOCTCvUJvsYqPq7xSIHHqAWozLaO/CTAYRVzCtSgsju3CrJ3KvhM', 1, CAST(N'2020-01-25 04:46:54.353' AS DateTime), NULL, 1, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_quarto] ON 

INSERT [dbo].[acomodacao_quarto] ([id], [id_acomodacao], [descricao], [hospedes], [custo_diaria], [quantidade], [foto_capa], [chk_ac], [chk_parqueamento], [chk_televisao], [chk_geleira], [chk_wifi], [chk_minibar], [quarto_foto], [Inactivo], [observacoes]) VALUES (1, 1, N'EXCLUSIVO', 2, 5500.0000, 9, N'quarto18122019155712_1.jpg', 1, 1, 1, 0, 1, 1, NULL, 0, N'From the minute we arrived the staff were lovely and very helpful. Room beautiful with lovely views of the lake. Breakfast was fantastic and dinner in the Taffeta bar was very very nice.')
SET IDENTITY_INSERT [dbo].[acomodacao_quarto] OFF
SET IDENTITY_INSERT [dbo].[carrinho_compra] ON 

INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica]) VALUES (1, 19, 0, 1, 0, 0, NULL, NULL, NULL, 2, NULL, 1, CAST(N'2019-12-30 18:58:42.700' AS DateTime), N'toyota raum usado em bom estado', NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica]) VALUES (2, 1, 0, 1, 0, 0, NULL, NULL, NULL, 2, NULL, 1, CAST(N'2019-12-30 19:00:26.527' AS DateTime), N'toyota raum usado em bom estado', NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica]) VALUES (3, 19, 0, 1, 0, 0, NULL, NULL, NULL, 1, NULL, 1, CAST(N'2019-12-30 19:22:56.347' AS DateTime), N'play station em bom estado, aceito negociacoes', NULL, NULL, NULL, NULL)
INSERT [dbo].[carrinho_compra] ([id], [id_usuario], [e_restaurante], [e_artigo], [e_acomodacao], [e_taxi], [id_restaurante], [id_acomodacao], [id_quarto], [id_artigo], [id_taxi], [activo], [data_cadastro], [descricao], [e_obra], [id_obra], [e_musica], [id_musica]) VALUES (4, 20, 0, 1, 0, 0, NULL, NULL, NULL, 2, NULL, 1, CAST(N'2020-01-03 01:49:50.427' AS DateTime), N'toyota raum usado em bom estado', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[carrinho_compra] OFF
SET IDENTITY_INSERT [dbo].[turismo] ON 

INSERT [dbo].[turismo] ([id], [nome], [data_cadastro], [id_distrito], [localizacao], [inactivo], [foto_capa], [descricao]) VALUES (1, N'Feira Internacional de Turismo', CAST(N'2020-01-18 10:22:10.090' AS DateTime), 2, N'Avenida MARGINAL', 0, N'LocalTuristico1812020102214_1.jpeg', N'O Micultur através do INATUR e FEMOTUR, estão a organizar a VII edição do FIKANI – Feira Internacional do Turismo de Moçambique, que irá decorrer de 06 a 09 de Setembro de 2019, na Cidade de Maputo, cujo objectivo é de contribuir para o fortalecimento e desenvolvimento do turismo e da economia do país a partir da promoção do Sector do Turismo, suas potencialidades e oportunidades. 

No FIKANI os expositores irão dispor de STANDS para exibição dos seus bens, serviços, produtos e potencialidades ao público.

Existirão também eventos paralelos, como é o caso de seminários, gastronomia, animações, festivais de cultura (música, dança, literatura), entre outros...

É neste contexto qua a DPCULTURZ, tem a honra de convidar a todos operadores do ramo hoteleiro e turístico a participarem deste magistoso evento de promoção do Turismo em Moçambique.

Para mais informações contactem a DPCULTURZ, cita na Rua da Resistência em frente da Praça da Juventude, ou pelos números 849047542 / 844284389, e-mail –dpturz@gmail.com , facebook – Dpcturz Zambézia,')
SET IDENTITY_INSERT [dbo].[turismo] OFF
SET IDENTITY_INSERT [dbo].[clinica] ON 

INSERT [dbo].[clinica] ([id], [id_distrito], [descricao], [nome], [bairro], [telefone], [foto_capa], [inactivo], [email], [data_cadastro]) VALUES (1, 2, N'Clínica MMQ - é uma clínica de especialidades médicas que visa a oferecer os Serviços de Saúde com qualidade, humanização e preços competitivos apresentando quase 5 anos de experiência na Saúde. Realizamos uma pesquisa de mercado e oferecemos os melhores valores do mercado.

Prestamos, Serviços de Saúde como Consultas Externas e Consultas ao Domicílios, Exames Clínicos , Check-up Laboral, Ecografia de Última Geração 4D e outros, Serviços de Enfermagem, Cuidados Intensivos, Serviços de Analises Clínicas e Laboratoriais, Serviços de Ambulância, Maternidade, Incubadora, primeiros socorros, fisioterapia, assistência ao clube ou desportista, Cuidados Especiais para Recém-Nascidos, Radiologia, Cirurgias, Internamento com capacidade de 15 quartos climatizados com capacidade de duas Camas, Farmácia Aberta 24H e muito mais.', N'Clinica MMQ', N'Avenida Marginal', N'84 732 7026', N'clinica1812020103241_1.png', 0, N'clinicammq@gmail.com', CAST(N'2020-01-18 10:32:28.907' AS DateTime))
SET IDENTITY_INSERT [dbo].[clinica] OFF
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
SET IDENTITY_INSERT [dbo].[evento] ON 

INSERT [dbo].[evento] ([id], [nome], [data_cadastro], [data_evento], [descricao], [foto_capa], [id_distrito], [local], [inactivo], [adiado], [realizado]) VALUES (1, N'Conferência Internacional do Turismo Baseado na Natureza', CAST(N'2020-01-18 10:15:49.237' AS DateTime), CAST(N'2020-01-17 00:00:00.000' AS DateTime), N'A nível global, os governos nacionais, ONGs e os gestores de áreas de conservação enfrentam desafios para conseguir financiar a protecção dos habitats e espécies e, ao mesmo tempo, garantir que as comunidades locais se beneficiem das áreas de conservação. O turismo baseado na natureza, surge como uma das soluções para resolver o dilema. Ao promover a fauna bravia e os espaços naturais como atracções, os países podem preservar os ecossistemas e gerar empregos para as populações que vivem mais próximo de animais selvagens.

Esta conferência internacional pretende explorar mecanismos de desenvolvimento do turismo baseado na natureza nas áreas de conservação, de forma a fornecer resultados para as pessoas e a vida selvagem. O turismo é uma indústria prioritária para o Governo de Moçambique e o Estado está empenhado em criar oportunidades que explorem e enaltecem o poder do desenvolvimento. Para este efeito, o Governo estabeleceu as condições necessárias para que as áreas de conservação implementem as parcerias público-privadas.

As parcerias público-privadas são indispensáveis para oferecer um turismo de primeira classe nas áreas de conservação e também garantir que essas áreas selvagens sejam protegidas para o futuro. A co-gestão das áreas de conservação é uma forma inovadora de aceder aos recursos técnicos, profissionais e financeiros necessários.

O Governo de Moçambique tem a honra de estar em parceria com o Grupo Banco Mundial, o Global Wildlife Program e outros parceiros no lançamento desta conferência com o intuito de promover o desenvolvimento do turismo sustentável e a conservação da vida selvagem. Ao reunir profissionais de turismo, especialistas em conservação, formuladores de políticas, filantropos, académicos e empreendedores, a conferência busca compartilhar lições e as melhores práticas de empreendimentos de ecoturismo em todo o mundo.', N'Evento1812020101750_1.jpg', 2, N'Conselho Municipal', 0, 0, 0)
SET IDENTITY_INSERT [dbo].[evento] OFF
SET IDENTITY_INSERT [dbo].[farmacia] ON 

INSERT [dbo].[farmacia] ([id], [id_distrito], [nome], [bairro], [descricao], [telefone], [foto_capa], [inactivo], [email], [data_cadastro]) VALUES (1, 2, N'Farmácia Popular', N'Ave Josina Machel, Quelimane', N'teste', N'258842338251', N'Farmacia1812020103613_1.JPG', 0, N'farmaciapopular@gmail.com', CAST(N'2020-01-18 10:36:06.720' AS DateTime))
SET IDENTITY_INSERT [dbo].[farmacia] OFF
SET IDENTITY_INSERT [dbo].[hospital] ON 

INSERT [dbo].[hospital] ([id], [id_distrito], [nome], [bairro], [data_cadastro], [descricao], [inactivo], [foto_capa]) VALUES (1, 2, N'Hospital Central de Quelimane', N'Avenida Marginal', CAST(N'2020-01-18 10:29:33.003' AS DateTime), N'A Província da Zambézia vai contar com o curso de medicina-geral a partir do ano 2020. Esta informação foi prestada por Manuel de Morais Director da delegação da UP de Quelimane segunda-feira a quando da aula introdutória do quarto ano do curso de medicina geral. Trata-se do curso que estava a ser ministrado na faculdade de ciências de saúde da Universidade Pedagógica Delegação da Maxixe, província de Inhambane.

Devido a falta de condições como de um hospital central para estagiar os futuros médicos, o curso foi retirado da Maxixe para Quelimane por reunir melhores condições como de um hospital de referência com capacidade recomendadas para o efeito tal como recomenda o novo curricula.

“A UP já tinha desenhado abertura de um curso de medicina em Quelimane. Quando se deu início a construção do hospital central tinha se decido que nós também iriamos abrir o curso de medicina mas por questões de organização interna, esse curso foi preterido e abrimos o curso em Inhambane" disse Manuel de Morais.', 0, N'hospital1812020102942_1.jpg')
SET IDENTITY_INSERT [dbo].[hospital] OFF
SET IDENTITY_INSERT [dbo].[obra_arte_imagem] ON 

INSERT [dbo].[obra_arte_imagem] ([id], [id_obra_arte], [caminho_imagem]) VALUES (1, 1, N'ImgObra1812020101016_1.jpg')
INSERT [dbo].[obra_arte_imagem] ([id], [id_obra_arte], [caminho_imagem]) VALUES (2, 2, N'ImgObra2112020103638_2.jpg')
SET IDENTITY_INSERT [dbo].[obra_arte_imagem] OFF
SET IDENTITY_INSERT [dbo].[pacote_subscricao] ON 

INSERT [dbo].[pacote_subscricao] ([id], [nome], [preco_por_mes], [activo]) VALUES (1, N'Basico', CAST(1200.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[pacote_subscricao] OFF
SET IDENTITY_INSERT [dbo].[item_pacote_subscricao] ON 

INSERT [dbo].[item_pacote_subscricao] ([id], [item_nome], [activo], [id_pacote_subscricao]) VALUES (1, N'Anuncios', 1, 1)
INSERT [dbo].[item_pacote_subscricao] ([id], [item_nome], [activo], [id_pacote_subscricao]) VALUES (2, N'cartaz', 1, 1)
SET IDENTITY_INSERT [dbo].[item_pacote_subscricao] OFF
SET IDENTITY_INSERT [dbo].[restaurante_foto] ON 

INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (1, N'ImgRest20122019172456_1.jpg', 1, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (2, N'ImgRest20122019172514_1.jpg', 1, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (3, N'ImgRest412020195318_2.jpg', 2, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (4, N'ImgRest412020195322_2.jpg', 2, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (5, N'ImgRest412020195326_2.jpg', 2, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (6, N'ImgRest412020195330_2.jpg', 2, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (7, N'ImgRest412020195333_2.JPG', 2, 1)
SET IDENTITY_INSERT [dbo].[restaurante_foto] OFF
SET IDENTITY_INSERT [dbo].[restaurante_classificacao] ON 

INSERT [dbo].[restaurante_classificacao] ([id], [id_restaurante], [classificacao], [usuario_nome], [usuario_email], [usuario_assunto], [comentario], [foto], [data_cadastro], [id_usuario]) VALUES (1, 1, 3, N'Augusto Pinto', N'jpires@mozsistemas.co.mz', N'teste', NULL, NULL, CAST(N'2019-12-28 10:23:50.203' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[restaurante_classificacao] OFF
SET IDENTITY_INSERT [dbo].[restaurante_comentario] ON 

INSERT [dbo].[restaurante_comentario] ([id], [id_restaurante], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (1, 1, NULL, CAST(N'2019-12-28 10:23:50.373' AS DateTime), 1, N'Boa Comida', N'Augusto Pinto', N'jpires@mozsistemas.co.mz', NULL)
SET IDENTITY_INSERT [dbo].[restaurante_comentario] OFF
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
SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] OFF
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
SET IDENTITY_INSERT [dbo].[empresa] ON 

INSERT [dbo].[empresa] ([id], [descricao], [telefone], [website], [email], [endereco], [seguranca], [como_pagar]) VALUES (1, N'O MUSSIKA é uma plataforma online (disponível em www.mussika.co.mz), criada pelo Centro de Estudos para o Desenvolvimento da Zambézia - CEPDZ, especialmente para permitir que os agentes económicos da província da Zambézia, possam de forma muito fácil e rápida, expandir os seus negócios na medida em que estes interagem com seus parceiros, fornecedores e clientes a velocidade de um simples clique.

Este portal preocupa-se também em divulgar ao mundo as actividades sociais, os grandes projectos desenvolvidos na província por empresas privadas e do estado. A plataforma é também o espaço ideal para que pequenos empreendedores divulguem os seus negócios e criem vínculos com potenciais clientes e investidores. O Mussika engloba toda a riqueza da província, permitindo assim que qualquer um em qualquer parte do mundo, que tenha acesso ao aplicativo, se delicie da cultura, turismo e gastronomia zambeziana. Através deste aplicativo já é possível ter acesso as potencialidades e solicitar serviços online de turismo, gastronomia, arte e cultura e até transportes nos 22 Distritos da Província da Zambézia. O maior diferencial do Mussika é o elevado grau de interactividade que o mesmo oferecera aos seus utilizadores, funcionalidades como pesquisar um Hotel, Restaurante, um fornecedor um serviço, criação de anúncios de vagas de emprego e triagem de candidatos (por parte das empresas), criação e actualização de portfolios em tempo real, promoção e divulgação de produtos e serviços e muito mais.', N'873 2000 32', N'www.mussika.co.mz', N'info@mussika.co.mz', N'Sediada na avenida Julius Nyerere casa no 470 bairro Aquima com Nuit 700142698 - Cidade de Quelimane', N'Empresa Robusta', N'muito facil, ate pelo empesa')
SET IDENTITY_INSERT [dbo].[empresa] OFF
