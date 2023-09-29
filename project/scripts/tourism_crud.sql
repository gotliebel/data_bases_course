alter table tourism.travel_ag add phone_number varchar(50) not null default 'Unknown';

insert into tourism.travel_ag values (11, 'https://ostrovok.ru', '+79876543221');

insert into tourism.travel_ag values (12, 'https://chill.com', '+75556662233');

update tourism.travel_ag set phone_number = '+79999999999' where travel_ag_id = 1;

update tourism.travel_ag set phone_number = '+78888888888' where travel_ag_id = 2;

update tourism.travel_ag set phone_number = '+77777777777' where travel_ag_id = 3;

update tourism.travel_ag set phone_number = '+76666666666' where travel_ag_id = 4;

update tourism.travel_ag set phone_number = '+75555555555' where travel_ag_id = 5;

update tourism.travel_ag set phone_number = '+74444444444' where travel_ag_id = 6;

update tourism.travel_ag set phone_number = '+73333333333' where travel_ag_id = 7;

update tourism.travel_ag set phone_number = '+72222222222' where travel_ag_id = 8;

update tourism.travel_ag set phone_number = '+71111111111' where travel_ag_id = 9;

update tourism.travel_ag set phone_number = '+71234567889' where travel_ag_id = 10;

select * from tourism.travel_ag;

delete from tourism.travel_ag where travel_ag_id = 11;

delete from tourism.travel_ag where travel_ag_id = 12;
