--1. Создать схему topic_2:
CREATE SCHEMA topic_2;

--2. Создать таблицу topic_2.salary в новой схеме с полями employee_nm, department_nm, salary.
-- Какого типа должны быть поля? Какой должна быть размерность этих полей?
create table topic_2.salary (
    employee_nm varchar,
    department_nm varchar,
    salary integer,
    UNIQUE (employee_nm, department_nm, salary)
);


--3. Проверить, что таблица создана, написав запрос к системной таблице information_schema.tables.

select *
from information_schema.tables
limit 10;

--4. Заполнить таблицу 5 тестовыми строками.

insert into topic_2.salary VALUES ('Андрей', 'ФПМИ', 300);

select *
from topic_2.salary;

delete
from topic_2.salary
where employee_nm = 'Андрей';


INSERT INTO topic_2.salary
VALUES ('Ken Sánchez', 'HR', 78);
INSERT INTO topic_2.salary
VALUES ('TerriLee Duffy', 'HR', 95);
INSERT INTO topic_2.salary
VALUES ('Roberto Tamburello', 'HR', 382);
INSERT INTO topic_2.salary
VALUES ('Rob Walters', 'HR', 16);
INSERT INTO topic_2.salary
VALUES ('Gail Erickson', 'HR', 1079);

--5. Добавить в таблицу новое поле comment.
alter table topic_2.salary add comment varchar;


--6. Написать запрос для обновления поля с комментарием. Для каждой строки необходимо указать свой комментарий.
-- Подумайте, как это сделать одной операций UPDATE, а не пятью разными запросами.

-- 1.
UPDATE topic_2.salary
SET comment = CASE
WHEN employee_nm = 'Ken Sánchez' THEN 'lazy'
WHEN employee_nm = 'TerriLee Duffy' THEN 'smart'
WHEN employee_nm = 'Roberto Tamburello' THEN 'stupid'
WHEN employee_nm = 'Rob Walters' THEN 'dumb'
WHEN employee_nm = 'Gail Erickson' THEN 'crazy'
END
WHERE employee_nm IN (SELECT employee_nm FROM topic_2.salary);

-- 2.
INSERT INTO topic_2.salary (employee_nm, department_nm, salary, comment) VALUES
('Ken Sánchez', 'HR', 78, 'lazy'),
('TerriLee Duffy', 'HR', 95, 'stupid'),
('Roberto Tamburello', 'HR', 382, 'dumb'),
('Rob Walters', 'HR', 16, 'smart'),
('Gail Erickson', 'HR', 1079, 'crazy')
ON CONFLICT (employee_nm, department_nm, salary) DO UPDATE SET comment = excluded.comment;



--7. Удалить одну из строк таблицы на выбор.

delete
from topic_2.salary
where employee_nm = 'Ken Sánchez';

--8. Очистить таблицу, используя оператор группы DDL.

truncate table topic_2.salary;

--9. Удалить из таблицы столбец с комментарием.

alter table topic_2.salary drop comment;

--10. Запустить запросы со вставками данных.

INSERT INTO topic_2.salary(employee_nm, department_nm, salary)
VALUES ('Ken Sánchez', 'HR', 78),
        ('TerriLee Duffy', 'HR', 95),
        ('Roberto Tamburello', 'HR', 382),
        ('Rob Walters', 'HR', 16),
        ('Gail Erickson', 'HR', 1079),
        ('Jossef Gibson', 'HR', 102),
        ('Dylan Miller', 'HR', 486),
        ('Diane Margheim', 'HR', 1953),
        ('Gigi Matthew', 'SALE', 49),
        ('Michael Raheem', 'SALE', 71),
        ('Ovidiu Cracium', 'SALE', 94),
        ('Thierry Hers', 'SALE', 61),
        ('Janice Galvin', 'SALE', 972),
        ('Michael Sullivan', 'SALE', 849),
        ('Sharon Salavaria', 'SALE', 715),
        ('David Michael', 'SALE', 94),
        ('Kevin Brown', 'R&D', 891),
        ('John Wood', 'R&D', 1486),
        ('Mary Dempsey', 'R&D', 176),
        ('Wanida Benshoof', 'R&D', 49),
        ('Terry Eminhizer', 'R&D', 381),
        ('Sariya Harnpadoungsataya', 'R&D', 946),
        ('Mary Gibson', 'R&D', 486),
        ('Jill Williams', 'R&D', 19),
        ('James Hamilton', 'R&D', 46),
        ('Peter Krebs', 'R&D', 445),
        ('Jo Brown', 'R&D', 666),
        ('Guy Gilbert', 'MANAGEMENT', 482),
        ('Mark McArthur', 'MANAGEMENT', 12),
        ('Britta Simon', 'MANAGEMENT', 194),
        ('Margie Shoop', 'MANAGEMENT', 481),
        ('Rebecca Laszlo', 'MANAGEMENT', 16),
        ('Annik Stahl', 'MANAGEMENT', 134),
        ('Suchitra Mohan', 'R&D', 87),
        ('Brandon Heidepriem', 'R&D', 111),
        ('Jose Lugo', 'R&D', 185),
        ('Chris Okelberry', 'R&D', 94),
        ('Kim Abercrombie', 'R&D', 348),
        ('Ed Dudenhoefer', 'R&D', 68),
        ('JoLynn Dobney', 'R&D', 346),
        ('Bryan Baker', 'R&D', 185),
        ('James Kramer', 'SUPPORT', 965),
        ('Nancy Anderson', 'SUPPORT', 500),
        ('Simon Rapier', 'SUPPORT', 133),
        ('Thomas Michaels', 'SUPPORT', 200),
        ('Eugene Kogan', 'SUPPORT', 144),
        ('Andrew Hill', 'SUPPORT', 300),
        ('Ruth Ellerbrock', 'SUPPORT', 179),
        ('Barry Johnson', 'HEAD', 10000),
        ('Sidney Higa', 'HEAD', 1),
        ('Max Lanson', 'PR', 150);

