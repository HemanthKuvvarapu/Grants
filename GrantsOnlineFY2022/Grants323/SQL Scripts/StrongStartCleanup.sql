
SELECT * FROM dbo.GrantApplicant 
--WHERE AgencyName = 'University of Massachusetts Boston'
WHERE fundcode = 323 AND fiscalyear = 2021
--8153

DECLARE @fundcode int
declare @fiscalyear int

set @fundcode = 323
set @fiscalyear = 2021

update grantapplicant
	set [Passphrase] = ''
       ,[LatestSubmitDate] = null
      ,[MiscDocsPrinted] = null
      ,[FirstSubmitDate] = null
      ,[TaxId] = null
      ,[Amendment1SubmitDate] = null
      ,[Amendment2SubmitDate] = null
    where fundcode = @fundcode
      and fiscalyear = @fiscalyear
      
update grantuser
	set [password] = ' '
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
delete from CheckList
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
delete from BudgetNarrative
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
delete from BudgetNarrativeAmendment
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
delete from GrantContact
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)

	
delete from GrantLanguage
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
delete from GrantProposal
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
		
delete from GrantProposalTown
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
delete from GrantStatus
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
delete from GrantUploadedFiles
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
		
delete from NarrativeQuestions
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
delete from ProjectedDeliverables
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)
		
delete from RequiredDocuments
	where grantapplicantid in 
		(select grantapplicantid 
			from grantapplicant
			where fundcode = @fundcode
			  and fiscalyear = @fiscalyear 
		)