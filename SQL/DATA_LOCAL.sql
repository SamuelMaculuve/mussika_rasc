USE [mussika_bd]
GO
SET IDENTITY_INSERT [dbo].[acomodacao_tipo] ON 

INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1, N'PENSAO')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (2, N'HOTEL')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (3, N'LODGE')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1002, N'PENSAO')
SET IDENTITY_INSERT [dbo].[acomodacao_tipo] OFF
SET IDENTITY_INSERT [dbo].[distrito] ON 

INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (1, NULL, N'234234', N'noimage.png', N'234324234', N'Quelimane é a capital e a maior cidade da província da Zambézia, em Moçambique. Está localizada no rio dos Bons Sinais, a cerca de 20 km do Oceano Índico; por essa razão, a cidade conta com um porto, que é uma das suas principais actividades económicas, centro de uma importante indústria pesqueira.

Era um importante centro comercial suaíle quando os portugueses ali chegaram em 1498, mais especificamente Vasco da Gama na sua primeira viagem à Índia, mas a presença portuguesa permanente só foi registada a partir de 1544.[1] Foi elevada a vila e sede de concelho em 1763 e a cidade a 21 de Agosto de 1942.[2]

A cidade de Quelimane é administrativamente um município com um governo local eleito e também um distrito, que administra as competências do governo central.[3] Numa área de 117 km², a cidade tinha 150 116 habitantes em 1997. A população tinha ascendido a 185.000 habitantes em 2003, e o censo de 2007 registou 193.343 habitantes.', 0, N'234234', N'23432423', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (2, NULL, N'quelimane', N'Perfil18122019141159_2.jpg', N'werwerwerewrs', N'Quelimane é a capital e a maior cidade da província da Zambézia, em Moçambique. Está localizada no rio dos Bons Sinais, a cerca de 20 km do Oceano Índico; por essa razão, a cidade conta com um porto, que é uma das suas principais actividades económicas, centro de uma importante indústria pesqueira.

Era um importante centro comercial suaíle quando os portugueses ali chegaram em 1498, mais especificamente Vasco da Gama na sua primeira viagem à Índia, mas a presença portuguesa permanente só foi registada a partir de 1544.[1] Foi elevada a vila e sede de concelho em 1763 e a cidade a 21 de Agosto de 1942.[2]

A cidade de Quelimane é administrativamente um município com um governo local eleito e também um distrito, que administra as competências do governo central.[3] Numa área de 117 km², a cidade tinha 150 116 habitantes em 1997. A população tinha ascendido a 185.000 habitantes em 2003, e o censo de 2007 registou 193.343 habitantes.[4]

Qulimane está interligada ao território moçambicano por uma extensa rede de transportes, sendo que suas mais requisitadas vias de acesso são as rodoviárias, por intermédio da rodovia N10, de ligação com Nicoadala, ao noroeste; da rodovia N320, de ligação com Chinde, ao sul, e a praia de Zalala, ao norte, e; da rodovia R1119, de ligação com Mendozo e Magromane, no litoral.[6]

Anteriormente a sede municipal era ligada a Mocuba pelo Caminho de Ferro Transzambeziano, que utilizava o importante porto de Quilimane para escoamento de produtos agrícolas e semi-beneficiados.[7][8] O trafego no caminho de ferro está suspenso por falta de manutenção.

A cidade ainda conta com um aeródromo de voos domésticos, o aeroporto de Quelimane.[9]

A cidade de Quelimane sedia a Universidade Licungo (UniLicungo), uma das instituições de ensino superior públicas do país.[10] Também na cidade existe um campus da tradicional Universidade Eduardo Mondlane, onde funciona a Escola Superior de Ciências Marinhas e Costeiras, e; um campus do Instituto Superior de Ciências de Saúde.[11]', 0, N'43242', N'23432', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (3, NULL, N'Mocuba', N'noimage.png', N'adas', N'                            Quelimane é a capital e a maior cidade da província da Zambézia, em Moçambique. Está localizada no rio dos Bons Sinais, a cerca de 20 km do Oceano Índico; por essa razão, a cidade conta com um porto, que é uma das suas principais actividades económicas, centro de uma importante indústria pesqueira.

Era um importante centro comercial suaíle quando os portugueses ali chegaram em 1498, mais especificamente Vasco da Gama na sua primeira viagem à Índia, mas a presença portuguesa permanente só foi registada a partir de 1544.[1] Foi elevada a vila e sede de concelho em 1763 e a cidade a 21 de Agosto de 1942.[2]

A cidade de Quelimane é administrativamente um município com um governo local eleito e também um distrito, que administra as competências do governo central.[3] Numa área de 117 km², a cidade tinha 150 116 habitantes em 1997. A população tinha ascendido a 185.000 habitantes em 2003, e o censo de 2007 registou 193.343 habitantes.[4]
Qulimane está interligada ao território moçambicano por uma extensa rede de transportes, sendo que suas mais requisitadas vias de acesso são as rodoviárias, por intermédio da rodovia N10, de ligação com Nicoadala, ao noroeste; da rodovia N320, de ligação com Chinde, ao sul, e a praia de Zalala, ao norte, e; da rodovia R1119, de ligação com Mendozo e Magromane, no litoral.[6]

Anteriormente a sede municipal era ligada a Mocuba pelo Caminho de Ferro Transzambeziano, que utilizava o importante porto de Quilimane para escoamento de produtos agrícolas e semi-beneficiados.[7][8] O trafego no caminho de ferro está suspenso por falta de manutenção.

A cidade ainda conta com um aeródromo de voos domésticos, o aeroporto de Quelimane.[9]
                        ', 0, N'3534', N'344345', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[distrito] OFF
SET IDENTITY_INSERT [dbo].[acomodacao] ON 

INSERT [dbo].[acomodacao] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_acomodacao_tipo], [id_distrito], [Inactivo]) VALUES (1, N'HOTEL PENSILVANIA', N'Av. Eduardo Mondlane Nro1 . Nacala', N'842338251', N'jpires@mozsistemas.co.mz', N'Featuring a rooftop infinity pool, Hilton Lake Como offers accommodation a 10-minute walk from the shores of Lake Como. Guests can enjoy the Terrazza 241 rooftop restaurant and bar, the Satin restaurant and the Taffeta lobby bar. Featuring stylish features, rooms have wooden floor and a LCD TV. Some units also feature a lake-view terrace or a spa bath. The Eforea spa & health club boasts an indoor pool, a Finnish sauna, hot tub and Turkish bath. A fitness centre and a solarium are also available. Como town centre is a 15-minute walk from Hilton Lake Como. Villa Olmo is 500 m away. Couples particularly like the location — they rated it 8.6 for a two-person trip. We speak your language!', N'Perfil19122019132239_1.jpg', N'hotelpensilvania.co.mz', N'dfd', 2, 2, 0)
SET IDENTITY_INSERT [dbo].[acomodacao] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_foto] ON 

INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (1, 1, N'ImgAcom19122019132247_1.jpg')
INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (2, 1, N'ImgAcom19122019132248_1.jpg')
INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (3, 1, N'ImgAcom19122019132248_1.jpg')
INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (4, 1, N'ImgAcom19122019132247_1.jpg')
SET IDENTITY_INSERT [dbo].[acomodacao_foto] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_quarto] ON 

INSERT [dbo].[acomodacao_quarto] ([id], [id_acomodacao], [descricao], [hospedes], [custo_diaria], [quantidade], [foto_capa], [chk_ac], [chk_parqueamento], [chk_televisao], [chk_geleira], [chk_wifi], [chk_minibar], [quarto_foto], [Inactivo], [observacoes]) VALUES (1, 1, N'quarto vip', 0, 34.0000, 343, N'quarto19122019132335_1.jpg', 1, 0, 0, 1, 0, 0, NULL, 0, N'Featuring a rooftop infinity pool, Hilton Lake Como offers accommodation a 10-minute walk from the shores of Lake Como. Guests can enjoy the Terrazza 241 rooftop restaurant and bar, the Satin restaurant and the Taffeta lobby bar. Featuring stylish features, rooms have wooden floor and a LCD TV. Some units also feature a lake-view terrace or a spa bath. The Eforea spa & health club boasts an indoor pool, a Finnish sauna, hot tub and Turkish bath. A fitness centre and a solarium are also available. Como town centre is a 15-minute walk from Hilton Lake Como. Villa Olmo is 500 m away. Couples particularly like the location — they rated it 8.6 for a two-person trip. We speak your language!')
SET IDENTITY_INSERT [dbo].[acomodacao_quarto] OFF
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

