USE [18ip10]
GO
/****** Object:  Table [dbo].[Врачи]    Script Date: 09.11.2021 15:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Врачи](
	[id Врача] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Время начала работы] [time](7) NULL,
	[Время окончания работы] [time](7) NULL,
	[Кабинет] [nvarchar](50) NULL,
	[Id должности] [int] NOT NULL,
 CONSTRAINT [PK_Врачи] PRIMARY KEY CLUSTERED 
(
	[id Врача] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Должности]    Script Date: 09.11.2021 15:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должности](
	[Id Должности] [int] IDENTITY(1,1) NOT NULL,
	[Название должности] [nvarchar](50) NULL,
 CONSTRAINT [PK_Должности] PRIMARY KEY CLUSTERED 
(
	[Id Должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Животные]    Script Date: 09.11.2021 15:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Животные](
	[id животного] [int] IDENTITY(1,1) NOT NULL,
	[id Клиента] [int] NOT NULL,
	[Кличка] [nvarchar](50) NULL,
	[Вид] [nvarchar](50) NULL,
	[Порода] [nvarchar](50) NULL,
	[Возраст] [nvarchar](50) NULL,
	[Больничная карта] [nvarchar](50) NULL,
	[Паспорт] [nvarchar](50) NULL,
 CONSTRAINT [PK_Животные] PRIMARY KEY CLUSTERED 
(
	[id животного] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 09.11.2021 15:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Id Клиента] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Телефон] [nvarchar](50) NULL,
	[Адрес] [nvarchar](50) NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[Id Клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Прием]    Script Date: 09.11.2021 15:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Прием](
	[id Приема] [int] IDENTITY(1,1) NOT NULL,
	[Id Животного] [int] NOT NULL,
	[Id Клиента] [int] NOT NULL,
	[Время приема] [time](7) NULL,
	[Id Врача] [int] NULL,
	[Стоимость] [char](10) NULL,
	[Id Услуги] [int] NULL,
 CONSTRAINT [PK_Прием] PRIMARY KEY CLUSTERED 
(
	[id Приема] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 09.11.2021 15:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[id Услуги] [int] IDENTITY(1,1) NOT NULL,
	[Название услуги] [nvarchar](50) NULL,
	[Стоимость услуги] [char](10) NULL,
 CONSTRAINT [PK_Услуги] PRIMARY KEY CLUSTERED 
(
	[id Услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Врачи]  WITH CHECK ADD  CONSTRAINT [FK_Врачи_Должности] FOREIGN KEY([Id должности])
REFERENCES [dbo].[Должности] ([Id Должности])
GO
ALTER TABLE [dbo].[Врачи] CHECK CONSTRAINT [FK_Врачи_Должности]
GO
ALTER TABLE [dbo].[Животные]  WITH CHECK ADD  CONSTRAINT [FK_Животные_Клиенты] FOREIGN KEY([id Клиента])
REFERENCES [dbo].[Клиенты] ([Id Клиента])
GO
ALTER TABLE [dbo].[Животные] CHECK CONSTRAINT [FK_Животные_Клиенты]
GO
ALTER TABLE [dbo].[Прием]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Врачи] FOREIGN KEY([Id Врача])
REFERENCES [dbo].[Врачи] ([id Врача])
GO
ALTER TABLE [dbo].[Прием] CHECK CONSTRAINT [FK_Прием_Врачи]
GO
ALTER TABLE [dbo].[Прием]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Животные] FOREIGN KEY([Id Животного])
REFERENCES [dbo].[Животные] ([id животного])
GO
ALTER TABLE [dbo].[Прием] CHECK CONSTRAINT [FK_Прием_Животные]
GO
ALTER TABLE [dbo].[Прием]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Животные1] FOREIGN KEY([Id Животного])
REFERENCES [dbo].[Животные] ([id животного])
GO
ALTER TABLE [dbo].[Прием] CHECK CONSTRAINT [FK_Прием_Животные1]
GO
ALTER TABLE [dbo].[Прием]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Услуги] FOREIGN KEY([Id Услуги])
REFERENCES [dbo].[Услуги] ([id Услуги])
GO
ALTER TABLE [dbo].[Прием] CHECK CONSTRAINT [FK_Прием_Услуги]
GO
