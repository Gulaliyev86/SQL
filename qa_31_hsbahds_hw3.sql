create table employees(
    id serial primary key,
    employee_name varchar(50) not null
);

select * from employees;

insert into employees(employee_name)
values ('Irina'),
	   ('Ivan'),
	   ('Anstasia'),
	   ('Diana'),
	   ('Maksim'),
	   ('Nika'),
	   ('Абрам'),
	   ('Емельян'),
	   ('Захар'),
	   ('Илья'),
	   ('Лев'),
	   ('Михаил'),
	   ('Никита'),
	   ('Пётр'),
	   ('Степан'),
	   ('Тимур'),
	   ('Богдан'),
	   ('Юлия'),
	   ('София'),
	   ('Яна'),
	   ('Марк'),
	   ('Варвара'),
	   ('Евгений'),
	   ('Елизавета'),
	   ('Даниэль'),
	   ('Мария'),
	   ('Максим'),
	   ('Есения'),
	   ('Александр'),
	   ('Андрей'),
	   ('Ксения'),
	   ('Ксения'),
	   ('Артемий'),
	   ('Агата'),
	   ('Макар'),
	   ('Диана'),
	   ('Полина'),
	   ('Денис'),
	   ('Савелий'),
	   ('Арина'),
	   ('Кира'),
	   ('Дарья'),
	   ('Виктория'),
	   ('Моника'),
	   ('Ксения'),
	   ('Валерия'),
	   ('Нина'),
	   ('Алиса'),
	   ('Екатерина'),
	   ('Ольга'),
	   ('Мирон'),
	   ('Павел'),
	   ('Руслан'),
	   ('Филипп'),
	   ('Роман'),
	   ('Анна'),
	   ('Олеся'),
	   ('Филипп'),
	   ('Владимир'),
	   ('Эмилия'),
	   ('Артём'),
	   ('Константин'),
	   ('Ярослав'),
	   ('Милана'),
	   ('Виктор'),
	   ('Таисия'),
	   ('Александра'),
	   ('Максим'),
	   ('Максим'),
	   ('Максим');
	  
create table salary(
		id serial  primary key,
		monthly_salary int not null
)

insert into salary(monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);
	  
select * from salary;

create table employee_salary(
		id serial primary key,
		employee_id int not null unique,
		salary_id int not null,
		foreign key (employee_id)
			references employees(id),
		foreign key (salary_id)
			references salary(id)
);

insert into employee_salary(employee_id, salary_id)
values (3, 7),
	   (1, 4),
	   (5, 9),
	   (40, 12),
	   (2, 5),
	   (6, 2),
	   (7, 14),
	   (34, 4),
	   (22, 13),
	   (37, 10);




drop table employee_salary;

select * from employee_salary;

create table roles(
		 id serial primary key,
		 role_name varchar(30) not null unique
);

