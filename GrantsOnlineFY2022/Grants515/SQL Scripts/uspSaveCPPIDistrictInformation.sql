USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspSaveCPPIDistrictInformation]    Script Date: 11/7/2018 1:18:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspSaveCPPIDistrictInformation] 
( @GrantApplicantID int
, @DistrictName VARCHAR(200)
, @TotalEnrollment INT
, @HighSchoolGradRate DECIMAL(18,2)
, @PctMeetExceed3rdGrade DECIMAL(18,2)
, @PctMeetExceedELA DECIMAL(18,2)
, @PctMeetExceedMath DECIMAL(18,2)
, @PctRetentionEarlyK2 DECIMAL(18,2)
, @PctSuspensionK5 DECIMAL(18,2)
) 
AS
BEGIN

	IF EXISTS (SELECT 1 FROM dbo.CPPIDistrictInformation WHERE GrantApplicantID = @GrantApplicantID)
	BEGIN

		UPDATE dbo.CPPIDistrictInformation
		SET DistrictName = @DistrictName,
			TotalEnrollment = @TotalEnrollment,
			HighSchoolGradRate = @HighSchoolGradRate,
			PctMeetExceed3rdGrade = @PctMeetExceed3rdGrade,
			PctMeetExceedELA = @PctMeetExceedELA,
			PctMeetExceedMath = @PctMeetExceedMath,
			PctRetentionEarlyK2 = @PctRetentionEarlyK2,
			PctSuspensionK5 = @PctSuspensionK5
		WHERE GrantApplicantID = @GrantApplicantID

	END   
	ELSE
    BEGIN

		INSERT INTO CPPIDistrictInformation 
		(GrantApplicantID, DistrictName, TotalEnrollment, HighSchoolGradRate, PctMeetExceed3rdGrade, PctMeetExceedELA, PctMeetExceedMath, PctRetentionEarlyK2, PctSuspensionK5)
		VALUES 
		(@GrantApplicantID, @DistrictName , @TotalEnrollment , @HighSchoolGradRate , @PctMeetExceed3rdGrade , @PctMeetExceedELA , @PctMeetExceedMath , @PctRetentionEarlyK2 , @PctSuspensionK5 )

	END
    
END



GO

