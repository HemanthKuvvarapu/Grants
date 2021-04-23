USE [GrantsOnline]
GO
/****** Object:  Table [dbo].[HeadStartAgencyAwarded]    Script Date: 04/11/2013 10:21:36 ******/
SET ANSI_NULLS ON
GO

/*

Add HeadStart grant type 4 to table.

*/

set IDENTITY_INSERT [dbo].[GrantType] ON

if not exists(
SELECT *
  FROM [GrantType]
  where grantTypeid = 4)
INSERT INTO [GrantsOnline].[dbo].[GrantType]
           ([GrantTypeId],[GrantName],[Notes]) VALUES (100,N'HeadStart',N'')

set IDENTITY_INSERT [dbo].[GrantType] off

/*

Add HeadStart Agencies information.

*/


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HeadStartAgencyAwarded]') AND type in (N'U'))
DROP TABLE [dbo].[HeadStartAgencyAwarded]
GO


SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeadStartAgencyAwarded](
	[Lead Agency Name] [nvarchar](255) NULL,
	[FY2013 Total Grant Award] [money] NULL,
	[FY2014 Total Grant Award] [money] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'ACTION FOR BOSTON COMMUNITY DEVELOPMENT, INC.', 1722622.0000, 1722622.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'ASSOCIATED FOR HUMAN SERVICES, INC.', 1562.0000, 1562.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'BERKSHIRE COUNTY HEAD START', 240496.3700, 240497.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'CAPE COD CHILD DEVELOPMENT PROGRAM, INC.', 268581.0000, 268581.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'CITIZENS FOR CITIZENS INC', 255525.0000, 255525.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'CITY OF WORCESTER', 408248.0000, 408248.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'COMMUNITIES UNITED INC', 218488.5500, 218489.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'COMMUNITY ACTION AGENCY OF SOMERVILLE', 381564.9200, 381565.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'COMMUNITY ACTION FRAN HAM N QUAB RE INC', 385894.0000, 385894.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'COMMUNITY ACTION INC', 151383.0100, 151383.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'COMMUNITY ACTION PROGRAMS INTER-CITY', 258888.0000, 258888.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'COMMUNITY TEAMWORK  INC', 328011.6200, 328012.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'DIMOCK COMMUNITY HEALTH CTR', 66846.0000, 66846.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'GREATER LAWRENCE COMMUNITY ACTION COUNCIL', 250320.0000, 250320.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'HOLYOKE CHICOPEE SPRINGFIELD HEAD START INC. - HS and EHS', 573250.3900, 573251.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'HOLYOKE CHICOPEE SPRINGFIELD HEAD START INC. - Migrant', 4872.0000, 4872.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'LYNN ECONOMIC OPPORTUNITY INC.', 300928.0300, 300928.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'MARTHA''S VINEYARD COMMUNITY SERVICES, INC.', 23953.0000, 23953.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'MONTACHUSETT OPPORTUNITY COUNCIL, INC.', 255529.0000, 255529.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'PATHWAYS FOR CHILDREN INC', 247106.2900, 247107.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'PEOPLE ACTING IN COMMUNITY ENDEAVORS, INC.', 188720.0000, 188720.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'QUINCY COMMUNITY ACTION PROGRAMS', 215055.9700, 215056.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'RIVERSIDE COMMUNITY CARE EARLY HEAD START', 15173.0000, 15173.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'SELF HELP INC', 473799.0000, 473799.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'SOUTH MIDDLESEX OPPORTUNITY COUNCIL, INC.', 257716.2500, 257717.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'SOUTH SHORE COMMUNITY ACTION COUNCIL', 103791.0000, 103791.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'SOUTH SHORE STARS', 2678.0000, 2678.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'TRI-CITY COMMUNITY ACTION PROGRAMS, INC.', 148053.7600, 148054.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'TRIUMPH INC', 162729.9200, 162730.0000)
INSERT [dbo].[HeadStartAgencyAwarded] ([Lead Agency Name], [FY2013 Total Grant Award], [FY2014 Total Grant Award]) VALUES (N'WORCESTER COMMUNITY ACTION', 88210.0000, 88210.0000)
/****** Object:  Table [dbo].[HeadStartAgency]    Script Date: 04/11/2013 10:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HeadStartAgency]') AND type in (N'U'))
DROP TABLE [dbo].[HeadStartAgency]
GO

SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeadStartAgency](
	[HeadStartAgencyID] [int] IDENTITY(1,1) NOT NULL,
	[HeadStartAganeyName] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[HeadStartAgency] ON
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (1, N'ACTION FOR BOSTON COMMUNITY DEVELOPMENT, INC.')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (2, N'ASSOCIATED FOR HUMAN SERVICES, INC.')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (3, N'BERKSHIRE COUNTY HEAD START')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (4, N'CAPE COD CHILD DEVELOPMENT PROGRAM, INC.')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (5, N'CITIZENS FOR CITIZENS INC')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (6, N'CITY OF WORCESTER')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (7, N'COMMUNITIES UNITED INC')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (8, N'COMMUNITY ACTION AGENCY OF SOMERVILLE')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (9, N'COMMUNITY ACTION FRAN HAM N QUAB RE INC')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (10, N'COMMUNITY ACTION INC')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (11, N'COMMUNITY ACTION PROGRAMS INTER-CITY')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (12, N'COMMUNITY TEAMWORK  INC')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (13, N'DIMOCK COMMUNITY HEALTH CTR')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (14, N'GREATER LAWRENCE COMMUNITY ACTION COUNCIL')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (15, N'HOLYOKE CHICOPEE SPRINGFIELD HEAD START INC. - HS and EHS')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (16, N'HOLYOKE CHICOPEE SPRINGFIELD HEAD START INC. - Migrant')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (17, N'LYNN ECONOMIC OPPORTUNITY INC.')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (18, N'MARTHA''S VINEYARD COMMUNITY SERVICES, INC.')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (19, N'MONTACHUSETT OPPORTUNITY COUNCIL, INC.')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (20, N'PATHWAYS FOR CHILDREN INC')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (21, N'PEOPLE ACTING IN COMMUNITY ENDEAVORS, INC.')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (22, N'QUINCY COMMUNITY ACTION PROGRAMS')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (23, N'RIVERSIDE COMMUNITY CARE EARLY HEAD START')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (24, N'SELF HELP INC')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (25, N'SOUTH MIDDLESEX OPPORTUNITY COUNCIL, INC.')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (26, N'SOUTH SHORE COMMUNITY ACTION COUNCIL')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (27, N'SOUTH SHORE STARS')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (28, N'TRI-CITY COMMUNITY ACTION PROGRAMS, INC.')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (29, N'TRIUMPH INC')
INSERT [dbo].[HeadStartAgency] ([HeadStartAgencyID], [HeadStartAganeyName]) VALUES (30, N'WORCESTER COMMUNITY ACTION')
SET IDENTITY_INSERT [dbo].[HeadStartAgency] OFF
