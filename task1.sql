create table employee_details ("EmployeeID" serial primary key,
	"FirstName" varchar(50) not null,
	"LastName" varchar(50),
	"Email" varchar(100) not null unique,
	"PhoneNumber" varchar(15) not null,
	"HireDate" date,
	"Salary" decimal(10,2),
	"DepartmentID" int,
	"IsActive" bool,
	"JobTitle" varchar(100)
)

insert into employee_details ("FirstName", "LastName", "Email", "PhoneNumber", "HireDate", "Salary", "DepartmentID", "IsActive", "JobTitle")
	values 
	('Ankush', 'lanjewar', 'lanjewarankush1802@gmail.com', '9309145683', '2024-08-01', 72000.00, 1, 'yes', 'Data Analytics'),
	('Aditya', 'Mohile', 'adityamohile@gmail.com', '8605255520', '2024-08-03', 62000.00, 2, 'yes', 'Freelancer'),
	('Deepam', 'Bhasme', 'deepambhasme@gmail.com', '9322893663', '2024-09-15', 71000.00, 1, 'yes', 'Data Analytics'),
	('Sanket', 'Kirpal', 'sanketkirpal@gmail.com', '9309843434', '2024-11-24', 70000.00, 1, 'no', 'Data Analytics'),
	('Manish', 'Thakre', 'manishthakre@gmail.com', '9850341692', '2024-12-08', 60000.00, 2, 'yes', 'Freelancer');

copy employee_details("EmployeeID", "FirstName", "LastName", "Email", "PhoneNumber", "HireDate", "Salary", "DepartmentID", "IsActive", "JobTitle")
	from 'C:/Users/Ankush/Desktop/ARC Technologies Nagpur/SQL/task1/Employee_Details.csv'
	delimiter ',' csv header;

update employee_details set "DepartmentID" = 0 where "IsActive" = 'false';

update employee_details set "Salary" = "Salary" * 1.08
	where "IsActive" = 'false' and "DepartmentID" = 0
	and "JobTitle" in ('HR Manager', 'Financial Analyst', 'Business Analyst', 'Data Analyst');

select "FirstName" as Name, "LastName" as Surname from employee_details
	where "Salary" between 30000 and 50000;

select * from employee_details where "FirstName" like 'A%';

delete from employee_details where "EmployeeID" between 1 and 5;

alter table employee_details rename to employee_database;

alter table employee_database rename column "FirstName" to "Name";

alter table employee_database rename column "LastName" to "Surname";

alter table employee_database add column "State" varchar;

update employee_database set "State" = 'India' where "IsActive" = 'true';

update employee_database set "State" = 'USA' where "IsActive" = 'false';

alter table employee_database alter column "State" set not null;