insert into roles(role_name)
values  ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
	    ('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
		  
select * from roles;

drop table roles;

delete table rules;

create table roles_employee(
		id serial  primary key,
		employee_id int not null unique,
		role_id int not null, 
		foreign key (employee_id)
			references employees(id),
		foreign key (role_id)
			references roles(id)
);

select count(*) from roles_employee;

insert into roles_employee(employee_id, role_id)
values (2, 4),
	   (4, 2),
	   (1, 4),
	   (7, 20),
	   (41, 19),
	   (3, 12),
	   (8, 11),
	   (9, 10),
	   (10, 2),
	   (40, 12),
	   (5, 4),
	   (42, 7),
	   (64, 4),
	   (44, 2),
	   (43, 6),
	   (11, 7),
	   (12,9),
	   (13, 12),
	   (14,20),
	   (15, 3),
	   (16, 4),
	   (17, 9),
	   (18,5),
	   (19,2),
	   (20, 3),
	   (21, 4),
	   (22, 10),
	   (23, 11),
	   (24, 10),
	   (25, 9),
	   (26, 10),
	   (27, 4),
	   (28, 2),
	   (29, 5),
	   (30, 7),
	   (31, 2),
	   (32, 1),
	   (33, 10),
	   (34, 5),
	   (35, 9);
	  
drop table roles_employee;

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary 
from employee_salary 
join employees
on employee_salary.employee_id = employees.id 
join salary 
on employee_salary.salary_id  = salary.id 
order by employee_name;
-----------------------------------------------------------------------
select employee_name,monthly_salary from employee_salary e
join employees es on e.id=es.id
join salary s on s.id=e.salary_id
order by employee_name;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary 
from employee_salary 
join employees
on employee_salary.employee_id = employees.id 
join salary 
on employee_salary.salary_id  = salary.id 
where salary.monthly_salary<2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary 
from employee_salary 
join salary 
on employee_salary.salary_id = salary.id;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary 
from employee_salary 
join salary 
on employee_salary.salary_id = salary.id
where salary.monthly_salary<2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name, salary.monthly_salary 
from employee_salary 
full join employees
on employee_salary.employee_id = employees.id 
full join salary 
on employee_salary.salary_id  = salary.id 
where salary.id is null

-- 6. Вывести всех работников с названиями их должности.
select es.employee_name, rs.role_name from roles_employee re
join employees es on re.employee_id = es.id
join roles rs on re.role_id = rs.id 
order by employee_name;

-- 7. Вывести имена и должность только Java разработчиков.
select es.employee_name, rs.role_name from roles_employee re
full join employees es on re.employee_id = es.id
full join roles rs on re.role_id = rs.id 
where rs.role_name like '%Java%';

-- 8. Вывести имена и должность только Python разработчиков.
select es.employee_name, rs.role_name from roles_employee re
full join employees es on re.employee_id = es.id
full join roles rs on re.role_id = rs.id 
where rs.role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select es.employee_name, rs.role_name from roles_employee re
full join employees es on re.employee_id = es.id
full join roles rs on re.role_id = rs.id 
where rs.role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.
select es.employee_name, rs.role_name from roles_employee re
full join employees es on re.employee_id = es.id
full join roles rs on re.role_id = rs.id 
where rs.role_name like '%Manual%';

-- 11. Вывести имена и должность автоматизаторов QA
select es.employee_name, rs.role_name from roles_employee re
full join employees es on re.employee_id = es.id
full join roles rs on re.role_id = rs.id 
where rs.role_name like '%Automation%';

-- 12. Вывести имена и зарплаты Junior специалистов
select es.employee_name, s.monthly_salary 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
select es.employee_name, s.monthly_salary 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select es.employee_name, s.monthly_salary 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select s.monthly_salary 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Java%';

-- 16. Вывести зарплаты Python разработчиков
select s.monthly_salary 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select es.employee_name, s.monthly_salary 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select es.employee_name, s.monthly_salary 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Middle JavaScript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select es.employee_name, s.monthly_salary 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Senior Java%';

-- 20. Вывести зарплаты Junior QA инженеров
select s.monthly_salary 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Junior%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(s.monthly_salary) 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum(s.monthly_salary) 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров
select min(s.monthly_salary) 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
select max(s.monthly_salary) 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%QA%';

-- 25. Вывести количество QA инженеров
select count(ems.id) 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(ems.id) 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count(ems.id) 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(s.monthly_salary) 
from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where rs.role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select es.employee_name, rs.role_name, s.monthly_salary from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
order by(s.monthly_salary);

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select es.employee_name, rs.role_name, s.monthly_salary from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where s.monthly_salary between 1700 and 2300
order by(s.monthly_salary);

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select es.employee_name, rs.role_name, s.monthly_salary from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where s.monthly_salary<2300
order by(s.monthly_salary);

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select es.employee_name, rs.role_name, s.monthly_salary from employee_salary ems
join employees es on ems.employee_id = es.id 
join salary s on ems.salary_id  = s.id
join roles rs on ems.id = rs.id 
where s.monthly_salary=1100 or s.monthly_salary=1500 or s.monthly_salary=2000
order by(s.monthly_salary);
