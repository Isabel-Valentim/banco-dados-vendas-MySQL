-- PERMITIR IMPORTAR OS DADOS
show variables;
SET GLOBAL local_infile=1;
-- ARQUIVOS SÃO CSV (separado por vírgula) (*.csv) - do Excel
-- USUARIOS
LOAD DATA INFILE  
'endereco/dados_usuarios.csv'
INTO TABLE vendas.usuarios
CHARACTER SET latin1
fields terminated by ','
LINES TERMINATED BY '\r\n'
IGNORE 1 Lines;
SELECT  * FROM vendas.usuarios;
-- LOJAS
LOAD DATA INFILE  
'endereco/dados_lojas.csv'
INTO TABLE vendas.lojas
CHARACTER SET latin1
fields terminated by ','
LINES TERMINATED BY '\r\n'
IGNORE 1 Lines;
SELECT  * FROM vendas.lojas;
-- PRODUTOS
LOAD DATA INFILE  
'endereco/dados_produtos.csv'
INTO TABLE vendas.produtos
CHARACTER SET latin1
fields terminated by ','
LINES TERMINATED BY '\r\n'
IGNORE 1 Lines;
UPDATE vendas.produtos SET `tipo_garantia` = NULL
where `tipo_garantia` = '-';
UPDATE vendas.produtos SET `meses_garantia` = NULL
where `meses_garantia` = '-';
SELECT  * FROM vendas.produtos;
-- COMPRAS
LOAD DATA INFILE  
'endereco/dados_compras.csv'
INTO TABLE vendas.compras
CHARACTER SET latin1
fields terminated by ','
LINES TERMINATED BY '\r\n'
IGNORE 1 Lines;
UPDATE vendas.compras SET `cupom` = NULL
where  `cupom` = 'NULL';
UPDATE vendas.compras SET `data_envio` = NULL
where  `data_envio` = 'NULL';
UPDATE vendas.compras SET `data_entrega` = NULL
where  `data_entrega` = 'NULL';
ALTER TABLE vendas.compras MODIFY COLUMN `data_envio` DATETIME;
ALTER TABLE vendas.compras MODIFY COLUMN `data_entrega` DATETIME;
SELECT  * FROM vendas.compras;

