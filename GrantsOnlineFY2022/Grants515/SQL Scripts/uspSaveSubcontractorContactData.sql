USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspSaveSubcontractorContactData]    Script Date: 10/22/2018 2:14:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspSaveSubcontractorContactData] 
@BudgetNarrativeID INT, @GrantApplicantID INT, @SubcontractorName VARCHAR(100), @SubContractorEmail VARCHAR(100), @SubcontractorPhone VARCHAR(20), @SubcontractorFiscalContactName VARCHAR(100),
@SubContractorAddress1 VARCHAR(100), @SubContractorAddress2 VARCHAR(100), @SubcontractorCity VARCHAR(50), @SubcontractorState CHAR(2), @SubcontractorZipcode VARCHAR(10), @SubcontractorFax VARCHAR(20)

AS

	IF EXISTS (SELECT 1 FROM dbo.SubcontractorContactData WHERE BudgetNarrativeID = @BudgetNarrativeID AND GrantApplicantID = @GrantApplicantID)
	BEGIN
    
		UPDATE dbo.SubcontractorContactData
		SET SubContractorName = @SubcontractorName,
			SubcontractorEmail = @SubcontractorEmail,
			SubcontractorPhone = @SubcontractorPhone,
			SubcontractorFiscalContact = @SubcontractorFiscalContactName,
			SubcontractorAddress1 = @SubContractorAddress1,
			SubcontractorAddress2 = @SubContractorAddress2,
			SubcontractorCity = @SubcontractorCity,
			SubcontractorState = @SubcontractorState,
			SubcontractorZipcode = @SubcontractorZipcode,
			SubcontractorFax = @SubcontractorFax
		WHERE BudgetNarrativeID = @BudgetNarrativeID 
		AND GrantApplicantID = @GrantApplicantID

		RETURN @BudgetNarrativeID

	END
    
	ELSE
    BEGIN
    
		INSERT INTO dbo.SubcontractorContactData
			(BudgetNarrativeID, GrantApplicantID, SubcontractorName, SubcontractorEmail, SubcontractorPhone, SubcontractorFiscalContact, 
			SubcontractorAddress1, SubcontractorAddress2, SubcontractorCity, SubcontractorState, SubcontractorZipcode, SubcontractorFax)
		VALUES (@BudgetNarrativeID,
				@GrantApplicantId,
				@SubcontractorName,
				@SubcontractorEmail,
				@SubcontractorPhone,
				@SubcontractorFiscalContactName,
				@SubcontractorAddress1,
				@SubcontractorAddress2,
				@SubcontractorCity,
				@subcontractorState,
				@SubcontractorZipcode,
				@SubcontractorFax)

		RETURN @@IDENTITY
	END
    



GO

