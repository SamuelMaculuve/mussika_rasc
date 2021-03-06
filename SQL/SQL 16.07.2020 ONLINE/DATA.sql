USE [mussikac_bd]
GO
SET IDENTITY_INSERT [dbo].[usuario_tipo] ON 

INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (1, N'NORMAL')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (2, N'ADMINISTRADOR')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (3, N'SUPER ADMINISTRADOR')
INSERT [dbo].[usuario_tipo] ([id], [tipo]) VALUES (4, N'PROVEDOR')
SET IDENTITY_INSERT [dbo].[usuario_tipo] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (1, N'Aministrador', N'admin@mussika.co.mz', N'hjaXldGSJhaiisXuEHM6gJga31QYwcss0We71W0ysY4oFcVKHSS4bnLAro6Q8zfBLcusb91OMQjxVjMbSWGiuY7ik8I1ZSreaM4+reZjzh0S1+r3X8BlYndnrISn6xyE', 1, CAST(N'2019-12-18 13:46:04.437' AS DateTime), NULL, 1, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (19, N'Júnior Pires Alide', N'2443042385780655@mussika.co.mz', N'tgmREXnZQtLOPxXnNlynJLoIpjSCHd1lVu5Zb8EQo9LrEXHyl9fHTDIAY5Ws4kYul0uwyvJQ3aql1hkqqL7N4lvIM6IBupq5T+BY2zAIEBeGwkNgWmmOkuxNJD+uvXHz', 1, CAST(N'2019-12-30 18:58:29.443' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (20, N'junior pires', N'118177461552061077467@mussika.co.mz', N'3jzWgbchzXV9FV3BHGSIEHKHGGRSJzqbRXiojpGNADq0CYiT4iu9wn0RHqoE4c7WdsAV60DS+9+2vwseU9xIjolMwGN9QssIKbGv6dMPEAS0YErO+AOCH5tugHt8pTJ/', 1, CAST(N'2020-01-03 01:49:10.543' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (22, N'Junior Braz', N'1444361629073788@mussika.co.mz', N'DqH2O37g3qqrwSvMWTmn7tACrdZ2iJkGHIvfeqpZZYiS45aw7+gPbukPa50XMv/Cf1ZfAenm3M6Qi0+h3nXGoLF8Ly3W4ZnOgYxl10Sw1V5VgfB5h4Aqi2uAVdN9Pvjk', 1, CAST(N'2020-01-07 16:43:13.083' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (33, N'jpires', N'jpires@mozsistemas.co.mz', N'iSY58NbG1aPPqif3APqjQ2Gk1afQ7SFhO5ATqUwCqYqJXJgWL6ksxBheSw9WFbydupAlm+BDs7610nrVeZlz85OfLCVSBC5b12RwXwdo2Fn9YCtK0jAOV13Wcv1HIZ25', 1, CAST(N'2020-01-11 10:38:58.380' AS DateTime), N'315036', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (34, N'Afane Eduardo Momade', N'clivafan@gmail.com', N'LirgKfJffw5VkcobphcGuglZ366uLKd4HBpnnrKj4A2MFoAg3usMSzidmyl8C5hIvKUO/hdrlrN7LwIOlxkxWSOinhiFpLXW5V3BLNg7bCmMeTIxg7GxnVRyjqddhnrF', 1, CAST(N'2020-01-12 20:45:28.473' AS DateTime), N'078473', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (35, N'Nando Zacarias Vontade Bernardo', N'nazvobe.jr@gmail.com', N'pEVIz3Tre7sUatx5A4zYUquViLIoOCatKwph8zTJE84By83WgwsiL21xC7nkoqULr30154EcV05C15o6p7ioXi1bw9coNv+t62LI/bF1ZvlLVH2Xz/eCraoPvGKSMMXw', 0, CAST(N'2020-01-15 08:47:47.123' AS DateTime), N'924378', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (36, N'Aldes', N'Aldescarlos007@gmail.com', N'MO3fCqZeDilXjqd+lMiOI9L+r1kB8IIqt8Ff+0Ctb2//iW8TBfir9t2hfy6ir1QH+3wDcwSptlShherG56eZepsh12Y4/DdQqLJsTs/Zs/VNCd3HY4CYZsh3VLa9a4oe', 1, CAST(N'2020-01-19 08:13:49.707' AS DateTime), N'786798', 1, NULL, 1, N'861062910', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (37, N'Maússe', N'quilasmausse@gmail.com', N'vFECges57miBXrUYRMTf+zr+7N95NVkMES0P9TBzVBSrmzbdKld/w0yHhON/Oa5pOzVIRNc1hTfZYv2d+zNpJwxLwdez/j5l8HR6q23zg3UlSVVGtJ8udoNplCRn7gwW', 1, CAST(N'2020-01-19 11:57:24.477' AS DateTime), N'716074', 1, NULL, 1, N'+258870486262', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (38, N'Quisito Alface', N'qalface@gmail.com', N'VHPL33AqsXxywwqr0QjRW3nstp7R4k94C5UJh5295L9Ug2aHbYF5CINgFyckll/uqQCKxyOqo8FyhV2X0GSjZX9kpI6jp/oAB/HtmQYM0KRFavM0NqSwNurY20CAxxnM', 0, CAST(N'2020-01-20 18:15:06.167' AS DateTime), N'110848', 0, NULL, 1, N'847160755', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (39, N'cpc', N'cpc.quel@gmail.com', N'96S9h1hsVWkOpLzUH8Ck9eW4sTwgAae9AUIpefdl+Ifoy05fyAEuowYKoSWsSD8LihyPhKK3moRBSLdKNCeLwXqAqwCu7Q7kDo0F1Z2ldZ/k39ygdbXhM241TABqiDrV', 0, CAST(N'2020-01-21 10:13:00.183' AS DateTime), N'230245', 0, NULL, 1, N'844125221', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (40, N'Salvador', N'slvdrelias@gmail.com', N'vHHp5NJH/Y1iIZXCcNqAjXOkkMsZBU2K+jX1fj+ULX6rLXeLhPACBgNsU33+gxTPiKSPQo8hudfOmL4PZXcAjKKDKsMMEqrR6+cm3QGJr8HATg80Wx4Qy1tZxNPvuCKq', 1, CAST(N'2020-01-22 23:44:05.690' AS DateTime), N'898071', 1, NULL, 1, N'258870735782', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (41, N'Salvador Elias Moiane', N'102737956361126933681@mussika.co.mz', N'dqpJrGLlrHY2U243s4o6WeiSo8RhEUfcNvqeQg/DiFyI5xk9krPhAWI11ImwwE86aXZTiksf6D+QiOCTCvUJvsYqPq7xSIHHqAWozLaO/CTAYRVzCtSgsju3CrJ3KvhM', 1, CAST(N'2020-01-25 04:46:54.353' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (42, N'Inácio Sumbane', N'3515927785144082@mussika.co.mz', N'ZoE5tylV6Izwnnm6I5mbjIyixOu8ptNuq4G7F4izZMlhFbjL3g3ScjFtM6wMrg1PQGpqr7+tukYhCO/GLSeCzY5ABavrL0tSBk7xfP9F6QImzhXnOx9HITUGbXNLvQxH', 1, CAST(N'2020-03-03 15:09:17.717' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (43, N'Ernesto Júnior Pires Alide', N'junior.alide007@gmail.com', N'NQ8s5Mvt7i/JAayiEC4JESeqTJbNKVm3RamHZZGbpAn8c5cSik4Gljta010vPFFVqQEBkd4rGpCxHzqWDPKyfIJk96vCWTWoJq8VapKoRfuFHkYpQIiqGFOaca+EWlrK', 1, CAST(N'2020-03-12 16:43:48.433' AS DateTime), N'752392', 0, NULL, 1, N'(+258)842-338-251', NULL, N'usuario43110520200020FB_IMG_1589025119434.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (44, N'Inácio Sumbane', N'inaciojrsumbane@gmail.com', N'Q0pqGQJV8dJvZaowQLyMvWZ+8t7gQqfoKEL48RcWXF71HdWqOa/5L82gV4SDupUwTDG8GjKlsiS5zm7ZaE3Y0lQ5aes7l6KaDH5e6molfHI4FeEQSfZA9fFDoAsS4nrj', 1, CAST(N'2020-03-19 10:09:43.257' AS DateTime), N'470153', 1, NULL, 1, N'(+258)486-316-01', NULL, N'usuario4409052020115523334024_1004280643045121_5024797573559815332_o.png', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (45, N'Paulo António Bonde ', N'bondepauloantonio@gmail.com', N'V9LeiNVvCIm890r/vsKxPCdgakrgPKDTECt8RnKH/UVjCfB8KHi1ztXyo89obyd+UGIHhEeJDiiw8qLmSmf2bQkPg3nAi/UpbFTeq2ueS5xmdulDR2zdtzdFabRWLcvf', 1, CAST(N'2020-03-26 19:18:06.203' AS DateTime), N'477934', 1, NULL, 1, N'861063201', NULL, N'usuario45260320202005FB_IMG_1584387786157.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (46, N'Arcanjo Eduardo Pinto', N'arcapinto@gmail.com', N'Qb3C4ilqNzbaj0MjskpvQbpYtbhj3DMGPE9gK3VG3TjUIu1rKnbl81C113GjDUYwC8eXT2EqXUdZ8xOP5ZHFF2CNV9GvIgRzN/qcWMk93z0ShgGk3SKvgvuIFG+ERWqc', 1, CAST(N'2020-03-26 20:27:44.787' AS DateTime), N'545294', 1, NULL, 1, N'258 861594876', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (47, N'Cesaria Moniz da Sailva Cossoma', N'cesariacossoma@gmail.com', N'kM2FfXPFVcIMj//vo74JfPNDje2WH7DGQmUOuThXsKiTqv/7vDUX1C4/c6Hagi9GUVeF5ZJSJWkCJmqq0Zk6oR4GIoFt7rcdt4pc0+8F0KbBnwVo1DJ5ko2jxoYEvo4b', 1, CAST(N'2020-03-27 08:04:38.043' AS DateTime), N'479084', 1, NULL, 1, N'876954719', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (48, N'Cesaria Cossoma', N'106690270601490199850@mussika.co.mz', N'p+TeM2IL/i5rCbPG0/+3cVrZmWRfnfoHuiArLEBP/h0WUKQfFZnWetYg254iz3kq+2WIR3jE55Ntt4F936Yc8B9UwE/F3n4KmzaGWAeJX/t/p+rhpdXgT5vUZInu3iFu', 1, CAST(N'2020-03-27 08:06:33.977' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (49, N'Ângelo Fernando', N'angelofernandoheriquesashlerr@gmail.com', N'u3qhzbaxU/Ck4raCniIp83Mcbcpzym5e9eJDamsgsHgX/p/0NSuo8TudyCMeUwz5zuG9srNKyiZZ/ggSjFxDf1N/FgcqyRVvt/NWRjXuPFN+x0PeEzci1eKyX4TuPFSr', 1, CAST(N'2020-03-27 08:17:58.670' AS DateTime), N'030298', 1, NULL, 1, N'+258 845896567', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (50, N'Wil', N'wilsonmaia04@gmail.com', N'ttOHl4cCUzVAwKHz1dz9VbTK+Onc3EKpfcoJtxyRbzkJaC7DiiawiwQRZzFlOu6XSbb8Tx4dl4UCRZNFI6G4vcAyq0WFL8BARKwKFSPLcVPLM+zeJOvmfOYWd2gmsolh', 1, CAST(N'2020-03-27 11:40:59.347' AS DateTime), N'088902', 1, NULL, 1, N'258823201484', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (51, N'Amilcar Sabonete', N'amilcarsabonete@gmail.com', N'dMFQIhY10dklcp9ES5oV3xL/Ih3v2yE6i/J5Sty+F8e6bbcOlGne0zAb+A6VO7bivFNqR2a/q5iCeQjb2BNaWD8AnH7/30FFnwn/UqgOPzf2ej+dsZt13JGqe3z9iqcg', 1, CAST(N'2020-04-03 11:11:00.157' AS DateTime), N'592867', 1, NULL, 1, N'+258847151648', NULL, N'usuario51030420201138IMG_20200403_100121.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (52, N'domingostomo@gmail.com', N'domingostomo@gmail.com', N'0boAgy8p87DqxNmt6vxZe4vj3v4Ul9QrXwq5rG4CNWp4rSB/SNYJKQDtBMUFxZpHrwI9ppuJT8n9QuXtjeQ+WU4flqDrGQPx2SuDW9F3BoNVZEKe3mc13NIUTQ+F34fO', 1, CAST(N'2020-04-03 15:07:24.533' AS DateTime), N'855653', 1, NULL, 1, N'840272115', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (53, N'Leonor Tatcher Souchet', N'souchetleonor1@gamil.com', N'DRxioHTHWPogdvmJCvKSXTqZE3Bjnoa3dDfCEpAvIC1PIgzSV+eSRnDWuA2KkWHj2VHBauCjefHSSeAH042NGzOw5thysBT8ukjsXabZjzAy0BlMAcfTRMTLINdzR2zx', 0, CAST(N'2020-04-05 22:56:59.387' AS DateTime), N'325700', 0, NULL, 1, N'841918044', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (54, N'Leonor Tatcher Souchet', N'souchetleonor1@gmail.com', N'pAyICKv7GNIEbU4NEiAQS3WduFd36Smbjfq+41smgAfaROsDw5ugHYGIX5YFTRxWWI0FB4mX1dfIHBcz4e1AEkm9SsysDDiWGgJ+a5tGc3wCGjHU8SHv9AWBE54q77PM', 1, CAST(N'2020-04-05 23:32:44.033' AS DateTime), N'715142', 1, NULL, 1, N'841918044', NULL, N'usuario54080620202325FB_IMG_1584292485916.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (55, N'Pires alide', N'junior-pires007@live.com', N'5N+mIwZ+tcQZdue9IM0ncPPkXQhTOhq45aMkan7oaJaFu3LfZ1tQwFzwwSndS/x66oPZ3O/GmXO7FukgIJ6v+u+Eqyx6A0VyPDriz+6ud0aHiGYCXtX2jX7J9wlRtec3', 1, CAST(N'2020-04-11 01:45:23.540' AS DateTime), N'893995', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (56, N'Vicente Artur Malunga', N'116977490456882746555@mussika.co.mz', N'x0B5qHF3FuGPZpYy19DK4oG+ck5G4zy3Cjkkmxv8EpITwPi6OIIZDXYeoZXQWpY0kd17iiMQZv1H/8xeK6yljvv7LFW2Qx+e1UCtqvCr/P9HdKAoPAnc/9wkKaAImfHx', 1, CAST(N'2020-04-14 10:04:36.587' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (57, N'Nelson Valdez ', N'valdeznelson99@gmail.com', N'7Rzwmljvrug3hTwORBaokBm44zbwVU6eekFRbuWVtxI+8y8qvR3Y6YTFiWEna/wtPnaFDr4BEQL2UPqQZFXjPNh+Y6njirP/SG3LN7bCMNVYzW4G7McvP3aYnUe3BB0y', 1, CAST(N'2020-04-19 18:34:47.707' AS DateTime), N'246637', 1, NULL, 1, N'844136660', NULL, N'usuario57190420201857Foto passe.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (58, N'Helion Pires', N'115469487432470453921@mussika.co.mz', N'XCjgBxwbu8mhDLtRHA4FrjJqZNAiQeh7VAVAWTZlz6kETIzcwFLtv0iIRqYQIPi4fzXbLfKdNUQw8l1OShtPDYT3VWfGA2xk10qA+EeZ6xLg9HCMN08i/2HtkxymrkkS', 1, CAST(N'2020-04-19 22:29:53.177' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (59, N'Belito Cassamo', N'bcassamo@gmail.com', N'0ktRVjat7IJVaSkb10I6CAhZ6MH4VvwK0++d5DN5CcECQV9t/gFB7T6KsjuvV9SdEBSs6P1IWCAMcEcirBH/HAsCSa98aqYFZPXtajamny/SKIGbybyyxLIEXsenTG66', 1, CAST(N'2020-04-22 13:11:53.167' AS DateTime), N'909199', 1, NULL, 1, N'842303700', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (60, N'Márcio', N'moraismarcio4@gmail.com', N'XzZWBXUTmOVMCAUTV9v57k1kPn+Gf8IO44GQlSqP+woB657BqOtRft7SyEUaZoL3EXZ9KKfKeHoSuqEjOYj0qDNbz9hB3QCMpB+FVgJlYTxtMTPQ2lTrHoAQXLvEGTT7', 1, CAST(N'2020-04-22 15:40:21.547' AS DateTime), N'854899', 1, NULL, 1, N'868218250', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (61, N'Intavez Pedro Caetano', N'intavez2014@gmail.com', N'2McHIR4mtIlqfGjTD7YwDhgiOBHbrttacuSqw582+ourwsTkOgmW+Y9mYLFzvbLjNKbsx6JzugFMbfz5PTYBXAZf2Y1ivDNpScOvQvaPqXx7zzZjVpp6WpnaUyX8ANc6', 1, CAST(N'2020-04-23 11:00:10.713' AS DateTime), N'292895', 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (62, N'Mwuiri', N'alessandrofusari@yahoo.it', N'rSOcVlC20ia0lHR+qeO6ZbHBlDgMsQaDFD89b59Pw9sbbMGtcx6kl+pe0xmckhSrPAAwS3RSY6tUMg9vUT3lrKpaG9yPda8o8c+iv9sXZx1F2+iHYXpP0GjDje5FZ6Cd', 1, CAST(N'2020-04-23 18:51:49.157' AS DateTime), N'340827', 1, NULL, 1, N'827718724', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (63, N'Kay On Ferreira', N'2855614217853836@mussika.co.mz', N'CJcoT6ut1g1dmtivqdrzPj91C1IiFfji+Zf5tSpLZ1ooo5QRZ4c4zZswaowyPeNURQlYWs1ooshCPm3iEUMC9xLZaiE8i1UuJ/3UffgK3Laefkm9D6+5dWprjGyBet+T', 1, CAST(N'2020-04-23 21:12:02.217' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (64, N'mountsoche', N'ruijceita@gmail.com', N'fZkvQe5JSBCPC7J4ybxriroVvSfu3B7wQdonCiLGPYLpA1jKbVKVoCZzb+pcKnuF+Npv8mtKAUwNOhQnqx53WcU11suDVgsGtgoFwxT/qmVXSFVD5goQSI2Z2cq/Jh7N', 1, CAST(N'2020-04-23 21:24:27.953' AS DateTime), N'689682', 1, NULL, 1, N'258824242979', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (65, N'Lourenço Gany', N'Lourenco.Gany123@gmail.com', N'AU2DhQohSRITcMgRYjvYr5DIGI+ZTBMbTx/lOp/8e2SSIircAqEY/JYw73PUdDsDTRSqWujVCRiq2V+GPC49+O86YKdAt6YFIwoZSqrdBp4IFGJPO+uyjcCm3UXbJpNg', 1, CAST(N'2020-04-24 16:29:28.850' AS DateTime), N'054201', 1, NULL, 1, N'867096594', NULL, N'usuario652404202016331571825818791.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (66, N'Humberto Junior', N'rrplquel@gmail.com', N'46hA/r5hNB8HF+U6Ozg+pdRKAh7O+kUwPdrUfkpZ9Kv1xItAnWIk+870ypV1/Y0QKN5jvbJMHBLhric5nhb6NjGqPpWhBG/y121qORZNmibOiqe7CT/yveuYRiM/QwHs', 1, CAST(N'2020-04-24 19:07:23.893' AS DateTime), N'756248', 1, NULL, 1, N'258842620099', NULL, N'usuario66240420201910Inst-image-6.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (67, N'Remigio ', N'remigiotomo@gmail.com', N'V2TPWm/WREOpNV74tFCH3WgbWBUUjXxYzKC/NOxJDSREaDp7Nb6Clbyhbn2phBW1hsOt/gSLzlop5NlemjSvCGcF8wfOdQKAMmr4f96Q+S89i0b3XdLsfB3MxttCVOP9', 1, CAST(N'2020-04-25 17:22:17.640' AS DateTime), N'763734', 1, NULL, 1, N'+258864450000', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (68, N'Humberto Estevao Domingos', N'111208877726027145332@mussika.co.mz', N'+nQkLDERWUW72leAEqgBAqf90chOBBmglN0SGV6jmslqDrd4KmiPfML7gbNKjO/tI8HRlPtE0fUP13l+EF2GxuGyvikcuoCL2hOu2U6Mj54rGueYzE8zIfnIHbDz+UtL', 1, CAST(N'2020-04-27 11:05:15.807' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (69, N'Ali Aboobacar ', N'alysaldicos@yahoo.com.br', N'RIMU97fCFjAHZCqzARq4uSPQrpW3EO9RJ1VC3exrX4nz98Pvp4R7mso+nF37QRkC8zvugWOQl1sJNO3KgrNe0/baDrQtzyxp9xlx7I8DoWAi8Ub9oQumcmdPApfNFYit', 1, CAST(N'2020-04-27 12:51:09.517' AS DateTime), N'010726', 1, NULL, 1, N'842975770', NULL, N'usuario69270420201306IMG-20200427-WA0193.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (70, N' Nelson Samuquela ', N'nelsonsamuquela@gmail.com', N'YRLA7jx8QGwWTB6Wkit/rE08v7hr2T2EbQhYX884nG55Xq2TW8GE1vk9ajLHKxr+T1eMKtQHX8B26QXotBpdCkRRhB4lQV0h+MAcOzIzPvo0Yh/uYnypnKIZEpd1IZ/I', 1, CAST(N'2020-04-29 12:03:47.010' AS DateTime), N'457590', 1, NULL, 1, N'848006370', NULL, N'usuario7029042020121020200428_201244.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (71, N'Amin Daud', N'mahamadd@gmail.com', N'xNDbddcppgOuIh5LP4NQSkI44t9JF/69wzHmwGA6FzhXw5qhwJTpQ0gPcimPRJpoLKM6szOchWiG5XOzncu5Cmk1ylqXh11tQfbuE+G3jDD6AWSoZfHEeiHCi014hjb2', 1, CAST(N'2020-04-29 12:58:33.920' AS DateTime), N'753014', 1, NULL, NULL, N'', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (72, N'Adolfo Skipper', N'dji.gad.dg@gmail.com', N'bpjwWUdOYmE7x8rB2lGOYdoekxDLuySIbDQnvvDUSSwnXsSw/vffXRFLXmAQywEwbVkpoqhppkyYzKOHfnPBmX4l6TiImRJiIOBvGF+uGFdnkKRfl0xb0YTHkeCUDwJg', 0, CAST(N'2020-04-29 14:06:32.543' AS DateTime), N'001115', 0, NULL, 1, N'845278696', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (73, N'Bayake', N'brockmusik2@gmail.com', N'VAO8SOH+lxasvjDvBvkO3d/zxCu9h7CQIxHBUPP1OeMqNikCdWOz0M+bod1Yfd0mahWOJIe0sbm6ljd30uhxpzDOI5RxBHrOuB1BZGB6Vhc55bOzmEs1n3zqtpm4yfw2', 0, CAST(N'2020-04-29 14:08:32.077' AS DateTime), N'838038', 0, NULL, 1, N'+258849646827', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (74, N'Bayake', N'estefanynhipissa@gmail.com', N'0rCbunhtPUBWWSn0YuqSco6DRJ620q//4KOzch1ZLpENNroImhWaVOdoLYgQhfUEHARALFs/YG4XxlfrJ011cjnMrbocZiAQ1SYBcW8oQDFMFh+VYacVIy9n+sA8yUJ/', 1, CAST(N'2020-04-29 14:09:40.537' AS DateTime), N'094386', 1, NULL, 1, N'+258849646827', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (75, N'Gomes Adolfo Das cangas', N'114882340650485362128@mussika.co.mz', N'jxeIccAl2PpqcXzp39woXhmvfbCDrer2uiubQ8hrQbAIA0QWUz4nFsiG+fgsip64mAl6kvRaJZYr7sq4HXogsouxqHsltIdsGnJjvIfpm7cnDwhoxcDsqHvH21uwCzTo', 1, CAST(N'2020-04-29 14:16:49.807' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (76, N'Belmiro António Mariano', N'belmariano1@gmail.com', N'HM1/KscADJ52MVuy/bFbdHBZkSyBdplcb8u0QwWm7g0KBZailDsFiagevFxpPmHYAxyQVkOrS/a8dBzLbHqw2CfqTdtIJNarejazv4qLrkV3K5QX7TZGSQaeOzfJUJ5x', 1, CAST(N'2020-04-29 15:05:15.437' AS DateTime), N'922390', 1, NULL, 1, N'867004700', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (77, N'Donaldino', N'donaldinojose@gmail.com', N'wXTJNAPoOt9jvz3eokWgQDVbfY9jdSjkPcKfh54kVIoo1XjV3ZnA0NnzDgfGJ16ndS9Ttj0fIxMTOW6aPJrdcFESqbawWW1PLI1HGomZjjnDztCCnFvQZasWVuKIg9kn', 1, CAST(N'2020-04-29 15:14:59.020' AS DateTime), N'054726', 1, NULL, 1, N'847292797', NULL, N'usuario77290420201530IMG_20190820_164301.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (78, N'king_secuestro', N'abdulbacarmussamussa7@gmail.com', N'5sbdm/m+Y2tSv5uqeCwofGOGytarJQA9u9MNn//9O/wDN20OIJFmd9IoFuG4mRoevMs6r2ejG445nCK4FKh86TsLxELBSm6SX6ATG3PmE9vcPj5ybZqC4cpA28HtfcKG', 1, CAST(N'2020-04-29 16:55:25.750' AS DateTime), N'152893', 1, NULL, 1, N'849187470', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (79, N'Keneth Soares', N'soareskeneth@gmail.com', N'jUMhztLdFLSEhqOXzKNUJdYsYTE7G4GxcNSeLObt1d8ypyqpp3C2cwNW/yIQ1nN1Jdg9YAdRllCNR+MoQ5i7e1EC9+1PI9mMAo8C/QyzwgZw5dcdQw4UXf2Fblcfbn5/', 1, CAST(N'2020-04-29 21:53:45.857' AS DateTime), N'419276', 1, NULL, 1, N'258 848530913', NULL, N'usuario79290420202157Keneth Soares ft Az Khinera- Te Quero de Volta (Prod. Willgeorge).jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (80, N'Nelson Jorge', N'nelsonjorgeofficial.mz@gmail.com', N'KJHjZ75JehOI+gcNOXoIvlvdUKQMo3WMLu47UGhf7f4QXrskznAPRGhW2o29hX/O/WdFPj3hwM3u9Z33Mg4gN55gCrybGOo865x89mJclNvy4cQ2UBDfYNVAjnu+wXT/', 1, CAST(N'2020-04-29 21:58:41.327' AS DateTime), N'911292', 1, NULL, 1, N'+258848112421', NULL, N'usuario80300420201405Nelson Jorge - Oficial Perfil.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (81, N'Gennio', N'erdecastro0318@gmail.com', N'JBqdEEz4J83saYXpFGF2c+AC4OqSVy4ZzCTlCXrO0NYmCSzsfuBAbSqqri9L9z1kpbbIMYcTygA/fEv51UBTm1eFwNMNhgR0A+sSPxgEVKfPJ4WuFFay4vu/zTW96Pw3', 1, CAST(N'2020-04-29 22:03:11.700' AS DateTime), N'405753', 1, NULL, 1, N'+258852993739', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (82, N'Enywan Cognitivo', N'marcosnhampa@gmail.com', N'fQ0BBcfj39Z1aOorBudDVFRap9ZMC5eVmjEdt9qbDYitFvigvEIN9nFf9jWCqgR+kkAaAmXDqQQ9o5Gz476dMzuwCiJaPXovyL6FEdURglYxKcFXilDaBCYd8KBhUcrH', 1, CAST(N'2020-04-29 22:04:34.973' AS DateTime), N'139542', 1, NULL, 1, N'+258 842306595', NULL, N'usuario822904202022141PERFIL-N1-FACE.png', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (83, N'Sophisticated ', N'Azariasmaqueu77@gmail.com', N'q2CCAPmUddSC7dP9L152Fp9jA0MJ/LOWVNHD5+2MZBWbbVwnt+5T5i2yCgy2g+Y2vefmwN/f1kXa8RvQNFvFFuJ5xlDRmGZyxUxuY0RuJizWFl6wLgTX/Fn/bgoUDkNz', 1, CAST(N'2020-04-29 22:34:43.377' AS DateTime), N'066811', 1, NULL, 1, N'258846836523', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (84, N'Marcos Nhampa', N'116115846318766736960@mussika.co.mz', N'1s9P+3wgLfmIhRT9ow0XwczYmQFOgY4WZsZnFgP1jEmc4UNHOZQpFM2z9B9PhlAxt2b6DAThK8YgNhVvLQDU3O5FsUP+ZSERccSLG9n464rDw99JxGTY01zGIHRPs82O', 1, CAST(N'2020-04-29 23:21:27.727' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (85, N'Nelson Samuquela', N'116848137858847513622@mussika.co.mz', N'VliW/ZC2AD2UZCiZvQmIcV/OdIto3ypkfyOvl0lKp8Ra7ZsuMGdXBBeUwDm+EKdCY4DSm84jTG53ydN/UwrArjEY0LqU9wyB7gE4TUHPUKWOorY1+aE+5CxyarOLayUc', 1, CAST(N'2020-04-30 11:16:15.107' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (86, N'Sabas boy Govinho', N'Gsabasboy@gmail.com', N'K/wye4a7PTdOZr0C8Xn7a49Y8yQZMR3yHYj9OYG42WLKWR2TWf70JtuapCppivvbsp6UtgJNKe0wK+EvjbybUX2DnpKLJHPL8JElZ2sx9KzDVGWf+gEDiZsrSe2KiajJ', 0, CAST(N'2020-04-30 15:42:42.517' AS DateTime), N'806472', 0, NULL, 1, N'845720767', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (87, N'Ercio', N'derciojossefamuchanga@gmail.com', N'RIqNgPq98aORbbzI/24UzTbrwWdGTc27bMSTN6sTBMWoUJD1gk91ikBm0ZW/5r5IYT3rRC1RFR1kfrGTi541lXYjaqaN1YUPZ12o2b1VdVbaGGbOiLsjvK031L7t72so', 1, CAST(N'2020-05-01 00:05:42.067' AS DateTime), N'355044', 1, NULL, 1, N'+258842004554', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (88, N'Nelson Vilanculo', N'nelsonvilanculo.nv@gmail.com', N'AKb+tHBV0d6kKB16wZg2JZJSY+lWvP3QTOHS/Cds8SMCE5Qw+J46kmwzfL1EkXpRi43DOfmczsKfwNQHo5R3+/FpgHUPUo82g+K3kxJmUnfD/cNx0zKsBqt6rwt3Qwsr', 0, CAST(N'2020-05-02 14:37:02.990' AS DateTime), N'156844', 0, NULL, 1, N'+258847009499', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (89, N'Januário Muigueia', N'muigueiajanuariovictor@gmail.com', N'ZyrDVdJOpmpwDPVvUIQsCUVQPNJ0kdV9e6Eh3An9L3wZpiD4bBOYfjS1b2m/Y3iJZS4hm6rDyhniItCCWEsf70T1jUiBb3mMazeZdhH06jISvGFSTl8ZDVugTY1r29Mm', 1, CAST(N'2020-05-04 11:36:48.670' AS DateTime), N'518754', 1, NULL, 1, N'258 843713977', NULL, N'usuario89040520201144IMG-20190905-WA0006.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (90, N'Ildo Vasco', N'115912057384944819814@mussika.co.mz', N'mFS0cCBkc88RP9ONJCJkv6Sb4iYp47hfN0P7uRrP6xVvpzexgqR3o9+kahGaYun+xV1UMgZQByi+t5ZC+ghNvw4tHEW/qZZjU/Toc5ToCLgj5I1pJ/XZWwtZHuT30L4q', 1, CAST(N'2020-05-07 09:10:45.813' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (91, N'Tymóteo Francisco', N'155810825925835@mussika.co.mz', N'E7SZRIT30vIBxwjW/m8aBHFsuZcliOtqIQVNfuRdTlLqrAX/ByNmW39hF1q0ts84jR0GwWkRY5/FzTpUqQEjQs79ksARzkpOkUgAm9ylfjCzf7EqrWEdCh1E+uGfkkPG', 1, CAST(N'2020-05-07 19:04:38.213' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (92, N'Freddy', N'freddy.jamal655@gmail.com', N'extT96eoZ8KUHYxqSAYi5X+ldy3lRACb1D8zgSzsq8Qqjo9aT08FEiPpJkKNT+rVAYEeoX20t1kdd1k+PY+m16aPc0VdLKU32IDrbGIyMWDnsySg2rbq/SWe9IGWNy/x', 1, CAST(N'2020-05-09 18:03:55.850' AS DateTime), N'588172', 1, NULL, 1, N'847289417', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (93, N'erdna', N'erdnamanjate@gmail.com', N'OsB65JuKCeF96Yqcz9z2633IaQK25d4Jr4iuzg/NIyygrINYyMrPhpQxcWT8mVNIrlhfNcyUjyoO74bVyKpQgLyWiHciIyOiZg7Dc4q2FtJLJDVX8k4o+iZCUFs0wNvH', 0, CAST(N'2020-05-09 18:08:08.227' AS DateTime), N'460881', 0, NULL, 1, N'258847631890', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (94, N'Agostinho Manhicana', N'683991835507213@mussika.co.mz', N'rhx46afKfqgj8o+3pIWwWt3VN+5dqehbAM+DTSsKTXvt0rWLmnrsB24eDuK2+tyivaKJH3dThoN053nucDB6AeBZu1X/je+UadInGI/D1aDsjBumEWd+PRQsbXd7v76x', 1, CAST(N'2020-05-10 12:44:09.517' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (95, N'Maurício reis', N'mauricioreise@gmail.com', N'IAjFYvUbwpirNZQXxD/hzMzxyoKs0Fc2Gpco8q4HLOI/ZS7zx+xHmHwBZEb/ocWQ8m/Z4MXS75MuitlMPTKJhshntBlhHvDkTrB6aBkCR1p/ztwhFroGOYDEBF3AR9Rs', 1, CAST(N'2020-05-10 18:07:44.127' AS DateTime), N'984499', 1, NULL, 1, N'876097575', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (96, N'Barros Lucas Bazo', N'bazobarros84@gmail.com', N'iaXtty2lvYJ5AeXOvE+At//v22fEeMcTvLqdIeSXZNmU21wrpPSgchhZcHRB0Bf5s4ARHd9Xp5rx0jXVhsrm6DJjjrAdGHMV2ejQhriifTav1hWMlARw5wZG2X2bAFNh', 0, CAST(N'2020-05-12 12:47:56.560' AS DateTime), N'483337', 0, NULL, 1, N'+258843974784', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (97, N'Fidel Duarte', N'fpensaooo51@gmail.com', N'Xrljx+Kj5a/LqKeIXbFeJ+7ADNz8ZX/oP4fqshtB4+hWVoHv2EL23Gt+VxbRgEvRbr8mgtTY1T6OK0hTGcL0fJwYrk099lmMHq1towQPbc9rrnxo4PDt+5SULeHodXmE', 1, CAST(N'2020-05-12 14:47:55.977' AS DateTime), N'870872', 1, NULL, 1, N'258842314588', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (98, N'Jacinto J. Angelo Ernesto', N'110353556922613994850@mussika.co.mz', N'9NCzU+/e5AInd8BpQnTedCg8sKxlPID+IRtaqK5/3fi+yi40rykuTMFIKILQnHjA2TRyCjX5p5T+LOjyPOTQU0hibcDLIliHy0uXqdh1n1ujeUfhm1p2csRQ22U6bcFd', 1, CAST(N'2020-05-12 19:40:01.653' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (99, N'Bartiloide Ricardo Ernesto', N'barteloidericardocuaranhiua@gmail.com', N'1giYjLjCUrLdcikT6TEtU3OXk6iTQzumI1IIdHncAxLJxv7Z8VDGU1lJYmXpBkUdJxHE4nzLbOMgXVa5CfluTJIs738YzBtjwTITd1dTJwrN8qQkJjlmPGsDUmKHjBZ1', 1, CAST(N'2020-05-17 18:23:06.207' AS DateTime), N'113345', 1, NULL, 1, N'258844415224', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (100, N'04.0531.2018', N'Ussene026@gmail.com', N'yysja+ExdrFYunybLeDb0KJg91A6fY8KXcTmj+7lRj3378FlLaBq4Hsh8nBiqLulb8X6H5vZebuzI9ER1QSJfaVJjEEGJIEBgx661+Mf29svFwY08K1OvdU9yywh+4N5', 1, CAST(N'2020-05-18 03:10:17.233' AS DateTime), N'978937', 1, NULL, 1, N'+258846445220', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (101, N'Dream gays', N'Eliseuaruni@gmail.com', N'+gjUw+GhOq+cDm21GIKKPzzNVdce3I5Gr+kZWaByzQff9UTnASpp9mkTi1doI2Y3NG0E+hI2kFI7JJH1mqt/6eDeZJZyM4AlmJChLwhPOr4GONVnITpYxP9V55955jzJ', 0, CAST(N'2020-05-18 21:19:07.617' AS DateTime), N'897759', 0, NULL, 1, N'848692180', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (102, N'Leonor Tatcher Souchet', N'Leonorsouchet1@gmail.com', N'MyihvVka2ZzeGSF/X8XNjxuN4JFjmUk7pq0Ra4n4rccqiYgFvjV8OZpI/raprcSbXUClau5kbPz6VqGxbFy3Upb6OSzqkyEMwXl+HYUthGcceC8OoQmfpMY2ESijs+zQ', 0, CAST(N'2020-05-20 12:45:20.853' AS DateTime), N'799003', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (103, N'Leonor Tatcher Souchet', N'Leonorsouchet1@gmail.com', N'iH+ol8lTpdY1cBKSYxg9JcGBOahHcwXJxpfKCXOYt76iSQy06N1UJGyPnsEH6cnYo/+ucqDPnUZtSy32iGj/4g3Jye1Xww4UXQ9cTfIK0sKC3snfbAqXxrPuw5r0wOD5', 0, CAST(N'2020-05-20 12:45:20.853' AS DateTime), N'799003', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (104, N'Edmilson Ramos', N'3067205930031134@mussika.co.mz', N'bdf6Nv7ZIlXCYzq++CMB0pnAOAoeoqBtYWZOwMhSFAvW/ntStvmkJ/Ll+LyXBLEsI4dDOzy8yTDsjsOQr9GVseEjwxkIePZ32kPFwaTthk0erH7qhSUGAWrhjeW/4zN0', 1, CAST(N'2020-05-20 12:46:26.810' AS DateTime), NULL, 1, NULL, NULL, N'', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (105, N'Fluxos ímpios', N'medjessfluxoimpios@gmail.com', N'eReuOIJBX3jIozZHJSR+tLy+BQ7YtFPy6Fij53ZcNM5vUFsyIfIiO73nEE/uyU8cltCLDYw8LZK7aMfS3oUMtk8q8LbR7fH/tnKMTyhwx2jrctWThYqbgXFLu6chRtPz', 0, CAST(N'2020-05-21 09:38:10.247' AS DateTime), N'271858', 0, NULL, 1, N'+258849431417', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (106, N'Jeff', N'Jeftestb@gmail.com', N'C0ygRrLz/6xRpGljTgzxpaDrlhrAw7y7Fa+fZoL+yGKCJEGSZXXq797HZppzpmAvldT2SdXG2sF0hBSey+MnpEM9PVLOjIGV8eQg3kx+NPG63YnhFIKf4tpA5nOIwqK2', 1, CAST(N'2020-05-21 15:13:43.747' AS DateTime), N'195541', 1, NULL, 1, N'847324786', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (107, N'Silvano Mathe', N'silvanomathe@gmail.com', N'ZXiBH4fCY2vcZFAnlB0Au5FlVFpJHAodC3ErA51oE1wgT0QHAZxjvZEJYRe98jS8432Rs8oQiVKvHoJbmYr+miV64QQmc5pJmoIv6rU2CCYd1EcHrVRrBLXJ3HXIGHpm', 1, CAST(N'2020-05-21 15:19:03.270' AS DateTime), N'246779', 1, NULL, 1, N'+258847990200', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (108, N'Martins Manuel', N'martinsmanue98@gmail.com', N'1jSO8KKR/GSQsFeRX9xjr0KW5JNNcHOz0N1Fv/YbQkDvKxIyjHSX60UlnSikpwSJWBnqECImKThG6gMp4QwzMlXx8Q1Cq05NWxAPptdySZI4KXaSjgN5boV0+wJpo55w', 0, CAST(N'2020-05-21 15:29:12.143' AS DateTime), N'385457', 0, NULL, 1, N'+257863123477', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (109, N'José Leonardo', N'josemacieleonardo@gmail.com', N'l7xkg3cDOQnD6M7bQiAX3OYpbUAl1I57qdNcDytO8F5Xw4f4Vu7bXC6kstIsD31+CJeArVkVGAetEhGkBSOesW1prObt6SdcEfBLnjezdQ9ImJuF/o8kg1mSTdasu5wy', 1, CAST(N'2020-05-21 15:32:20.083' AS DateTime), N'431730', 1, NULL, 1, N'848150323', NULL, N'usuario10921052020154315900685400596239947910430136022.jpg', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (110, N'Nelson Esmael Ibraimo', N'nelson.v.orias@gmail.com', N'UXQ+3QFGQTDwdReCARxPcjbRpyQYMzTBl3YTukPbZI42PyaX6zt8b4jcO3B15Pf9fhJVX6miB6BEMpS2v8rAe9CHp09Jyi4QJ7yEOFXlsb8TrRS6oAe6LuBCHA0CApLv', 0, CAST(N'2020-05-21 19:44:49.113' AS DateTime), N'819545', 0, NULL, 1, N'842100950', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (111, N'Nelson Orias', N'114512839865055661985@mussika.co.mz', N'nlVpryn9WWMyDXPVV2ReqDO/TmJqB6T700Hzt+sOn2g0JV5jNl4VRbMERXJ+5l8mDD29Mbkrxqgyt2/DdDMQL11ZHWI80XjmEvwo/WF+axuyaC15qA6Sd3U/OtWssF1H', 1, CAST(N'2020-05-21 19:47:00.193' AS DateTime), NULL, 1, NULL, 1, N'842100950', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (112, N'Andre Naume', N'andrenaume@gmail.com', N'qISzZjxaGIP0q6sL5IS1z+iGuNJtgCTKImIQ/i8p79FfvuRzn6P43jYMyVwsrvS/YYDLyYbcmQd5FqynqjOa7XP+RhnMr97m9ohyEnzzaQyIYN5Hcf4rIi+VehxnsfKF', 1, CAST(N'2020-05-22 10:47:36.043' AS DateTime), N'764191', 1, NULL, 1, N'879618677', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (113, N'Mário ', N'mariocaetano177@gmail.com', N'3Y1V+RblbS1rTheCs9EfkrPqG3SxxABpeNeyJTZrdhRrVw/yL2YGGuTQJDWFZ5W3uvTGqQb5K7TjWYaGelNTKBEVgUmvveh+MdW99ZVCS935C6LR2xJwXbdr3+FvWuh8', 1, CAST(N'2020-05-22 13:41:30.013' AS DateTime), N'189277', 1, NULL, 1, N'258848748533', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (114, N'José ', N'josechacadepicardo26@gmail.com', N'CDnkEoRkAIDqRBcte88TJ5FImrbLgwcPqexeDG3IHD1h112qm5edoqKGulEv3L+b4RuGVDvQxpyCOLEOJkPt99T5anJ139gBfReAbz0kbzM9UYM2Blr38ykwG/TIR9Q1', 1, CAST(N'2020-05-22 13:43:36.657' AS DateTime), N'078727', 1, NULL, 1, N'+258843961615', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (115, N'euridice', N'euridicedasilva91@gmail.com', N'16DP1ZDLfgjU2pukE2trO0+/p3hIQ6TNx27tcYuTvO0GYpdThCL0FyLKx/OiPyU63qa/MYjhCKSVoycUyZjbO4JAALWNDtjjd7XfCp8wIiG0dZTWpmLWym10kotBjmus', 0, CAST(N'2020-05-22 13:45:06.900' AS DateTime), N'126953', 0, NULL, 1, N'258849401820', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (116, N'Murilas', N'murilajaime@hotmail.com', N'lyQKwiP+Z7baOS8ZLGnI40Wfa4HWpTr2A1lK5D1T3t5R5WWmtBXBL4UvvbHzuacdfap1coQSaWQUnZ/loUiz1XedrCOq50nlEgFecGuYhtJoxMGogqt1y5ISFy6kGbUn', 1, CAST(N'2020-05-25 12:54:02.047' AS DateTime), N'481661', 1, NULL, 1, N'258848383817', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (117, N'Murilas', N'murilajaime@gmail.com', N'cA2c7F/2XEnZuAwf0z4d8dphIN6clcVWkV7DRLTvtrJRObM5u2wpbRPibsm471KV9YcIu5qWOi3Y5qsopoKwhzdi/m1SqqICD41HVwxuvyNNVqVoZ9cFZLkAsGY3HiKU', 1, CAST(N'2020-05-25 12:54:38.623' AS DateTime), N'343660', 1, NULL, 1, N'+258848383817', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (118, N'ussenedev', N'ussenedev@gmail.com', N'13ngCEH6On08IwDpa09lCvRSQCyfPg+4erjQHWHiV5rYcBmbNSSW8PUH7bNnx20/LjKOqMBW37kzsdgsoCI0oL2f7UtKEuDWr/Ur83vovXwM1n5m8rRlOjCU/Ur/yHQ2', 1, CAST(N'2020-05-26 08:27:21.530' AS DateTime), N'067283', 1, NULL, 1, N'+258846445220', NULL, N'usuario118260520200841santosussene3.png', NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (119, N'Delto Zacarias António', N'deltozacariasantonio22@gmail.com', N'LLdrAZAxCSY8Sg40zoWMeJhy3AXb5lMR7cy8viZaOfmlxPv49QVk14aTgFa5IUwysKv3QFBO0731A1HwZF1JNC6sVAYl4dpWzqPXl8CJ8yiQ8YRXPBndSSew6uaFE5zS', 1, CAST(N'2020-05-28 21:17:29.253' AS DateTime), N'426587', 1, NULL, 1, N'+25887791232', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (120, N'Taro Eugénio', N'3104814679581245@mussika.co.mz', N'kSgtAOhVxel3E4DsGkJ/WBYjWGb0PrtTpmMCcuH/Wf7qw3g/k/7kBTIl5u6R3QeQ1N2VH+wnOxv/uwRi75xevTZUA33Tbi1OzpjQ54M6k4f86HRcdVzsjhr1cSBgoK++', 1, CAST(N'2020-05-31 09:45:12.793' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (121, N'Nelsyd Aniceto ', N'nelsidioaniceto@gmail.com', N'eP9BgvMdF4JRNJk4Di3gedH1knbIl/xTb4Zm+H24ngm5RcskodBRPk99bbiadow33URdQUFFn2ud+tAED8bn/2iU4aH3Euge32tDOkBJ4MO+uLRkbCHEq5cTSCdNEQrn', 0, CAST(N'2020-06-01 09:42:52.683' AS DateTime), N'654617', 0, NULL, 1, N'+258 848750535', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (122, N'Haylton', N'hailtongfernandes@gmail.com', N'PHlibRFtMHU9mqoFg8Jd99nJV0GKmIl3epxAzNlR7So10ym1UKHFsQf5x+IyljaIDosrCxvHst51MngKLkiNAeiEy0dKlnwSHG4nQzME5RuMyreC06EMscgx6DVbIRra', 1, CAST(N'2020-06-01 10:56:37.833' AS DateTime), N'223894', 1, NULL, 1, N'846669766', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (123, N'Kally-De Lacerda Machado', N'amilcar_machado@yahoo.com.br', N'HFs0lv6Ed+Mfbj/wMmCgorwDZFWkkGUaYY+aY/oQDGvPLHrmlP4E123s4RNILCpHiTXWsv8VIbO5TIDvjF9hNLkDMi/v7YsoI/Rh5t+EsDIIbQAu8l8gT4I2P23Isfbx', 1, CAST(N'2020-06-04 16:07:49.497' AS DateTime), N'545847', 1, NULL, 1, N'00258849903658', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (124, N'Verazy', N'rfosvaldo5@gmail.com', N'2r1v8WXK+iV/Y6Mz3h5S3oBwkrHDsoDC4By2o3DXVpIXpg6uoEU2USOFNeajeFC5iIqC1opPewkTyKq9HCZ6bbZve1grZef6H/cglWYiJ8mcQfgo/eC5VEVyWcSALDOA', 1, CAST(N'2020-06-07 13:30:34.877' AS DateTime), N'596832', 1, NULL, 1, N'258845283596', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (125, N'Fernando Bonde', N'110986590712321955551@mussika.co.mz', N'u0PtMQJTCTNj61mJBoEVJum8VRT0Q36c+ee9y5q4evX644ZvuZbAfYONW9E2G/bvOIDbOU7HG0qnQKcpDprmypPIvFBFfBMxMEZhYGofqd6T8mMvYtTDFoIZH78fR1LT', 1, CAST(N'2020-06-08 07:37:15.420' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (126, N'Zex Sabino ', N'zaqueu76@gmail.com', N'7zmEFCnlsEviFv9rUkQ5Ao2uVIwAYYXFcCXt30zV5GPsmO6DYrJ27jh1twjtTFX0A3dH3vXlJJd7mXgfAMKVL7AwobCp4JS1gllOLq/8tsaaSpAJ+Anmu7vD4ABVjUv9', 1, CAST(N'2020-06-15 21:57:41.210' AS DateTime), N'487265', 1, NULL, 1, N'00258850401960', NULL, N'usuario12615062020220487D8D602-0BEF-4873-B08C-604B1C180829.jpeg', 0)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (127, N'Aniceto do Rosário', N'anicetotadeliwa007@gmail.com', N'cYzZYWAUokUGily+DX2oHXvT4SSK1CBvs34CXRwIcKiY9ZqALmf2bJr6iaN+lOmxROAPegOrWXBPj3uRWlpuig/mFSYLJcw2wnGkygqzkI1DtHAmPXpxqv8o5mONRZBk', 0, CAST(N'2020-06-23 11:38:23.747' AS DateTime), N'240101', 0, NULL, 4, N'847167969', NULL, NULL, 1)
GO
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (128, N'Lasmi Brito', N'694146901147331@mussika.co.mz', N'Iasw9IU95xclxF7MoBXWP8XoJIqQRotAnEcCGfOjtZOjdparM6xfWjepPt4nZnK/y9ajTVL2CwpTtw0Hod2RQEXX14eB08aPuM7XhEnqiI7BfTLrSekPTLzmPNG+A8Lb', 1, CAST(N'2020-06-25 12:53:57.193' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (129, N'Cariso Macario', N'carisomacario@gmail.com', N'rUVdCZJNx/HlHKgCbnKVWVdbr0Cf9+LpyilcKqx2J3m1AC0zkb1EhKRCzGUiXXtXC634v81eYoAWWEN9L/2JhoqNda1jJQx5LcQLOkBh/pF1JgFrZ5Pro628jbf8Sqtm', 1, CAST(N'2020-06-25 15:46:40.747' AS DateTime), N'662983', 1, NULL, 1, N'847597937', NULL, NULL, 0)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (130, N'ZARINO MUSSA', N'111260115517086853467@mussika.co.mz', N'DMaHqq6KserPYhTYMMa0bU4CQ6qvbYieYMChHhrQGIMI2tW9zrcxX+uzCj5LkKZfmdrOqoMuIw1gAly0VvGh2Vr3mJdtiJ1QECjacWKr2QVcTOJrZOAHEwa0DrWyYera', 1, CAST(N'2020-06-25 17:51:36.010' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (131, N'Zacarias ', N'Zacariaschepate2@gmail.com', N'9t+1fs7PAJspic1GL/9GYamtLe1jbRm9JXsd81jAM/rxtUuwcPXKakEPRlnGDsldMfd1OSTY9/Pm/x89JaUdhaPQLFjYPP/ohFbnIsZw2zMz+LWJZ3msc4F4qHowIsfD', 0, CAST(N'2020-06-25 19:26:20.067' AS DateTime), N'394946', 0, NULL, 4, N'+258840421568', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (132, N'Celestino Celestino Amade', N'105098755949711275504@mussika.co.mz', N'7o6SfImfjabMV9zYBaCjK8BE68Sf+jWYsZgwGa8oqogg9Uvh3QUZtTNYse41PplwJgyCf1IO/6gLtdnQ/ypUIta61gWLQDw4JPL/7xeGFzj0WF1rpQ1IThPAjAYWrH+f', 1, CAST(N'2020-06-25 19:36:05.700' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (133, N'Fsilva', N'fabuladasilva800@gmail.com', N'Qhk4vqwOtbNhenhzm6S5Hr2G8kFYBusbUEOoVLodOySMf1lJYel4bMnDW8e/txGIXtJS4R0xN11hDKtfL2CKfnYikJJxvwyp2TkIT7Qx+mokMvL3UCLQNuQ0uD2RrbTC', 0, CAST(N'2020-06-25 20:16:57.973' AS DateTime), N'398419', 0, NULL, 4, N'846560636', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (134, N'James Macamo', N'jamesmakamo510@gmail.com', N'9mpZaNukyvgo5jZlO9he7Jh8yYGbtEDp68JAzUG5znOzvdSMcwNvmwHq7qUf0kFNGdamp+bOfinYTVYECHEKfuYe+zuv1lbNfUKOfD54XI3/i3bAxucZhbChoHSuFgo1', 1, CAST(N'2020-06-25 21:52:11.913' AS DateTime), N'097502', 1, NULL, 1, N'258843693107', NULL, NULL, 0)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (135, N'luke', N'luketmozdj@gmail.com', N'QWQp56KNb1T6Q8qhRmskLjguoijxkd5plH8yr3fpRw8o8vk2JSOLGnJbF6rmiWHgoI7fJXSp228XXjnYCy2MLcBVJEY/idVxENKSTqXF45uIfSQQU3X0iSVYlmRRir9F', 0, CAST(N'2020-06-26 08:56:32.903' AS DateTime), N'916906', 0, NULL, 4, N'845235174', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (136, N'Victoriano', N'Mrconsultant471@gmail.com', N'P9Nw+IchxRfTAkoR96gfcPfGOmnLifcmeaewRmj3EHOQnj/NCtX1IXTAdsHySDX0YBnadBhxJTy3TPm84niUamxEmTpdTUa13kLjhuidM9bhw21CFiSWco0QenLd6e34', 1, CAST(N'2020-06-26 16:07:16.073' AS DateTime), N'912686', 1, NULL, 1, N'828077540', NULL, NULL, 0)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (137, N'Alfazema Basilio', N'111623763526769425955@mussika.co.mz', N'B+nhEBwI+9+1zOoTc1rHsKgYrq9H0O/nS4DyaUWmm6bOIIfIQ5l+LoEyL2ja8wN1Qk8LfW9u/KxFP+ML1shWwQU0cjnB7vsVcmwpDz0ukjALSZlr/EykEXTJGwZEcryK', 1, CAST(N'2020-06-26 22:50:57.890' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (138, N'Dimas', N'dimandenedio@gmail.com', N'kljJjP7qwrUVQY9cxRio22Ajn2XbxdlOZF0SDjkmMz8IWGg7OX/m4mcHNHM4xzTgtogMfJ5OklVYl1c//5WgZDsNjFhcoCMiRLxN9jLmPFN2phYyMkG4MaZUvESvIpyO', 0, CAST(N'2020-06-27 12:26:41.723' AS DateTime), N'995223', 0, NULL, 4, N'258845369749', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (139, N'ChilChirrinze', N'chilsio.chirrinze@gmail.com', N'q+6DoqsvdjwJePP9566Hqvqb+UtYl79wbdwBs8yb2EATI17cfczDaUFS6AE+drFq7jjvQMl4Wko+H0cwp9gwdCpt91xwPGP3ar+JY/673iQcTMQHK9F0qgmEn0g1jAVq', 0, CAST(N'2020-06-27 15:44:24.953' AS DateTime), N'548638', 0, NULL, 4, N'+258845082590', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (140, N'Nelson Benesse', N'101397543989108486600@mussika.co.mz', N'YteNK2G2zjv46y/BrMn1E4PqipYNNqlGYWJkymNxuJKKlBaCtt8S1kxPiZPdBmK9n/l5c9l7el9z4Ja9LV24eUA/2IHaGYheJADBZEBTMVHT4MjIcSJ0mRIfZamANZ0O', 1, CAST(N'2020-06-28 14:30:20.793' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (141, N'Gabriel josé Wide', N'108618903737213854399@mussika.co.mz', N'CJpo20I1Ge4ZCRh8pr/3Ly6TwGrd8Fmq7xrEMVI2Ntc8/OvTvB5r/KXtMzE4DmhziJ6g9HbceleYKA1Crb3jGAOG2Ela24aqkFpi4DHUmV/vcbU8bS24eXd4qaOP0UJ2', 1, CAST(N'2020-06-28 14:31:37.477' AS DateTime), NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (142, N'Omar Faruk ', N'eggsplorermoz@gmail.com', N'zZqAi7oX0KZ6pd5J6bIhA8zX3s9Kzj9W97yk/6XO3oU8WanyPUCZ0GnNLu+yTpFGWtssaqvRarj9GZXYXHuzr2ikQdJH/LEfyac9rVsAFTvmEIEGBj0rTkVqUoXJZaM6', 0, CAST(N'2020-06-28 18:40:38.517' AS DateTime), N'552473', 0, NULL, 4, N'258 862735745', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (143, N'Sheila mahoze', N'sheilamahoze2@gmail.com', N'd0N85DTNFXFS0FLh2qYym5T8fE2GgGt8OVMw0aDFNK4zuOaAcXwo9ucAdCA5kzeTQQs4SmkrXYQ7CM2rPhaEZkEbB0cm2nvHYhojPA0Ehu73EhQ9I30jkAweijv/sb/s', 0, CAST(N'2020-06-29 01:16:25.553' AS DateTime), N'832383', 0, NULL, 4, N'848547640', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (144, N'mcdonald', N'mcdonald@gmail.com', N'PUihOjDyC4qqAKqR2Hh8+pjbq54EskmWrv81EHeA/bWV9+OCs0WsnLQTo6ygzHpRolHhpaOuVlGVx6bvD9sIbS80UjC1BEhEk/SWL+UGOamsk8yRIFME+UhZw3cuexIh', 1, CAST(N'2020-06-29 18:22:18.340' AS DateTime), N'677454', 1, NULL, 4, N'258842338251', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (145, N'Edmundo Manhiça', N'Edmundomanhica@gmail.com', N'IECMOPjPZy+eKcLx/3vn47VZdWlNNjqZemCVyRgs6WCgTip3Wm34cwiK7wB9WHR5L8dfHczt8kDzY6aaT4BI7WGQi36uPq1x9vdph6gHviRyQG8a6Re6UYnN6tLbfa9C', 0, CAST(N'2020-06-30 13:48:32.160' AS DateTime), N'920174', 0, NULL, 4, N'845172607', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (146, N'Almiro Vilanculo', N'blessedbsd@gmail.com', N'niWOJXP3Y/COSbBR5bmrDQeDLPuVzxE83wrSOwK1dC8OmpLW7KOz/mkFqFTQS/A00BCdIQwFrINa1mWzkHPX9hQSr9jA+/zdzYuGsNw05maMUC3RJ7chEvWDLMdUlIOJ', 1, CAST(N'2020-06-30 23:13:56.603' AS DateTime), N'258459', 1, NULL, NULL, N'(+258)825-710-039', NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (147, N'Iat (industria de aluminio e tecto falso)', N'Edes.iatql@gmail.com', N'4+zvBjFIRrj87VI7LO+74zWPnBOe2c1FlOOSU/p41/rz6bZsK6Z0wV0yVjOnUN1mp/xJ5R8bRftDjMsp/KA8F73AkfAD/3H52FHUYFcDkxl5YN6pLlHEZphSy/xclq9C', 1, CAST(N'2020-07-01 21:06:26.257' AS DateTime), N'299358', 1, NULL, 1, N'258879052982', NULL, NULL, 0)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (148, N'Sky Diamond ', N'fernandochongola@gmail.com', N'cFIIaDVQQkWW9ADVrSb/tPws9PtlIAAbu/SEB6VqUyszP/xw8L36eZAm5CBFkiQidiMdpT//oDwTk+AzpP1nHgUkIhKwJp/KreIicfcatj5BiR3CqMK0bXppc1E3Ox3Z', 0, CAST(N'2020-07-02 01:57:14.957' AS DateTime), N'204729', 0, NULL, 4, N'+258847840711', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (149, N'ditafilipe@yahoo.com.br', N'ditafilipe@yahoo.com.br', N'h0Z87uOzwDMG6wSEWMjHhBeptj2e9xjm9kIHvD6a6DBNj/587H1i3Xgo8KerbDhOUAb7V3+E/qIBDrJwzOLuasdm4K/EKNMVnK0iDCy/2ZYhH9Afr0+zCs/l+KH7nFPr', 0, CAST(N'2020-07-02 13:12:56.020' AS DateTime), N'343701', 0, NULL, 4, N'842439591', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (150, N'Jacira Branquinho', N'Jacirabranquinho7@gmail.com', N'8Y+GzzowbZdCbHZaEmjAW3ms2ZwkHQBugkbfurmA0PmNxW4Gz0uaCQaRARI9xN0A0hSaq+VJJt3AcxwR2hMS9RtBMMC5GPLyJeqTgJjJGI/KxRH782yQtPH0KWq1pdxF', 1, CAST(N'2020-07-02 20:55:10.420' AS DateTime), N'260423', 1, NULL, 4, N'+258848653725', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (151, N'Azaruems', N'timanaazarias@gmail.com', N'G7iPBJ7/UYWdFsQ38n8rv6vwJHnUJa1xZO6+ARpHA23AlU35WX6z3IFzLKctJzFmu2+RQVTZ1d45xtonHP64F8Np6Ehrj2cA+q3nTfdM37rRdCygWNlW++sXEp9WeOoF', 0, CAST(N'2020-07-04 09:04:18.763' AS DateTime), N'599898', 0, NULL, 4, N'845752722', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (152, N'Ramadane ', N'2000ramadane@gmail.com', N'zdFdcp85KLV8kNmgmH8yaZH+st3JdxBB8ZWG5K7AAipoj1OzXA96wUldDdoTiQ9wlFQ62M4tnb4mpFvwMlhfVGfyOH7ZLRibBA+ruTXOEP5z05y7jPeODA+Il8eYPy+W', 0, CAST(N'2020-07-05 15:11:07.567' AS DateTime), N'909231', 0, NULL, 1, N'865404391', NULL, NULL, 0)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (153, N'Ussene', N'ussenedauda89@gmail.com', N'BXXJ5KVZFkOS8rQEoe5d5/oAUTFgF4cDH2eyDdf94njvzX2wN092gmH9cVnIAzmoLzbfJGDN0Dcp0rT7L3ChC7BlXupaQCvcxmwpMLBMmxbOMKmEv8JBozWhb+7Leby+', 0, CAST(N'2020-07-06 10:44:38.070' AS DateTime), N'840338', 0, NULL, 1, N'258846412467', NULL, NULL, 0)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (154, N'Clean Boys ', N'Novaisambrosio@gmail.com', N'XFfaH9hV0B9luhBV4dEoEmuvqIyDSYnGFMvDIsSuAytWgvOG21+HDzxFWDo7HLZiQnEMWWv9nGP5Qo94HNP1V6bAmlTe9BMu9H5sadQXjponbUNt3NvTfDScDvfY7biV', 0, CAST(N'2020-07-08 17:21:56.037' AS DateTime), N'456280', 0, NULL, 4, N'258 847229919', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (155, N'rojola pires', N'rojola@gmail.com', N'ISc4IYdbKFX/SaQXBklJuRR3r95hpygDMaUK6JMSdRoMlB9SoyUCraX+DGQKSdIDK4P71iKO09LdMzy8sCbsLWAHZabCHqGya3z71c3Fnt5ePQ2GKZEStaqasVvQ+btG', 1, CAST(N'2020-07-15 16:40:31.497' AS DateTime), N'021014', 1, NULL, 4, N'842338251', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (156, N'Inacio Sumbane', N'isumbane@mozsistemas.co.mz', N'43cHKb3XjOywkbCxNKofilm2x5XzsAVMGQ0neUd9cZ43aK+X8w+GnzoJWWNXW/uW7UXCJhV5hXdS7x0U9BkTSduyqJqKqeU+IaPzWOpL+zo7OMcg1EY5tVuyWqQXkctS', 0, CAST(N'2020-07-15 16:56:44.583' AS DateTime), N'688656', 0, NULL, 4, N'848631601', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (157, N'Boa Fbc', N'boafbc@gmail.com', N'rfETnmUKJU4fk7pAm7owOsfxJno24+PeXyNZC5EDvdejjAQA3VyUpp1A1UMaw+z6M1TCQ96vA+mIJaaQ3FcEtjEdW4g0dSJb0kNpEiltB7bU2nx3UI3aROdBO4WM6Nuz', 0, CAST(N'2020-07-16 06:15:24.903' AS DateTime), N'329549', 0, NULL, 4, N'+258 847448127', NULL, NULL, 1)
INSERT [dbo].[Usuario] ([idusario], [nome], [usuario], [senha], [activo], [datacadastro], [cod_autenticao], [autenticado], [msg_autenticacao], [id_usuario_tipo], [telefone], [tele], [foto_capa], [e_provedor]) VALUES (158, N'Rui Pires', N'tribodotrance@hotmail.com', N'+gjit4cT7wvEC6qyuH6Ucfs3GBnbuGHU3mY1n6TeaoXbZ94yeE/IVRjeJiVUush/XpdnQw9CfXB74YfhM7Lg37YLsO/e1EVKQJDqUe6TIRMPwIZ0RPwA6fX2/eJctuB0', 1, CAST(N'2020-07-16 10:12:51.190' AS DateTime), N'836825', 1, NULL, NULL, N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
SET IDENTITY_INSERT [dbo].[distrito] ON 

INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (1, NULL, N'Alto Molócuè', N'Perfil2452020135638_1.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d983214.1883745013!2d37.05402848377117!3d-15.715103968497798!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18c55fbbf53d7923%3A0xfb663fd7dd3fcd6b!2zQWx0byBNb2zDs2N1w6g!5e0!3m2!1spt-PT!2smz!4v1590320959210!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'6386  km²', N'272482', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (2, NULL, N'Chinde', N'Perfil2452020161659_2.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15127.262291396602!2d36.45375247895459!3d-18.582351597967254!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1f2cd246532faa87%3A0xac781e6e3e2f52f4!2sChinde!5e0!3m2!1spt-PT!2smz!4v1590329770632!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'4403  km²', N'119898', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (3, NULL, N'Derre', N'Perfil2452020163819_3.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7632.505654074893!2d36.12218857090578!3d-16.96210965333889!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d13842c4cea1e1%3A0x484eda43b830ce14!2sDerre!5e0!3m2!1spt-PT!2smz!4v1590331006564!5m2!1spt-PT!2smz', N'<p style="text-align: justify; line-height: 150%; background: white; margin: 6.0pt 0in 6.0pt 0in;"><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT; mso-bidi-font-weight: bold;">Derre</span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;&eacute; um distrito da prov&iacute;ncia da&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Zamb&eacute;zia" href="https://pt.wikipedia.org/wiki/Zamb%C3%A9zia"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Zamb&eacute;zia</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">, em&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Mo&ccedil;ambique" href="https://pt.wikipedia.org/wiki/Mo%C3%A7ambique"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Mo&ccedil;ambique</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">, com sede na povoa&ccedil;&atilde;o de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Derre (p&aacute;gina n&atilde;o existe)" href="https://pt.wikipedia.org/w/index.php?title=Derre&amp;action=edit&amp;redlink=1"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Derre</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">. Foi criado em 2013, com a eleva&ccedil;&atilde;o a distrito do posto administrativo do Derre que pertencia ao distrito de Morrumbala.</span></p>
<p style="text-align: start; line-height: 150%; background: white; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 6.0pt 0in 6.0pt 0in;"><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">Tem limites a norte com o distrito de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Milange (distrito)" href="https://pt.wikipedia.org/wiki/Milange_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Milange</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">, a oeste com os distritos de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Morrumbala (distrito)" href="https://pt.wikipedia.org/wiki/Morrumbala_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Morrumbala</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;e&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Mopeia (distrito)" href="https://pt.wikipedia.org/wiki/Mopeia_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Mopeia</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;da prov&iacute;ncia de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Tete (prov&iacute;ncia)" href="https://pt.wikipedia.org/wiki/Tete_(prov%C3%ADncia)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Tete</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">, a sul com o distrito de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Inhassunge (distrito)" href="https://pt.wikipedia.org/wiki/Inhassunge_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Inhassunge</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;e a leste com os distritos de&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Mocuba (distrito)" href="https://pt.wikipedia.org/wiki/Mocuba_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Mocuba</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">&nbsp;e&nbsp;</span><span style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif'';"><a title="Nicoadala (distrito)" href="https://pt.wikipedia.org/wiki/Nicoadala_(distrito)"><span lang="PT" style="color: windowtext; mso-ansi-language: PT; text-decoration: none; text-underline: none;">Nicoadala</span></a></span><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">.</span></p>
<p style="text-align: start; line-height: 150%; background: white; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; word-spacing: 0px; margin: 6.0pt 0in 6.0pt 0in;"><span lang="PT" style="font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-ansi-language: PT;">Em 2012, o distrito tinha uma popula&ccedil;&atilde;o estimada em 85&nbsp;385 habitantes. </span></p>', 0, NULL, N'85385', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (4, NULL, N'Gilé', N'Perfil2452020164457_4.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d982451.2955091988!2d37.809614904182446!3d-15.872337560377467!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18cf406a8c66d9bf%3A0xc549658101626d96!2zR2lsw6k!5e0!3m2!1spt-PT!2smz!4v1590331450505!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'8875  km²', N'169285', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (5, NULL, N'Gurué', N'Perfil2452020165030_5.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d61523.96715677099!2d36.950882925902086!3d-15.471089648595438!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18dac198752a2077%3A0xd129804853ee5057!2zR3VydcOp!5e0!3m2!1spt-PT!2smz!4v1590331699649!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'5606  km²', N'297935', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (6, NULL, N'Ile', N'Perfil2452020165513_6.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d981181.2744105177!2d36.972533633915546!3d-16.13077866618607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18cfc3f35b6e7015%3A0x1610abbc728c87a2!2sIle!5e0!3m2!1spt-PT!2smz!4v1590332005757!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'5589  km²', N'5589  ', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (7, NULL, N'Inhassunge', N'Perfil2452020171218_7.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d485526.62008064444!2d36.530341653835926!3d-18.063371962928418!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d2e8ce1d140f95%3A0xf69271b32c4389f9!2sInhassunge!5e0!3m2!1spt-PT!2smz!4v1590332199460!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'745  km²', N'91 196', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (8, NULL, N'Luabo', N'Perfil2452020171844_8.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30287.2719748799!2d36.081805067472246!3d-18.39699244877053!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d344c5a6ff1bf9%3A0xfb78074ce0b18e8c!2sLuabo!5e0!3m2!1spt-PT!2smz!4v1590333414651!5m2!1spt-PT!2smz', N'<p>&nbsp;</p>
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
<p style="margin: 0.5em 0px; color: #202122; font-family: sans-serif; background-color: #ffffff;">O posto administrativo de Chimbazo foi criado em 2017.</p>', 0, N'1 108 km²', N'48 459', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (9, NULL, N'Lugela', N'Perfil2452020172226_9.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d980189.3822840508!2d36.0846073168982!3d-16.32985227830752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d058dba32d5b2f%3A0x5edd6fdf3c7fc2ad!2sLugela!5e0!3m2!1spt-PT!2smz!4v1590333698465!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'6178  km²', N'135 485', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (10, NULL, N'Maganja da Costa', N'Perfil2452020172657_10.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d976489.7518700757!2d37.06076892193535!3d-17.052434856275166!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18cddc209393219b%3A0xf18a60bbf082c023!2sMaganja%20da%20Costa!5e0!3m2!1spt-PT!2smz!4v1590333871071!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'7597  km²', N'276 881', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (11, NULL, N'Milange', N'Perfil2452020172849_11.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d982042.6934254143!2d35.3792045881147!3d-15.955930255123144!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18da026d2101bbcb%3A0x5b4a51262a9cdbbf!2sMilange!5e0!3m2!1spt-PT!2smz!4v1590334093158!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'9842  km²', N'498 635', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (12, NULL, N'Mocuba', N'Perfil2452020173113_12.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d61097.89181042387!2d36.92612083222935!3d-16.84528468169019!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d1ead139f4a2f3%3A0x665aa404b3e10dee!2sMocuba!5e0!3m2!1spt-PT!2smz!4v1590334222316!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'8803  km²', N'300 628', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (13, NULL, N'Mocubela', N'Perfil2452020173419_13.jpg', NULL, N'<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Mocubela &eacute; um distrito da prov&iacute;ncia da Zamb&eacute;zia, em Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de Mocubela. Foi criado em 2013, com a eleva&ccedil;&atilde;o a distrito do posto administrativo do Mocubela, mais o posto administrativo de Bajone, que pertenciam ao distrito de Maganja da Costa.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Tem limite, a norte com o distrito de Mulevala, a noroeste e oeste com o distrito de Mocuba, a oeste com o distrito de Maganja da Costa, a sul com o Oceano &Iacute;ndico e a leste com o distrito de Pebane.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Em 2012, o distrito tinha uma popula&ccedil;&atilde;o estimada em 114 830 habitantes.</span></p>', 0, NULL, N'114 830', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (14, NULL, N'Molumbo', N'Perfil245202017375_14.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7689.83622287347!2d36.26831537080044!3d-15.488836306966853!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18da4823422500a9%3A0x142bdd62f6f9dc61!2sMolumbo!5e0!3m2!1spt-PT!2smz!4v1590334561377!5m2!1spt-PT!2smz', N'<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Molumbo &eacute; um distrito da prov&iacute;ncia da Zamb&eacute;zia, em Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de Molumbo. Foi criado em 2013, com a eleva&ccedil;&atilde;o a distrito do posto administrativo do Molumbo que pertencia ao distrito de Milange.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Tem limite, a norte com o distrito de Mecanhelas da prov&iacute;ncia de Niassa, a oeste com o Malawi, a sul com os distritos de Milange e Lugela, e a oeste com os distritos de Namarroi e Guru&eacute;.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Em 2012, o distrito tinha uma popula&ccedil;&atilde;o estimada em 101 664 habitantes.</span></p>', 0, NULL, N'101 664 ', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (15, NULL, N'Mopeia', N'Perfil245202017404_15.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30360.365837073135!2d35.68977331693315!3d-17.976609314576!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d4637272861e03%3A0xd529aae737e28b90!2sMopeia!5e0!3m2!1spt-PT!2smz!4v1590334723165!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'7671  km²', N'115 291', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (16, NULL, N'Morrumbala', N'Perfil245202017432_16.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d976754.4974319214!2d35.24390479646055!3d-17.00171801699607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d6c90c9a1b05a9%3A0xe5831f16af36da8c!2sMorrumbala!5e0!3m2!1spt-PT!2smz!4v1590334901395!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'12 801  km²', N'358 913', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (17, NULL, N'Mulevala', N'Perfil2452020174649_17.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30614.024994246374!2d37.560539065062365!3d-16.43735992386555!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18ce342ac363d971%3A0xcb316e605b2891!2sMulevala!5e0!3m2!1spt-PT!2smz!4v1590335133774!5m2!1spt-PT!2smz', N'<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Mulevala &eacute; um distrito da prov&iacute;ncia da Zamb&eacute;zia, em Mo&ccedil;ambique, com sede na povoa&ccedil;&atilde;o de Mulevala. Foi criado em 2013, com a eleva&ccedil;&atilde;o a distrito do posto administrativo do Mulevala que pertencia ao distrito de Ile.</span></p>
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
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Tebo</span></p>', 0, NULL, N'81 967', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (18, NULL, N'Namacura', N'Perfil2452020175040_18.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d487097.1850709666!2d36.77521634995751!3d-17.48617432864227!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d26c4867cd0c29%3A0x2b087df939866b4f!2sNamacurra!5e0!3m2!1spt-PT!2smz!4v1590335333228!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'2028  km²', N'94 693', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (19, NULL, N'Namarroi', N'Perfil245202017535_19.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d982484.5681441476!2d36.24995946201338!3d-15.865511681608494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18da9d1334bbcf29%3A0xc93bad25bf06c3c9!2sNamarroi!5e0!3m2!1spt-PT!2smz!4v1590335533564!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'3071  km²', N'125 999', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (20, NULL, N'Nicoadala', N'Perfil2452020175536_20.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d973649.2325176746!2d36.24171963149291!3d-17.58766063491082!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d24572de459395%3A0x879b5879f17c5227!2sNicoadala!5e0!3m2!1spt-PT!2smz!4v1590335688256!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'3392  km²', N'231 850 ', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (21, NULL, N'Pebane', N'Perfil245202017590_21.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30479.37669799247!2d38.13919341605544!3d-17.271003941483617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18cc45fce1e5dfc1%3A0xa8a128cc4b6c777a!2sPebane!5e0!3m2!1spt-PT!2smz!4v1590335806215!5m2!1spt-PT!2smz', N'<div class="attribute-short" style="font-family: ''Open Sans'', sans-serif; background-color: #ffffff;">
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
</div>', 0, N'10 182  km²', N'185 333', NULL, NULL, 0)
INSERT [dbo].[distrito] ([id], [codigo], [nome], [foto_capa], [linkmapa], [descricao], [activar_galeria], [area], [populacao], [longitude], [latitude], [visitas]) VALUES (22, NULL, N'Quelimane', N'Perfil245202018143_22.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60761.55521163133!2d36.8689249872236!3d-17.85750772625945!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18d2f3924aa45035%3A0x301df4b81c5c9fac!2sQuelimane!5e0!3m2!1spt-PT!2smz!4v1590336066880!5m2!1spt-PT!2smz', N'<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">Quelimane &eacute; a capital e a maior cidade da prov&iacute;ncia da Zamb&eacute;zia, em Mo&ccedil;ambique. Est&aacute; localizada no rio dos Bons Sinais, a cerca de 20 km do Oceano &Iacute;ndico; por essa raz&atilde;o, a cidade conta com um porto, que &eacute; uma das suas principais actividades econ&oacute;micas, centro de uma importante ind&uacute;stria pesqueira.</span></p>
<p class="MsoNormal"><span lang="PT" style="mso-ansi-language: PT;">A cidade de Quelimane &eacute; administrativamente um munic&iacute;pio com um governo local eleito e tamb&eacute;m um distrito, que administra as compet&ecirc;ncias do governo central.[1] Numa &aacute;rea de 117 km&sup2;, a cidade tinha 150 116 habitantes em 1997. A popula&ccedil;&atilde;o tinha ascendido a 185.000 habitantes em 2003, e o censo de 2007 registou 193.343 habitantes.</span></p>', 0, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[distrito] OFF
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
SET IDENTITY_INSERT [dbo].[genero_musical] ON 

INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (1, N'Zouk')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (2, N'Semba')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (3, N'RAP & RNB')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (4, N'Kizomba')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (5, N'Kuduro')
INSERT [dbo].[genero_musical] ([id], [descricao]) VALUES (6, N'Marrabenta')
SET IDENTITY_INSERT [dbo].[genero_musical] OFF
SET IDENTITY_INSERT [dbo].[categoria_obra_arte] ON 

INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (1, N'Literatura', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (2, N'Artes Plásticas', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (3, N'Escultura', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (4, N'Artesanato', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (5, N'Teatro', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (6, N'Dança', NULL)
INSERT [dbo].[categoria_obra_arte] ([id], [descricao], [fotografia]) VALUES (8, N'Grafites', NULL)
SET IDENTITY_INSERT [dbo].[categoria_obra_arte] OFF
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
SET IDENTITY_INSERT [dbo].[distrito_classificacao] ON 

INSERT [dbo].[distrito_classificacao] ([id], [id_distrito], [id_usuario], [e_like], [data_cadastro], [activo], [nomeUsuario], [email], [assunto], [estrelas]) VALUES (1, 10, NULL, 0, CAST(N'2020-06-26 20:57:01.377' AS DateTime), 1, N'Lino', N'Mario@g.com', NULL, 4)
INSERT [dbo].[distrito_classificacao] ([id], [id_distrito], [id_usuario], [e_like], [data_cadastro], [activo], [nomeUsuario], [email], [assunto], [estrelas]) VALUES (2, 6, NULL, 0, CAST(N'2020-07-05 15:20:49.723' AS DateTime), 1, N'VASCO CORNETA', N'cornetasvasco@gmail.com', NULL, 3)
SET IDENTITY_INSERT [dbo].[distrito_classificacao] OFF
SET IDENTITY_INSERT [dbo].[distrito_comentario] ON 

INSERT [dbo].[distrito_comentario] ([id], [id_distrito], [id_usuario], [comentario], [data], [valido], [nomeUsuario], [email], [assunto]) VALUES (1, 10, NULL, N'Good', CAST(N'2020-06-26 20:57:01.577' AS DateTime), 1, N'Lino', N'Mario@g.com', NULL)
INSERT [dbo].[distrito_comentario] ([id], [id_distrito], [id_usuario], [comentario], [data], [valido], [nomeUsuario], [email], [assunto]) VALUES (2, 6, NULL, N'Saudações compatriotas.
Quero antes louvar a iniciativa desta plataforma. Pois, é muito facil e acessível. 
Pessoalmente, gostei.

Proponho que seja revisto a divisão administrativa do distrito do ILE.', CAST(N'2020-07-05 15:20:49.723' AS DateTime), 1, N'VASCO CORNETA', N'cornetasvasco@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[distrito_comentario] OFF
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
SET IDENTITY_INSERT [dbo].[usuario_provedor] ON 

INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (1, 133, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'Início ')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (2, 135, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, N'live')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (3, 139, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, NULL, N'875082590')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (4, 142, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'001')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (5, 144, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, NULL, N'7863245')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (6, 145, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'Promoção de produtos e Serviços')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (7, 148, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (8, 151, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, N'Música')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (9, 154, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'Mussika01')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (10, 155, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, N'43434')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (11, 156, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'ref02')
INSERT [dbo].[usuario_provedor] ([id], [id_usuario], [musica], [bazar], [loja], [acomodacao], [taxi], [restaurante], [arte_cultura], [evento], [turismo], [farmacia], [clinica], [pagamento_servico], [referencia]) VALUES (12, 157, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'Produção Musical')
SET IDENTITY_INSERT [dbo].[usuario_provedor] OFF
SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] ON 

INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (21, 33, CAST(N'2020-01-11 10:40:58.630' AS DateTime), 1, NULL, N'620335', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (22, 33, CAST(N'2020-01-11 10:45:49.173' AS DateTime), 1, NULL, N'363238', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (23, 34, CAST(N'2020-01-12 20:46:20.480' AS DateTime), 1, NULL, N'078473', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (24, 36, CAST(N'2020-01-19 08:14:58.883' AS DateTime), 1, NULL, N'786798', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (25, 37, CAST(N'2020-01-19 11:58:19.063' AS DateTime), 1, NULL, N'716074', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (26, 40, CAST(N'2020-01-22 23:45:43.597' AS DateTime), 1, NULL, N'898071', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (28, 43, CAST(N'2020-03-12 16:44:13.697' AS DateTime), 1, NULL, N'982015', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (29, 44, CAST(N'2020-03-19 10:10:16.577' AS DateTime), 1, NULL, N'470153', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (30, 45, CAST(N'2020-03-26 19:19:04.643' AS DateTime), 1, NULL, N'477934', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (31, 46, CAST(N'2020-03-26 20:29:54.413' AS DateTime), 1, NULL, N'545294', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (32, 47, CAST(N'2020-03-27 08:09:50.950' AS DateTime), 1, NULL, N'479084', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (33, 47, CAST(N'2020-03-27 08:13:38.030' AS DateTime), 1, NULL, N'479084', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (34, 49, CAST(N'2020-03-27 08:21:04.833' AS DateTime), 1, NULL, N'030298', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (35, 50, CAST(N'2020-03-27 11:42:51.297' AS DateTime), 1, NULL, N'088902', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (36, 51, CAST(N'2020-04-03 11:29:52.340' AS DateTime), 1, NULL, N'592867', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (37, 51, CAST(N'2020-04-03 11:50:14.707' AS DateTime), 1, NULL, N'592867', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (38, 52, CAST(N'2020-04-03 15:09:14.763' AS DateTime), 1, NULL, N'855653', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (39, 54, CAST(N'2020-04-05 23:36:05.137' AS DateTime), 1, NULL, N'715142', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (40, 55, CAST(N'2020-04-11 01:48:37.290' AS DateTime), 1, NULL, N'893995', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (41, 57, CAST(N'2020-04-19 18:53:19.420' AS DateTime), 1, NULL, N'246637', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (42, 59, CAST(N'2020-04-22 13:15:30.257' AS DateTime), 1, NULL, N'909199', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (43, 60, CAST(N'2020-04-22 15:41:04.687' AS DateTime), 1, NULL, N'854899', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (44, 61, CAST(N'2020-04-23 11:01:28.503' AS DateTime), 1, NULL, N'292895', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (45, 62, CAST(N'2020-04-23 18:57:22.337' AS DateTime), 1, NULL, N'340827', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (46, 64, CAST(N'2020-04-23 21:25:28.043' AS DateTime), 1, NULL, N'689682', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (47, 65, CAST(N'2020-04-24 16:30:49.553' AS DateTime), 1, NULL, N'054201', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (48, 66, CAST(N'2020-04-24 19:08:02.120' AS DateTime), 1, NULL, N'756248', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (49, 67, CAST(N'2020-04-25 17:23:12.373' AS DateTime), 1, NULL, N'763734', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (50, 69, CAST(N'2020-04-27 13:03:02.297' AS DateTime), 1, NULL, N'010726', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (51, 43, CAST(N'2020-04-27 22:19:05.643' AS DateTime), 1, NULL, N'905733', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (52, 43, CAST(N'2020-04-27 23:06:36.933' AS DateTime), 1, NULL, N'238237', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (53, 43, CAST(N'2020-04-27 23:12:42.313' AS DateTime), 1, NULL, N'633034', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (54, 43, CAST(N'2020-04-27 23:14:10.467' AS DateTime), 1, NULL, N'509729', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (55, 43, CAST(N'2020-04-27 23:19:38.623' AS DateTime), 1, NULL, N'811913', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (56, 70, CAST(N'2020-04-29 12:04:22.907' AS DateTime), 1, NULL, N'457590', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (57, 71, CAST(N'2020-04-29 12:59:59.293' AS DateTime), 1, NULL, N'753014', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (58, 74, CAST(N'2020-04-29 14:16:09.927' AS DateTime), 1, NULL, N'094386', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (59, 76, CAST(N'2020-04-29 15:06:14.483' AS DateTime), 1, NULL, N'922390', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (60, 77, CAST(N'2020-04-29 15:15:49.627' AS DateTime), 1, NULL, N'054726', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (61, 78, CAST(N'2020-04-29 16:58:41.580' AS DateTime), 1, NULL, N'152893', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (62, 79, CAST(N'2020-04-29 21:54:40.453' AS DateTime), 1, NULL, N'419276', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (63, 82, CAST(N'2020-04-29 22:09:57.400' AS DateTime), 1, NULL, N'139542', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (64, 81, CAST(N'2020-04-29 22:16:20.087' AS DateTime), 1, NULL, N'405753', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (65, 83, CAST(N'2020-04-29 22:35:27.213' AS DateTime), 1, NULL, N'066811', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (66, 80, CAST(N'2020-04-30 14:03:57.487' AS DateTime), 1, NULL, N'911292', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (67, 87, CAST(N'2020-05-01 00:06:59.817' AS DateTime), 1, NULL, N'355044', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (68, 89, CAST(N'2020-05-04 11:38:50.150' AS DateTime), 1, NULL, N'518754', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (69, 92, CAST(N'2020-05-09 18:04:43.930' AS DateTime), 1, NULL, N'588172', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (70, 95, CAST(N'2020-05-16 22:24:33.313' AS DateTime), 1, NULL, N'984499', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (71, 99, CAST(N'2020-05-17 18:24:23.600' AS DateTime), 1, NULL, N'113345', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (72, 100, CAST(N'2020-05-18 03:11:01.917' AS DateTime), 1, NULL, N'978937', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (73, 106, CAST(N'2020-05-21 15:14:27.243' AS DateTime), 1, NULL, N'195541', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (74, 107, CAST(N'2020-05-21 15:33:38.063' AS DateTime), 1, NULL, N'246779', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (75, 109, CAST(N'2020-05-21 15:37:55.253' AS DateTime), 1, NULL, N'431730', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (76, 112, CAST(N'2020-05-22 10:48:42.693' AS DateTime), 1, NULL, N'764191', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (77, 112, CAST(N'2020-05-22 10:51:11.293' AS DateTime), 1, NULL, N'764191', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (78, 113, CAST(N'2020-05-22 13:43:15.940' AS DateTime), 1, NULL, N'189277', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (79, 114, CAST(N'2020-05-22 13:47:31.773' AS DateTime), 1, NULL, N'078727', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (80, 113, CAST(N'2020-05-22 14:16:47.077' AS DateTime), 1, NULL, N'189277', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (81, 97, CAST(N'2020-05-22 15:35:45.783' AS DateTime), 1, NULL, N'870872', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (82, 117, CAST(N'2020-05-25 12:55:47.170' AS DateTime), 1, NULL, N'343660', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (83, 118, CAST(N'2020-05-26 08:33:48.807' AS DateTime), 1, NULL, N'067283', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (84, 116, CAST(N'2020-05-28 16:53:40.343' AS DateTime), 1, NULL, N'481661', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (85, 119, CAST(N'2020-05-28 21:21:21.433' AS DateTime), 1, NULL, N'426587', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (86, 119, CAST(N'2020-05-28 21:21:48.433' AS DateTime), 1, NULL, N'426587', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (87, 122, CAST(N'2020-06-01 10:57:13.037' AS DateTime), 1, NULL, N'223894', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (88, 123, CAST(N'2020-06-04 16:08:50.193' AS DateTime), 1, NULL, N'545847', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (89, 124, CAST(N'2020-06-07 13:33:02.877' AS DateTime), 1, NULL, N'596832', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (90, 126, CAST(N'2020-06-15 21:59:34.800' AS DateTime), 1, NULL, N'487265', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (91, 129, CAST(N'2020-06-25 15:47:40.663' AS DateTime), 1, NULL, N'662983', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (92, 134, CAST(N'2020-06-25 21:53:43.977' AS DateTime), 1, NULL, N'097502', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (93, 136, CAST(N'2020-06-26 22:15:52.567' AS DateTime), 1, NULL, N'912686', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (94, 146, CAST(N'2020-06-30 23:22:46.380' AS DateTime), 1, NULL, N'258459', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (95, 147, CAST(N'2020-07-01 21:07:25.247' AS DateTime), 1, NULL, N'299358', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (96, 150, CAST(N'2020-07-02 21:01:03.557' AS DateTime), 1, NULL, N'260423', N'Autenticado')
INSERT [dbo].[UsuarioAutenticacao] ([idAutenticacao], [idUsuario], [data], [viaemail], [viacell], [codigo], [resultado]) VALUES (97, 158, CAST(N'2020-07-16 10:16:08.077' AS DateTime), 1, NULL, N'836825', N'Autenticado')
SET IDENTITY_INSERT [dbo].[UsuarioAutenticacao] OFF
