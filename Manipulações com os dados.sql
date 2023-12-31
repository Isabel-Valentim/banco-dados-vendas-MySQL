USE VENDAS; 

-- INFORMAÇÕES

-- 5 principais clientes
SELECT A.NOME, SUM(B.VALOR_PAGO) AS 'VALORPAGOTOTAL' FROM USUARIOS A
LEFT JOIN COMPRAS B
ON A.ID_USUARIOS = B.ID_USUARIOS
GROUP BY A.NOME 
ORDER BY VALORPAGOTOTAL DESC
LIMIT 5;

-- 5 principais lojas
SELECT A.NOME, SUM(B.VALOR_PAGO) AS 'VALORPAGOTOTAL' FROM LOJAS A
LEFT JOIN COMPRAS B
ON A.ID_LOJAS = B.ID_LOJAS
GROUP BY A.NOME 
ORDER BY VALORPAGOTOTAL DESC
LIMIT 5;

-- 5 principais produtos
SELECT A.NOME, SUM(B.VALOR_PAGO) AS 'VALORPAGOTOTAL' FROM PRODUTOS A
LEFT JOIN COMPRAS B
ON A.ID_PRODUTOS = B.ID_PRODUTOS
GROUP BY A.NOME 
ORDER BY VALORPAGOTOTAL DESC
LIMIT 5;

-- CONFIGURAÇÃO FUNÇÃO SEM GROUP BY
SET GLOBAL sql_mode = '';
SET SESSION sql_mode = '';


-- Valor a receber
SELECT IF(STATUS = 'PENDENTE', SUM(VALOR_PAGO), 0) AS 'À RECEBER'
FROM COMPRAS; 

-- PREÇOS DE PROMOÇÃO
SELECT NOME,
PRECO, 
CASE WHEN CATEGORIA = 'ELETRÔNICOS' THEN PRECO*0.5
WHEN CATEGORIA = 'MODA' THEN  PRECO*0.7
WHEN CATEGORIA = 'Casa e Decoração' THEN  PRECO*0.7
ELSE PRECO
END PRECOS_PROMOCIONAIS
FROM PRODUTOS; 

-- PROCURA POR USUÁRIO
SELECT NOME, CPF FROM USUARIOS
WHERE NOME LIKE 'A_A%';

-- SELEÇÃO DE DIFERENTES PRODUTOS DE UMA CATEGORIA
SELECT DISTINCT NOME
FROM PRODUTOS
WHERE CATEGORIA IN ('ELETRÔNICOS', 'INFORMÁTICA');