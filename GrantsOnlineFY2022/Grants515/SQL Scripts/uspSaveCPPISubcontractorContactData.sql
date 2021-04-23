USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspSaveCPPISubcontractorContactData]    Script Date: 11/7/2018 1:19:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspSaveCPPISubcontractorContactData] 
@ContactID INT, @GrantApplicantID INT, @SystemProviderID INT, 
@BudgetNarrativeID INT, @SubcontractorName VARCHAR(100), @SubcontractorContactName VARCHAR(100), 
@SubContractorAddress1 VARCHAR(100), @SubContractorAddress2 VARCHAR(100), @SubcontractorCity VARCHAR(50), @SubcontractorState CHAR(2), @SubcontractorZipcode VARCHAR(10),
@SubcontractorPhone VARCHAR(20), @SubcontractorFax VARCHAR(20), @SubcontractorEmail VARCHAR(100), @IsFiscalContact INT

AS

	IF @ContactID <> -1
	BEGIN
    
		UPDATE dbo.CPPISubcontractorContactData
		SET SubContractorName = @SubcontractorName,
			SubcontractorEmail = @SubcontractorEmail,
			SubcontractorPhone = @SubcontractorPhone,
			SubcontractorContactName = @SubcontractorContactName,
			SubcontractorAddress1 = @SubContractorAddress1,
			SubcontractorAddress2 = @SubContractorAddress2,
			SubcontractorCity = @SubcontractorCity,
			SubcontractorState = @SubcontractorState,
			SubcontractorZipcode = @SubcontractorZipcode,
			SubcontractorFax = @SubcontractorFax,
			IsFiscalContact = @IsFiscalContact,
			BudgetNarrativeID = @BudgetNarrativeID
		WHERE ContactID = @ContactID
			AND GrantApplicantID = @GrantApplicantID
			AND SystemProviderID = @SystemProviderID

		RETURN @ContactID

	END
    
	ELSE
    BEGIN
    
		INSERT INTO dbo.CPPISubcontractorContactData
			(GrantApplicantID, BudgetNarrativeID, SystemProviderID, SubcontractorName, SubcontractorEmail, SubcontractorPhone, SubcontractorContactName, 
			SubcontractorAddress1, SubcontractorAddress2, SubcontractorCity, SubcontractorState, SubcontractorZipcode, SubcontractorFax, IsFiscalContact)

		VALUES (@GrantApplicantID,
				@BudgetNarrativeID,
				@SystemProviderID,
				@SubcontractorName,
				@SubcontractorEmail,
				@SubcontractorPhone,
				@SubcontractorContactName,
				@SubcontractorAddress1,
				@SubcontractorAddress2,
				@SubcontractorCity,
				@subcontractorState,
				@SubcontractorZipcode,
				@SubcontractorFax,
				@IsFiscalContact)

		RETURN @@IDENTITY
	END
    




GO

