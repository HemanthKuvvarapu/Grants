USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[CPPIProgramAssessmentInstrument]    Script Date: 10/3/2018 3:02:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CPPIProgramAssessmentInstrument](
	[CPPIProgramAssessmentInstrumentId] [INT] IDENTITY(1,1) NOT NULL,
	[GrantApplicantId] [INT] NOT NULL,
	[AssessmentInstrumentId] [INT] NOT NULL,
	[GrantCPPISystemProvidersId] [INT] NULL
) ON [PRIMARY]

GO


