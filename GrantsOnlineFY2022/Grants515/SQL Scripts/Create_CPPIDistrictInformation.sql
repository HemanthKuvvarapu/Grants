USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[CPPIDistrictInformation]    Script Date: 10/15/2018 9:09:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CPPIDistrictInformation](
	[GrantApplicantID] [int] NOT NULL,
	[DistrictName] [varchar](200) NULL,
	[TotalEnrollment] [int] NULL,
	[HighSchoolGradRate] [decimal](18, 2) NULL,
	[PctMeetExceed3rdGrade] [decimal](18, 2) NULL,
	[PctMeetExceedELA] [decimal](18, 2) NULL,
	[PctMeetExceedMath] [decimal](18, 2) NULL,
	[PctRetentionEarlyK2] [decimal](18, 2) NULL,
	[PctSuspensionK5] [decimal](18, 2) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

