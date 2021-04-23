USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPIDistrictInformation]    Script Date: 11/7/2018 1:14:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspGetCPPIDistrictInformation] @GrantApplicantID INT
AS
BEGIN

	SELECT DistrictName, 
		TotalEnrollment, 
		HighSchoolGradRate, 
		PctMeetExceed3rdGrade, 
		PctMeetExceedELA, 
		PctMeetExceedMath, 
		PctRetentionEarlyK2, 
		PctSuspensionK5 
	FROM dbo.CPPIDistrictInformation
	WHERE GrantApplicantID = @GrantApplicantID

END


GO

