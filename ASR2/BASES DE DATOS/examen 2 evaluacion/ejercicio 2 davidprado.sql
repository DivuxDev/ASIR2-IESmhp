use comercio;
describe producto;
select * from producto;
select * from detallefactura;
describe vendedor;

 drop procedure comercio.consultaventasproducto;
 
delimiter $$
create procedure comercio.consultaventasproducto (in codigoven smallint,in codigoart smallint,
out textosalida varchar(200),out univendidas int(11))
 begin
declare vendido int;
declare texto_salida varchar(200);

select sum(detallefactura.unidades) into vendido from vendedor inner join factura on vendedor.idvendedor = factura.idvendedor 
inner join detallefactura on detallefactura.idfactura = factura.idfactura
 where vendedor.idvendedor=codigoven and detallefactura.idproducto = codigoart 
 group by vendedor.idvendedor;
 
 if vendido>0 then 
 
 set textosalida=(select concat('el vendedor ',codigoven ,' ha vendido ', sum(detallefactura.unidades), ' unidades del articulo ',codigoart) 
 from vendedor inner join factura on vendedor.idvendedor = factura.idvendedor 
inner join detallefactura on detallefactura.idfactura = factura.idfactura
 where vendedor.idvendedor=codigoven and detallefactura.idproducto = codigoart 
 group by vendedor.idvendedor);
 
 set univendidas=(select sum(detallefactura.unidades) from vendedor inner join factura on vendedor.idvendedor = factura.idvendedor 
inner join detallefactura on detallefactura.idfactura = factura.idfactura
 where vendedor.idvendedor=1 and  detallefactura.idproducto = 1 group by vendedor.idvendedor);
 
 else
 
 set textosalida=(select concat('El vendedor no ha vendido el articulo. Mirar otros vendedores'));
 set univendidas=0;
 
select vendedor.idvendedor,sum(detallefactura.unidades) as 'unidades vendidas del producto'
 from vendedor inner join factura on vendedor.idvendedor = factura.idvendedor 
inner join detallefactura on detallefactura.idfactura = factura.idfactura
 where detallefactura.idproducto = codigoart group by vendedor.idvendedor;
 end if;

 end $$
delimiter ;

call comercio.consultaventasproducto(1,1,@textosalida,@unidades); 
 select @textosalida,@unidades;

 call comercio.consultaventasproducto(5,1,@textosalida,@unidades); 
 select @textosalida,@unidades;

 



