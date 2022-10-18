
use comercio;
create table vendedores (nvendedor varchar(11),nombrevendedor varchar(32));

load data infile '/tmp/columnasvendedor.txt' into table vendedores fields terminated by '|';

select * from vendedores;