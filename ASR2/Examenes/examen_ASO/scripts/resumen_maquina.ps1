write-host 'tu ordenador de llama...'
(get-computerinfo).csname

write-host 'tu IP es...'

(get-netipaddress -interfacealias 'interna').IPv4address

write-host 'tu dominio se llama...'

(get-computerinfo).csdomain
