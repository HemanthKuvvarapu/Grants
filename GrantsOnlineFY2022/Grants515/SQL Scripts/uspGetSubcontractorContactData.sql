USE [GrantOnlineFY2016]
GO
/****** Object:  StoredProcedure [dbo].[uspGetSubcontractorContactData]    Script Date: 10/31/2018 8:55:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[uspGetSubcontractorContactData] @SystemProviderID INT, @GrantApplicantID INT, @ContactID INT, @IsFiscalContact SMALLINT = 0
AS

	SELECT * FROM dbo.CPPISubcontractorContactData 
	WHERE SystemProviderID = @SystemProviderID 
	AND GrantApplicantID = @GrantApplicantID
	AND IsFiscalContact = @IsFiscalContact
	AND ContactID = @ContactID

