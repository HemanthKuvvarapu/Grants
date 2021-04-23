USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPIProgramInformation]    Script Date: 11/7/2018 1:16:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspGetCPPIProgramInformation] @SystemProviderID INT, @QuestionID VARCHAR(50)
AS
BEGIN

	SELECT SystemProviderId, QuestionId, QuestionAns, GrantApplicantId
	FROM dbo.CPPISurveyProgramInformation 
	WHERE  SystemProviderId = @SystemProviderID
	AND QuestionID = @QuestionID

END

GO

