USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPISurveyClassroomEducators]    Script Date: 11/7/2018 1:17:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[uspGetCPPISurveyClassroomEducators]
(
@ClassroomId Int
)
AS
BEGIN
	Select * from CPPISurveyClassroomEducators
	where ClassroomId = @ClassroomId 
	AND ClassroomId <> -1
	order by EducatorId
END



GO