--11. Вывести все значения из таблицы topic_2.salary.

select *
from topic_2.salary;

--12. Найти всех сотрудников с зарплатой выше 500.

select employee_nm
from topic_2.salary
where salary.salary > 500;

--13. Найти всех сотрудников с зарплатой ниже 400 из отдела HR.

select employee_nm
from topic_2.salary
where salary < 400 and department_nm = 'HR';

--14. Найти всех сотрудников, зарплата которых лежит в диапазоне от 300 до 500.

select employee_nm, salary
from topic_2.salary
where salary between 300 and 500;

--15. Найти всех сорудников, в имени (не фамилии) которых встречается буква 'A',
-- с зарплатой не менее 100. Считаем, что имя и фамилия разделены одним пробелом.

select employee_nm
from topic_2.salary
where lower(employee_nm) like '%a% %' and salary >= 100;

--16. Вывести всех сотрудников из отделов HR и PR, не используя оператор OR.

select employee_nm
from topic_2.salary
where department_nm similar to '(P|H)R';

--17. Найти все отделы, названия которых состоят ровно из 2 символов. Вывести каждый отдел ровно 1 раз.

select distinct department_nm
from topic_2.salary
where department_nm like '__';

--18. Найти все отделы, названия которых начинаются на букву 'S'. Вывести каждый отдел столько раз, сколько он встречается в таблице.

select department_nm
from topic_2.salary
where department_nm similar to 'S%';

--19. Вывести всех сотрудников, которые не работают в отделах 'R&D' и 'SUPPORT', не используя операторы OR и AND.

select employee_nm
from topic_2.salary
where department_nm not similar to '((R&D)|(SUPPORT))';

--20. Вывести все отделы в названии которых встречаются буквы 'A' и 'E'. Порядок следования букв в названии значения не имеет.

select department_nm
from topic_2.salary
where lower(department_nm) similar to '(%a%e%|%e%a%)';

--21. Найти количество строк в таблице topic_2.salary.

select count(*)
from topic_2.salary;

--22. Найти максимальную зарплату по всем сотрудникам.

select max(salary.salary)
from topic_2.salary;

--23. Посчитать число сотрудников с зарплатой выше 500.

select count(employee_nm)
from topic_2.salary
where salary > 500;

--24. Найти среднюю зарплату в разбивке по отделам.

select avg(salary)
from topic_2.salary
group by department_nm;

--25. Найти все отделы со средней зарплатой свыше 300.

select department_nm
from topic_2.salary
group by department_nm
having avg(salary) > 300;

--26. Найти все города с минимальной зарплатной свыше 500.

select department_nm
from topic_2.salary
group by department_nm
having min(salary) > 500;

--27. Найти все отделы с числом сотрудников не менее 10 человек.

select department_nm
from topic_2.salary
group by department_nm
having count(employee_nm) >= 10;

--28. Вывести список всех сотрудников, отсортированный по убыванию зарплаты.

select employee_nm, salary
from topic_2.salary
order by salary desc, employee_nm;

--29. Вывести список всех отделов по убыванию средней зарплаты в отделе, а также среднюю, минимальную, максимальную зарплаты и количество человек в отделе.

select department_nm, avg(salary), min(salary), max(salary), count(*)
from topic_2.salary
group by department_nm
order by avg(salary) desc;

--30. Подсчитать отклонение максимальной зарплаты по всех отделах от минимальной и средней.

select department_nm, (max(salary) - min(salary)) as deviation_max_min, (max(salary) - avg(salary)) as deviation_max_avg
from topic_2.salary
group by department_nm;

--31. Для каждого отдела рассчитать отклонепние максимальной зарплаты от средней и минимальной, а также отклонение средней от минимальной.

select department_nm, (max(salary) - avg(salary)) as deviation_max_avg,
       (max(salary) - min(salary)) as deviation_max_min,
       (avg(salary) - min(salary)) as deviation_avg_min
from topic_2.salary
group by department_nm;

--32. Вывести отделы по возрастанию фонда оплаты труда.

select department_nm, sum(salary)
from topic_2.salary
group by department_nm
order by sum(salary) desc;
