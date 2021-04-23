USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPIProgramSurveyData]    Script Date: 10/15/2018 10:08:47 AM ******/
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

