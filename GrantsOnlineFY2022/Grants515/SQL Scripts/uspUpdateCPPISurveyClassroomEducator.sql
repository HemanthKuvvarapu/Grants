USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspUpdateCPPISurveyClassroomEducator]    Script Date: 11/7/2018 1:20:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[uspUpdateCPPISurveyClassroomEducator]
(
@EducatorId Int,
@EducatorName varchar(300),
@Position varchar(300),
@EducationLevel varchar(300),
@MajorProgramStudy VARCHAR(100),
@AnnualSalary varchar(50)
)
AS
BEGIN
	Update CPPISurveyClassroomEducators
		set EducatorName = @EducatorName,
		    Position = @Position,
		    HighestEducationLevel = @EducationLevel,
			MajorProgramStudy = @MajorProgramStudy,
		    AnnualSalary = @AnnualSalary
	where EducatorId = @EducatorId
	
END



GO

