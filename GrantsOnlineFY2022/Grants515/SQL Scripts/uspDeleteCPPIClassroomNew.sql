USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspDeleteCPPIClassroomNew]    Script Date: 10/11/2018 2:21:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspDeleteCPPIClassroomNew]
(
	@ClassroomId INT
)
AS
BEGIN	
	DELETE dbo.CPPISurveyClassroomInformation WHERE ClassroomId = @ClassroomId
END

GO

