USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[CPPISurveyProgramInformation]    Script Date: 10/11/2018 8:28:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CPPISurveyProgramInformation](
	[SystemProviderId] [int] NOT NULL,
	[QuestionId] [varchar](50) NOT NULL,
	[QuestionAns] [varchar](max) NOT NULL,
	[GrantApplicantId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

