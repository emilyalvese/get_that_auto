 DROP DATABASE  IF EXISTS get_that_auto ;


CREATE DATABASE IF NOT EXISTS get_that_auto;

------ Usa o banco de dados get_that_auto
USE get_that_auto;

-- -----------------------------------------------------
-- Table .`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendedores` (
  `idVendedores` INT NOT NULL,
  `salario` DOUBLE NOT NULL,
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
  `fornecedorescol` VARCHAR(45) NOT NULL,
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

insert into enderecos (cep, rua, bairro, cidade, estado) values ('8595', 'Holmberg', 'Fullstone', '611 Parkside Center', 'Autumn Leaf');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('1973', 'Oak Valley', 'MacGowing', '638 Myrtle Road', 'Service');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('363', 'Prairieview', 'Mussared', '4483 Artisan Avenue', 'Eagle Crest');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('59724', 'Merchant', 'Korpal', '4489 Village Green Avenue', 'Alpine');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('5', 'Nevada', 'Sharma', '173 Stang Park', 'Hintze');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('58', 'Steensland', 'Egre', '90395 Maywood Court', 'Atwood');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('9450', 'Pepper Wood', 'Sikora', '0838 Carey Center', 'Westport');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('1641', 'Vera', 'Plunket', '677 Esch Park', 'Shopko');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('63', 'Spohn', 'Stigers', '1 Walton Lane', 'Mifflin');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('24402', 'Calypso', 'Cake', '53172 Moulton Crossing', 'Cottonwood');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('5423', 'Dwight', 'Vaudre', '06385 Prairie Rose Terrace', 'Kings');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('26', 'Dwight', 'Causer', '15 Vidon Junction', 'Hansons');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('58597', 'Sauthoff', 'Fulleylove', '0 Old Gate Plaza', 'Farmco');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('40', 'Southridge', 'Sharman', '398 Pleasure Street', 'Delaware');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('407', 'Mcguire', 'Tampen', '78367 Susan Point', 'Birchwood');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('86394', 'Dorton', 'Whitwham', '592 Logan Pass', 'Sachtjen');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('2343', 'Lakeland', 'Longhorn', '208 Nobel Avenue', 'Norway Maple');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('72', 'Beilfuss', 'Enoksson', '315 Brown Road', 'Ilene');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('413', 'Talmadge', 'Winckle', '32 Farragut Pass', 'Cottonwood');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('401', 'Holmberg', 'Jutson', '932 Longview Crossing', 'Starling');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('41', 'Dixon', 'Brogi', '665 John Wall Alley', 'Carioca');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('16', 'Golf', 'O''Docherty', '01 Muir Hill', 'Logan');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('93', 'Kinsman', 'Shorrock', '424 Mallard Center', 'Warner');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('312', 'Dwight', 'Brewitt', '85 Muir Alley', 'Huxley');
insert into enderecos (cep, rua, bairro, cidade, estado) values ('14', 'Fieldstone', 'Buckney', '9 Dayton Plaza', 'Waubesa');


insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (1, 2574.89, 'Garreth', 'Espinoy', 'gespinoy0@cisco.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (2, 1883.12, 'Jess', 'McMichan', 'jmcmichan1@privacy.gov.au');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (3, 2406.64, 'Kalli', 'Matthisson', 'kmatthisson2@yahoo.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (4, 1844.79, 'Brigg', 'McNeill', 'bmcneill3@issuu.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (5, 2043.41, 'Othilia', 'Islip', 'oislip4@house.gov');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (6, 1413.24, 'Carina', 'Leupoldt', 'cleupoldt5@mediafire.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (7, 1386.02, 'Sol', 'Winspur', 'swinspur6@geocities.jp');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (8, 2896.38, 'Caressa', 'Clair', 'cclair7@google.ca');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (9, 2559.79, 'Wallis', 'Sante', 'wsante8@mashable.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (10, 2133.2, 'Saundra', 'Deport', 'sdeport9@newyorker.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (11, 1437.69, 'Calla', 'Poschel', 'cposchela@yandex.ru');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (12, 2765.86, 'Averell', 'Poxson', 'apoxsonb@gnu.org');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (13, 1295.16, 'Maggie', 'Revill', 'mrevillc@irs.gov');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (14, 2207.62, 'Jsandye', 'Benyan', 'jbenyand@huffingtonpost.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (15, 2227.54, 'Lilly', 'Presser', 'lpressere@linkedin.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (16, 1631.18, 'Velma', 'Sturdy', 'vsturdyf@imdb.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (17, 1697.44, 'Merrel', 'Foran', 'mforang@mashable.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (18, 1472.86, 'Angelle', 'Nuccii', 'anucciih@webs.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (19, 2900.21, 'Maggie', 'Allright', 'mallrighti@surveymonkey.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (20, 2589.45, 'Blaire', 'Elstone', 'belstonej@creativecommons.org');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (21, 2122.06, 'Link', 'Wason', 'lwasonk@examiner.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (22, 2721.89, 'Mahmud', 'Sanders', 'msandersl@dmoz.org');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (23, 1450.41, 'Quintana', 'Mountjoy', 'qmountjoym@indiatimes.com');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (24, 2494.51, 'Ashlie', 'Reaney', 'areaneyn@google.com.hk');
insert into vendedores (idVendedores, salario, nome, sobrenome, email) values (25, 2527.39, 'Tedie', 'Hartwell', 'thartwello@thetimes.co.uk');

