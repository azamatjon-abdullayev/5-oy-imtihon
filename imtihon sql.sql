drop table if exists products;
DROP table if exists manufactures;

create table if not exists manufactures(
	manufacture_id serial primary key,
	manufacture_name varchar(50) not null
	
);


create table if not exists products(
	product_id serial primary key,
	product_name varchar(50) not null,
	product_price INTEGER not null,
	stock INTEGER,
	manufacture_id integer REFERENCES manufactures(manufacture_id) 
);

insert into manufactures(manufacture_name)VALUES
('akfa'),
('Bmw'),
('Mersedes-Benz');


insert into products(product_name,product_price,stock,manufacture_id)VALUES
('rom',10000,100000,1),
('rom2',12000,100000,1),
('rom3',13000,100000,1),
('bmw x5',1700000,100000,2),
('bmw x6',1700000,100000,2),
('bmw x7',1700000,100000,2),
('mers amg 800',1700000,100000,3),
('mers amg 900',1700000,100000,3),
('mers amg 500',1700000,100000,3);

update products set product_price = 11000 where product_id = 1;
update products set product_price = 13000 where product_id = 2;
update products set product_price = 14000 where product_id = 3;

update products set product_price = 1800000 where product_id = 4;
update products set product_price = 1800000 where product_id = 5;
update products set product_price = 1800000 where product_id = 6;

update products set product_price = 1900000 where product_id = 7;
update products set product_price = 1900000 where product_id = 8;
update products set product_price = 1900000 where product_id = 9;


select * from products;
select * from manufactures;

update manufactures set manufacture_name = 'akfa' where manufacture_id = 1;
update manufactures set manufacture_name = 'bmw amg' where manufacture_id = 2;
update manufactures set manufacture_name = 'mers amg' where manufacture_id = 3;

update products set product_name='rom3',product_price = 39000 
where product_id = 1
on conflict(product_name)
do update set product_price = 39000;

update products set product_name='rom2',product_price = 39000 
where product_id = 2
on conflict(product_name)
do update set product_price = 39000;

delete from products where product_id = 1;
delete from products where product_id = 2;
delete from products where product_id = 3;

delete from products where product_id = 4;
delete from products where product_id = 5;
delete from products where product_id = 6;

delete from products where product_id = 7;
delete from products where product_id = 8;
delete from products where product_id = 9;

alter table manufactures
add column manufacture_year date default current_date;

alter table manufactures
drop column manufacture_year;


select product_name,product_price,stock,manufactures.manufacture_name from products 
inner join manufactures on manufactures.manufacture_id = products.manufacture_id;


select * from employees;


-- delete from products where products.manufacture_id = 1 join manufactures on manufactures.manufacture_id = products.manufacture_id



 






















