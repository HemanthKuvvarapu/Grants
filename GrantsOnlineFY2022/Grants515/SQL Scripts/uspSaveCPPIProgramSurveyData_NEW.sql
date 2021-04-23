USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspSaveCPPIProgramSurveyData]    Script Date: 5/13/2020 12:04:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROC [dbo].[uspSaveCPPIProgramSurveyData]
(
@SystemProviderId INT OUTPUT,
@QuestionId VARCHAR(50),
@QuestionAns VARCHAR(MAX) = NULL,
@GrantApplicantId INT,
@UpdatePeriod INT = NULL 
)
AS
-- 5/13/2020 JN Add check if any classrooms exist for Program Enrollment count of 0 

BEGIN

DECLARE @QuestionIdUpdate VARCHAR(500) = '',
		@Query VARCHAR(MAX) = ''

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


IF ((@UpdatePeriod IS NOT NULL AND @UpdatePeriod = '1' AND @QuestionId IN ('txtQ1_1_1', 'txtQ1_2_1', 'txtQ1_3_1', 'txtQ1_5_1') AND @QuestionAns = '0')	-- setting the total program = 0 enrollment
	OR (@UpdatePeriod IS NOT NULL AND @UpdatePeriod = '2' AND @QuestionId IN ('txtQ1_1_2', 'txtQ1_2_2', 'txtQ1_3_2', 'txtQ1_5_2') AND @QuestionAns = '0')
	OR (@UpdatePeriod IS NOT NULL AND @UpdatePeriod = '3' AND @QuestionId IN ('txtQ1_1_3', 'txtQ1_2_3', 'txtQ1_3_3', 'txtQ1_5_3') AND @QuestionAns = '0'))
BEGIN
-- Find any existing classrooms for this program (SystemProviderId)
	IF EXISTS (SELECT 1 FROM dbo.CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderId AND GrantApplicantId = @GrantApplicantId) 
	BEGIN

		SELECT @QuestionIdUpdate = 
			CASE WHEN @UpdatePeriod = 1 THEN '(''txtQ1_1_1''' + ', ''txtQ1_2_1''' + ', ''txtQ1_3_1''' + ', ''txtQ1_5_1'')'
				 WHEN @UpdatePeriod = 2 THEN '(''txtQ1_1_2''' + ', ''txtQ1_2_2''' + ', ''txtQ1_3_2''' + ', ''txtQ1_5_2'')'
				 WHEN @UpdatePeriod = 3 THEN '(''txtQ1_1_3''' + ', ''txtQ1_2_3''' + ', ''txtQ1_3_3''' + ', ''txtQ1_5_3'')'
				 ELSE '(''txtQ1_1_1''' + ', ''txtQ1_2_1''' + ', ''txtQ1_3_1''' + ', ''txtQ1_5_1'')'
			END 

		SELECT @Query = 'UPDATE dbo.CPPISurveyClassroomInformation SET QuestionAns = ''0'' where QuestionId in ' + @QuestionIdUpdate + ' AND SystemProviderId = ' + CONVERT(VARCHAR, @SystemProviderId) + ' AND GrantApplicantId = ' + CONVERT(VARCHAR, @GrantApplicantId)

		EXEC (@Query)
			
	END

END


GO


