
use comercio;

delimiter $$
create procedure comercio.vendedores_factura (in nvendedor int(1),out salidavendedor int(1), out numero_ventas int(11))
begin
select factura.idfactura,producto.nombre,detallefactura.precio,detallefactura.unidades from vendedor inner join factura on factura.idvendedor=vendedor.idvendedor inner join detallefactura on detallefactura.idfactura=factura.idfactura inner join producto on producto.idproducto=detallefactura.idproducto where vendedor.idvendedor=nvendedor order by factura.idfactura;

set numero_ventas=(select count(distinct(factura.idfactura)) from vendedor inner join factura on factura.idvendedor=vendedor.idvendedor  where vendedor.idvendedor=nvendedor);
set salidavendedor=nvendedor;
end $$
delimiter ;

call comercio.vendedores_factura(1,@nvendedor,@numeroventas);
select @nvendedor,@numeroventas;