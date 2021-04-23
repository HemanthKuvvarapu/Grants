USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspDeleteCPPISurveyClassroomEducator]    Script Date: 10/17/2018 10:16:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspDeleteCPPISurveyClassroomEducator]
(
	@EducatorId int
)
AS
BEGIN
	delete from CPPISurveyClassroomEducators 
		where EducatorId = @EducatorId
END


GO

