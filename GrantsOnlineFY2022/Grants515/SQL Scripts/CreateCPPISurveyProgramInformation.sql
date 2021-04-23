USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[UPKSurveyProgramInformation]    Script Date: 10/9/2018 3:27:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CPPISurveyProgramInformation](
	[SystemProviderId] [INT] NOT NULL,
	[QuestionId] [VARCHAR](50) NOT NULL,
	[QuestionAns] [VARCHAR](MAX) NOT NULL,
	[GrantApplicantId] [INT] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
