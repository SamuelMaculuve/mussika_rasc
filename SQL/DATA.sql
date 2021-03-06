USE [mussikac_bd]
GO
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
SET IDENTITY_INSERT [dbo].[distrito] ON 

INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (2, NULL, N'Quelimane', N'Perfil20122019171137_2.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60761.555211617015!2d36.86892522204015!3d-17.85750772630134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d2f3924aa45035%3A0x301df4b81c5c9fac!2sQuelimane!5e0!3m2!1spt-PT!2smz!4v1576670511227!5m2!1spt-PT!2smz', N'                                                                                                                Quelimane e um distrito de teste
                        
                        
                        
                        ', 0, N'193.343', N'117 km', NULL, NULL, 0)
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
SET IDENTITY_INSERT [dbo].[acomodacao_tipo] ON 

INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1, N'PENSAO')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (2, N'HOTEL')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (3, N'LODGE')
INSERT [dbo].[acomodacao_tipo] ([id], [tipo]) VALUES (1002, N'PENSAO')
SET IDENTITY_INSERT [dbo].[acomodacao_tipo] OFF
SET IDENTITY_INSERT [dbo].[acomodacao] ON 

INSERT [dbo].[acomodacao] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_acomodacao_tipo], [id_distrito], [Inactivo]) VALUES (1, N'Hilton Lake Como', N'Via Borgo Vico 241 , 22100 Como, Italy', N'842338251', N'jpires@mozsistemas.co.mz', N'Featuring a rooftop infinity pool, Hilton Lake Como offers accommodation a 10-minute walk from the shores of Lake Como. Guests can enjoy the Terrazza 241 rooftop restaurant and bar, the Satin restaurant and the Taffeta lobby bar.

Featuring stylish features, rooms have wooden floor and a LCD TV. Some units also feature a lake-view terrace or a spa bath.

The Eforea spa & health club boasts an indoor pool, a Finnish sauna, hot tub and Turkish bath. A fitness centre and a solarium are also available.

Como town centre is a 15-minute walk from Hilton Lake Como. Villa Olmo is 500 m away.

Couples particularly like the location — they rated it 8.6 for a two-person trip.

We speak your language!
            ', N'Perfil20122019165950_1.jpg', N'www.booking.com/hotel/it/hilton-lake-como', N'indisponivel', 2, 2, 0)
SET IDENTITY_INSERT [dbo].[acomodacao] OFF
SET IDENTITY_INSERT [dbo].[usuario_tipo] ON 

INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (1, N'NORMAL')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (2, N'ADMINISTRADOR')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (3, N'SUPER ADMINISTRADOR')
SET IDENTITY_INSERT [dbo].[usuario_tipo] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone]) VALUES (1, N'Aministrador', N'admin@mussika.co.mz', N'hjaXldGSJhaiisXuEHM6gJga31QYwcss0We71W0ysY4oFcVKHSS4bnLAro6Q8zfBLcusb91OMQjxVjMbSWGiuY7ik8I1ZSreaM4+reZjzh0S1+r3X8BlYndnrISn6xyE', 1, CAST(N'2019-12-18 13:46:04.437' AS DateTime), NULL, 1, NULL, 3, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone]) VALUES (16, N'Isumbane', N'inaciojrsumbane@gmail.com', N'NZPG7XR8rOVwwwXB2oLXRNVnxpAMztKc6a/f8CgEpPi8KOfYkXRUhXsC1fTNPDZEzc6lDSuKLzwxmzD+ikJVHlkWaIYIqOTB66PA7PXSya+vP3xQMu1dKg2yW3gFAS15', 1, CAST(N'2019-12-29 01:29:52.920' AS DateTime), N'744351', 1, NULL, 1, N'258848631601')
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone]) VALUES (18, N'Ernesto Alide', N'junior.alide007@gmail.com', N'b7EMf5sIwar1ipsPr9puqPOSTMab1MhRpYJ1G5UopNwQPFYGzKElS82Db6RpCM4x2Brv4c0jQPUKPbH+UiV38lOxS0ljoRyBueSEVtaQzq7ptrNglP/cUrlnBV9Qjpoa', 1, CAST(N'2019-12-29 01:58:36.433' AS DateTime), N'630510', 1, NULL, 1, N'258842338251')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
SET IDENTITY_INSERT [dbo].[restaurante_tipo] ON 

INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (1, N'Comida Rapida')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (2, N'Pizza')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (3, N'Pastelaria')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (4, N'Mexicana')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (5, N'Chinesa')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (6, N'Italiana')
INSERT [dbo].[restaurante_tipo] ([id], [tipo]) VALUES (7, N'MEXICANA')
SET IDENTITY_INSERT [dbo].[restaurante_tipo] OFF
SET IDENTITY_INSERT [dbo].[restaurante] ON 

