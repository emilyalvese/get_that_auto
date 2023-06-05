DROP DATABASE IF EXISTS get_that_auto;

CREATE DATABASE IF NOT EXISTS get_that_auto;
-- Usa o banco de dados get_that_auto
USE get_that_auto;

-- -----------------------------------------------------
-- Table .`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendedores` (
  `idvendedores` INT NOT NULL,
  `salario` DOUBLE NOT NULL,
  `porcentagemComissao` DOUBLE NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvendedores`)
);

-- -----------------------------------------------------
-- Table .`enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enderecos` (
  `cep` INT NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cep`)
);

-- -----------------------------------------------------
-- Table .`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes` (
  `pessoas_cpf` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `enderecos_cep` INT NOT NULL,
  PRIMARY KEY (`pessoas_cpf`),
  CONSTRAINT `fk_clientes_enderecos1` FOREIGN KEY (`enderecos_cep`) REFERENCES `enderecos` (`cep`)
);

-- -----------------------------------------------------
-- Table .`vendaRegistros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaRegistros` (
  `idvenda` INT NOT NULL,
  `formaPagamento` VARCHAR(45) NOT NULL,
  `data` DATETIME NOT NULL,
  `valor` DOUBLE NOT NULL,
  `carrinho` VARCHAR(45) NOT NULL,
  `vendedores_idvendedores` INT NOT NULL,
  `clientes_pessoas_cpf` INT NOT NULL,
  PRIMARY KEY (
    `idvenda`,
    `vendedores_idvendedores`,
    `clientes_pessoas_cpf`
  ),
  CONSTRAINT `fk_vendaRegistros_vendedores1` FOREIGN KEY (`vendedores_idvendedores`) REFERENCES `vendedores` (`idvendedores`),
  CONSTRAINT `fk_vendaRegistros_clientes1` FOREIGN KEY (`clientes_pessoas_cpf`) REFERENCES `clientes` (`pessoas_cpf`)
);

-- -----------------------------------------------------
-- Table .`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `cnpj` INT NOT NULL,
  `enderecos_cep` INT NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  PRIMARY KEY (`cnpj`),
  CONSTRAINT `fk_fornecedores_enderecos` FOREIGN KEY (`enderecos_cep`) REFERENCES `enderecos` (`cep`)
);

-- -----------------------------------------------------
-- Table .`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categorias` (
  `idcategorias` INT NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorias`)
);

