use sakila;

SELECT title from film;

select distinct release_year from film;

select title, rental_duration from film where rental_duration >= 4 order by rental_duration;

select customer_id, rental_id, amount, payment_date from payment where payment_date between "2005-07-01" and "2005-08-01" order by payment_date;

select distinct count(customer_id) from customer;

describe rental;

select customer_id, count(*) as nArriendos from rental group by customer_id;

SELECT MAX(total) as Maximo FROM (SELECT customer_id,count(*) as total FROM rental GROUP BY customer_id) as t1;

describe payment;
select staff_id, count(*) as nTransacciones from payment group by staff_id;

select staff_id, count(*) as nTransacciones from payment where payment_date between "2005-08-23" and "2005-08-24" group by staff_id order by nTransacciones DESC limit 1;


describe film;
describe language;

select title, name from film inner join language on film.language_id = language.language_id;

show tables;
describe film;
describe customer;
describe rental;
describe inventory;

select * from rental limit 10;
select * from inventory;


select * from inventory where film_id = (select film_id from film where title = "CHICAGO NORTH");

##izquierda
select * from customer inner join rental on customer.customer_id = rental.customer_id;

##derecha
select * from inventory where film_id = (select film_id from film where title = "CHICAGO NORTH");

select first_name, last_name from customer inner join rental on customer.customer_id = rental.customer_id inner join inventory on inventory.inventory_id = rental.inventory_id inner join film on inventory.film_id = film.film_id  where film.title = "CHICAGO NORTH";

describe customer;
show tables;
describe address;
describe city;
select first_name, last_name, city from customer inner join address on customer.address_id = address.address_id inner join city on address.city_id = city.city_id order by city;


describe film;
describe rental;
describe inventory;

select count(*) as nVecesArrendada, title from film inner join inventory on film.film_id = inventory.film_id inner join rental on inventory.inventory_id = rental.inventory_id group by film.film_id order by nVecesArrendada DESC;




show tables;
describe payment;
select sum(amount) as volumenGanado, title from payment inner join rental on payment.rental_id = rental.rental_id inner join inventory on rental.inventory_id = inventory.inventory_id inner join film on inventory.film_id = film.film_id group by film.film_id order by volumenGanado DESC;


describe customer;
select sum(amount) as Pagado, first_name, last_name from (payment inner join customer on customer.customer_id = payment.customer_id) where amount > 10 group by customer.customer_id order by Pagado DESC;

