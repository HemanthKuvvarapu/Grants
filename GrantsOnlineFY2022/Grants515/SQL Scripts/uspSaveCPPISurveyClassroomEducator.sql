USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspSaveCPPISurveyClassroomEducator]    Script Date: 11/7/2018 1:20:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[uspSaveCPPISurveyClassroomEducator]
(
@ClassroomId Int,
@EducatorName varchar(300),
@Position varchar(300),
@EducationLevel varchar(300),
@MajorProgramStudy VARCHAR(100),
@AnnualSalary varchar(50),
@SystemProviderId INT,
@GrantApplicantId int
)
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM CPPISurveyClassroomEducators WHERE ClassroomID = @ClassroomID AND EducatorName = @EducatorName AND GrantApplicantID = @GrantApplicantID AND SystemProviderID = @SystemProviderId)
	BEGIN
		insert into CPPISurveyClassroomEducators
		(
			ClassroomId,
			EducatorName,
			Position,
			HighestEducationLevel,
			MajorProgramStudy,
			AnnualSalary,
			SystemProviderId,
			GrantApplicantId
		)
		values
		(
			@ClassroomId,
			@EducatorName,
			@Position,
			@EducationLevel,
			@MajorProgramStudy,
			@AnnualSalary,
			@SystemProviderId,
			@GrantApplicantId
		)
	END
    ELSE 
	BEGIN
		UPDATE CPPISurveyClassroomEducators 
		SET Position = @Position,
			HighestEducationLevel = @EducationLevel,
			MajorProgramStudy = @MajorProgramStudy,
			AnnualSalary = @AnnualSalary
		WHERE ClassroomID = @ClassroomID 
		AND EducatorName = @EducatorName
		AND GrantApplicantID = @GrantApplicantId
		AND SystemProviderID = @SystemProviderID
	END
    

END



GO

