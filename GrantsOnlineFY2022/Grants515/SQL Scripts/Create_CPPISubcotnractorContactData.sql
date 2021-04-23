USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[CPPISubcontractorContactData]    Script Date: 10/29/2018 3:51:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CPPISubcontractorContactData](
	[ContactID] [INT] IDENTITY(100,1) NOT NULL,
	[GrantApplicantID] [INT] NOT NULL,
	[SystemProviderID] [INT] NOT NULL,
	[BudgetNarrativeID] [INT] NULL,
	[IsFiscalContact] [INT] NULL,
	[SubcontractorName] [VARCHAR](100) NULL,
	[SubcontractorContactName] [VARCHAR](100) NOT NULL,
	[SubcontractorAddress1] [VARCHAR](50) NULL,
	[SubcontractorAddress2] [VARCHAR](50) NULL,
	[SubcontractorCity] [VARCHAR](50) NULL,
	[SubcontractorState] [CHAR](2) NULL,
	[SubcontractorZipcode] [VARCHAR](10) NULL,
	[SubcontractorPhone] [VARCHAR](20) NULL,
	[SubcontractorFAX] [VARCHAR](20) NULL,
	[SubcontractorEmail] [VARCHAR](100) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


