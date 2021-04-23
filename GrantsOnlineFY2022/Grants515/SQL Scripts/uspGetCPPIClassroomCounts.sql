USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPIClassroomCounts]    Script Date: 11/7/2018 1:12:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspGetCPPIClassroomCounts] @SystemProviderId INT, @GrantApplicantId INT, @Column int
AS

BEGIN

	DECLARE @TotalPSClassCount INT,
			@Total3YearOldCount INT,
			@Total4YearOldCount INT,
			@totalUnder3YearCount INT

	IF @Column = 1	-- Current survey numbers
	BEGIN    
		select @TotalPSClassCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_1_1')

		select @Total3YearOldCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_2_1')

		select @Total4YearOldCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_3_1')

		select @TotalUnder3YearCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_5_1')
	END

    IF @Column = 2	-- March 1 survey numbers
	BEGIN    
		select @TotalPSClassCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_1_2')

		select @Total3YearOldCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_2_2')

		select @Total4YearOldCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_3_2')

		select @TotalUnder3YearCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_5_2')
	END

	IF @Column = 3	-- June 1 survey numbers
	BEGIN
    
		select @TotalPSClassCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_1_3')

		select @Total3YearOldCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_2_3')

		select @Total4YearOldCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_3_3')

		select @TotalUnder3YearCount = SUM(CONVERT(INT,QuestionAns)) FROM CPPISurveyClassroomInformation WHERE SystemProviderID = @SystemProviderID AND GrantApplicantID = @GrantApplicantId
			AND QuestionId IN ('txtQ1_5_3')
	END

	-- Return the dataset
	SELECT TotalPSClassCount = ISNULL(@TotalPSClassCount,0),
		Total3YearOldCount = ISNULL(@Total3YearOldCount,0),
		Total4YearOldCount = ISNULL(@Total4YearOldCount,0),
		TotalUnder3YearCount = ISNULL(@TotalUnder3YearCount,0)

END


GO

