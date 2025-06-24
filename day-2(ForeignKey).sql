-- use database to work on it
use skp;

-- Table-1 {Department (Parent Table)}
create table Department(
id int primary key,    -- primary key = unique + not null
name varchar(100),
description text
);

-- display table data
select * from Department;

-- insert 6 records
insert into Department
values
(101, 'English', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(102, 'Finance', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(103, 'History', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(104, 'Maths', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(105, 'Commerce', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(106, 'Computer', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.');


-- Table-2 {Faculty(Child Table)}
 create table Faculty(
 id int primary key,
 name varchar(100),
 dept_id int,
 foreign key (dept_id) references department(id)
 );

-- display table data
select * from faculty;

-- insert values
insert into faculty
values
(1,'Dr. Prashant',101),
(2,'Dr. Ritu',103),
(3,'Dr. Rohit',104),
(4,'Dr. Prashant',105),
(5,'Dr. Prateek',106),
(6,'Dr. Asha',103),
(7,'Dr. Ritvik',null),
(8,'Dr. Sameer',102),
(9,'Dr. Priya',105),
(10,'Dr. Namita',101);














