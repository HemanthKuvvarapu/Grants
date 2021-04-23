SELECT * FROM dbo.GrantApplicant
WHERE fundcode = 515 AND fiscalyear = 2021

--CPPI-515
--Boston - $500,000
--Lowell - $625,000
--New Bedford - $625,000
--North Adams - $335,000
--Somerville - $625,000
--Springfield - $625,000

UPDATE dbo.GrantApplicant 
SET EligibilityAmount = 500000 
WHERE fundcode = 515 AND fiscalyear = 2021
AND AgencyName LIKE 'Boston%'
AND EligibilityAmount = 650000

UPDATE dbo.GrantApplicant 
SET EligibilityAmount = 625000 
WHERE fundcode = 515 AND fiscalyear = 2021
AND AgencyName LIKE 'Lowell%'
AND EligibilityAmount = 650000

UPDATE dbo.GrantApplicant 
SET EligibilityAmount = 625000 
WHERE fundcode = 515 AND fiscalyear = 2021
AND AgencyName LIKE 'New Bedford%'
AND EligibilityAmount = 650000

UPDATE dbo.GrantApplicant 
SET EligibilityAmount = 335000 
WHERE fundcode = 515 AND fiscalyear = 2021
AND AgencyName LIKE 'North Adam%'
AND EligibilityAmount = 450000

UPDATE dbo.GrantApplicant 
SET EligibilityAmount = 625000 
WHERE fundcode = 515 AND fiscalyear = 2021
AND AgencyName LIKE 'Somerville%'
AND EligibilityAmount = 650000

UPDATE dbo.GrantApplicant 
SET EligibilityAmount = 625000 
WHERE fundcode = 515 AND fiscalyear = 2021
AND AgencyName LIKE 'Springfield%'
AND EligibilityAmount = 650000



SELECT * FROM dbo.GrantApplicant
WHERE fundcode = 615 AND fiscalyear = 2021

--CPPI-Cohort 2- 615
--Holyoke - $625,000
--Lawrence - $625,000
--Northampton - $625,000

UPDATE dbo.GrantApplicant 
SET EligibilityAmount = 625000 
WHERE fundcode = 615 AND fiscalyear = 2021
AND AgencyName LIKE 'Holyoke%'
AND EligibilityAmount = 750000

UPDATE dbo.GrantApplicant 
SET EligibilityAmount = 625000 
WHERE fundcode = 615 AND fiscalyear = 2021
AND AgencyName LIKE 'Lawrence%'
AND EligibilityAmount = 1025000.00

UPDATE dbo.GrantApplicant 
SET EligibilityAmount = 625000 
WHERE fundcode = 615 AND fiscalyear = 2021
AND AgencyName LIKE 'Northamp%'
AND EligibilityAmount = 750000

