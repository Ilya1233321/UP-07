USE [18ip10]
GO
/****** Object:  Table [dbo].[Врачи]    Script Date: 22.11.2021 13:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Врачи](
	[id_Врача] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Время начала работы] [time](7) NULL,
	[Время окончания работы] [time](7) NULL,
	[Аватар] [nvarchar](150) NULL,
	[Кабинет] [nvarchar](50) NULL,
	[Логин] [nvarchar](50) NULL,
	[Пароль] [nvarchar](50) NULL,
	[Id должности] [int] NOT NULL,
 CONSTRAINT [PK_Врачи] PRIMARY KEY CLUSTERED 
(
	[id_Врача] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Должности]    Script Date: 22.11.2021 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должности](
	[Id_Должности] [int] IDENTITY(1,1) NOT NULL,
	[Название должности] [nvarchar](50) NULL,
 CONSTRAINT [PK_Должности] PRIMARY KEY CLUSTERED 
(
	[Id_Должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Животные]    Script Date: 22.11.2021 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Животные](
	[id_животного] [int] IDENTITY(1,1) NOT NULL,
	[id_Клиента] [int] NOT NULL,
	[Кличка] [nvarchar](50) NULL,
	[Вид] [nvarchar](50) NULL,
	[Фотография] [nchar](10) NULL,
	[Порода] [nvarchar](50) NULL,
	[Возраст] [nvarchar](50) NULL,
	[Больничная карта] [nvarchar](50) NULL,
	[Паспорт] [nvarchar](50) NULL,
 CONSTRAINT [PK_Животные] PRIMARY KEY CLUSTERED 
(
	[id_животного] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 22.11.2021 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Id_Клиента] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Телефон] [nvarchar](50) NULL,
	[Адрес] [nvarchar](50) NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[Id_Клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Список услуг]    Script Date: 22.11.2021 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Список услуг](
	[Id_Услуги] [int] NULL,
	[Id_Приема] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 22.11.2021 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[id_Услуги] [int] IDENTITY(1,1) NOT NULL,
	[Название услуги] [nvarchar](50) NULL,
	[Стоимость услуги] [char](10) NULL,
 CONSTRAINT [PK_Услуги] PRIMARY KEY CLUSTERED 
(
	[id_Услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Врачи]  WITH CHECK ADD  CONSTRAINT [FK_Врачи_Должности] FOREIGN KEY([Id должности])
REFERENCES [dbo].[Должности] ([Id_Должности])
GO
ALTER TABLE [dbo].[Врачи] CHECK CONSTRAINT [FK_Врачи_Должности]
GO
ALTER TABLE [dbo].[Животные]  WITH CHECK ADD  CONSTRAINT [FK_Животные_Клиенты] FOREIGN KEY([id_Клиента])
REFERENCES [dbo].[Клиенты] ([Id_Клиента])
GO
ALTER TABLE [dbo].[Животные] CHECK CONSTRAINT [FK_Животные_Клиенты]
GO
ALTER TABLE [dbo].[Список услуг]  WITH CHECK ADD  CONSTRAINT [FK_Список услуг_Прием] FOREIGN KEY([Id_Приема])
REFERENCES [dbo].[Прием] ([id_Приема])
GO
ALTER TABLE [dbo].[Список услуг] CHECK CONSTRAINT [FK_Список услуг_Прием]
GO
ALTER TABLE [dbo].[Список услуг]  WITH CHECK ADD  CONSTRAINT [FK_Список услуг_Услуги] FOREIGN KEY([Id_Услуги])
REFERENCES [dbo].[Услуги] ([id_Услуги])
GO
ALTER TABLE [dbo].[Список услуг] CHECK CONSTRAINT [FK_Список услуг_Услуги]
GO
