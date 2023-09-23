--1 задание
select book_ref from bookings
union 
select ticket_no from boarding_passes;

select * from Bookings
join Tickets on
Bookings.book_ref=Tickets.book_ref;

--задание 2
 select * from ticket_flights where  fare_conditions='Economy'
 limit 5

--задание 3
select fare_conditions,
 count (*) as total
from  ticket_flights
join boarding_passes  on
ticket_flights.flight_id=boarding_passes.flight_id
group by fare_conditions;

--задание 4
select * from Bookings
left join Tickets on
Bookings.book_ref=Tickets.book_ref
join Ticket_flights on
Tickets.ticket_no=Ticket_flights.ticket_no;

--задание 5
create view tiket2 as 
select * from ticket_flights where  fare_conditions='Economy'
