CREATE PROC dbo.uspUpdatePDFCheckListErrorCount 
(
  @GrantApplicantID INT,
  @PartNum INT,
  @ErrorCount INT
) 
AS
BEGIN
	IF @ErrorCount > 0
	BEGIN
		IF EXISTS(SELECT grantApplicantId FROM GrantStatus WHERE PartNum = @PartNum AND GrantApplicantId = @GrantApplicantId)
			UPDATE GrantStatus
				SET ErrorCount = @ErrorCount
			WHERE GrantApplicantId = @GrantApplicantID
			  AND PartNum = @PartNum
		ELSE
			INSERT INTO GrantStatus (GrantApplicantId, PartNum, ErrorCount) VALUES (@GrantApplicantId, @PartNum, @ErrorCount)
	END
	ELSE
	BEGIN
		DELETE FROM GrantStatus WHERE PartNum = @PartNum AND GrantApplicantId = @GrantApplicantId
	END
END


GO
