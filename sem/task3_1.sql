create schema if not exists topic_3;

CREATE TABLE IF NOT EXISTS topic_3.salary
(
    employee_nm   VARCHAR,
    department_nm VARCHAR,
    salary        int
);

--2. Создать в этой схеме таблицу department с полями department_nm и location_txt

CREATE TABLE IF NOT EXISTS topic_3.department
(
    department_nm VARCHAR,
    location_txt  VARCHAR
);

--3. Запустить операции вставки, полученные от семинариста

INSERT INTO topic_3.salary
VALUES ('Ken Sánchez', 'HR', 78);
INSERT INTO topic_3.salary
VALUES ('TerriLee Duffy', 'HR', 95);
INSERT INTO topic_3.salary
VALUES ('Roberto Tamburello', 'HR', 382);
INSERT INTO topic_3.salary
VALUES ('Rob Walters', 'HR', 16);
INSERT INTO topic_3.salary
VALUES ('Gail Erickson', 'HR', 1079);
INSERT INTO topic_3.salary
VALUES ('Jossef Gibson', 'HR', 102);
INSERT INTO topic_3.salary
VALUES ('Dylan Miller', 'HR', 486);
INSERT INTO topic_3.salary
VALUES ('Diane Margheim', 'HR', 1953);
INSERT INTO topic_3.salary
VALUES ('Gigi Matthew', 'SALE', 49);
INSERT INTO topic_3.salary
VALUES ('Michael Raheem', 'SALE', 71);
INSERT INTO topic_3.salary
VALUES ('Ovidiu Cracium', 'SALE', 94);
INSERT INTO topic_3.salary
VALUES ('Thierry Hers', 'SALE', 61);
INSERT INTO topic_3.salary
VALUES ('Janice Galvin', 'SALE', 972);
INSERT INTO topic_3.salary
VALUES ('Michael Sullivan', 'SALE', 849);
INSERT INTO topic_3.salary
VALUES ('Sharon Salavaria', 'SALE', 715);
INSERT INTO topic_3.salary
VALUES ('David Michael', 'SALE', 94);
INSERT INTO topic_3.salary
VALUES ('Kevin Brown', 'R&D', 891);
INSERT INTO topic_3.salary
VALUES ('John Wood', 'R&D', 1486);
INSERT INTO topic_3.salary
VALUES ('Mary Dempsey', 'R&D', 176);
INSERT INTO topic_3.salary
VALUES ('Wanida Benshoof', 'R&D', 49);
INSERT INTO topic_3.salary
VALUES ('Terry Eminhizer', 'R&D', 381);
INSERT INTO topic_3.salary
VALUES ('Sariya Harnpadoungsataya', 'R&D', 946);
INSERT INTO topic_3.salary
VALUES ('Mary Gibson', 'R&D', 486);
INSERT INTO topic_3.salary
VALUES ('Jill Williams', 'R&D', 19);
INSERT INTO topic_3.salary
VALUES ('James Hamilton', 'R&D', 46);
INSERT INTO topic_3.salary
VALUES ('Peter Krebs', 'R&D', 445);
INSERT INTO topic_3.salary
VALUES ('Jo Brown', 'R&D', 666);
INSERT INTO topic_3.salary
VALUES ('Guy Gilbert', 'MANAGEMENT', 482);
INSERT INTO topic_3.salary
VALUES ('Mark McArthur', 'MANAGEMENT', 12);
INSERT INTO topic_3.salary
VALUES ('Britta Simon', 'MANAGEMENT', 194);
INSERT INTO topic_3.salary
VALUES ('Margie Shoop', 'MANAGEMENT', 481);
INSERT INTO topic_3.salary
VALUES ('Rebecca Laszlo', 'MANAGEMENT', 16);
INSERT INTO topic_3.salary
VALUES ('Annik Stahl', 'MANAGEMENT', 134);
INSERT INTO topic_3.salary
VALUES ('Suchitra Mohan', 'R&D', 87);
INSERT INTO topic_3.salary
VALUES ('Brandon Heidepriem', 'R&D', 111);
INSERT INTO topic_3.salary
VALUES ('Jose Lugo', 'R&D', 185);
INSERT INTO topic_3.salary
VALUES ('Chris Okelberry', 'R&D', 94);
INSERT INTO topic_3.salary
VALUES ('Kim Abercrombie', 'R&D', 348);
INSERT INTO topic_3.salary
VALUES ('Ed Dudenhoefer', 'R&D', 68);
INSERT INTO topic_3.salary
VALUES ('JoLynn Dobney', 'R&D', 346);
INSERT INTO topic_3.salary
VALUES ('Bryan Baker', 'R&D', 185);
INSERT INTO topic_3.salary
VALUES ('James Kramer', 'SUPPORT', 965);
INSERT INTO topic_3.salary
VALUES ('Nancy Anderson', 'SUPPORT', 444);
INSERT INTO topic_3.salary
VALUES ('Simon Rapier', 'SUPPORT', 133);
INSERT INTO topic_3.salary
VALUES ('Thomas Michaels', 'SUPPORT', 200);
INSERT INTO topic_3.salary
VALUES ('Eugene Kogan', 'SUPPORT', 144);
INSERT INTO topic_3.salary
VALUES ('Andrew Hill', 'SUPPORT', 186);
INSERT INTO topic_3.salary
VALUES ('Ruth Ellerbrock', 'SUPPORT', 179);
INSERT INTO topic_3.salary
VALUES ('Barry Johnson', 'HEAD', 10000);
INSERT INTO topic_3.salary
VALUES ('Sidney Higa', 'HEAD', 1);
INSERT INTO topic_3.salary
VALUES ('Max Lanson', 'PR', 150);


