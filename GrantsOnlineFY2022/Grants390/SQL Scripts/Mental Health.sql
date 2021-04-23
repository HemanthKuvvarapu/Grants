/*
DDL is taken care by sql compare 
DML is listed here
--*/
--create table AndreaTownList from the excel and then delete the columns not needed

----f, g, (H)
--ALTER TABLE dbo.AndreaTownList
--DROP COLUMN [1# Total Number of Households (Census)] -- hidden column f


--ALTER TABLE dbo.AndreaTownList
--DROP COLUMN [2#  Median Number of Families Receiving Services For All Subsidi] --g

----i, j (K)
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [3# Total Number of Children Ages 0 to 14 (Census)]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [4# Median Number  of Children Receving Services For All Subsidiz]

----l, m, n (O)
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [5# High Risk Home Visiting Factor]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [5# High Risk Home Visiting Factor1]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [6# Avg# Number of Providers  in Towns with Families Served]

----p, q, r, s (T)
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [F16]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [7# Rural ]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [8# Level 4 Communites]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [9# Gateway Communities]

---- KEEP AN
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [F21]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [1# % Households (Census)]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [2# % Families (Vouchers)]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [3# % Children (Census)]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [4# % Children (Vouchers)]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [5# % High Risk Home Visiting Factor]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [5# % High Risk Home Visiting Factor1]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [6# % Providers in Towns with Families Served]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [F29]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [7# Rural (Weighting) 1/145=#69%]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [8# Level 4 Communites 1/12=8#33%]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [9# Gateway Communities 1/24=4#17%]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [10# Licensed Programs1]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [F34]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [Sum of Factors]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [% of TOTAL]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [F37]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [Funding Distribution by Town]
--ALTER TABLE dbo.AndreaTownList DROP COLUMN [$1,250,000]

--------------------------------------------- INSERTS/UPDATES ---------------
IF NOT EXISTS (SELECT 1 FROM lookup.ContactType)
INSERT INTO lookup.ContactType
VALUES (1, 'Grant Coordinator')
, (2, 'Lead Agency Contact Name')
, (3, 'Superintendent/Executive Director')
, (4, 'Summer Contact')
, (5, 'Fiscal Contact')


/****** Object:  Table [lookup].[LANGUAGE]    Script Date: 02/20/2013 11:18:28 ******/
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (0, N'No language code', 22)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (10, N'English', 1)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (11, N'Spanish', 2)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (12, N'Portuguese', 3)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (13, N'Vietnamese', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (14, N'Khmer (Cambodian)', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (15, N'Cantonese', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (16, N'Laotian', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (17, N'French', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (18, N'Haitian Creole', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (19, N'Italian', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (20, N'Greek', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (21, N'Armenian', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (22, N'Polish', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (23, N'Russian', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (24, N'American Sign Language (ASL)', 10)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (25, N'Amharic', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (26, N'Croatian', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (27, N'Slovenian', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (28, N'Tagalog', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (29, N'Serbian-Cyrillic', 9)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (79, N'Unknown', 20)
INSERT [lookup].[LANGUAGE] ([LanguageId], [DESCRIPTION], [SortOrder]) VALUES (80, N'Other', 21)




-----------------------
 
USE [GrantsOnline]
GO
