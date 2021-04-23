USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspSaveCPPIPartStatus]    Script Date: 11/7/2018 1:18:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[uspSaveCPPIPartStatus](
@GrantApplicantId int out,
@Part int,
@Status tinyint
)
as
begin

	delete from CPPIPreRequirement where GrantApplicantId = @GrantApplicantId and Part = @Part
	
	Insert into CPPIPreRequirement (GrantApplicantId, Part, Status) values (@GrantApplicantId, @Part, @Status)
	
end


GO