INSERT INTO topic_3.department
VALUES ('HR', 'Murom');
INSERT INTO topic_3.department
VALUES ('SUPPORT', 'Saratov');
INSERT INTO topic_3.department
VALUES ('MANAGEMENT', 'Samara');
INSERT INTO topic_3.department
VALUES ('HEAD', 'Moscow');
INSERT INTO topic_3.department
VALUES ('SALE', 'Moscow');
INSERT INTO topic_3.department
VALUES ('R&D', 'Novosibirsk');

--4. Вывести все значения из таблицы department

select *
from topic_3.department;

--5. Вывести всех сотрудников, работающих в Москве.

select employee_nm
from topic_3.salary s
         join topic_3.department d on d.department_nm = s.department_nm
where d.location_txt = 'Moscow';

--6. Найти всех сотрудников, город работы которых нам не известен

select employee_nm
from topic_3.salary s
         left outer join topic_3.department d on d.department_nm = s.department_nm
where d.location_txt is NULL;

--7. Рассчитать максимальную зарплату по городу

select max(salary), location_txt
from topic_3.salary s
         join topic_3.department d on d.department_nm = s.department_nm
group by d.location_txt
order by max(salary) desc;

--8. Подсчитать число сотрудников в каждом городе

select count(employee_nm), location_txt
from topic_3.salary s
         join topic_3.department d on d.department_nm = s.department_nm
group by d.location_txt
order by count(employee_nm) desc;

--9. Найти все города с минимальной зарплатой свыше 500

select location_txt
from topic_3.salary s
         join topic_3.department d on d.department_nm = s.department_nm
group by d.location_txt
having min(s.salary) > 500;

--10. Вывести список всех сотрудников, отсортированных по городу и по возрастанию зарплаты

select employee_nm, salary, location_txt
from topic_3.salary s
         join topic_3.department d on d.department_nm = s.department_nm
order by location_txt, salary;

--11. Вывести города, отсортировав по уменьшению средней зарплаты

select location_txt
from topic_3.salary s
         join topic_3.department d on d.department_nm = s.department_nm
group by location_txt
order by avg(salary) desc;

--12. Для каждого города подсчитать количество сотрудников, максимальную и минимальную зарплату, а также среднее значение зарплаты

select location_txt, count(employee_nm), max(salary), min(salary), avg(salary)
from topic_3.salary s
         join topic_3.department d on d.department_nm = s.department_nm
group by location_txt;

--13. Вывести города и количество сотрудников в них, если средняя зарплата по городу превышает 100

select location_txt, count(employee_nm)
from topic_3.salary s
         join topic_3.department d on d.department_nm = s.department_nm
group by location_txt
having avg(salary) > 100;

--14. Записать в таблицу department новый отдел на ваш выбор. Для нового отдела воспользоваться агрегирующими функциями по зарплате. Посмотреть на полученные результаты и объяснить их.

INSERT INTO topic_3.department
VALUES ('ФПМИ', 'Dolgoprudniy');
select min(salary), max(salary), avg(salary)
from topic_3.salary s
         right outer join topic_3.department d on d.department_nm = s.department_nm
where location_txt = 'Dolgoprudniy'
group by location_txt;

--15. Получить максимально полную сводку по полям: Имя сотрудника, Наименование отдела, Город отдела и Сумма зарплаты.

select employee_nm, s.department_nm, location_txt, salary
from topic_3.salary s
         full outer join topic_3.department d on d.department_nm = s.department_nm;

--16. Представьте, что в таблице department - N строк, а в salary - M строк. Какие минимальное и максимальное число строк можно получить в результате применения к ним:


-- CROSS JOIN - декартово произведение, поэтому минимальное и максимальное число строк будет одно и то же - N * M;
-- INNER JOIN - пересечение по какому-то признаку. Минимум может быть ноль строк(когда нет ни одного пересечения). Максимум - max(N, M);
--  LEFT JOIN - Минимум - N(нет ни одного пересечения). Максимум - (M + N - 1);
--  FULL JOIN - Минимум - N + M. Максимум - N + M;


--17. Верно ли, что любой вид JOIN-а может быть приведен к INNER JOIN при должном старании автора запроса?
--           Приведите примеры таких вырождений для CROSS JOIN-а и любого из OUTER JOIN-ов.

--  Любой вид JOIN-ов(кроме CROSS JOIN) можно привести к INNER JOIN, используя сам INNER JOIN и потом дополнить строками, которые не вошли при предыдущем JOIN.