INSERT [dbo].[artigo] ([id], [codigo], [id_categoria_artigo], [nome], [descricao], [marca_registada], [atracao_internacional], [preco_min], [preco_max], [preco_venda], [observacoes], [portofolio], [genero], [e_servico], [foto_capa], [id_distrito], [bairro], [clicks], [data_cadastro], [Inactivo]) VALUES (1, NULL, 2, N'playstation', N'sfdsfsd', 1, 1, 20.0000, 25.0000, 22.0000, NULL, N'sony.com', N'games', 0, N'Perfil19122019155347_1.jpg', 2, N'mucuti', NULL, CAST(N'2019-12-19 15:53:15.737' AS DateTime), 0)
INSERT [dbo].[artigo] ([id], [codigo], [id_categoria_artigo], [nome], [descricao], [marca_registada], [atracao_internacional], [preco_min], [preco_max], [preco_venda], [observacoes], [portofolio], [genero], [e_servico], [foto_capa], [id_distrito], [bairro], [clicks], [data_cadastro], [Inactivo]) VALUES (2, NULL, 2, N'Toyota Raum', N'Toyota em bom estado, compre ja, toda papeladda em dia', 1, 1, 225000.0000, 250000.0000, 240000.0000, NULL, N'toyota.co.mz', N'Viaturas', 0, N'Perfil20122019153629_2.jpg', 2, N'Bloco 1', NULL, CAST(N'2019-12-20 15:36:13.100' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[artigo] OFF
SET IDENTITY_INSERT [dbo].[artigo_imagem] ON 

INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (1, 1, N'ImgArtigo19122019155354_1.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (2, 1, N'ImgArtigo19122019155354_1.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (3, 1, N'ImgArtigo19122019155354_1.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (4, 2, N'ImgArtigo20122019153636_2.jpg')
INSERT [dbo].[artigo_imagem] ([id], [id_artigo], [caminho]) VALUES (5, 2, N'ImgArtigo20122019153645_2.jpg')
SET IDENTITY_INSERT [dbo].[artigo_imagem] OFF
SET IDENTITY_INSERT [dbo].[usuario_tipo] ON 

INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (1, N'NORMAL')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (2, N'ADMINISTRADOR')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (3, N'SUPER ADMINISTRADOR')
SET IDENTITY_INSERT [dbo].[usuario_tipo] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo]) VALUES (1, N'Aministrador', N'admin@mussika.co.mz', N'TrZfkDorZTfo7YZ7dSK2dWE54sarFgv27H1VvZzl4aTWel1JNcPZ4+ZU/pgFZxiL+ksshRY2jNNWzoWip8SDKsM/vShaOzHu//SY+hSPXgokPvBte3WmSY6ONvi3glTz', 1, CAST(N'2019-12-18 14:08:59.160' AS DateTime), NULL, 1, NULL, 3)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo]) VALUES (2, N'Júnior Pires Alide', N'2443042385780655@mussika.co.mz', N'ndOZgwsqwPxDJnxrFpV947Qdb1Ee6xj8NzPXC0Rqr8vGFblrp6bh6cRk5+OuM7vbjs7/f/tLQUDNvDQQHC5pKhl94/wBldxeX5wuOhRw6eWOO6+kPyuEeZWBAdkWV+K3', 1, CAST(N'2019-12-19 12:48:37.157' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo]) VALUES (3, N'jpires@mussika.co.mz', N'jpires@mussika.co.mz', N'IOMWvrqEXxz3mpeayP03333nED9u6qgpiHB/2/Osier4MYxYMAF4xBtxTe30o+w3VNL3m57WkaHAMTuDJn2CXgyrC0BvxMX6gVfs1uXCwuoEF+DSv+FpN19fmkgEqMix', 1, CAST(N'2019-12-20 15:33:29.353' AS DateTime), NULL, 1, NULL, 3)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[distrito_comentario] ON 

