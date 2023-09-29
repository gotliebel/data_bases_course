--3 сделать ddl скрипты

create schema if not exists tourism;

create table if not exists tourism.tickets
(
    ticket_id serial primary key,
    price     integer     not null,
    date      date        not null,
    "from"    varchar(50) not null,
    "to"      varchar(50) not null,
    duration  integer     not null
);

create table if not exists tourism.travel_ag
(
    travel_ag_id serial primary key,
    website      varchar(50) not null
);

create table if not exists tourism.tickets_travel_ag_id
(
    ticket_id    serial,
    travel_ag_id serial,
    primary key (ticket_id, travel_ag_id),
    foreign key (ticket_id) references tourism.tickets (ticket_id),
    foreign key (travel_ag_id) references tourism.travel_ag (travel_ag_id)
);

create table if not exists tourism.hotels
(
    hotel_id serial primary key,
    price    integer     not null,
    stars    integer     not null,
    location varchar(50) not null
);

create table if not exists tourism.hotels_travel_ag_id
(
    hotel_id     serial,
    travel_ag_id serial,
    primary key (hotel_id, travel_ag_id),
    foreign key (hotel_id) references tourism.hotels (hotel_id),
    foreign key (travel_ag_id) references tourism.travel_ag (travel_ag_id),
    valid_from   date,
    valid_to     date
);

create table if not exists tourism.countries
(
    city    varchar(50) primary key,
    country varchar(50) not null
);

create table if not exists tourism.directions
(
    direction_id serial primary key,
    city         varchar(50) not null,
    foreign key (city) references tourism.countries (city),
    type         varchar(50) not null
);

create table if not exists tourism.directions_hotels_id
(
    direction_id serial,
    hotel_id     serial,
    primary key (direction_id, hotel_id),
    foreign key (hotel_id) references tourism.hotels (hotel_id),
    foreign key (direction_id) references tourism.directions (direction_id)
);

create table if not exists tourism.directions_tickets_id
(
    direction_id serial,
    ticket_id    serial not null,
    primary key (direction_id, ticket_id),
    foreign key (direction_id) references tourism.directions (direction_id),
    foreign key (ticket_id) references tourism.tickets (ticket_id)
);

--4,5 сделать insert

insert into tourism.countries (city, country)
values ('Moscow', 'Russia'),
       ('Barcelona', 'Spain'),
       ('Paris', 'France'),
       ('Berlin', 'Germany'),
       ('Rim', 'Italy'),
       ('Milan', 'Italy'),
       ('London', 'England'),
       ('Amsterdam', 'Netherlands'),
       ('Bangkok', 'Thailand');

update tourism.countries
set city    = 'Phuket',
    country = 'Thailand'
where city = 'Bangkok';

insert into tourism.directions (city, type)
values ('Moscow', 'excursion'),
       ('Barcelona', 'excursion'),
       ('Barcelona', 'beach'),
       ('Paris', 'excursion'),
       ('Berlin', 'excursion'),
       ('Rim', 'excursion'),
       ('Milan', 'excursion'),
       ('London', 'excursion'),
       ('Amsterdam', 'excursion'),
       ('Phuket', 'beach');

insert into tourism.hotels (price, stars, location)
values (110, 3, 'Moscow'),
       (170, 4, 'Moscow'),
       (125, 3, 'Barcelona'),
       (700, 5, 'Barcelona'),
       (100, 2, 'Paris'),
       (210, 3, 'Paris'),
       (135, 3, 'Berlin'),
       (165, 4, 'Rim'),
       (180, 3, 'Milan'),
       (200, 3, 'London'),
       (150, 3, 'Amsterdam'),
       (350, 4, 'Phuket');

insert into tourism.tickets (ticket_id, price, date, "from", "to", duration)
values (1, 501, cast('2023-04-01' as date), 'Moscow, SVO', 'Barcelona, BCN', 240),
       (2, 472, cast('2023-04-01' as date), 'Moscow, VKO', 'Barcelona, BCN', 240),
       (3, 453, cast('2023-04-02' as date), 'Moscow, DME', 'Paris, CDG', 230),
       (4, 200, cast('2023-04-03' as date), 'Moscow, ZIA', 'Berlin, BER', 220),
       (5, 510, cast('2023-05-04' as date), 'Moscow, SVO', 'Rim, FCO', 235),
       (6, 505, cast('2023-05-05' as date), 'Moscow, DME', 'Milan, MXP', 230),
       (7, 504, cast('2023-05-04' as date), 'Moscow, DME', 'London, LHR', 240),
       (8, 503, cast('2023-05-03' as date), 'Moscow, VKO', 'Amsterdam, AMS', 210),
       (9, 700, cast('2023-05-04' as date), 'Moscow, DME', 'Phuket, HKT', 540);

