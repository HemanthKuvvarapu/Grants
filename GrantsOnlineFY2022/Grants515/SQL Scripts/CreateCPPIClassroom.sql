USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[CPPIClassroom]    Script Date: 10/3/2018 3:02:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CPPIClassroom](
	[CPPIClassroomId] [INT] IDENTITY(1,1) NOT NULL,
	[GrantApplicantId] [INT] NOT NULL,
	[ClassroomName] [VARCHAR](100) NOT NULL,
	[TotalChildren] [INT] NOT NULL,
	[HighNeedsChildren] [INT] NOT NULL,
	[CreatedDate] [DATETIME] NOT NULL,
	[ModifiedDate] [DATETIME] NULL,
	[EnglishLearner] [INT] NULL,
	[HispanicChildren] [INT] NULL,
	[NonHispanicChildren] [INT] NULL,
	[IndianChildren] [INT] NULL,
	[AsianChildren] [INT] NULL,
	[AfricanChildren] [INT] NULL,
	[HawaiianChildren] [INT] NULL,
	[WhiteChildren] [INT] NULL,
	[BiracialChildren] [INT] NULL,
	[OtherRaceChildren] [INT] NULL,
	[UnspecifiedChildren] [INT] NULL,
	[PreSchoolChildren] [INT] NULL,
	[GrantCPPISystemProvidersId] [INT] NULL,
	[WeeksPerYearOperation] [INT] NULL,
	[DaysPerWeekOperation] [INT] NULL,
	[HoursPerDayOperation] [INT] NULL,
	[Amount] [DECIMAL](18, 2) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


