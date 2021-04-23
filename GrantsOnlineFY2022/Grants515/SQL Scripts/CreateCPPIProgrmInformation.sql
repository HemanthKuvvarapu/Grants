USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[CPPIProgramInformation]    Script Date: 10/3/2018 3:02:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CPPIProgramInformation](
	[GrantApplicantId] [INT] NOT NULL,
	[ProgramTypeId] [INT] NULL,
	[IsHeadStartProgram] [BIT] NULL,
	[CPPIFundedPreschoolClassrooms] [INT] NULL,
	[NonCPPIFundedPreschoolClassrooms] [INT] NULL,
	[PreschoolChildrenEnrolled] [INT] NULL,
	[PreschoolChildrenProjectedEnrollment] [INT] NULL,
	[ChildrenWithFinAssistance] [INT] NULL,
	[ProjectedChildrenWithFinAssistance] [INT] NULL,
	[ChildrenWithIEP] [INT] NULL,
	[CPPIChildrenWithIEP] [INT] NULL,
	[AssessmentInstrumentId] [INT] NULL,
	[AssessmentInstrumentNotes] [VARCHAR](3000) NULL,
	[CPPIVersionId] [INT] NULL,
	[CreatedDate] [DATETIME] NOT NULL,
	[ModifiedDate] [DATETIME] NULL,
	[IsAccredited] [INT] NULL,
	[AccreditationTypeId] [INT] NULL,
	[AccreditationNumber] [VARCHAR](50) NULL,
	[AccreditationExpirationDate] [DATETIME] NULL,
	[Children3YearOld] [INT] NULL,
	[Children4YearOld] [INT] NULL,
	[Children5YearOld] [INT] NULL,
	[IsToolLicensed] [INT] NULL,
	[IsProgramLicensed] [BIT] NULL,
	[ProgramNumber] [INT] NULL,
	[QRISLevel] [INT] NULL,
	[GrantCPPISystemProvidersId] [INT] IDENTITY(1,1) NOT NULL,
	[ProgramName] [VARCHAR](100) NULL,
	[AccreditationEarnDate] [DATETIME] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


