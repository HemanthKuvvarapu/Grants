USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPIPartStatus]    Script Date: 11/7/2018 1:14:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[uspGetCPPIPartStatus](
@GrantApplicantId int
)
as
begin

	select * from CPPIPreRequirement where GrantApplicantId = @GrantApplicantId
	
end

GO

