use comercio;
create table auditarproducto(descripcion varchar(200));

select * from auditarproducto;

create trigger auditar after update on producto for each row 
 insert into auditarproducto
 values (concat('Se ha modificado el precio del producto: ',old.idproducto,' precio anterior '
 ,old.precio, 'y precio actual: ',new.precio));
 
 select * from producto;
update producto set precio = 500 where idproducto = 1;
select * from producto;
select * from auditarproducto;
 
 update producto set precio = 490 where idproducto = 1;
 select * from auditarproducto;