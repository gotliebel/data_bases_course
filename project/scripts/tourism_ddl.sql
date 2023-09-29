create schema if not exists tourism;

create table if not exists tourism.tickets(
    ticket_id serial primary key,
    price integer not null,
    date date not null,
    "from" varchar(50) not null,
    "to" varchar(50) not null,
    duration integer not null
);

create table if not exists tourism.travel_ag(
    travel_ag_id serial primary key,
    website varchar(50) not null
);

create table if not exists tourism.tickets_travel_ag_id(
    ticket_id serial,
    travel_ag_id serial,
    primary key (ticket_id, travel_ag_id),
    foreign key (ticket_id) references tourism.tickets(ticket_id),
    foreign key (travel_ag_id) references  tourism.travel_ag(travel_ag_id)
);

create table if not exists tourism.hotels(
    hotel_id serial primary key,
    price integer not null,
    stars integer not null,
    location varchar(50) not null
);

create table if not exists tourism.hotels_travel_ag_id(
    hotel_id serial,
    travel_ag_id serial,
    primary key (hotel_id, travel_ag_id),
    foreign key (hotel_id) references tourism.hotels(hotel_id),
    foreign key (travel_ag_id) references tourism.travel_ag(travel_ag_id),
    valid_from date,
    valid_to date
);

create table if not exists tourism.countries(
    city varchar(50) primary key,
    country varchar(50) not null
);

create table if not exists tourism.directions(
    direction_id serial primary key,
    city varchar(50) not null,
    foreign key (city) references tourism.countries(city),
    type varchar(50) not null
);

create table if not exists tourism.directions_hotels_id(
    direction_id serial,
    hotel_id serial,
    primary key (direction_id, hotel_id),
    foreign key (hotel_id) references tourism.hotels(hotel_id),
    foreign key (direction_id) references tourism.directions(direction_id)
);

create table if not exists tourism.directions_tickets_id(
    direction_id serial,
    ticket_id serial not null,
    primary key (direction_id, ticket_id),
    foreign key (direction_id) references tourism.directions(direction_id),
    foreign key (ticket_id) references tourism.tickets(ticket_id)
);
