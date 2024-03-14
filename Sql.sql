 
 
 -- 1. Напишите запрос, который выводит идентификатор сотрудника, его имя и фамилию, а также категорию зарплаты на основе следующих условий:

-- Если зарплата меньше 5000, категория "Низкая".
-- Если зарплата от 5000 до 10000, категория "Средняя".
-- Если зарплата больше 10000, категория "Высокая".

use gt171023;

select
employee_id, first_name, last_name,
   
case
	when salary < 5000 then 'Низкая'
	when salary >= 5000 and salary <= 10000 then 'Средняя'
	when salary > 10000 then 'Высокая'
end as salary_category
    
from employees;



-- 2.Определение размера премии сотрудникам:
-- Напишите запрос, который выводит идентификатор сотрудника, его имя и фамилию, а также размер премии на основе следующих условий:
-- Если зарплата меньше 5000, премия составляет 10% от зарплаты.
-- Если зарплата от 5000 до 10000, премия составляет 15% от зарплаты.
-- Если зарплата больше 10000, премия составляет 20% от зарплаты.

select
employee_id, first_name, last_name,

case
	when salary < 5000 then salary * 1.10
	when salary >= 5000 and salary <= 10000 then salary * 1.15
	when salary > 10000 then salary * 1.20
end as bonus

from employees;


-- 3.Получить список стран с указанием их региона и обозначением страны "EU" для стран Европейского союза, "Non-EU" для остальных стран.

use hr;

select 
country_name , region_id, 

case
	when region_id in ( 1 ) then "EU"
	when region_id in ( 2,4,3 ) then "Non-EU"
end as country_id

from countries;


-- 4. Получить список стран с указанием количества символов в их названиях.

select 
country_name , 
length(country_name) as symbols
from countries;


-- 5. Получить список стран и их первые три символа в названии

select 
country_name , 
left(country_name,3)
from countries;



-- 6.Получить список сотрудников с заменой их email на "Confidential", если он содержит слово "sqltutorial"

use gt171023;

select employee_id,first_name, last_name,

case
	when email like "%sqltutorial%" then "Confidential"
    else email
end as email

from employees;


-- 7 Получить список сотрудников и указать их email в нижнем регистре.

select employee_id,first_name, last_name,
lower(email)
from employees;


-- 8.Получить список сотрудников(firstname, lastname) с указанием их должности(job_title).

select first_name, last_name,job_id as job_title
from employees;

-- 9.Получить список отделов(department_name) и их названий с указанием местоположения(city).

use hr;

select department_name , city
from departments
join locations
on departments.location_id = locations.location_id;


-- 10.Получить список отделов(departmentname) и их менеджеров(firstname, last_name).

select department_name, first_name, last_name
from departments
join employees
on departments.department_id = employees.department_id;

-- 11.Получить список сотрудников(firstname, lastname) с указанием их департамента(department_name), отсортированный по департаменту.

select first_name, last_name, department_name
from departments
join employees
on departments.department_id = employees.department_id
order by departments.department_name;


-- 12. Получить список сотрудников(firstname, lastname)  и их менеджеров(firstname, lastname) 
select
    t1.first_name as employee_firstname,
    t1.last_name as employee_lastname,
    t2.first_name as manager_firstname,
    t2.last_name as manager_lastname
from  employees t1
   join employees t2 on t1.manager_id = t2.employee_id;
   
  -- 13. Получить список стран, где местоположение находится в США.
  
select 
t1.country_name,
t3.region_name
from countries t1
inner join locations t2
on t1.country_id= t2.country_id
inner join regions t3
on t1.region_id=t3.region_id
where t3.region_name= 'Americas';

 

  
  
  
  
  
  
  
  
  
















