insert into tourism.travel_ag (website)
values ('https://www.anextour.com'),
       ('https://fstravel.com'),
       ('https://www.coral.ru'),
       ('https://www.tez-tour.com'),
       ('https://pegast.ru'),
       ('https://intourist.ru'),
       ('https://www.bgoperator.ru'),
       ('https://www.tripadvisor.ru'),
       ('https://www.booking.com'),
       ('https://www.kayak.com');

insert into tourism.directions_hotels_id (direction_id, hotel_id)
values (1, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 4),
       (4, 5),
       (4, 6),
       (5, 7),
       (6, 8),
       (7, 9),
       (8, 10),
       (9, 11),
       (10, 12);

insert into tourism.directions_tickets_id (direction_id, ticket_id)
values (2, 1),
       (2, 2),
       (3, 1),
       (3, 2),
       (4, 3),
       (5, 4),
       (6, 5),
       (7, 6),
       (8, 7),
       (9, 8),
       (10, 9);

insert into tourism.tickets_travel_ag_id (ticket_id, travel_ag_id)
values (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (2, 5),
       (2, 6),
       (3, 7),
       (3, 8),
       (4, 1),
       (4, 2),
       (4, 3),
       (5, 4),
       (5, 5),
       (6, 6),
       (6, 7),
       (6, 8),
       (7, 1),
       (7, 2),
       (7, 3),
       (8, 4),
       (9, 5);

insert into tourism.hotels_travel_ag_id (hotel_id, travel_ag_id, valid_from, valid_to)
values (3, 1, cast('2021-05-06' as date), cast('2026-05-06' as date)),
       (3, 2, cast('2020-04-07' as date), cast('2025-07-04' as date)),
       (3, 4, cast('2019-08-10' as date), cast('2030-06-08' as date)),
       (4, 3, cast('2018-07-08' as date), cast('2023-10-12' as date)),
       (4, 5, cast('2010-01-01' as date), cast('2021-01-01' as date)),
       (4, 6, cast('2012-02-03' as date), cast('2017-02-03' as date)),
       (5, 7, cast('2018-12-25' as date), cast('2023-12-26' as date)),
       (5, 8, cast('2019-11-14' as date), cast('2024-06-15' as date)),
       (6, 7, cast('2020-04-09' as date), cast('2027-04-10' as date)),
       (6, 8, cast('2016-06-09' as date), cast('2028-08-13' as date)),
       (7, 1, cast('2017-07-15' as date), cast('2027-09-27' as date)),
       (7, 2, cast('2020-05-05' as date), cast('2029-07-28' as date)),
       (7, 3, cast('2015-10-08' as date), cast('2025-08-10' as date)),
       (8, 4, cast('2020-05-26' as date), cast('2029-05-28' as date)),
       (8, 5, cast('2019-07-16' as date), cast('2030-04-25' as date)),
       (9, 6, cast('2014-10-25' as date), cast('2024-07-05' as date)),
       (9, 7, cast('2016-01-18' as date), cast('2025-01-17' as date)),
       (9, 8, cast('2015-06-06' as date), cast('2028-08-19' as date)),
       (10, 1, cast('2016-08-19' as date), cast('2026-03-13' as date)),
       (10, 2, cast('2019-09-20' as date), cast('2027-04-14' as date)),
       (10, 3, cast('2020-06-21' as date), cast('2029-08-15' as date)),
       (11, 4, cast('2018-04-07' as date), cast('2028-11-12' as date)),
       (12, 5, cast('2019-08-20' as date), cast('2021-12-10' as date));


--6 6 осмысленных запросов

select rank() over (order by avg(price) desc), avg(price) as average_price, location
from tourism.hotels
group by location
having avg(price) > 150
order by average_price desc, location;

with joined as (select *
                from (tourism.directions d join tourism.directions_tickets_id dt
                      on d.direction_id = dt.direction_id) as j
                         join tourism.tickets t on j.ticket_id = t.ticket_id),
     ranked as (select *, rank() over (partition by type order by city) as row from joined)
select avg(row) as row, city, type, avg(price) as price
from ranked
group by city, type
having max(price) > 100
order by row, price desc;

select website,
       avg(price) as price,
       avg(stars) as stars,
       location,
       rank() over (partition by location order by avg(stars) desc)
from (tourism.travel_ag ta join tourism.hotels_travel_ag_id htai on ta.travel_ag_id = htai.travel_ag_id) as joined
         join tourism.hotels h on joined.hotel_id = h.hotel_id
group by website, location
having avg(stars) >= 3
order by location, stars desc;

with joined_directions_tickets as (select j.direction_id,
                                          price,
                                          date,
                                          "from",
                                          "to",
                                          duration,
                                          city,
                                          type
                                   from (tourism.tickets t join tourism.directions_tickets_id dt
                                         on t.ticket_id = dt.direction_id) as j
                                            join tourism.directions d on j.direction_id = d.direction_id),
     joined_directions_hotels as (select j.direction_id, price, stars, location
                                  from (tourism.hotels h join tourism.directions_hotels_id dhi
                                        on h.hotel_id = dhi.hotel_id) as j
                                           join tourism.directions d on j.direction_id = d.direction_id)
select date,
       "from",
       "to",
       city,
       avg(jdt.price) as ticket_price,
       avg(jdh.price) as hotel_price,
       avg(stars)     as stars,
       row_number() over (partition by avg(stars))
from joined_directions_tickets jdt
         join joined_directions_hotels jdh on jdt.direction_id = jdh.direction_id
group by date, "from", "to", city, location
having avg(jdt.price) > 400
order by city;

select city,
       type,
       max(price) as max_price,
       max(stars) as max_stars,
       rank() over (partition by city order by max(stars))
from (tourism.directions d join tourism.directions_hotels_id dhi on d.direction_id = dhi.direction_id) as j
         join tourism.hotels h on j.hotel_id = h.hotel_id
group by city, type, location
having max(price) > 150
order by max_price desc, city desc;

select website, avg(price) as price, "to", row_number() over (order by avg(price))
from (tourism.travel_ag t join tourism.tickets_travel_ag_id ttai on t.travel_ag_id = ttai.travel_ag_id) as j
         join tourism.tickets t on j.ticket_id = t.ticket_id
where website like '%anextour%'
group by website, "to"
order by price;

--9

select travel_ag_id, regexp_replace(website, '(.){10}', '**********', 6) as website
from tourism.travel_ag;

with joined as (select d.direction_id, city, type, dti.ticket_id
                from tourism.directions d
                         join tourism.directions_tickets_id dti on d.direction_id = dti.direction_id)
select direction_id,
       j.ticket_id as ticket_id,
       city,
       type,
       price,
       date,
       "from",
       "to",
       duration
from joined j
         join tourism.tickets t on j.ticket_id = t.ticket_id;

with joined as (select d.direction_id, city, type, dhi.hotel_id
                from tourism.directions d
                         join tourism.directions_hotels_id dhi on d.direction_id = dhi.direction_id)
select direction_id, j.hotel_id as hotel_id, city, type, price, stars, location
from joined j
         join tourism.hotels h on j.hotel_id = h.hotel_id;

with joined as (select h.hotel_id, price, stars, location, valid_from, valid_to, travel_ag_id
                from tourism.hotels h
                         join tourism.hotels_travel_ag_id htai on h.hotel_id = htai.hotel_id)
select hotel_id,
       j.travel_ag_id,
       price,
       stars,
       location,
       valid_from,
       valid_to,
       website
from joined j
         join tourism.travel_ag ta on j.travel_ag_id = ta.travel_ag_id;

with joined as (select t.ticket_id, price, date, "from", "to", duration, travel_ag_id
                from tourism.tickets t
                         join tourism.tickets_travel_ag_id ttai on t.ticket_id = ttai.ticket_id)
select ticket_id,
       j.travel_ag_id,
       price,
       date,
       "from",
       "to",
       duration,
       website
from joined j
         join tourism.travel_ag ta on j.travel_ag_id = ta.travel_ag_id;

select direction_id, c.city as city, country, type
from tourism.countries c
         join tourism.directions d on c.city = d.city;
