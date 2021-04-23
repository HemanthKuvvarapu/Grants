USE [GrantOnlineFY2016]
GO
/****** Object:  StoredProcedure [dbo].[uspRegisterNewAgency]    Script Date: 10/2/2018 10:50:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE  [dbo].[uspRegisterNewAgency](
@AgencyName varchar(100),
@Address1 varchar(100),
@City varchar(50),
@State char(2),
@Zipcode varchar(10),
@Phone varchar(20),
@Email varchar(200),
@Username varchar(20),
@Password varchar(20),
@FiscalYear int,
@FundCode int,
@ProgramTypeId int = 0,
@GrantApplicantId int out
)
as
begin
	
	insert into GrantApplicant (AgencyName, Username, Passphrase, Address1, City,
								State, Zipcode, Phone, Email, FiscalYear, FundCode, CreatedDate, ModifiedDate, programTypeId)
								values
								(@AgencyName, @Username, @Password, @Address1, @City,
								@State, @Zipcode, @Phone, @Email, @FiscalYear, @FundCode, getDate(), GETDATE(), @ProgramTypeId)
	
	set @GrantApplicantId = @@IDENTITY

	-- Added by JN 11/30/2016 per user request
	if @FundCode = 238 --and @FiscalYear = 2017
	begin
		update GrantApplicant
		set EligibilityAmount = 250000.00
		where GrantApplicantId = @GrantApplicantId
	end
	Else if @FundCode = 239
	begin
		update GrantApplicant
		set EligibilityAmount = 25000.00
		where GrantApplicantId = @GrantApplicantId
	end
	Else if @FundCode = 705
	begin
		update GrantApplicant
		set EligibilityAmount = 300000.00
		where GrantApplicantId = @GrantApplicantId
	END
    Else if @FundCode = 325	-- Career Pathways
	begin
		update GrantApplicant
		set EligibilityAmount = 2000000.00
		where GrantApplicantId = @GrantApplicantId
	end
end