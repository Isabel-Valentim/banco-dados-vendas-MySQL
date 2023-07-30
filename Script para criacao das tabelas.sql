DROP DATABASE IF EXISTS VENDAS; 
CREATE DATABASE VENDAS; 
USE VENDAS; 

CREATE TABLE IF NOT EXISTS `vendas`.`produtos` (
  `id_produtos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `subcategoria` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `largura` FLOAT NOT NULL,
  `altura` FLOAT NOT NULL,
  `profundidade` FLOAT NOT NULL,
  `peso` FLOAT NOT NULL,
  `preco` FLOAT NOT NULL,
  `tem_garantia` CHAR(1) NOT NULL,
  `tipo_garantia` VARCHAR(45) NULL,
  `meses_garantia` INT NULL,
  `data_cadastro` DATETIME NOT NULL,
  `status` VARCHAR(45),
  PRIMARY KEY (`id_produtos`),
  UNIQUE INDEX `id_produtos_UNIQUE` (`id_produtos` ASC) INVISIBLE,
  INDEX `nome_idx` (`nome` ASC) INVISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `vendas`.`lojas` (
  `id_lojas` INT NOT NULL AUTO_INCREMENT,
  `cnpj` CHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `cep` INT NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `data_cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id_lojas`),
  UNIQUE INDEX `id_lojas_UNIQUE` (`id_lojas` ASC) INVISIBLE,
  INDEX `cnpj_idx` (`cnpj` ASC) INVISIBLE,
  INDEX `nome_idx` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `vendas`.`usuarios` (
  `id_usuarios` INT NOT NULL AUTO_INCREMENT,
  `cpf` CHAR(11) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `ddi` INT NOT NULL,
  `ddd` INT NOT NULL,
  `celular` BIGINT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NULL,
  `tipo_endereco` VARCHAR(45) NULL,
  `cep` INT NULL,
  `bairro` VARCHAR(45) NULL,
  `endereco` VARCHAR(100) NULL,
  `numero` INT NULL,
  `data_cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id_usuarios`),
  UNIQUE INDEX `idusuarios_UNIQUE` (`id_usuarios` ASC) VISIBLE,
  INDEX `cpf_idx` (`cpf` ASC) INVISIBLE,
  INDEX `nome_idx` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `vendas`.`compras` (
  `id_compras` INT NOT NULL AUTO_INCREMENT,
  `id_usuarios` INT NOT NULL,
  `id_produtos` INT NOT NULL,
  `id_lojas` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `data_pedido` DATETIME NOT NULL,
  `meio_pagamento` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `desconto_concedido` FLOAT NULL,
  `frete` FLOAT NOT NULL,
  `valor_pago` FLOAT NOT NULL,
  `cupom` VARCHAR(45) NULL,
  `parcelas` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `tipo_entrega` VARCHAR(45) NOT NULL,
  `data_envio` DATETIME NULL,
  `data_entrega` DATETIME NOT NULL,
  PRIMARY KEY (`id_compras`),
  INDEX `id_usuarios_idx` (`id_usuarios` ASC) VISIBLE,
  UNIQUE INDEX `id_compras_UNIQUE` (`id_compras` ASC) INVISIBLE,
  INDEX `id_lojas_idx` (`id_lojas` ASC) VISIBLE,
  INDEX `id_produtos_idx` (`id_produtos` ASC) VISIBLE,
  CONSTRAINT `id_lojas`
    FOREIGN KEY (`id_lojas`)
    REFERENCES `vendas`.`lojas` (`id_lojas`),
  CONSTRAINT `id_usuarios`
    FOREIGN KEY (`id_usuarios`)
    REFERENCES `vendas`.`usuarios` (`id_usuarios`),
  CONSTRAINT `id_produtos`
    FOREIGN KEY (`id_produtos`)
    REFERENCES `vendas`.`produtos` (`id_produtos`))
ENGINE = InnoDB;