INSERT [dbo].[restaurante] ([id], [nome], [endereco], [telefone], [email], [descricao], [foto_capa], [website], [mapa], [id_restaurante_tipo], [id_distrito], [activo]) VALUES (1, N'Restaurante Quinta do Nico', N'Avenida Marginal', N'84 270 1311', N'jpires@mozsistemas.co.mz', N'Temos pratos do dia, e comida zambeziana', N'perfil20122019172450_1.jpg', N'www.quintanico.co.mz', N'<iframe src="https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d3923357.695097542!2d36.495665681207264!3d-16.19965723313339!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e6!4m3!3m2!1d-14.543998799999999!2d40.6770132!4m5!1s0x18d2f392e4d04219%3A0xcfc846a734eb29d9!2srestaurante%20cidade%20de%20quelimane!3m2!1d-17.8790571!2d36.8915759!5e0!3m2!1spt-PT!2smz!4v1576855237648!5m2!1spt-PT!2smz', 1, 2, 1)
SET IDENTITY_INSERT [dbo].[restaurante] OFF
SET IDENTITY_INSERT [dbo].[taxi] ON 

INSERT [dbo].[taxi] ([id], [nome], [praca_fixa], [bairro], [condutor], [proprietario], [matricula], [marca], [cor], [telefone], [email], [id_distrito], [foto_capa], [Inactivo]) VALUES (1, N'Taxi Mauricio', N'Quelimane', NULL, N'Mauricio', NULL, N'025MP', N'Toyota', N'preto', N'841524722', NULL, 2, N'noimage.png', 0)
SET IDENTITY_INSERT [dbo].[taxi] OFF
SET IDENTITY_INSERT [dbo].[restaurante_classificacao] ON 

INSERT [dbo].[restaurante_classificacao] ([id], [id_restaurante], [classificacao], [usuario_nome], [usuario_email], [usuario_assunto], [comentario], [foto], [data_cadastro], [id_usuario]) VALUES (1, 1, 3, N'Augusto Pinto', N'jpires@mozsistemas.co.mz', N'teste', NULL, NULL, CAST(N'2019-12-28 10:23:50.203' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[restaurante_classificacao] OFF
SET IDENTITY_INSERT [dbo].[restaurante_comentario] ON 

INSERT [dbo].[restaurante_comentario] ([id], [id_restaurante], [id_usuario], [data], [valido], [comentario], [nomeUsuario], [email], [assunto]) VALUES (1, 1, NULL, CAST(N'2019-12-28 10:23:50.373' AS DateTime), 1, N'Boa Comida', N'Augusto Pinto', N'jpires@mozsistemas.co.mz', NULL)
SET IDENTITY_INSERT [dbo].[restaurante_comentario] OFF
SET IDENTITY_INSERT [dbo].[restaurante_foto] ON 

INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (1, N'ImgRest20122019172456_1.jpg', 1, 1)
INSERT [dbo].[restaurante_foto] ([id], [caminho], [id_restaurante], [activo]) VALUES (2, N'ImgRest20122019172514_1.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[restaurante_foto] OFF
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
SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] ON 

INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (10, 16, CAST(N'2019-12-29 01:51:20.487' AS DateTime), 1, NULL, N'744351', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (11, 18, CAST(N'2019-12-29 02:01:57.767' AS DateTime), 1, NULL, N'630510', N'Autenticado')
SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_foto] ON 

INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (5, 1, N'ImgAcom201220191701_1.jpg')
INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (6, 1, N'ImgAcom201220191707_1.jpg')
INSERT [dbo].[acomodacao_foto] ([id], [id_acomodacao], [caminho]) VALUES (7, 1, N'ImgAcom2012201917012_1.jpg')
SET IDENTITY_INSERT [dbo].[acomodacao_foto] OFF
SET IDENTITY_INSERT [dbo].[acomodacao_quarto] ON 

INSERT [dbo].[acomodacao_quarto] ([id], [id_acomodacao], [descricao], [hospedes], [custo_diaria], [quantidade], [foto_capa], [chk_ac], [chk_parqueamento], [chk_televisao], [chk_geleira], [chk_wifi], [chk_minibar], [quarto_foto], [Inactivo], [observacoes]) VALUES (1, 1, N'EXCLUSIVO', 2, 5500.0000, 9, N'quarto18122019155712_1.jpg', 1, 1, 1, 0, 1, 1, NULL, 0, N'From the minute we arrived the staff were lovely and very helpful. Room beautiful with lovely views of the lake. Breakfast was fantastic and dinner in the Taffeta bar was very very nice.')
SET IDENTITY_INSERT [dbo].[acomodacao_quarto] OFF
