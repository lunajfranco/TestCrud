USE [TestCrud]
GO
/****** Object:  Table [dbo].[Alquiler]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquiler](
	[cod_alquiler] [int] NOT NULL,
	[cod_usuario] [int] NULL,
	[cod_pelicula] [int] NULL,
	[dia_de_alquiler] [date] NULL,
	[estado_alquiler] [bit] NULL,
	[veces_alquilada] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tGenero]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tGenero](
	[cod_genero] [int] IDENTITY(1,1) NOT NULL,
	[txt_desc] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tGeneroPelicula]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tGeneroPelicula](
	[cod_pelicula] [int] NOT NULL,
	[cod_genero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_pelicula] ASC,
	[cod_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPelicula]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPelicula](
	[cod_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[txt_desc] [varchar](500) NULL,
	[cant_disponibles_alquiler] [int] NULL,
	[cant_disponibles_venta] [int] NULL,
	[precio_alquiler] [numeric](18, 2) NULL,
	[precio_venta] [numeric](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRol]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRol](
	[cod_rol] [int] IDENTITY(1,1) NOT NULL,
	[txt_desc] [varchar](500) NULL,
	[sn_activo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUsers]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUsers](
	[cod_usuario] [int] IDENTITY(1,1) NOT NULL,
	[txt_user] [varchar](50) NULL,
	[txt_password] [varchar](50) NULL,
	[txt_nombre] [varchar](200) NULL,
	[txt_apellido] [varchar](200) NULL,
	[nro_doc] [varchar](50) NULL,
	[cod_rol] [int] NULL,
	[sn_activo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tVentas]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tVentas](
	[cod_venta] [int] NOT NULL,
	[cod_usuario] [int] NULL,
	[cod_pelicula] [int] NULL,
	[dia_de_venta] [date] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Alquiler] ([cod_alquiler], [cod_usuario], [cod_pelicula], [dia_de_alquiler], [estado_alquiler], [veces_alquilada]) VALUES (1, 2, 1, CAST(N'2022-11-09' AS Date), 1, 3)
GO
INSERT [dbo].[Alquiler] ([cod_alquiler], [cod_usuario], [cod_pelicula], [dia_de_alquiler], [estado_alquiler], [veces_alquilada]) VALUES (1, 2, 1, CAST(N'2022-11-09' AS Date), 0, 1)
GO
INSERT [dbo].[Alquiler] ([cod_alquiler], [cod_usuario], [cod_pelicula], [dia_de_alquiler], [estado_alquiler], [veces_alquilada]) VALUES (1, 2, 1, CAST(N'2022-11-09' AS Date), 0, 2)
GO
INSERT [dbo].[Alquiler] ([cod_alquiler], [cod_usuario], [cod_pelicula], [dia_de_alquiler], [estado_alquiler], [veces_alquilada]) VALUES (1, 2, 3, CAST(N'2022-11-09' AS Date), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[tGenero] ON 
GO
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (1, N'Acción')
GO
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (2, N'Comedia')
GO
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (3, N'Drama')
GO
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (4, N'Terror')
GO
SET IDENTITY_INSERT [dbo].[tGenero] OFF
GO
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (1, 1)
GO
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (2, 2)
GO
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (3, 2)
GO
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (3, 3)
GO
INSERT [dbo].[tGeneroPelicula] ([cod_pelicula], [cod_genero]) VALUES (4, 4)
GO
SET IDENTITY_INSERT [dbo].[tPelicula] ON 
GO
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta]) VALUES (1, N'Duro de matar III', 3, 0, CAST(1.50 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta]) VALUES (2, N'Todo Poderoso', 2, 1, CAST(1.50 AS Numeric(18, 2)), CAST(7.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta]) VALUES (3, N'Stranger than fiction', 1, 1, CAST(1.50 AS Numeric(18, 2)), CAST(8.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta]) VALUES (4, N'OUIJA', 0, 2, CAST(2.00 AS Numeric(18, 2)), CAST(20.50 AS Numeric(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[tPelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[tRol] ON 
GO
INSERT [dbo].[tRol] ([cod_rol], [txt_desc], [sn_activo]) VALUES (1, N'Administrador', -1)
GO
INSERT [dbo].[tRol] ([cod_rol], [txt_desc], [sn_activo]) VALUES (2, N'Cliente', -1)
GO
SET IDENTITY_INSERT [dbo].[tRol] OFF
GO
SET IDENTITY_INSERT [dbo].[tUsers] ON 
GO
INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (2, N'userTest', N'Test1', N'Ariel', N'ApellidoConA', N'12312321', 1, -1)
GO
INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (3, N'userTest2', N'Test2', N'Bernardo', N'ApellidoConB', N'12312322', 1, -1)
GO
INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (4, N'userTest3', N'Test3', N'Carlos', N'ApellidoConC', N'12312323', 1, -1)
GO
SET IDENTITY_INSERT [dbo].[tUsers] OFF
GO
ALTER TABLE [dbo].[tGeneroPelicula]  WITH CHECK ADD  CONSTRAINT [fk_genero_pelicula] FOREIGN KEY([cod_pelicula])
REFERENCES [dbo].[tPelicula] ([cod_pelicula])
GO
ALTER TABLE [dbo].[tGeneroPelicula] CHECK CONSTRAINT [fk_genero_pelicula]
GO
ALTER TABLE [dbo].[tGeneroPelicula]  WITH CHECK ADD  CONSTRAINT [fk_pelicula_genero] FOREIGN KEY([cod_genero])
REFERENCES [dbo].[tGenero] ([cod_genero])
GO
ALTER TABLE [dbo].[tGeneroPelicula] CHECK CONSTRAINT [fk_pelicula_genero]
GO
ALTER TABLE [dbo].[tUsers]  WITH CHECK ADD  CONSTRAINT [fk_user_rol] FOREIGN KEY([cod_rol])
REFERENCES [dbo].[tRol] ([cod_rol])
GO
ALTER TABLE [dbo].[tUsers] CHECK CONSTRAINT [fk_user_rol]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarAlquilerDePelicula]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarAlquilerDePelicula] 
@cod_alquiler int,
@estado_alquiler bit,
@veces_alquilada int
AS
Update dbo.Alquiler
	set estado_alquiler = @estado_alquiler, veces_alquilada = @veces_alquilada
	where cod_alquiler = @cod_alquiler
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarGeneroDePelicula]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ActualizarGeneroDePelicula] 
@cod_pelicula int,
@cod_genero int
AS
if not exists (select * from dbo.tGeneroPelicula where cod_pelicula = @cod_pelicula and cod_genero = @cod_genero )
Update dbo.tGeneroPelicula
	set cod_pelicula = @cod_pelicula, cod_genero = @cod_genero
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarPeliculas]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ActualizarPeliculas] 
@cod_pelicula int,
@txt_desc varchar(50),
@cant_disponibles_alquiler int,
@cant_disponibles_venta int,
@precio_alquiler numeric(18,2),
@precio_venta numeric(18,2)
AS
Update dbo.tPelicula
set txt_desc = @txt_desc, cant_disponibles_alquiler = @cant_disponibles_alquiler, cant_disponibles_venta = @cant_disponibles_venta, precio_alquiler = @precio_alquiler, precio_venta = @precio_venta
where cod_pelicula = @cod_pelicula
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUser]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ActualizarUser] 
@cod_usuario int,
@txt_user varchar(50),
@txt_password varchar(50),
@txt_nombre varchar(200),
@txt_apellido varchar(200),
@nro_doc varchar(50),
@cod_rol int,
@sn_activo int
AS
Update dbo.tUsers
set txt_user=@txt_user, txt_password = @txt_password, txt_nombre = @txt_nombre, txt_apellido = @txt_apellido,
	nro_doc = @nro_doc, cod_rol = @cod_rol, sn_activo = @sn_activo
	where cod_usuario = @cod_usuario
GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarCantidadDePeliculasAlquiladasYPrecios]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_BuscarCantidadDePeliculasAlquiladasYPrecios]
AS
 select tUsers.cod_usuario, txt_user, tPelicula.cod_pelicula, tPelicula.txt_desc, Alquiler.dia_de_alquiler, Alquiler.veces_alquilada, SUM(tPelicula.precio_alquiler * Alquiler.veces_alquilada) PrecioTotal from Alquiler
 join tUsers on tUsers.cod_usuario = Alquiler.cod_usuario
 join tPelicula on tPelicula.cod_pelicula = Alquiler.cod_pelicula
 where Alquiler.veces_alquilada > 0
 group by tUsers.cod_usuario, txt_user, tPelicula.cod_pelicula, tPelicula.txt_desc, Alquiler.dia_de_alquiler, Alquiler.veces_alquilada
GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarPeliculasAlquiladasPorUsuario]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_BuscarPeliculasAlquiladasPorUsuario]
AS
 select tUsers.cod_usuario, txt_user, tPelicula.cod_pelicula, tPelicula.txt_desc, Alquiler.dia_de_alquiler, SUM(tPelicula.precio_alquiler) PrecioTotal from Alquiler
 join tUsers on tUsers.cod_usuario = Alquiler.cod_usuario
 join tPelicula on tPelicula.cod_pelicula = Alquiler.cod_pelicula
 where Alquiler.estado_alquiler = 0
 group by tUsers.cod_usuario, txt_user, tPelicula.cod_pelicula, tPelicula.txt_desc, Alquiler.dia_de_alquiler
GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarPeliculasNoDevueltasYUsuario]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_BuscarPeliculasNoDevueltasYUsuario] 
AS
 select tUsers.cod_usuario, txt_user, tPelicula.cod_pelicula, tPelicula.txt_desc from Alquiler
 join tUsers on tUsers.cod_usuario = Alquiler.cod_usuario
 join tPelicula on tPelicula.cod_pelicula = Alquiler.cod_pelicula
 where Alquiler.estado_alquiler = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarRol]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_BuscarRol]
@cod_rol int
as
select * from tRol
where cod_rol = @cod_rol
GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarTodosLosUsuarios]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_BuscarTodosLosUsuarios]
as
select * from tUsers
inner join tRol on tUsers.cod_rol = tRol.cod_rol
GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarUsuariosPorId]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_BuscarUsuariosPorId]
@cod_usuario int
as
select * from tUsers
where cod_usuario = @cod_usuario
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarUsuarioPorId]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_EliminarUsuarioPorId] 
@cod_usuario varchar(50)
AS
Delete
from dbo.tUsers
where cod_usuario = @cod_usuario
GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteUsuarioConDni]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ExisteUsuarioConDni] 
@nro_doc varchar(50)
AS
Select nro_doc 
from dbo.tUsers
where nro_doc = @nro_doc
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarGenero]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_InsertarGenero] 
@txt_desc varchar(50)
AS
if not exists (select txt_desc from dbo.tGenero where txt_desc = @txt_desc)
INSERT INTO dbo.tGenero(txt_desc)
VALUES (@txt_desc)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarPeliculas]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarPeliculas] 
@txt_desc varchar(50),
@cant_disponibles_alquiler int,
@cant_disponibles_venta int,
@precio_alquiler numeric(18,2),
@precio_venta numeric(18,2)
AS
if not exists (select txt_desc from dbo.tPelicula where txt_desc = @txt_desc)
INSERT INTO dbo.tPelicula(txt_desc, cant_disponibles_alquiler, cant_disponibles_venta, precio_alquiler, precio_venta)
VALUES (@txt_desc, @cant_disponibles_alquiler, @cant_disponibles_venta, @precio_alquiler, @precio_venta)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertUsers]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertUsers] 
@txt_user varchar(50),
@txt_password varchar(50),
@txt_nombre varchar(200),
@txt_apellido varchar(200),
@nro_doc varchar(50),
@cod_rol int,
@sn_activo int

AS
if not exists (select nro_doc from dbo.tUsers where nro_doc = @nro_doc)
INSERT INTO dbo.tUsers(txt_user, txt_password, txt_nombre, txt_apellido, nro_doc, cod_rol, sn_activo)
VALUES (@txt_user, @txt_password, @txt_nombre, @txt_apellido, @nro_doc, @cod_rol, @sn_activo)
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUsuario]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_LoginUsuario]
@txt_user varchar(50),
@txt_password varchar(50)
as
select * from tUsers
inner join tRol on tUsers.cod_rol = tRol.cod_rol
where txt_user = @txt_user and txt_password = @txt_password
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPeliculasParaAlquilar]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ObtenerPeliculasParaAlquilar]
as
select * from dbo.tPelicula where cant_disponibles_alquiler > 0
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPeliculasParaVender]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ObtenerPeliculasParaVender]
as
select * from dbo.tPelicula where cant_disponibles_venta > 0
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarAlquiler]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegistrarAlquiler] 
@cod_usuario int,
@cod_pelicula int,
@dia_de_venta date,
@estado_alquiler bit,
@veces_alquilada int
AS
INSERT INTO dbo.Alquiler( cod_usuario, cod_pelicula, dia_de_alquiler, estado_alquiler, veces_alquilada)
VALUES (@cod_usuario, @cod_pelicula, @dia_de_venta, @estado_alquiler, @veces_alquilada)
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarVenta]    Script Date: 10/11/2022 11:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_RegistrarVenta] 
@cod_usuario int,
@cod_pelicula int,
@dia_de_venta date
AS
INSERT INTO dbo.tVentas( cod_usuario, cod_pelicula, dia_de_venta)
VALUES (@cod_usuario, @cod_pelicula, @dia_de_venta)
GO
