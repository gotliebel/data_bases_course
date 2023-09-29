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
set city = 'Phuket', country = 'Thailand'
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
values (1,501, cast('2023-04-01' as date), 'Moscow, SVO', 'Barcelona, BCN', 240),
       (2,472, cast('2023-04-01' as date), 'Moscow, VKO', 'Barcelona, BCN', 240),
       (3,453, cast('2023-04-02' as date), 'Moscow, DME', 'Paris, CDG', 230),
       (4,200, cast('2023-04-03' as date), 'Moscow, ZIA', 'Berlin, BER', 220),
       (5,510, cast('2023-05-04' as date), 'Moscow, SVO', 'Rim, FCO', 235),
       (6,505, cast('2023-05-05' as date), 'Moscow, DME', 'Milan, MXP', 230),
       (7,504, cast('2023-05-04' as date), 'Moscow, DME', 'London, LHR', 240),
       (8,503, cast('2023-05-03' as date), 'Moscow, VKO', 'Amsterdam, AMS', 210),
       (9,700, cast('2023-05-04' as date), 'Moscow, DME', 'Phuket, HKT', 540);

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
values (1,1),
       (1,2),
       (2,3),
       (2,4),
       (3,4),
       (4,5),
       (4,6),
       (5,7),
       (6,8),
       (7,9),
       (8,10),
       (9,11),
       (10,12);

insert into tourism.directions_tickets_id (direction_id, ticket_id)
values (2,1),
       (2,2),
       (3,1),
       (3,2),
       (4,3),
       (5,4),
       (6,5),
       (7,6),
       (8,7),
       (9,8),
       (10,9);

insert into tourism.tickets_travel_ag_id (ticket_id, travel_ag_id)
values (1,1),
       (1,2),
       (1,3),
       (1,4),
       (2,5),
       (2,6),
       (3,7),
       (3,8),
       (4,1),
       (4,2),
       (4,3),
       (5,4),
       (5,5),
       (6,6),
       (6,7),
       (6,8),
       (7,1),
       (7,2),
       (7,3),
       (8,4),
       (9,5);

insert into tourism.hotels_travel_ag_id (hotel_id, travel_ag_id, valid_from, valid_to)
values (3,1, cast('2021-05-06' as date), cast('2026-05-06' as date)),
       (3,2, cast('2020-04-07' as date), cast('2025-07-04' as date)),
       (3,4, cast('2019-08-10' as date), cast('2030-06-08' as date)),
       (4,3, cast('2018-07-08' as date), cast('2023-10-12' as date)),
       (4,5, cast('2010-01-01' as date), cast('2021-01-01' as date)),
       (4,6, cast('2012-02-03' as date), cast('2017-02-03' as date)),
       (5,7, cast('2018-12-25' as date), cast('2023-12-26' as date)),
       (5,8, cast('2019-11-14' as date), cast('2024-06-15' as date)),
       (6,7, cast('2020-04-09' as date), cast('2027-04-10' as date)),
       (6,8, cast('2016-06-09' as date), cast('2028-08-13' as date)),
       (7,1, cast('2017-07-15' as date), cast('2027-09-27' as date)),
       (7,2, cast('2020-05-05' as date), cast('2029-07-28' as date)),
       (7,3, cast('2015-10-08' as date), cast('2025-08-10' as date)),
       (8,4, cast('2020-05-26' as date), cast('2029-05-28' as date)),
       (8,5, cast('2019-07-16' as date), cast('2030-04-25' as date)),
       (9,6, cast('2014-10-25' as date), cast('2024-07-05' as date)),
       (9,7, cast('2016-01-18' as date), cast('2025-01-17' as date)),
       (9,8, cast('2015-06-06' as date), cast('2028-08-19' as date)),
       (10,1, cast('2016-08-19' as date), cast('2026-03-13' as date)),
       (10,2, cast('2019-09-20' as date), cast('2027-04-14' as date)),
       (10,3, cast('2020-06-21' as date), cast('2029-08-15' as date)),
       (11,4, cast('2018-04-07' as date), cast('2028-11-12' as date)),
       (12,5, cast('2019-08-20' as date), cast('2021-12-10' as date));
