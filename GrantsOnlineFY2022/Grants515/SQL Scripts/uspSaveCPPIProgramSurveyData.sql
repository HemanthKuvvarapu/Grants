USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspSaveCPPIProgramSurveyData]    Script Date: 11/7/2018 1:19:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspSaveCPPIProgramSurveyData]
(
@SystemProviderId INT output,
@QuestionId VARCHAR(50),
@QuestionAns VARCHAR(MAX) = NULL,
@GrantApplicantId INT
)
AS
BEGIN

IF (@SystemProviderId = -1)
BEGIN
	SELECT @SystemProviderId = ISNULL(MAX(systemProviderId), 0) + 1 FROM [GrantOnlineFY2016].[dbo].[CPPISurveyProgramInformation]
END

IF EXISTS(SELECT 1 FROM CPPISurveyProgramInformation
				WHERE SystemProviderId = @SystemProviderId
				  AND QuestionId = @QuestionId
				  AND GrantApplicantId = @GrantApplicantId )
BEGIN
	UPDATE CPPISurveyProgramInformation
	SET QuestionAns = @QuestionAns
	WHERE SystemProviderId = @SystemProviderId
	  AND QuestionId = @QuestionId
	  AND GrantApplicantId = @GrantApplicantId
END
ELSE
	INSERT INTO CPPISurveyProgramInformation(SystemProviderId, QuestionId, QuestionAns, GrantApplicantId)
	VALUES (@SystemProviderId, @QuestionId, @QuestionAns, @GrantApplicantId)
END

GO

