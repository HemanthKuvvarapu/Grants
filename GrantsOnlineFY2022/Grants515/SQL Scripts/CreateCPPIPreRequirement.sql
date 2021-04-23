USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[CPPIPreRequirement]    Script Date: 10/3/2018 3:02:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CPPIPreRequirement](
	[GrantApplicantId] [INT] NOT NULL,
	[Part] [INT] NOT NULL,
	[Status] [TINYINT] NULL
) ON [PRIMARY]

GO


