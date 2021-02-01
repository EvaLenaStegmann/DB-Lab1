
-- MoomMissions
select 
	Spacecraft
	,[Launch date]
	,[Carrier rocket]
	,Operator
	,[Mission type] 
into SuccessfulMissions 
from MoonMissions
where Outcome = 'Successful';

GO

update SuccessfulMissions
set Operator = trim(Operator);

GO


update SuccessfulMissions
set Spacecraft = rtrim(substring(Spacecraft, 1, CHARINDEX('(', spacecraft) -1))
where spacecraft like '%(%)%';

GO 

select 
	Operator
	,[Mission type]
	,count(*) as 'Mission count'
from SuccessfulMissions
group by 
	Operator
	,[Mission type]
having count(*) > 1
order by 
	Operator
	,[Mission type];

GO

-- Users
select 
	ID
	,UserName
	,Password
	,FirstName + ' '+ LastName as 'Name'
	,Email
	,Phone
	,case
		when cast(substring(id,10,1) as int) % 2 = 0 then 'Female'
		else 'Male'
	end as 'Gender'
into NewUsers
from Users;

GO

select
	UserName
	,count(*)
from NewUsers
group by
	UserName
having count(*) > 1;

GO

update NewUsers
set UserName = 'sigpea'
where ID = '630303-4894';

update NewUsers
set UserName = 'sigpeb'
where ID = '811008-5301';

update NewUsers
set UserName = 'felbea'
where ID = '890701-1480';

GO

delete from NewUsers
where datepart(year, left(ID, 6)) < 1970 and Gender = 'female';

GO

insert into NewUsers 
values ('680326-5005'
		,'evaste'
		,newid()
		,'Eva-Lena Stegmann'
		,'elstegmann@gmail.com'
		,'072-4411159'
		,'Female');

GO

select 
	Gender
	, avg(datediff(year, left(ID, 6), getdate())) as 'Average age'
from NewUsers
group by Gender;

GO

