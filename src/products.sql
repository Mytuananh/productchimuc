create database Products;
use Products;
create table product(
    id int auto_increment primary key not null ,
    productCode varchar(10) not null ,
    productName varchar(20) not null ,
    productPrice int not null,
    productAmount int not null ,
    productDescription varchar(30) not null ,
    productStatus boolean not null
);

create unique index index_product on product(productCode);
create index index_product3 on product(productName, productPrice);
explain select * from product where productCode = 'A1';
explain select * from product where productName = 'Tủ' and productPrice = 250;

create view product_view as
    select productCode, productName, productPrice, productStatus from product;
select * from product_view;
create or replace view product_view as
    select productCode, productName from product;
select * from products.product_view;
drop view product_view;
select * from products.product_view;

delimiter //
create procedure findAll()
begin
    select * from product;
end //
delimiter ;

call findAll();

delimiter //
drop procedure if exists 'addNew'//
create procedure addNew()
begin
    insert into product (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUE ('A6', 'Bát', 140, 2, 'Vỡ', true);
end //
delimiter ;

delimiter //

create procedure addNew1()
begin
    insert into product (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUE ('A6', 'Bát', 140, 2, 'Vỡ', true);
end //
delimiter ;

call addNew1();

delimiter //
create procedure editProduct(in idNew int)
begin
    update product p set p.productPrice = 600 where p.id = idNew;
end //
delimiter ;

delimiter //
create procedure editProduct1(in idNew int)
begin
    update product p set p.productPrice = 600 where p.id = idNew;
end //
delimiter ;
call editProduct1(5);
call editProduct1(2);

delimiter //
create procedure removeProduct(in idNew int)
begin
    delete from product p where p.id = idNew;
end //
delimiter ;

call removeProduct(6);