INSERT [dbo].[distrito_comentario] ([id], [id_distrito], [id_usuario], [comentario], [data], [valido], [nomeUsuario], [email], [assunto]) VALUES (1, 1, 2, N'lindo', CAST(N'2019-12-23 14:26:35.287' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[distrito_comentario] ([id], [id_distrito], [id_usuario], [comentario], [data], [valido], [nomeUsuario], [email], [assunto]) VALUES (2, 1, 2, N'feio', CAST(N'2019-12-23 14:30:01.720' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[distrito_comentario] ([id], [id_distrito], [id_usuario], [comentario], [data], [valido], [nomeUsuario], [email], [assunto]) VALUES (3, 1, NULL, N'muito grande, porem lindo!', CAST(N'2019-12-23 14:31:55.420' AS DateTime), 1, N'Ernesto junior pires alide', N'junior.alide007@gmail.com', NULL)
INSERT [dbo].[distrito_comentario] ([id], [id_distrito], [id_usuario], [comentario], [data], [valido], [nomeUsuario], [email], [assunto]) VALUES (4, 1, NULL, N'muito grande, porem lindo!', CAST(N'2019-12-23 14:32:32.177' AS DateTime), 1, N'Ernesto junior pires alide', N'junior.alide007@gmail.com', NULL)
INSERT [dbo].[distrito_comentario] ([id], [id_distrito], [id_usuario], [comentario], [data], [valido], [nomeUsuario], [email], [assunto]) VALUES (5, 1, NULL, N'teste', CAST(N'2019-12-23 14:34:29.597' AS DateTime), 1, N'anibal da costa', N'acosta@gmail.com', NULL)
INSERT [dbo].[distrito_comentario] ([id], [id_distrito], [id_usuario], [comentario], [data], [valido], [nomeUsuario], [email], [assunto]) VALUES (6, 1, NULL, N'ja estive, muito lindo', CAST(N'2019-12-23 16:27:34.280' AS DateTime), 1, N'Paulo Vilanculo', N'pvilanculo@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[distrito_comentario] OFF
SET IDENTITY_INSERT [dbo].[distrito_classificacao] ON 

INSERT [dbo].[distrito_classificacao] ([id], [id_distrito], [id_usuario], [e_like], [data_cadastro], [activo], [nomeUsuario], [email], [assunto], [estrelas]) VALUES (1, 1, 2, 0, CAST(N'2019-12-23 14:26:02.420' AS DateTime), 1, NULL, NULL, NULL, 4)
INSERT [dbo].[distrito_classificacao] ([id], [id_distrito], [id_usuario], [e_like], [data_cadastro], [activo], [nomeUsuario], [email], [assunto], [estrelas]) VALUES (2, 1, NULL, 0, CAST(N'2019-12-23 14:32:26.197' AS DateTime), 1, N'Ernesto junior pires alide', N'junior.alide007@gmail.com', NULL, 5)
SET IDENTITY_INSERT [dbo].[distrito_classificacao] OFF
SET IDENTITY_INSERT [dbo].[distrito_foto] ON 

INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (1, 2, N'ImgDistrito1812201914127_2.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (2, 2, N'ImgDistrito18122019141210_2.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (3, 2, N'ImgDistrito18122019141213_2.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (14, 3, N'ImgDistrito18122019163139_3.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (16, 3, N'ImgDistrito18122019163156_3.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (19, 3, N'ImgDistrito18122019163318_3.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (20, 3, N'ImgDistrito18122019163327_3.jpg')
INSERT [dbo].[distrito_foto] ([id], [id_distrito], [caminho]) VALUES (21, 3, N'ImgDistrito18122019163331_3.jpg')
SET IDENTITY_INSERT [dbo].[distrito_foto] OFF
SET IDENTITY_INSERT [dbo].[restaurante_tipo] ON 

INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (1, N'Comida Rapida')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (2, N'Pizza')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (3, N'Pastelaria')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (4, N'Mexicana')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (5, N'Chinesa')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (6, N'Italiana')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (7, N'MEXICANA')
SET IDENTITY_INSERT [dbo].[restaurante_tipo] OFF
SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] ON 

INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (1, 3, CAST(N'2019-12-20 15:34:27.430' AS DateTime), 1, NULL, NULL, N'Autenticado')
SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] OFF
