USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPIProgramSurveyData]    Script Date: 11/7/2018 1:16:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[uspGetCPPIProgramSurveyData]
(
@SystemProviderId INT
)
AS
BEGIN
	SELECT * FROM CPPISurveyProgramInformation
		WHERE SystemProviderId = @SystemProviderId
END





GO

