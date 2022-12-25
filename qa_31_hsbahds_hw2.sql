create table employees(
    id serial primary key,
    employee_name varchar(50) not null
)

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

select * from roles_employee;

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
	   



	   
	   