USE [migrationsample]
GO


select * from otherdb..reg



-- Step 2: Insert data from otherdb..reg
INSERT INTO [dbo].[member_registration]
           (
           [member_id]
           ,[syc_member_type_id]
           ,[usm_office_id]
           ,[syc_salutation_id]
           ,[first_name]
           ,[middle_name]
           ,[last_name]
           ,[birth_on]
           ,[birth_on_bs]
           ,[permanent_address_detail]
           ,[temporary_address_detail]
           ,[phone_no]
           ,[mobile_no]
           ,[email_address]
           ,[syc_nationality_id]
           ,[father_name_in_nepali]
           ,[mother_name_in_nepali]
           ,[spouse_name_in_nepali]
           ,[district_name_in_nepali]
           ,[vdc_municipality_name_in_nepali])
SELECT
       
      idno             -- member_id
      ,2               -- syc_member_type_id
      ,2               -- usm_office_id
      ,2               -- syc_salutation_id
      ,LTRIM(RTRIM(PARSENAME(REPLACE(cusname, ' ', '.'), 3))) AS first_name
      ,CASE 
           WHEN PARSENAME(REPLACE(cusname, ' ', '.'), 2) IS NOT NULL 
           THEN LTRIM(RTRIM(PARSENAME(REPLACE(cusname, ' ', '.'), 2))) 
           ELSE NULL 
       END AS middle_name
      ,LTRIM(RTRIM(PARSENAME(REPLACE(cusname, ' ', '.'), 1))) AS last_name
      ,NULL            -- birth_on
      ,'2045/01/01'    -- birth_on_bs
      ,cusaddress      -- permanent_address_detail
      ,cusaddress      -- temporary_address_detail
      ,telephone       -- phone_no
      ,telephone       -- mobile_no
      ,'nam@example.com' -- email_address
      ,1               -- syc_nationality_id
      ,father          -- father_name_in_nepali
      ,NULL            -- mother_name_in_nepali
      ,husbandwife     -- spouse_name_in_nepali
      ,NULL            -- district_name_in_nepali
      ,tole            -- vdc_municipality_name_in_nepali
FROM otherdb..reg;





