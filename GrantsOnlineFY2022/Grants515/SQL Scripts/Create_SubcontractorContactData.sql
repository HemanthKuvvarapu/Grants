USE [GrantOnlineFY2016]
GO

/****** Object:  Table [dbo].[SubcontractorContactData]    Script Date: 10/22/2018 3:14:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SubcontractorContactData](
	[BudgetNarrativeID] [INT] NOT NULL,
	[GrantApplicantID] [INT] NOT NULL,
	[SubcontractorName] [VARCHAR](100) NOT NULL,
	[SubContractorFiscalContact] [VARCHAR](100) NULL,
	[SubContractorAddress1] [VARCHAR](50) NULL,
	[SubContractorAddress2] [VARCHAR](50) NULL,
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


