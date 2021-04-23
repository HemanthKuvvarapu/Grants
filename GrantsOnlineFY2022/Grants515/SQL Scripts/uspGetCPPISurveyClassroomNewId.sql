USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPISurveyClassroomNewId]    Script Date: 11/7/2018 1:17:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspGetCPPISurveyClassroomNewId]  @SystemProviderID INT, @GrantApplicantID INT, @ClassroomID INT OUTPUT
AS
BEGIN

	IF NOT EXISTS (SELECT 1 FROM dbo.CPPISurveyClassroomInformation 
			WHERE SystemProviderId = @SystemProviderID 
			AND GrantApplicantId = @GrantApplicantID)
	BEGIN

		SET @ClassroomID = (SELECT MAX(ClassroomId) + 1 
				FROM dbo.CPPISurveyClassroomInformation)
	END
    
	ELSE 
	BEGIN
    
		SET @ClassroomID = (SELECT MAX(ClassroomId) + 1 
				FROM dbo.CPPISurveyClassroomInformation 
				WHERE SystemProviderId = @SystemProviderID 
				AND GrantApplicantId = @GrantApplicantID)
	END
    
	--INSERT INTO CPPISurveyClassroomInformation 
	--(ClassroomId, SystemProviderId, QuestionId, QuestionAns, GrantApplicantID)
	--VALUES 
	--(@ClassroomID, @SystemProviderId, 'txtDummy', 'CreateNewClassroom', @GrantApplicantID)

	RETURN @ClassroomID
END

GO