-- -----------------------------------------------------
-- Table .`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produtos` (
  `idprodutos` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `imagemProduto` VARCHAR(45) NOT NULL,
  `altura` DOUBLE NOT NULL,
  `largura` DOUBLE NOT NULL,
  `quantidade` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `unidadeEmEstoque` INT NOT NULL,
  `categorias_idcategorias` INT NOT NULL,
  `fornecedores_cnpj` INT NOT NULL,
  PRIMARY KEY (`idprodutos`, `fornecedores_cnpj`),
  CONSTRAINT `fk_produtos_categorias1` FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategorias`),
  CONSTRAINT `fk_produtos_fornecedores1` FOREIGN KEY (`fornecedores_cnpj`) REFERENCES `fornecedores` (`cnpj`)
);

-- -----------------------------------------------------
-- Table .`carrinhos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carrinhos` (
  `produtos_idprodutos` INT NOT NULL,
  `vendaRegistros_idvenda` INT NOT NULL,
  `vendaRegistros_vendedores_idvendedores` INT NOT NULL,
  PRIMARY KEY (
    `produtos_idprodutos`,
    `vendaRegistros_idvenda`,
    `vendaRegistros_vendedores_idvendedores`
  ),
  CONSTRAINT `fk_produtos_has_vendaRegistros_produtos1` FOREIGN KEY (`produtos_idprodutos`) REFERENCES `produtos` (`idprodutos`),
  CONSTRAINT `fk_produtos_has_vendaRegistros_vendaRegistros1` FOREIGN KEY (
    `vendaRegistros_idvenda`,
    `vendaRegistros_vendedores_idvendedores`
  ) REFERENCES `vendaRegistros` (`idvenda`, `vendedores_idvendedores`)
);

-- inserts emily alves
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678911111, 12345671, '442 Donald Avenue', 'Alyosha O''Bradain', 47992117973);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678922222, 12345672, '7455 Namekagon Place', 'Mada McPeck', 47992117973);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678933333, 12345673, '09 Meadow Vale Street', 'Lita Balentyne', 47991853907);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678944444, 12345674, '448 Hermina Junction', 'Reidar Tollady', 47984241802);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678955555, 12345675, '922 Blue Bill Park Court', 'Shaylah Tear', 47991234869);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678966666, 12345676, '538 Bluestem Way', 'Arvy Till', 47992301175);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678977777, 12345677, '67017 Bunker Hill Plaza', 'Tommy Raubenheimers', 47992114545);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678988888, 12345678, '12 Roth Avenue', 'Geoffry O''Doherty', 47991341877);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678999999, 12345679, '0467 Lawn Hill', 'Damara Jesper', 47991557830);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (12345678900000, 12345670, '6197 Charing Cross Parkway', 'Monah Donovin', 47992136577);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (98, 8, '191 Lotheville Point', 'Miguelita O''Scollee', 99);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (83, 74, '671 Tomscot Place', 'Elaina Soldan', 64);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (46, 39, '3 Spohn Point', 'Valentia Lamasna', 22);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (41, 60, '6475 Debs Parkway', 'Alexandro Arlet', 79);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (16, 45, '9 Sunnyside Avenue', 'Weider Cultcheth', 2);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (21, 3, '58973 Buell Crossing', 'Trev Iglesia', 42);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (40, 43, '334 Columbus Trail', 'Gale Kording', 69);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (63, 61, '747 Jana Street', 'Cam Duncanson', 68);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (94, 88, '353 Rusk Junction', 'Wendye Moverley', 48);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (58, 89, '68694 Bluejay Point', 'Ephrayim Ludlam', 24);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (38, 31, '4698 Montana Hill', 'Melody Loughman', 63);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (20, 35, '318 Warbler Plaza', 'Sim Glasper', 67);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (40, 71, '03870 Graceland Drive', 'Mollee Albertson', 49);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (92, 16, '63 7th Drive', 'Lisle Basnall', 6);
insert into fornecedores (cnpj, enderecos_cep, endereco, nome, telefone) values (84, 80, '9 Grim Drive', 'Antons Madle', 29);

insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (01, 'Graeme Cullity', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALWSURBVDjLlZNbSFRRFIb/c8bLjM7NcUadvDZig1kgUVmBEpRplIj1ki/1XFAQXUAq6EL1UvSQFQk9FD4ERRGNZBcJ8UaQGgWpqSOOk46XyctxPHPOPmfvtoJCkUX7ZT+s9X2svdZeAmMM/3P6fV4fUVmZFNJ9RccGq2L+Cbz0uijgEgWMUsZOGUXLviSjA4Efg/sX438V+Bu99yFgL9NgI5SZLSa7GOybYqCqsKCwxlUFHMyjDJ+t7jKjLb0SAtMhjzRCHfsEq4kI/rGZiweuDF36o4DDBw3G5KfW1CrYnBsgB+ugR6ZApsbBBDOcOckITMxU89RfBRx08+uRyblpt8VVhViDAnm4FlSRecUKRJMRTJM54UCKOSZ3mYsZaPDmiQY06xrSknIOCfbMCqjh15BGW0BlGVqUi2YXEB/HEBfDwHQGSaZ0RaAp7J4zr9BtTSmHrvSDhO5CJLNgRMVcWAKJqCBRglqzHRGN4HysjtkIHV8REInlxyc6oUS+o7fDh7g4ilhmRjwPWm2xCIxJMPC/EjWqyHCux9mRLlRorHNZIMrztCHU8wWapiIhIRfBHitC4wm4rcXj6qSAB3Ybai28efY85KcVITPZi4fuaGXJDYd5USAs/sSWW552iztpe+7WcjTV+VB29DDOtDxBacER6IxCpzooGEKzQSQlpqDD/w6dgWYa1VTH0hSKT/p3vL3u6VOUV+vc3nyEBsfAg0vwcJj3hWrQKAHRCeYUCYWZxZgnC+KHodawuPyW0hq/d2Jo+nlkphcD3W1cEIXGR5NqzUKaNRtum4eP1gSXJR1dI21oG2ydXFCxWfh9mZ6dW1sGxhrrs0QoqgqVqkvVeJwF2ObZg4+BdjR9exNSNewavca+Cqtt4+PTOZdB2YWUNRZkpJlQPdyNjZk70dH7XpJAt3C4b6WJq536E9kGVWE1hOD4zfSgS2GiUDidUPLizlzLcs5P3E1ndhQ2sD8AAAAASUVORK5CYII=', 3.30, 8.70, 44, 'aaa', 99, 52, 12345678911111);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (02, 'Ynes Wylie', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAANBSURBVDjLXZNrSFNhGMcPQQQRfYv60meJoiCtROuDZRcEA6MP3ckwS0tlZVlptnXRqavMaqZ5Ka1Jq1bOmWiXs466mqZzLs0103CmLp27HOdlaf+es2xFL/xe/jzv8/+/vA/nMACYsWpmDiEmjEQTMU+o/wvVFs+e64mAP3XGoWLmEtljzXv7vSMsXM37bHp1ZEPyK6+WsM+ifa+O4tyGuJHxzjQ79euJpb4AWwWT6tLv/zY1VI3hd9GOD8oQXtowglvNNhS3DfoQ9DWuB23K1R6nSeLh205+J18LMZex3mPOu41p9qH6aIfuQciPvHd9eGQcgIL7CrmqA3mPO3DvdQ8Uhn6UvGXxSb11Ztz6eHro+TIzeQOYLwXMhq7C+ebGopWebLYHFfo+qNhedFtdGHHxGHaNwdznQnldN0rqe/GoUgajIniys3BhK3kDfINILq7KSXlqQmFDL5R0m7BGnU58/jaICdIC/E/gjqYbcq0F6UoO8aW6K74ZCNveghbtqScm3Kkxo5Nu9vz4Cd7jwe2SUtgoyD05iae1b8B9diJT2Q6hV/D4A3bmcnaRohVZD42wjXsxOjmDKTo4K5bggaoSKRckqNPpwQ5acEKuh9ArePwB2zNr7LFFeohLDejjvRQyA6vTjcuyqz4zZ2hHWtMJiOpjkfDmEGLL1BA8/oBt6U+0u66zkJS34K3FiQF6tNXtxQttI3rsLgxNAymNiSjvzsfVVgkSa2MQmXWrxR8Qduq+OEL8HEl3dZAqzRimgY16AfcMQdpBASfZeJSY81BMSBpTEK3cjUj55rW+gNAEeRDRseV8FUQFHLKUXTD0OsDTPHiPF0bShyujkd8hwyXDaeR9lCK57hjCczb8/dbXHpYdiZOWe8LPPMMB2UuIbnJIvtEA0fV6HM9lsU+xG7ntGTjXlIgc40UkaGKwXrxmwh+g0+nCTCYTXrPcdOixIqw5rsC6JJUPQe+4G4Ws1guQGtIRrz6EkPQgb+Dplb+foNFoFhG8xWKBuqrKvmpPmmTFrlQtYZ9FG3Fj84Sk6QyOVh5EcGogDmTv2eEfYllZ2QKii5gilv//KwtslIaORuRuQvC5QEjzM4apb4lQ/wXCx9fe4QKeWQAAAABJRU5ErkJggg==', 1.10, 2.80, 34, 'bbb', 18, 92, 12345678922222);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (03, 'Kynthia Kolinsky', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGSSURBVDjLlZO7S8NQGMVb/weRgoI4iIuCVuoiuBfBwUFwaosPqJODk5OLBVutSlMsuDg4OVWkYO3o4Cha/BNS+qLP9K3HnEtT07f94HATcs8v33eSawBgUGtSlVmVZYimVY3Ro8nQBJgrlUq2Xq9/NxoN9JL6HD6f76oTogEsNBeLRSiK0lIul0Mmk0E8HheQWCwGSZLaICwjAdxQLpdRrVbFShUKBWSzWSQSCQEolUrgSwKBgIB0AWjWRAAN+XweyWSya6RmJsY2gDpGawOvObc2SiqVEp3Istwf0Ck9hJ0wj3Q6/X+AHsJxmAlBIwGoWq0mciGEGhnALkJvDzgK2LB3sQH7mRWrjtmbgQCaNAVf73HyYMdTVMK7HIb3xYkt7zxWDkyeoQC273BbEfy8RPDrGixPZBfeyD4B5aFfgVo/XkQoegt9PX5IBEAP+OmXwdrhDNxhB1xhmzC7nm1/HTR/x2U1ZUXd3PMw+YOn2PTM4Ty8I97MlfcigyZgipBBR3lhe/zO4jQpbJvrkn3CT+8vh7avwsYhJlIAAAAASUVORK5CYII=', 3.80, 3.00, 82, 'ccc', 15, 45, 12345678933333);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (04, 'Osborne Tomaszkiewicz', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKsSURBVDjLpVNdSFNhGH7P2dnZz3FOxfnD/Ns0pzXNEgbdSEhlhBeV9AP90IUV3XhR0EV3CUEXgRBBfxS18CIYXWStKJIo2NxSmw1zGLYlOja3Ua25nW1n39c7KVEwCzrw8vC97/s833Pe7/sYSin8z8euV/R4PPzo6KhqvR7mTw76Hrw/LpDFa5Yqjp1MFELsh9g3cHTr3X9ygOQehYLczynlmpmkIEgcK3A8vXPsytOevwoguRVI2qYtUUHk8ywYmeDEt3AU8msWJFv32Zut6wrsrRMvVHBpCHwMQJUgje3v7mrTSjFXfl3KJKGzjpxaNQOv13tDkqQODMhmszyG0Ww2Mzb763RbY5UiEAiAsTwFTMJFlNUn2JfDjmQmk/mSTqcBMcIiUdLpdM0o1oyJ8zzPM06nc6S+Uqvw+/2HBRUHheKreYOpk4357nkFQVCLonjJZDI1o4iRRdJAMBiERCKhx4Q9Go22I+5bWFjYjI3Pq+mT6yW1XfrCyi1Qxodq9OzIIawP+3y+vIMPrMVimUFyHB3MY2GPQqEYQ+JOtVo9UcT4e2W55BlNaRHk4o+hvLVXq5JJD0k21WUwGPICb5eGiERnPB7XI9H+e+dwaM5Sr/RYKjYdABDHwW0dhIKiFBTTebqrZopzOBwZnJdnSQAJt1Y4mEDcUalJuQtKzQc1xUk8VT8AJZBLvAPD9nOMnCxeZIgYQgH38k20Wq1ZtKRBcp2ahL+3CK7hho6TTUq5C0hm7teZyUEmtEP4EwvP7EOzpy+/qF2+B0jk0EkKcYqXIsGyDbub1JooUCmGRBmMPZrGLgJEnAZdYy00qCPlb/rNG9d8C+6r2+ZajgzqZWwABb5ihq66ezKVCcKTHpge6rdxa70FKZ1Rjt/uSVFC8dfJiqDLCHmktOInriB9Oz6CFbUAAAAASUVORK5CYII=', 1.60, 5.00, 69, 'ddd', 5, 47, 12345678944444);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (05, 'Letty Duckit', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJsSURBVBgZfcFLbExhGIDh9z9zztw6marQUm1DNZEQEdUpsRC2lLgsJDZNGmFjY2nBErGzENewIEUQRBBBJFW3IC6xqqYSd4tWtOPMnMv/fdqYUIvxPEZVqWbn6sUzm+tyV3OpTMFaQUET2eSN7YdvdFHhUMWudR1OY23NxVwyXbAiWFUiK8YfLa3ZvXFpDxUOVbTUanZKpmZ5Jl9L67w5NDY1IKKICHWZzAkqXKpI6seoftZsae/a7Ez3ikwoaZox63H/7LGACocq9n3fE06dlh3L4hOaFMbLMiH48FTntjWGVLgD1wt+Oj8/Y4zDX8r5rZ/ibYcWvjxV09/R3NJKyXh4JuTDx2HtHVrU28lvZuBap7ateYQxBpRxih9Ydhx4QuvceRQKAU9vncWYNF4yT1NHN6eP3olvv3q/JX7cc8EMXC5I29o+E349jA0T4OTZ2xtRmrqaKZ2zGCyCtfzhKkxDeXHuXvDm7etNLpFBJcSGSVSUn0MP6M6/gvg4PKSq45uupA4+33PJxaiRuMTo0CDRyCckKlO3YD0/2nfxL2VCzoPRk8v4kpxJ86IVSZfIwc3UM2PVfkBAFRuHJL7f5KtfxqqlZBP4McQ2orlhCQaIn70ojXj9sUukqC0TfjsJKL8JKbFkyTEmSYwYPBWsRLgEWCDR0d40Z2XfiEsAKjEYQBUQkAhHIxrcH9QbHzVF1CmiDJPOtPMOOLOSEca5hIrBgiqoBQ1RCUDKqJZQ66O2iMajqPUBYTJXQyH2h5HYA3VAE6h6IClUakAjVEMwITgxtlxmMlfLweehIxsaUBwMhv9RwNwF0WEqfgE9XTQvEQ+I/gAAAABJRU5ErkJggg==', 3.80, 5.20, 12, 'eee', 37, 72, 12345678955555);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (06, 'Coreen Harrower', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMxSURBVBgZdcFraFtlAAbg9zvnO5fcTk7Smda2SRvbLbau69aSUXWdE4rTuTlBnUxkYzgUFX9VLKJ4mQoyEMShwqygqKWKjKEDYSiuk152payKTdvFZZCmSdauTXNyTs4ln/vhjxLc85D1n82BASAMcqcqfPDgeu+BWpmXzl3XUqNThWPJtHbc55MRUCSUNQeT78WwFnWKNsAAw6oYaUryFUrErOEYl+a0C8mU/o2iyvD6ZNwOdW6aYAIPn8z1PBBx7x88OX8k0iBvpgyCKIv3KiH3DoFBqlgMt9gA3sAaHCs5KK9anr425UhzUKrnjUqqK+SK1MhcoKxZNTLPHdwYdb1W76cvLGZMEVU43aigRRUON/po15Wp5cvtdeKzDQp/j+RUmAeVWp9I1NlZbaxYsPP6sjWEKtTv4h55KB58e/z84vDpM9m3WMmULNP5VA25tzTdrXYspPSvbiwYo7FWz8dHdxzfkxhaucx7O6DdGAEx0gfpgb7QywEvnwsoVPPAXlIa3H13BD0BItKwV7AKJcLO3hkSor01vwZ3xdR3Xev2wB/dguV/Ypg+PXiU+j10Lw84AVUgstfFVsr0t1MXV8ObN/l6rKKd4xkb2Bkd3fDitqzkV+/H0tW/IRITPqUO3pqIn/I8caaTJfx+ocBMwQXKkbbWJvn1ZKLwcypZeuf7p97cFO/u+VZteRjlzDBEN0FqchqWYS4aevE+bva6gZ/OLCOTtznKk8fr1gmfuCWuZTFbHrt0eH94a3f8O7X1UWLMfwEi3ITg9UEuXc1ahUxf/JUTM3Rm3kJ92AVR4CjAnnbLXC1z2OyTjT/0ehr3feRvfQxG+nNwgg2zEEV+ZHzV0Uu7u/rPTeIWwhhDtV/er3+iOf7MUGz7XtHMfg3CmzBWGpE/e153dK091j9+Df/hUOXLlyLPNXUf+tFiYTEzdQwVGNCWGpAbmcg5hrYx1j9+DWtQVFGaNwy2b3seieFXMfPHGKRIJ+xcYj4g8js7BiaSqMKhSmJuwTb/OoVoZy88nhjSF6eKhm7u6hiY+BP/gzDGsNa+7UG9665aurUtCiaUx/Rc/tDuD68kcRv/AvFKVJouQOXGAAAAAElFTkSuQmCC', 3.60, 3.90, 72, 'fff', 27, 63, 12345678966666);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (07, 'Grayce Wingfield', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEUSURBVCjPXdFNSsMAEIbh0Su4teAdIgEvJB5C14K4UexCEFQEKfivtKIIIlYQdKPiDUTRKtb0x6ZJ+volraEJ3+zmycwkMczGzTE3lwkbxeLE5XTqQfTIjhIm6bCy9E/icoOoyR4v7PLDN+8ibxQHxGzE3JBfHrgUalDnQ6BNk1WRFPjs66kDNTxqg0Uh5qYg4IkrjrS9pTWfmvKaBaGaNU4EY+Lpkq88eKZKmTAhbd3i5UFZg0+TzV1d1FZy4FCpJCAQ8DUnA86ZpciiXjbQhK7aObDOGnNsUkra/WRAiQXdvSwWpBkGvQpnbHHMRvqRlCgBqkm/dd2745YbtofafsOcPiiMTc1fzNzHma4O/XLHCtgfTLBbxm6KrMIAAAAASUVORK5CYII=', 3,30, 2.90, 3, 'ggg', 96, 100, 12345678977777);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (08, 'Elvyn Coltart', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJbSURBVBgZfcE9iFxVGMfh33v3zM7uODMr6iaoqJWypBELZfEDCy3TWElQQRAstLKwMJ1iJVqpaBdCyq1tLCVWsVhihBAwyy4SdWMyc+fjzr33nPP+XWEkW7g+j0niv5z/6vsvhr3eG6OF1swMMzbklCyZOU29uBA4wbDfe/Ods1ubvV7fuGeDpVkT+Xpn9+3ACcqKbq/Xt+u3Jlze/5CN4V9UbeTg8EGef+RTtrcexWzFAicwY5iA5E6/f8h65wGcBl/d589Rhcsx0zBwAomJxMa0ahnVNVlzZrHhblUzogEZEpNw47tnd9eGZ86YFdwjOsVbKxJMa2f/1pN49xqzWDEePcFTp7v8K5iKrcdevNAxMxBHBGakn3/EHcaLzNOnP+KZ/Q/45cYB45c/J8WEADMbBpJqvO02f3xDblegGGI2AJ3CEFd/e58YI1falvbhDu2114kxcu6FK0gQiFbIW3K7ilz44oDF7T3OWsWdS3u8xzErwHqA9UCwCFIZMK15WjD//ZD5zZ9QiljosnXuIimJpolg4A5FARbuY7HzCl/u7Jbz2eJiIBaE9VNsbp9nc9v5h/KENPkBb/aAiOIM5TnyirXHP+ZX4JN3X7qfI4EoKdd4dRXlklxdB0WQI68xE8pjlGcoVyDnuECD5AmPt1EqwQLKM1ACNUgFynM8TVGeghnHBVrJyCjdRWmM0hjlEqUS5RKlKcoTlOfIa7w54EjNUlDro1Td6cXZ6gAfFFIHfAB6COUGaFHRAC1WZHJdS603LAXVzWc3v33tOcSrGAP+jwC73OK6xNLfULttUqzYsnAAAAAASUVORK5CYII=', 6.90, 6.00, 71, 'hhh', 59, 46, 12345678988888);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (09, 'Paquito Goodbourn', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJgSURBVDjLnVNLa1NBFP7m3jQPSVKiTaskGKQKUqlSQZTqqlWrCwUX9bFx6dIf4MpFXQi6cafgQhAVJD7oLou2uFBEBLswCxFqbFRswZjHvbd3Zu6MZyYGiptKBy7f3DnnO+c7Z84wrTU2s6buT0wLKe86/+N8efZ88WL53NF15LNEflwY2pFjGykg8m7OxT7O+TMu5JQQIknkF9vzg26tXm9vqIDIOSKXi/mCQ+QKkV+WCkVLJvNBdq3y0EpQWkFFCpGij1BEEoJHCIWAL+vQqU/oz2TQ8X0sf1+BE45DihRi8eZJHN6TWpdTQypNQbooCYXUWGq9xXztFrRiOL3zDuJsCPfmfiLWo7V8Sdnxl6TALVFZMifUchRj2Zv2fLWRw9a0QtCR3QCnDqRRWWxjcjSNph/hyesGpo/kkIoz6K4oLNZ8LFSBS+MDCCngg4UVqEBQKVLCDxVyaRdUPhJ9DgKq3ZBvz/4AI/71p8so5eMYKaRQ2BbHrsEkAkE98yQcL5R489nDoeEteP6ugWQfw5XjecRchk4YWQUeoQl+bG/WltteM80lmxfB6QQaEyMZzH9s4cT+rFVzo/yNHDQ8cjRjYlDR5sOXDr6uhvZsjewq5HCaAacr03hVbcF1mDV2SJUZMJPZSPC4CQAqqY7f1Oz+lIuZCyXoUINNzlT1mbEc6r9CcKrLNMhkN503e25vonsbws5H93pLAwnMPVpCrNWWtmmZpAtO9ScFg0iQkySUDoTSlmSGi+LYQTMqey+ADV99r9cCkmxrIiM3e0IjnxMS0f6TAtvJfxbb7HPurT/OV55dSDB+9QAAAABJRU5ErkJggg==', 8.90, 1.70, 33, 'iii', 40, 23, 12345678999999);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (10, 'Piotr Barbera', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAADrSURBVDjLY/z//z8DJYCJgUIwyAwoPZHJBsS7STGABY1/9e+fvzKkGMAIiwWgzRfF2ST0/vz5w/Dw/UOGXz9/M/z6AcK/GH4CMZj+jmCD5C70X2VkgWo+KcYqrqfArcTw598fBhluOTD9++9fIP7N8PsfEP/9AxUD0b8ZVq9ci/AC0Nm//zD+Yfj19xdY0R+got9gxb8RNNQAkNyf/0CxX39QvZC5M+68MJuIAQczJ8PDlw8ZXr9/g9XZIK+BNP/5/Yfh/sJHjIzIKTF2VchNoEI5oAbHDWk7TpAcjUDNukDNB4nVjOKFEZwXAOOhu7x6WtPJAAAAAElFTkSuQmCC', 6.80, 3.40, 58, 'jjj', 32, 43, 12345678900000);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (11, 'Rana Rishbrook', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAANPSURBVBgZBcHdT1tlAMDh3zltORT6Ob4mtWDGMpgiU8LcEooJyiaEGbNkCkaNCVfeGP4Dr7zBG42J3hiVZInTeTMvFAPBYRhmGDBjEYaAMhhtVzraUjin5+M95/V5FCklAAAA4wtjfcCHwHmgAfADh8Ci9OSXn/d9+ysAAIAipQRgfGHMD0wC115PDmjxYANloxbDBuGaCHLMZqeEK9wZIdy3vh76/hhAkVIyvjAWAG731D/XeznZT9nUsLDZKitUSY0Dw0MKmyAGWWuepczSfeGIl79789ahCgBMdted6U0191BwbRxVQQiViqjCoIqCpbFvBtk7DNASeomek+1dtuXcAPAVL+2mgE/eOXPF97erk6VCxRMcmyEKVoCyCZvpIw51HS1+gBLd5GJ9B7Nrf566vji54rsw9uKnrzVf6FR8QbKqANnIU26I5ZyPiqmylj7Gqy6itf6DFdkk7xXxF10665Lq8sP1E37gfDKS4J6RIV+t8qyvDQ/Bzr6NaVaInpSUT0yz5ZXAksSExmbeYuCZbhxLPO8H6mr8tewYGfYtg3DNKUp2mGLRI9pg0hg3yLsvULZW0OQRR08OKJRqCAXDOLaI+aWUiiLBtspIkvgDLlN3HZRgiOyWQJURmhsqhI/6KKcdTJZw7G2QEiGE4neFVyjb5USdL0a4+hw7aQ9lZ502nvB0Yx3rd7LcpwNHFZzzVuloaSOTq2Zx/gGeJct+4Yi/HhZ2E6drksyk59H/OKY7mGBk5D10Xadtbw///CK6A++PXqO6KkA2m2V5eZloNm75ukbOHqzub789fDql3p6ZJb4f4sobV/nos6+4deM629v/0daSwDrM89vsLDd/vEnRyNLfd4nibimgfjP8w7RtOb9Mr/1O+CBINBwFIHZxCMO0GB0dJZVKMTQ0xODgIKZVwdduAhCLxlQ/gGM5785t3rtTT6SLfA4A4+5PKNJjYmKC2tpaAHRdR3qwMvXIGP6AmnQ6bSpSSgAGv3glbKTNnyP/xlOv9g4oiUSSgOojl8uxsbGBpmm0trbS1NSEI5zS3qM95ubmHitSSgAA2tvbfY399eOhx5GPmxubq7UqTVFQeKCsllyfu90pus4qKFiW5WYymbyu61f/B/q4pKqmYKY6AAAAAElFTkSuQmCC', 12, 24, 19, '', 44, 1, 32);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (15, 'Culver Hawney', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJKSURBVDjLdZJNSFRRFIC/82YazQJpkVgbQV9aU23cuQtatIxaREi4C9zmQvrBpEUGLtvnQkqIVi0jgmzjT5PWZJYwIiEG2iInnR/ffeeeFuNMjtaFwz1wz/fde+69Ymb03Z1Ine88uZxMSuP84lo4PtKb5x/j0rX7zafPtee2torlxWymY/rVWCRmBlAneZ/9Hk6M9tVJLl693dx5tiNXKBbLix9nOzJvnkUANQHAjTtPU+n248uYNc7MLIYvnwzkAS5cvtUcnjmVKxZK5a+fZzvm3z6PqkydAODKzceprs4TOfXx4Q/Tc2EUFelMd+UK26XSty+Z8NO7F9HeejEzBgcHHwD3qjIzo6WlJQGgqnjvWV9fVzPDzFBVCoXCw/Hx8eHkLjAUXn8k+y/NDNTAe8OXNLH221FSMODXWO8QMBwANDU1ScsRIZCDcKzGj7xjNe+IvZAQCADnnEAlx8xoTELrUSEZ/IXLkbK6GbEVeRIiJIIKEIigqtQEzjmcVsBjjYJIBf65HWOeXVgIEAIRAqMmSAJEUUTkgd2dU2LkywoIIkYAeKOSG3jZJ1BVnFaK1Hu2nKcpFeDUCAJQBcQQE6qPXieI45gdNcxDKTbUV/o8lDBiJ3VwNbz39S0UdgznoeSMWEHNUBNMKmf2tgfG6gUNDQ1svh5lZWWFkaUlBtracM6RTqdZmJuju7ubqakpenp6mJycJAzDWgtiZvT391trayuq+t/w3tdm7z3ZbJZMJiNJgI2NDRYWFmqL3nvM7EBe/crVvwPwB5ahnKoTKjg4AAAAAElFTkSuQmCC', 74, 89, 7, '', 3, 45, 32);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (94, 'Anitra Kofax', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAH3SURBVDjLhZNJjxJhEIb7T8xVw78g6fh75mJGY/SqTjRGTXTcbu7xxtItPew2YxMgbGkCNMgSQkgDAiHRKNpkWPL61ZfQGcLioS5V9T711tfVQrVaRaVSQblcRqlUQrFYRKFQgK7ryOfzBwCEfSEYhoHlcrkRvV6PQzKZzF6IQJNJYJomn9zpdGwI5ZgLJJPJnRCBLFMzTaNELpfTJ5MJ5vM5zxMwnU5D07StEIGmrhqZ+JxZNqfTKUY/u4gbMq+1220kEgnEYrENiECTV5YXiwVIPP71Hc9Or+ORdAjNkHit1WqRC0QikTWIwHa0xuMxb5rNZhj+6OLk9Bpef7mN92f38JyBVpBms0kuEAgEbIiQzWavsB2t0WjEm76ZOTyWD/FWvYtP2kN8OLu/Bmk0GuQCPp+PQzgllUqJbEdrOBzypnq3gKe+I7xTj23IiXKEWMnF67VajVxAkqQDe5d4PC6yHa3BYLAB+fj1AV4Fb+KlcgvzxYy7CIVC8Hg8l9delO0nqqpq9ft9G/Lk81W88N/Am+gx/vz9fVHssFe4GNFoVAyHwxZdIrdr6kx8B9Nzyxa73W6H/YjbjiMYDIp+v9+iS1x9YhKz/Jp4J4BCURQne2mLDqxer28V7wVQyLLs9Hq9FoldLpdj6yn/73dlU51MfGlX/R/5GCirExPTUwAAAABJRU5ErkJggg==', 11, 64, 10, '', 79, 94, 21);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (11, 'Moishe Cavee', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHySURBVDjLpZNLaFNREIa/k3vTR4qKFdpaxZhFfeBCUEF8oaAiulIkoCtdFATBRcWFG6EgCG5VfFBduBVBFIIQHwga3GlREJVqS4OhrRKjwdxc7z0zLq5JGwwSceCszplv/n/OjFFV/idcgKOXXg4BSWArsB5UUQyixGKGmAERQSyluKtjK5fO34Aopw6uMqgqRy6+GNF/jPO33qiqRgqAbQA3csW6tL8ZG9zSzdvJkl+3gGhf7XKgpx0AY5onv5v2AfCqQVsdoKqJWtX3M35LzVNrzSxA1K1JazXECnMBBiA9/IiqCKKQObub8cK3psmp/gWoWABiESCiffECNq7upeiF9cfzEm0Np24htA0KAChXLYEqFT9sqBhYpZQd4Wv2Gl5+jHzvEtbGdwB7I4D5rcD3A7zAYqtBA6CUvU4wept16UHaU2vwXmXpfPqQB7viJyILc3692WTPZC4wsP0AHR+eYG4eJvHxDqlkN2p0yAWQUBQwAPdzEw3J5cpPwqlJOvpSsO/k7A4ML8YRs9wFsCITQOr11f1/dBsg39NPZTRD173j+N4UFaD83cE6FKJJtHI3febxClXdhMhCkRBUULGohGzu2knb82ckF3XiOnHKn0PGp2OqyGXT6jrnDi07/aNYOOZYk7SOflK4sicbnvsFhzwbXdu8qEIAAAAASUVORK5CYII=', 11, 29, 24, '', 9, 81, 38);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (8, 'Krispin Gripton', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAF8SURBVBgZBcFNiIwBAAbgN5etvQiJOPiuyk/YwqLk52v9NbTtarDGNpbhoCknHKgtOXxDIU60mVI4OOxVbtuchaTkoByUMpoc/NTjeSIi0irPd5q9U/2J/uHe7s7mUkQkImeLi1VrcM+cZ56oXLJusKZaVohEThcz3fve+Oaz1+bdctdNNUPdFBKZqu54658v2q54pKvlsmt2SCWpleODl75aMKvtu3MWNJ02oymDlCk7N7zwR9tHc9pm/TDtpHFNa6WT0d4d930y54E583inoe6YmhHpZX3/oVnP/fTKvF/+emzKpJo9tkk/Rf+2q9qe+uC39x5rqBt30E4bpJ+lvUuuaLmg5ZymhhMm1OwzarX0sqiz33UN06Y1TKmbcNSY7UYMSycpM5hxxnF1dZPG1YzZaZOVMkgZSbXOpGMOOeKIA/baaqNVhqSSSIp01xhV2mWrLTZZa7Eh6aaQiKRIlcESK6y23LAhGaRKIRIRkZTppJd++umlk1JE5D9AhzZjNC9N+QAAAABJRU5ErkJggg==', 28, 51, 85, '', 56, 83, 69);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (74, 'Mac Ryley', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKfSURBVDjLfVNNaBNREP52s0m0cc2PUaiWQLGKYtWKCkUPohJJFfTiIQcv2tKDCB56sAfPUjyUFKQHrS2e1NaCthapSFuxlFyMifYHRWkvDZHapj/aZLubXWfeJgV/X5g3u5uZ7/tm5j3Jsiz8byUSiS7DMC7puq6QB3lha2tr7B9J/wJIpVJeSujw+XwX3e4yaJQE04SIphy/34fBwRdQ/pacTCYjnBwMBnd4PB5Mz8yC2U3TgmmZBGShQGCapkGZmprSCoWCi0wElWSyz2azv0vGwkKWgEyEz9SJbwonV1SEsLi4JNgt/lms0hLGL8SJgN+L/r5n2Fd9SLDzf0IBo3LyjY4EhUmQJNrtTXi2leVl3G48KhjfJeJgteXnLtgKWCqzcqA/sAWyLEMik4vGzwxgmTZj9YEj4tkq9kBmBfROADIcDscvJhc9L24eM86p0+hcjImyhAK9OB5JluBQlHV24bkE8vbkbMbOj/fwY8UQKgQAb9wQLoEZK7eVifrtJSG9ZNgHauYN5ryTqJoPIpfPYWi8V0xFAMjFOtm+fPrzXGz2TmAmN4vwyeOoCOzC8MRTxMe7kdcCNoDTqaClvkaMR9cNrK5qQrLL5aQyLLQPP0DNnggKcgEHy8N4NdmD2v3H0P35ORSqq3VkZOhE6aCQD6iqWsnTyWQyGqlzf8t9hVPahLq99UJR0+m76P/QTo3sgxKNRptKUtva2q4TyPmdVbsrVdWH3icPTZr5/ez3+SsT6TEplR5Fc7gLLS8vY4PDTR2SLbmUHIvFthJbLBI5eyoUCkFVPWhoaNyYz+ejhqXfir8fg4uuDjO7JAWjydd0eszW9ctE0hfI3vb0PD5cOv/FezEZv5O+WXttu9I9PXAVGFApfIWsnb43/wTyL6VPiDb06AAAAABJRU5ErkJggg==', 58, 81, 22, '', 41, 2, 27);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (57, 'Bobbi Hursey', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJSSURBVDjLpZM9aBRhEIaf2c3dJZvNxT+I0cJK0SJGwcKfwvIQFUsRG9HSKkGLKGhjKZGICViJ5RkQtLSQGOxsElEIFsKJCsZ4t7ls9u/b/cZCLxqTzoGBgRmeeV+YEVXlf6IL4MaDFyNVzzvVirUsIojgqyXsDIlY0iR+Pj5aG98UUPW9U1fO7N/qeb781fM7RZgaJqfnzgKbA5Yjyp7ny5OXC4Pfm1+2tDN1FLBFt1txeotyycUYsWNTswtpEtfHR2u31wFE6M2BlTDberF2oMvzqihKYS0uvlsuuSRp7hZodXJ67jywHqDKqip+Kyqku8fn6cxHd6m57ASxICKoreCI4DrOzszIwNjUbJAm8aPx0dpIV4ekCkWhbmZdgnbuXD59CM/r+9eyABKmpn9yeu4S8Bsg9FoLIIUjPW4QKp7Xx8LXNq8b1+mvLhFlhk+L2zm+6w5H9+9GxJU1C6giKFnxgzwPKaySA7m1+P4iPaVtWFJsucG3VoRVi4hW1wAO9psW2U6vvMPtLlVxHAdVWIkyWklCoauEJqUZJbRIQQVV2muAKEpeTNTnDxorQ2lqKGz8C5BYGl/3YivvCE1E0NrDvoHKxju4d612H+Dm1KvhSpfdDZVBayGIC4YHxjjcGOH9h08EJ++SmxwFROSPhU5EUfJsoj5/BJVzgvL281WMMbzJMrLBEtm78xhjuHDiDWsvpKob8sbkTGOpGehymGgQJhqEsbZW/uRis623Hr5uqep6BX8pqU/U549ZnCHHEQT6FZbpbBXLahg/BpD/feefqppLG2N7xVoAAAAASUVORK5CYII=', 95, 27, 77, '', 28, 33, 74);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (96, 'Christal Yedy', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJaSURBVDjLpZNPSFVREIe/c9/r+tD36vW/IA2rTUYlZbp0FQTRQqmgXFW7loIra+NWCFxFENQmgsyEQnGlSIFUVIsURKuHBZmlWWnee985Z6aNaWa0qFkOwzczv/mNUVX+J9K/J9yAyarSrMIxEWpVQYUnIvSpcCV3Qud/rTe/TuAGTL0KN0xFS6XJ16LhBlCPRtP42Rck4+0FEc6tb9DBVQDXbxo0X38v2NaElq7DL4wiyQzqYjAZgswejA1I3naSTA02bj6t3UsA2282qDKR2n87K8E3fFwAO4e4BPUx32YWePk84kBdJfktNXwdOj8vws7tTfo5AFChOdjZmtUQJCnQdfUZXdfH6L45Ab7I2MgCmRLP8ONxfPKa0r2tWfE0L4kowvHU+jp8PIy6iMYLu1EXoz5BbcyhGhBfRG2M+/KMcOsZxHMcuPQTUEXJWiT6gorlzcgmTDqHQUEVWNTJOXbk7wMJ3lO5NIEKkbo4xDvwRcqPnAUTrjiviqc0v525x12gigip5RU8BWxUDSEqlmy+jCBTsco06mNMUIr4NDbhFUCwuEKPnX6BCStQAff1EahbBbAzg6TXHiSansAW6VkGeDoWRtrmcTmCsJzixwckk7eR4qfFzhHFqV6S991oyUEmH7bN24SOFUb6dMecTG8+2pmpaITUHG72KT56j7oYk86RylXj2cXsaC+zY32nDrXq3VVWnrxljornWllVS2W4cR/BmgDE4RLP98kxPgy1F5zl4uFL2vfHXwB4d9NkxdMiwjHvqXVFcJYnztLnLO01l//yTP8SPwD79F9Uvnnx1AAAAABJRU5ErkJggg==', 59, 64, 86, '', 29, 87, 90);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (51, 'Ina O''Heyne', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAI9SURBVDjLjZM7aFNRGMdTA+Jg8UFx0qGDi4PgoERE6qCIUJxEwcFOdhPEdhB0FVQsmRRbaM1mhdIhtUVBwzU2mPf71bzfuTEUb9repiVNrr8rNsQaJcOf795zz//xffccjaIoml3IsrwP9KnPlUrlWOe3f0GzR0Cr1mq1eqhcLk8Xi8X5fD5/ricB1bnD/Qnkl7lc7mEmk9lIpVKWeDx+o6vA79gqtGotlUoHIOcQuZnNZvWQX4HxaDSaDIfDbwKBwP69An2dgHyH2JtASCaTfoSGVlZWPodCoXuQjV6v1+d2u093nUGhUNAS20b/C7huETsM2RiJRCZIdtHn8y27XK5vDodjuasAkS+DFCk+pdNpN2QRZxmBEZxtfr//fiKRuG61WtcsFsuDvwQgzeO8GovF1MFZqRHaMHo8nh0wS/RxyF6VbDabi4IgDLTJEE6hnqDGcZQZ2A9amsJVJMlHu92+ZbPZRNYvITAKOWsymUbaAvT7mknXgcSmPANbJfYGKT7gXGRNUAUgrzmdzq/sG263gPFxXDI41yA2+ehiYGUGtslmiRROyOr7AjM5/8dvbL57q9teWvwiLr6vBYPBdZJ42NjEVaKW6LlGnWUGg10P0s7MtKE1N6c0nj5TKhN6kdg1XOv0vA5xivrfO6HZfvRYak1OKi29Xqnfuq3Enr9oEHOJI3yyp8skXxs2NO6OKq2xMaV+5aoiXhgSOJH9vZB/CUhnzuq+nxg0FI4MSLmDhw35/qO63cvVi8BP3IoJNAAt5FMAAAAASUVORK5CYII=', 47, 52, 24, '', 49, 97, 37);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (28, 'Anthia Windross', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ3SURBVDjLpVJdSJNhFD7bp7Js6qaUDqmxEFfRQFmZ00wjXYK2kgX+h114Ed5siZf9aIWFUSLRReVFgUElGVkURDCkKI3NlKIaRYmWmJmSue3b+9f5DGuBBNoHLwfe7zw/57yPSggB//NFLQcUKHG4BCEuESbt6uUQCDncqNm3x4gEbtVSR5jbuStGEPoaHSRibV7yCDxMWhH8HsHpCd6n7J8E9mPDLsGZmzN27tHJze2z23aUIbAcCTITfM+Y0qMiDQd7gNJSQdnd6MudZZEEhYd9Y5VbpFRZ9kJmlG/OdOGNdC0+58wNg03ijFZxTnGJhJZKjt1RuBCHXFmV9QfszccmbXf/9Lfc2MeTZkvBytFiw/h1Q/Z6xkhTuS3eyCh1qeQDdT0Kya/FUC3am7yjt769aCjMp4Lv7yzoyNeZHM26Ndnw7mHTjODcXnO/NpdzdggFzv71CkVHBmNKxp/cy5sY3Jo2MxKiejY7VZGwzlhUD0D8EAia4VP/+V7BuNNS84AoGHXEvCmMUc/tJOsXt7kuGdddPJsZbUqy1gKEfDBwtQu0uiDQULgUj2MBp7YfHXLhvONo5yWnpMdzylbd15YXHG3QrobtWao4fQC4/AHTw4H9eA6mgkYVleXjAx22uHkCVHXtzYhGdcI8p3PalMuhK/YYVDmhW5sBPDCM2CBYnWY09Rk0Gj8kWyo2UDnsnifgjLTf7P8+guqtC7aYHK5PTCuxxsZ9BUGn8LEl8N7yKzECHvLDqnQj9pCGvpZNGxeNMtobs1R3pUrqj0gwraQ/4q8apBVmmHj1Avy9Ld2LJhHtaXyXnEHBBdrnEUf8rqBUIVJ+AugPahHelS39AAAAAElFTkSuQmCC', 41, 99, 60, '', 7, 22, 95);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (10, 'Leda Marikhin', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALVSURBVDjLpVO7T1NRGP/dR18iF+iTQktEkHdDCjHgIGAX40AMMhrkD3AxcWBxMnExTigDPhYJcdFFHHxEo5HBVKlaCk1bFJJiaQuhpbS0ve29x3Ov0jiweZLf+ZKT7/t9v+9xGEII/ufwyjU7O3urUCh4SqWSQZIkplgsavL5vFaxsiwzOp1ONBqNL6ampq4p/hMTE/3UrM/Nze0yMzMzNRzHpd1uNxQ1NEBF8OsbXBk9BfHnI0y/64Bg60Q4HJlMpVJ3abBAoUgf4FpaWgI9PT1Gm82GaDSKeDyOnZ0dNDR14P3SNkL7fejtPwuGYbC1tTXGsqxOr9eD53kmk8kM8TRrqyAICAQCsFqtcLlcoKWAlgKLxYJgMIjFxUWYTCZ4PB4kEgmk02nVJxQKtfOKYzKZhNlsRqmqCXfe5pErM5CpPh2jwbDjJIz7+1R+GIpKJTASicBut6ulssqVy+XgdDqxsCyiSFjoNRRaFhKrwYfNKnQ4JYwNboNIWYiiCNrgikqVgHZbRVZiaW0cBQsN+wccR2Dl/ejuuwgLG1T96MRUqypQWA5ZlUOIDGU1GBag8RgUPsF2YhiC3Y065geq2JTqWyE4VEA7Ci0RUZZp/TKh8giMbBJu7UdUm2shZZ6jsXcSrcIGyqWiWkKFQGH0+/1w18TBlQ9QpG8SxWnNazi7LwEFH7yP53G8Ng8Ll0CbtVQh4JXse3t76nhMqRQGmpvV5lQjBredoLrugGZfp7VR0uxnNI9cx4Xd23jyPasScA6HI722tjYci8U4umXKPjCrK8sYaoqifWAUnOwDKe+ioctMOQ6gPaaDQd+FoPcVWf1Veskc9Zl890eumjsv3qtvM9CsXtpUEUvPgugf7wTD1QCG8/jy8EaSyPK5Iwm802c2XZfnGzl2g2ZP/V37w0NHa2hHYuUbwgs3n/JHfdFyUdT7HoznCZ0GzfIPSMVCsYTU/wbkK6iCy8xjQgAAAABJRU5ErkJggg==', 96, 16, 20, '', 68, 92, 51);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (68, 'Salome Schreiner', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJpSURBVDjLpZNNSJRhEMd/z7vr9m7t2oopZl/UoVWpQ0RC0EFL6FAQ4a0OXbrVLaJDEdStjhEUFQVBHaIuSocIomtWJvYFRhb51eqaH7vu7vu8zzvTQbENvDkwDAzMj+E//zGqymrCY5URBxh6vm/Ar21rM6aapwSF7yORm90PBP9NGQAWskc/ujiAUa9ly4EHNcYY0MVhjMFV8jtyA1dGdKkLEEvUqkbhZHHi1XngSRwApxXErgl+3yKyMfBqMSaN33yI5vZrCVQBARVAMV6q6VvPgcv/AKHxVCyRTaCiSPkX4UKO4uRravyNoCGIRdUBjnTLhQQq25Y1wKgvrowtgdoFwsI86ZZT+PWtgKGU72du5CWNbWeJJVKYeAYiL/4PEHrEk41kWk8vraoogtgxwj8vmP7+gVTzEfKDl0jXCf7mixAoVQBVjSpIaRCN5tCogLpZJJxh/vcwaxu7qN24h+Evj0nEF/A1gLDaBwGq4pBwCrFTiM0hNoctjjE7kSO9IUM030PDrtPMTIRIFCwfdhFgVQ0R6v6gbhoN86ibZnZ0jPrsCaj00/fwEalMmULeY378E7gqgFqZcaXpubCYEFdK44IGivkk4u0kXVdCgh+gQlR8y/aOc4y960Ws2GUNtBJcH759vB2lC0MaYwjq6hJbO896UnqDSpm93VnEjuOvGyKz7SBTE/e/Lh5whWfqv9NxZkPrsZtNO5NExT5ULe+ffWVvdysmth6Sh3l379KkinSuCOi7sX9098lHm2LeT9TNUOVkwCOWzJL7PMBQ79Wn8ZU+zAXW77/bXVZRVKQqdbkigqo2/QXSf1oX6zFeUgAAAABJRU5ErkJggg==', 89, 12, 81, '', 88, 20, 92);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (56, 'Hillard Petheridge', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ/SURBVDjLpZNfSFNRHMe/293umptu01GJMF1WQ5dRQgVl0UthYNHDiAQhChF6bdBLrz1Erz3Ug7CewqeoF0XzZVialnaXSHOYM2Ko6Szn3P2ze+/pnDMdodZLFw7n3nPP9/P7/n6/cyyEEPzPY9u5MDU1FdN1vatYLNroDDrzoWkam/sikUjnnoBEIuGhgl6v1xtxOCqgUhFME9wfdenzeTE4OHCTfu0GSJLUzsR+v7/O5XIhvZABi26aBCYxKYjAoDBVVfdOgW4eCAQCfEGWFRSpeDoxSQFmeVy6fIWnsSeA5SiKInK5XCmyYaA5fIJHJ1vRWbGrhRRmX3QSwd2CzdU4LErmFgcwskFFbBNrCrOekD7Q2eDR2b/AxSqcb7TD6e+CJ3gSv9IhJId6H5cdlGpF+GYGCLe08ujMRaUxAb9rCe7ac1j7+gWiRUNl1UG4awKesoNtAIfQyEzM353DCPkIvMF2qIt9ECss+CYlUVS0rCLnz5YBZbFRKhoDOPUEWmp1eBqvQck8g1XUYXfXY19hermQt7WfuvcmxQGsPdsnkllmKZDsKI4eWYfn8HUqfgqrXYeWC2IlPrZhyIWO1ui4VO4Cc8C6IAhCKe/V92io+Yn94avQlnohiATKej0W4+O08oXjoej4wnYbrVsOJkZGRpDP57GRjqPBR9tJ6rA4/QQmFGyu1WF5dAbPZwMIRccW/jwHHNDd3X1mbm6uo7+/fzKTfInmth44vr9F6vU7SINrmBn6CGfbA2Rl666DZNl5Gx/2HNPv37krwGpAGn6F+XQan8Q2ZFUHa3EyFos1/RNw40K13HrogO10UxDEro7KP1Zudzz6PP+36/wbU7aHpoSFkuUAAAAASUVORK5CYII=', 76, 60, 20, '', 55, 84, 45);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (100, 'Jacques Sill', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALoSURBVDjLhZP9S1NRHIf3D+gfURRhL2gFFQYFiSkEIkZFI8kfyjIUNNFCrOnMFxKJMTfCKNEl5AxUVCx1bm6NdMMkx97ci5vTjTn3otvdy9326dxbiinRhQ/n3MN9nnO+557DAcDZH7VanSuXy4VTU1OL4+Pjm8PDw4HBwUGTRCIRf+wXXz34/V5Ho9FkEFhE4ITT6YTf78f29jYikQhCoRAMBj3E3a/otyJ+v1DQnvmX4A88abVakU6nEY1GwUgcDgd8Ph+SySTSSQo0ZYJ8egCvO+qV7W2NmXsCZmYGTiQSYB6apsG8WywWBINBVhqnNhAL65GKreDrRC+aX1b2swICXyTLToXDYRbY2dlhJevr6zAajWDGk0kakZAR8bCBXUWCpKb6Uar26ZNcDoFFa2trYGIymViIqZkRud1uth+PhYhAR0An6W+RFcahVCpRXl4u4mRnZ+N/qbh/BZMfShDZ9rLiQCAAm82GsrKyJVag0+lgNpuhUqnQ19fHQkzrcrlgNi5DN/EAWytS2Ba6Ybfbsbq6Co/HAy6X62MFDLwLMRImzBiTlppr2DRIQIct0I/chVY7i3mdBUbHBopLbm0dEjDZhc3LKmgGihDbHENsowt+6zgWx+qh0jvwRWtEQdFN/aESdkU5OUQ8y4fPNITYWjPm2s8hsTWEH+/zMK8exTvpBApuFPX8cxNLiy/APtOAuLcPlKUMc205iDrqEbRNYKH3NvILC1N5+dcvsQdJIBCIFAoFPEHyK9d/Qm/XYklaigDZuOhqLSLmO7+zco+U8gYOhQDC6lzt3kns7OzM4Lc2T38alcDmNUD3TQjHXBfiHjE7e2SFS0o4y7aUrQKUewQK/mmvoulk1t5l4vF4Gc8a6noeVz2k1d15oHxWxP0ziHnJHnil+/IZ9I4Oru8SyBqOSzkHr2dVVeVlRcf5qKI1JyVvyU7Lms6kZbxTKdmLLFrWeCJGIGrm+TFqpv4oNV13RPkLngD4bMIOcuMAAAAASUVORK5CYII=', 49, 85, 35, '', 58, 74, 8);
insert into produtos (idprodutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (95, 'Inglis Boyde', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAH0SURBVDjLxZPPS1RxFMU/7800vglR0hkNRDKHUAwpgyxSiSgwsiFqEbRIWkW47l+IYNa1aOGqoFYJYRiBkeAwYQjmj5GBHJOyVAYZR6b3Zt73e78tZMDKnQsPXDjcczlwL+daxhj2A5t94uANghUST6SiwHMR6RQtIa00O6UcpZSvfbWgfP3o89Nb7/Y0AFK97ZHY6ZYj2FhoEZSABZSVJru61fti7MtbIPCfQTyRqg7axJzNBV5OLHIxfo/ZqQl8bVhd+Ur31btkUyNszGVsuP33CvFE6qiIjHa11vNtNklNQwsFV1H0FGvfsygxbBUVoqGpoYbmSw9NVaQto5W+sTzyIGNdezz5uq8tevNCe5SldY980aeshLIylHyh5O/w2sMBYo1hlIZPM0u8n5ibWnkzdC4oWgbOnoiQ+elScBUlJZR9oayEkm92zHyh8Ntnec1FDPSebOFjarG7+fqTuqBWOmQMFH/MMPbqGaEqhzN9A5w6348Sg9KCFlian2JydJhgKMyv8H1ChwJ4HtVW15U7Rm2vo7Y3iEbqsG2b9Vweq7YV4+aoRN0qbRKN1CMi5PJFtNOE29h/zKoMdHR0ZHt6eo47jsP4+Ph8Op3u3H3tiu55HtPT0x/S6fTlf3MwmEwmE4ALDO8Rut36UKVpHfg3/gGTgwnlYQ1oPAAAAABJRU5ErkJggg==', 26, 53, 62, '', 56, 9, 35);

-- inserts pat
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('5e9b4ff2-60d3-4417-bf86-3cb651ddb572', 'americanexpress', '9/10/2022', '$1665.94', 'volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla', '989c9086-ada5-478b-b023-d274ed30b184', '808-97-2646');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('63bf0e11-372c-4aa2-8e06-438322ece03d', 'jcb', '7/3/2023', '$1041.56', 'turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet', '81dbae84-3989-41a8-b2c8-48028402aeb2', '745-20-7466');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('9c9f4610-5d62-4672-8604-421ec53b185f', 'jcb', '11/25/2023', '$1873.27', 'velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit', '06c125d5-ce15-4f74-b66e-4ca911aa8653', '604-21-2241');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('c1d0fdf9-3f7a-476c-bed3-7dfe18efcf5c', 'jcb', '11/13/2022', '$377.37', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse', 'c007cd5b-f921-47f3-94db-876e12423f95', '128-95-0839');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('feac69e4-a58b-403d-94b8-15ed3022b53a', 'jcb', '6/23/2022', '$671.54', 'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit', '091e9e5c-15ef-4000-9c58-b6110bf58280', '573-24-0866');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('b550b02f-a3ce-4077-9736-646e66a94048', 'diners-club-enroute', '2/20/2023', '$136.44', 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', '8009f9b0-5847-44ee-b04e-d50806a8c9ca', '424-98-1960');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('8bd3a810-40ca-442b-b3d4-1ff9ee3d2757', 'jcb', '7/14/2023', '$143.24', 'at turpis a pede posuere nonummy integer non velit donec', '1b140504-03ea-4300-bfd1-5c2d944d11c3', '777-26-4533');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('4a19cd3c-1fcb-486a-b003-b43fc0bc4e6f', 'jcb', '4/28/2023', '$1008.27', 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id', '5591c074-1e34-4c55-8f1a-23fe5b1afeba', '766-61-6131');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('a6d94506-32dc-45e2-8400-c64db628a2cd', 'maestro', '1/24/2023', '$1275.99', 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', '78cba517-3574-4d20-bef4-181185fdcf56', '452-14-9327');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('d993a375-694f-4736-aaa4-dc4775b87ed7', 'jcb', '2/6/2023', '$938.88', 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante', 'be46d61f-840c-4764-a453-cc98235a2f28', '542-03-0714');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('d7fb6221-0f60-4432-aeab-ce682c25f86f', 'mastercard', '5/3/2023', '$1845.88', 'faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec', '0ca310fc-cc4b-4188-abf1-c3eac7238a9c', '415-84-9842');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('6e2e64a4-31cd-47c7-9fc1-aa971427478e', 'americanexpress', '3/9/2023', '$584.73', 'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices', 'eec82686-4a35-4f46-bbd2-66b3a51d6f4a', '694-01-9039');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('d47cd218-7d15-4c4a-9985-022c3caafae6', 'bankcard', '9/11/2023', '$1671.18', 'et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum', '3c41a933-9d9c-41ce-8e5a-c668ec571f2f', '871-32-4792');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('834b8e11-bd96-4afe-901a-e6aab7f45ba1', 'jcb', '6/19/2023', '$128.73', 'sapien urna pretium nisl ut volutpat sapien arcu sed augue', '74bbe133-9e82-4fa0-9c28-2240dd02f6b8', '469-51-9558');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('52c0dbed-a1f9-4f46-99d4-ed4e229d9bc8', 'jcb', '7/30/2023', '$259.68', 'sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis', '18299076-1054-4fb5-96b1-4aaa74c90f0f', '888-73-9424');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('08c11065-2d7c-4c36-b63d-39bd0ed16289', 'switch', '8/3/2022', '$227.27', 'libero rutrum ac lobortis vel dapibus at diam nam tristique tortor', '1a869db1-7c21-4ec0-9a19-fc7580de2f6a', '398-21-7317');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('f148856f-e717-438d-98a5-80b9d83ef88b', 'jcb', '4/26/2023', '$1808.33', 'gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi', 'ec6f330d-640b-457a-9151-31957a8bd621', '740-67-9135');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('a342a7ba-3199-4d03-8a0c-ee4ab92ca609', 'jcb', '2/19/2023', '$302.56', 'vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel', '3388dae6-0081-4f48-bcfe-c22538f99781', '765-40-2346');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('883b9f61-f28b-4457-add1-7badf7c074ef', 'visa-electron', '8/16/2022', '$1914.21', 'curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu', '672157ef-99a3-40bf-9f9a-65471036ab79', '434-86-5444');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('8eff2f0b-2669-450b-9dc9-c2494ffe7229', 'maestro', '6/17/2022', '$84.87', 'nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit', '4e127e17-c583-43d5-a1b9-d88527f64092', '275-03-9484');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('dd1145ba-a39a-4ced-a990-7a254defd822', 'visa', '4/11/2023', '$834.39', 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis', 'dc429c3f-ccce-4ed6-b19e-6b65ef42aabe', '429-12-3272');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('58934c1e-989f-4c29-85d0-778e69113479', 'instapayment', '4/16/2023', '$1769.19', 'pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc', '4ea525cc-17e2-4e11-a398-866520434bc2', '483-71-2692');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('f7435b9c-131c-473d-ba7e-04229d58dead', 'jcb', '8/25/2022', '$976.75', 'magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque', '99bb77f8-90c9-49f8-9e0e-0ab36e2da0a5', '586-72-5842');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('7c66c5ea-10ab-48d4-846b-d5dcde99fc9a', 'jcb', '1/22/2023', '$1893.42', 'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum', 'a0d36909-048f-4f08-b121-4dd2e080d6cc', '205-08-4101');
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, cpf) values ('5c51537f-22da-423a-9b62-bee7feb74b90', 'diners-club-enroute', '12/6/2023', '$1475.45', 'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus', '6b905e99-dbe5-40c7-89f6-ba62e61bd42c', '821-32-3204');

insert into categorias (idcategorias, categoria) values ('4856e3a1-c5ba-49bd-ad0b-ba6e4ff7a7dd', 'felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat');
insert into categorias (idcategorias, categoria) values ('b7dc0b31-e0a6-4a88-ae91-5198ca2adb63', 'justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales');
insert into categorias (idcategorias, categoria) values ('e93e9c97-a066-4b1b-86c5-d90cf3ca9be5', 'adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin');
insert into categorias (idcategorias, categoria) values ('8da0b5a7-7c9a-4a2a-a588-06a252f6d193', 'fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem');
insert into categorias (idcategorias, categoria) values ('32f8af04-855c-4e1d-a396-278f002eabc8', 'luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat');
insert into categorias (idcategorias, categoria) values ('36d9b87a-43a0-4bf9-81cd-ad529f6a2730', 'orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris');
insert into categorias (idcategorias, categoria) values ('9d54c3d7-c87a-411c-9991-291f63ded29a', 'ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas');
insert into categorias (idcategorias, categoria) values ('c56cfa22-26da-4ac9-b4e8-c2555812b6b6', 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non');
insert into categorias (idcategorias, categoria) values ('23f9c7c4-84a6-4047-8e6f-ae2e00842838', 'etiam justo etiam pretium iaculis justo in hac habitasse platea');
insert into categorias (idcategorias, categoria) values ('271d1bd4-4340-4605-8519-5b0cf870012c', 'sed tincidunt eu felis fusce posuere felis sed lacus morbi');
insert into categorias (idcategorias, categoria) values ('efaa2244-7eec-4cee-b2c0-aea559e881cb', 'gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem');
insert into categorias (idcategorias, categoria) values ('04f05e4c-c9fd-4c54-a4f8-793f823fc901', 'leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien');
insert into categorias (idcategorias, categoria) values ('e752a207-e510-480d-ae80-7a4ffa3f1401', 'sed interdum venenatis turpis enim blandit mi in porttitor pede justo');
insert into categorias (idcategorias, categoria) values ('8a5ee9a6-e764-4fa3-b6ad-2feb5027baea', 'phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla');
insert into categorias (idcategorias, categoria) values ('b4d3f1b6-9b1d-468f-8fba-3ea9634ab17e', 'in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut');
insert into categorias (idcategorias, categoria) values ('0a306501-bbde-4e2a-be7e-13f637260c69', 'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit');
insert into categorias (idcategorias, categoria) values ('7dc9f6f2-5516-4d7c-86f6-47a34f823af5', 'consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo');
insert into categorias (idcategorias, categoria) values ('cb67efdd-c415-41c7-90ab-f85751f066cb', 'rutrum nulla nunc purus phasellus in felis donec semper sapien a libero');
insert into categorias (idcategorias, categoria) values ('99c1ffeb-360b-4afb-bb47-d6972855d249', 'id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam');
insert into categorias (idcategorias, categoria) values ('3e30de62-cf8f-406a-accd-781fab5ee3ba', 'mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante');
insert into categorias (idcategorias, categoria) values ('47cc38f5-4c45-4877-88a8-3d1ba4dd17f9', 'metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia');
insert into categorias (idcategorias, categoria) values ('f71c98d2-43a9-49f8-bee3-3d4a11e25450', 'nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut');
insert into categorias (idcategorias, categoria) values ('b69a7b5d-1bc8-461c-874e-1f020e07b3ac', 'in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis');
insert into categorias (idcategorias, categoria) values ('a63a2589-ab7a-443e-9d94-ed77a1767ecc', 'sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui');
insert into categorias (idcategorias, categoria) values ('7abba3af-d902-4b7f-8ac8-3f8cfe1dc5ef', 'semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis');

-- inserts andri

-- inserts emily snow


-- updates emily alves
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;
-- UPDATE fornecedores SET cnpj = valor1, enderecos_cep = valor2, endereco = valor3, nome = valor4, telefone = valor5 WHERE cnpj == valor;

-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;
-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;
-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;
-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;
-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;
-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;
-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;
-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;
-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;
-- UPDATE produtos SET idprodutos = valor1, nome = valor2, imagemProduto = valor3, altura = valor4, largura = valor5, quantidade = valor6, descricao = valor7, unidadeEmEstoque = valor8, categorias_idcategorias = valor9, fornecedores_cnpj = valor10 WHERE idprodutos == valor;

-- updates pat

-- updates andri

-- updates emily snow


-- deletes emily alves
-- DELETE FROM fornecedores WHERE cnpj == valor;
-- DELETE FROM fornecedores WHERE cnpj == valor;
-- DELETE FROM fornecedores WHERE cnpj == valor;
-- DELETE FROM fornecedores WHERE cnpj == valor;
-- DELETE FROM fornecedores WHERE cnpj == valor;

-- DELETE FROM produtos WHERE idprodutos == valor;
-- DELETE FROM produtos WHERE idprodutos == valor;
-- DELETE FROM produtos WHERE idprodutos == valor;
-- DELETE FROM produtos WHERE idprodutos == valor;
-- DELETE FROM produtos WHERE idprodutos == valor;

-- deletes pat

-- deletes andri

-- deletes emily snow


-- selects emily alves

-- selects pat

-- selects andri

-- selects emily snow