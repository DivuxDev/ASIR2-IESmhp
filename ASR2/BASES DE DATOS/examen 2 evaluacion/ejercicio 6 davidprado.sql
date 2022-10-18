use comercio;
SHOW VARIABLES LIKE 'secure_file_priv';
select idvendedor,concat(nombre," ",apellidos) from vendedor 
into outfile '/tmp/columnasvendedor.txt' fields terminated by '|' optionally enclosed by '"';

