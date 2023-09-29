DROP TABLE IF EXISTS topic_3.db_instructor_salary;


CREATE TABLE topic_3.db_instructor_salary
(
    name        VARCHAR(120),
    dt          DATE,
    salary_amt  DECIMAL(12, 2),
    salary_type SMALLINT
);


INSERT INTO topic_3.db_instructor_salary
VALUES ('Роздухова Нина', '2019-02-25', 2999.00, 1);


INSERT INTO topic_3.db_instructor_salary
VALUES ('Роздухова Нина', '2019-03-05', 5100.00, 1);


INSERT INTO topic_3.db_instructor_salary
VALUES ('Роздухова Нина', '2019-03-05', 6800.00, 3);


INSERT INTO topic_3.db_instructor_salary
VALUES ('Халяпов Александр', '2019-02-25', 10499.00, 1);


INSERT INTO topic_3.db_instructor_salary
VALUES ('Халяпов Александр', '2019-03-05', 13000.00, 1);


INSERT INTO topic_3.db_instructor_salary
VALUES ('Меркурьева Надежда', '2019-02-25', 2999.00, 1);


INSERT INTO topic_3.db_instructor_salary
VALUES ('Меркурьева Надежда', '2019-02-25', 5800.00, 2);


INSERT INTO topic_3.db_instructor_salary
VALUES ('Меркурьева Надежда', '2019-03-05', 6400.00, 1);


INSERT INTO topic_3.db_instructor_salary
VALUES ('Меркурьева Надежда', '2019-03-05', 8300.00, 2);

--1. С помощью скалярного подзапроса найти имена преподавателей,
-- которые получили разово минимальную выплату за все время.

SELECT name
FROM topic_3.db_instructor_salary
WHERE salary_amt =
      (SELECT min(salary_amt)
       FROM topic_3.db_instructor_salary)
GROUP BY name
HAVING count(*) = 1;


--2.  С помощью скалярного подзапроса найти имена преподавателей,
-- у которых выплата по тому или иному типу была максимальной.

SELECT salary_type,
       max(salary_amt)
FROM topic_3.db_instructor_salary
GROUP BY salary_type; --подзапрос


SELECT name
FROM topic_3.db_instructor_salary
WHERE salary_amt IN
      (SELECT max(salary_amt)
       FROM topic_3.db_instructor_salary
       GROUP BY salary_type);

-- Вывести имя преподавателя и тип выплаты, используя case или decode
-- (1 – выплата за семинарские занятия, 2 – выплата за лекционные занятия, 3 – премиальная часть);

SELECT name,
       CASE salary_type
           WHEN 1 THEN 'выплата за семинарские занятия'
           WHEN 2 THEN 'выплата за лекционные занятия'
           WHEN 3 THEN 'премиальная часть'
           END AS salary_type
FROM topic_3.db_instructor_salary;

--3. С помощью подзапроса и предиката IN вывести имена преподавателей, тип и сумму выплат по каждому типу за все время работы, при
-- условии, что у преподавателя была выплата за лекционные занятия.

select name, salary_type, salary_amt
from topic_3.db_instructor_salary
where name in(select name from topic_3.db_instructor_salary where salary_type = 2);


-- 4. С помощью EXISTS вывести имена преподавателей,
-- тип и сумму выплат по каждому типу за все время работы,
-- при условии, что у преподавателя была выплата за лекционные занятия;

SELECT name,
       salary_type,
       sum(salary_amt)
FROM topic_3.db_instructor_salary AS dis_1
WHERE exists
          (SELECT salary_amt
           FROM topic_3.db_instructor_salary AS dis_2
           WHERE salary_type = 2
             AND dis_1.name = dis_2.name)
GROUP BY name,
         salary_type;

-- 5. С помощью аналитической функции COUNT найти количество выплат по каждому преподавателю за каждое число;
-- выведите также размер каждой выплаты.

SELECT t1.name, t1.dt, payment_amt, salary_amt
FROM (SELECT name, dt, COUNT(*) as payment_amt
      FROM topic_3.db_instructor_salary
      GROUP BY name, dt) AS t1 --подзапрос: нашли кол-во выплат по каждому преподавателю за каждое число
         JOIN topic_3.db_instructor_salary as t2
              ON t1.name = t2.name AND t1.dt = t2.dt;


--6. С помощью аналитической функции SUM найти общий размер выплат по каждому преподавателю за каждое число; выведите также размер каждой выплаты.

SELECT t1.name, t1.dt, sum_salary, salary_amt
FROM (SELECT name, dt, sum(salary_amt) as sum_salary
      FROM topic_3.db_instructor_salary
      GROUP BY name, dt) AS t1
         JOIN topic_3.db_instructor_salary as t2
              ON t1.name = t2.name AND t1.dt = t2.dt;

--7. С помощью аналитической функции SUM и сортировки найти суммарные выплаты по каждому преподавателю за каждое число (по нарастанию).

SELECT t1.name, t1.dt, sum_salary, salary_amt
FROM (SELECT name, dt, sum(salary_amt) as sum_salary
      FROM topic_3.db_instructor_salary
      GROUP BY name, dt) AS t1
         JOIN topic_3.db_instructor_salary as t2
              ON t1.name = t2.name AND t1.dt = t2.dt
order by sum_salary;

--8. С помощью аналитической функции RANK (DENSE_RANK) и подзапроса найти имена преподавателей, которые получили разово минимальную выплату за все время.
-- Перед этим добавьте следующую строку в данные:
INSERT INTO topic_3.db_instructor_salary VALUES ('Роздухова Нина', '2019-02-25', 2999, 1);

select name
from (select name, rank() over (order by salary_amt) as rank
      from topic_3.db_instructor_salary) as t1
where rank = 1
group by name
having count(name) = 1;


--9. С помощью аналитической функции ROW_NUMBER и подзапроса найти имя преподавателя, который первый получил самую маленькую выплату.
-- Если таких преподавателей несколько, взять первого по сортировке по имени;


--10. С помощью конструкции DISTINCT ON найти имя преподавателя, который первый получил самую маленькую выплату. Если таких
-- преподавателей несколько, взять первого по сортировке по имени. Можно ли обойтись без конструкции DISTINCT ON?

select name, dt, salary_amt
from topic_3.db_instructor_salary
order by salary_amt, dt, name desc;

select distinct on (salary_amt) name, dt, salary_amt
from topic_3.db_instructor_salary
order by salary_amt, dt, name desc
limit 1;