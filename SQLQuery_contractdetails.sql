select*from [postingsheet].[Contract_Hrs_South_cloud] 
WITH(NOLOCK) WHERE cast (DutyDate as date) ='2019-06-06'AND 
  LocationAutoId IN (SELECT LocationAutoId FROM G4SOMSF.postingsheet.BranchDetails WITH(NOLOCK) WHERE HubID = 'KNT')
  AND Flag <> 'D' 

select*from ContractDetails with(nolock) 
inner join So_Postdetails on So_Postdetails.SoautoId=ContractDetails.SoAutoId
inner join CustomerAssignments on CustomerAssignments.AssignmentAutoId=So_Postdetails.AssignmentAutoId
inner join CustomerDetails on CustomerDetails.CustAutoId=CustomerAssignments.CustAutoId
where cast(DutyDate as date)='2019-06-06';


select* from postingsheet.CustomerAssignment_cloud with(nolock);

select*from CustomerAssignments with(nolock)
inner join CustomerDetails on CustomerDetails.CustAutoId=CustomerAssignments.CustAutoId

select*from postingsheet.CustomerAssignment_cloud with(nolock)

select*from tbl_SchedulesIN_ActualOUT with(nolock) where ScheduleDate='2019-06-06' and Deactivate='N'

select*from postingsheet.Schedule_South_cloud with(nolock) 
WHERE cast (DutyDate as date) ='2019-06-06'AND 
  LocationAutoId IN (SELECT LocationAutoId FROM G4SOMSF.postingsheet.BranchDetails WITH(NOLOCK) WHERE HubID = 'KNT')

  Select* from (select Clientcode,Clientname,Asmtid,Shiftcode,AutoSchedulerId,EntryDate,LastModified,
 CONCAT(clientcode,Asmtid,Shiftcode) as CA from tbl_SchedulesIN_ActualOUT with(nolock) where ScheduleDate='2019-06-06' and Deactivate='N') as T1
  left join 
  (select Clientcode,Asmtid,Shiftcode,CONCAT(clientcode,Asmtid,Shiftcode) as CDA from postingsheet.Schedule_South_cloud with(nolock) 
WHERE cast (DutyDate as date) ='2019-06-06'AND 
  LocationAutoId IN (SELECT LocationAutoId FROM G4SOMSF.postingsheet.BranchDetails WITH(NOLOCK) WHERE HubID = 'KNT')) as T2
  on T2.CDA=T1.CA
  where T2.CDA is null and T1.AutoSchedulerId<>0 and T1.Shiftcode<>'0'



  select*from tbl_SchedulesIN_ActualOUT with(nolock) where Clientcode='057726' and Asmtid='A5-WHT' and Shiftcode='N'


  Select* from (select EmployeeNo,Clientcode,Clientname,Asmtid,Shiftcode,AutoSchedulerId,EntryDate,LastModified,
 CONCAT(clientcode,Asmtid,Shiftcode) as CA from tbl_SchedulesIN_ActualOUT with(nolock) where ScheduleDate='2019-06-06' and Deactivate='N') as T1
  left join 
  (select EmployeeNumber,Clientcode,Asmtid,Shiftcode,CONCAT(clientcode,Asmtid,Shiftcode) as CDA from postingsheet.Schedule_South_cloud with(nolock) 
WHERE cast (DutyDate as date) ='2019-06-06'AND 
  LocationAutoId IN (SELECT LocationAutoId FROM G4SOMSF.postingsheet.BranchDetails WITH(NOLOCK) WHERE HubID = 'KNT')) as T2
  on T2.CDA=T1.CA
  where T2.CDA is null and T1.AutoSchedulerId<>0 and T1.Shiftcode<>'0'

  



  select*from tbl_SchedulesIN_ActualOUT with(nolock) where Clientcode='057726' and Asmtid='A5-WHT' and Shiftcode='N'

  Select* from (select EmployeeNo,Clientcode,Clientname,Asmtid,Shiftcode,AutoSchedulerId,EntryDate,LastModified
  from tbl_SchedulesIN_ActualOUT with(nolock) where ScheduleDate='2019-06-06' and Deactivate='N') as T1
  right join 
  (select EmployeeNumber,Clientcode,Asmtid,Shiftcode,SchRosterAutoID from postingsheet.Schedule_South_cloud with(nolock) 
WHERE cast (DutyDate as date) ='2019-06-06'AND 
  LocationAutoId IN (SELECT LocationAutoId FROM G4SOMSF.postingsheet.BranchDetails WITH(NOLOCK) WHERE HubID = 'KNT')) as T2
  on T2.SchRosterAutoID=T1.AutoSchedulerId
  where T1.AutoSchedulerId is null and T2.SchRosterAutoID<>0 and T2.Shiftcode<>'0'
  order by T2.ClientCode
