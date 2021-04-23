USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[CPPIDistrictInformation]    Script Date: 10/5/2018 12:21:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CPPIDistrictInformation](
	[GrantApplicantID] [INT] NOT NULL,
	[DistrictName] [VARCHAR](200) NULL,
	[TotalEnrollment] INT NULL,
	[HighSchoolGradRate] [DECIMAL](18, 2) NULL,
	[PctMeetExceed3rdGrade] [DECIMAL](18, 2) NULL,
	[PctMeetExceedELA] [DECIMAL](18, 2) NULL,
	[PctMeetExceedMath] [DECIMAL](18, 2) NULL,
	[PctRetentionEarlyK2] [DECIMAL](18, 2) NULL,
	[PctSuspensionK5] [DECIMAL](18, 2) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


