/*
DB Changes to scale the mental health to EPS (Quickly)
*/

--created table GrantType (to reuse the same db and code)
USE [GrantsOnline]
GO
 
/****** Object:  Table [dbo].[GrantType]    Script Date: 03/08/2013 11:23:43 ******/
SET IDENTITY_INSERT [dbo].[GrantType] ON
INSERT [dbo].[GrantType] ([GrantTypeId], [GrantName], [Notes]) VALUES (1, N'Mental Health', N'Released on 2/28/13')
INSERT [dbo].[GrantType] ([GrantTypeId], [GrantName], [Notes]) VALUES (2, N'EPS', N'')
INSERT [dbo].[GrantType] ([GrantTypeId], [GrantName], [Notes]) VALUES (3, N'CFCE', N'')
SET IDENTITY_INSERT [dbo].[GrantType] OFF
---------------------------------------------------------------------------------------------

INSERT INTO EPSRegionTotals : GET the DATA script AND LOAD.

--update existing applicants to refer to MH grant
UPDATE dbo.GrantApplicant 
SET GrantTypeId = ISNULL(GrantTypeId, 1)
go


-------------

