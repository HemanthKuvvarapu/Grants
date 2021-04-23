USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[CPPISurveyClassroomEducators]    Script Date: 11/1/2018 9:50:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CPPISurveyClassroomEducators](
	[EducatorId] [INT] IDENTITY(1,1) NOT NULL,
	[ClassroomId] [INT] NOT NULL,
	[EducatorName] [VARCHAR](300) NOT NULL,
	[Position] [VARCHAR](300) NOT NULL,
	[HighestEducationLevel] [VARCHAR](300) NOT NULL,
	[MajorProgramStudy] [VARCHAR](100) NULL,
	[AnnualSalary] [VARCHAR](50) NULL,
	[GrantApplicantID] [INT] NULL,
	[SystemProviderID] [INT] NULL,
	
 CONSTRAINT [PK_CPPISurveyClassroomEducators] PRIMARY KEY CLUSTERED 
(
	[EducatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


