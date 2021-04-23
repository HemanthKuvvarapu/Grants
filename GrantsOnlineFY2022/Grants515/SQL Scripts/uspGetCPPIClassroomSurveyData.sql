USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPIClassroomSurveyData]    Script Date: 11/7/2018 1:13:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[uspGetCPPIClassroomSurveyData]
(
@ClassroomId int
)
as
begin
	Select * from CPPISurveyClassroomInformation
		where ClassroomId = @ClassroomId
		order by ClassroomId
end




GO

