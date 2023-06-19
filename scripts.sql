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
  `id` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table .`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes` (
  `pessoas_cpf` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `enderecos_id` INT NOT NULL,
  PRIMARY KEY (`pessoas_cpf`),
  FOREIGN KEY (`enderecos_id`) REFERENCES `enderecos` (`id`)
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
  FOREIGN KEY (`vendedores_idvendedores`) REFERENCES `vendedores` (`idvendedores`),
  FOREIGN KEY (`clientes_pessoas_cpf`) REFERENCES `clientes` (`pessoas_cpf`)
);

-- -----------------------------------------------------
-- Table .`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `cnpj` INT NOT NULL,
  `enderecos_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  PRIMARY KEY (`cnpj`),
  FOREIGN KEY (`enderecos_id`) REFERENCES `enderecos` (`id`)
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
  FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategorias`),
  FOREIGN KEY (`fornecedores_cnpj`) REFERENCES `fornecedores` (`cnpj`)
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
   FOREIGN KEY (`produtos_idprodutos`) REFERENCES `produtos` (`idprodutos`),
   FOREIGN KEY (
    `vendaRegistros_idvenda`,
    `vendaRegistros_vendedores_idvendedores`
  ) REFERENCES `vendaRegistros` (`idvenda`, `vendedores_idvendedores`)
);


-- inserts patricia
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('95560', '1', 'PO Box 26708', '9th Floor', 'PO Box 59776', '7th Floor');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('95590', '2', 'PO Box 74593', 'Suite 85', 'Apt 359', 'Room 630');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('9899', '3', 'Apt 1550', 'Apt 1844', 'Suite 82', 'Suite 87');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('95569', '4', '4th Floor', 'Apt 109', 'Apt 615', 'PO Box 25490');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('78703', '5', 'Room 834', 'Room 640', '2nd Floor', 'PO Box 18324');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('45436', '6', '10th Floor', 'Room 157', 'PO Box 64020', 'Apt 1839');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('48338', '7', 'PO Box 4960', '15th Floor', 'Apt 425', '15th Floor');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('49150', '8', 'PO Box 77945', '6th Floor', 'Room 1447', 'Apt 1004');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('1412', '9', 'PO Box 93294', 'Suite 34', 'PO Box 56430', 'PO Box 42783');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('392094', '10', 'Apt 1694', 'Room 1157', 'PO Box 406', 'Suite 85');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('03582', '11', 'Room 1155', 'Room 262', 'PO Box 56599', '7th Floor');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('427820', '12', 'Apt 1154', 'Apt 1926', '7th Floor', 'Apt 1674');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('39193', '13', 'Suite 81', '2nd Floor', 'PO Box 16552', 'Room 1065');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('38700', '14', '5th Floor', 'Suite 49', 'PO Box 68615', 'PO Box 44260');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('3312', '15', 'Suite 60', '20th Floor', 'Room 95', '18th Floor');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('2438', '16', '1st Floor', '15th Floor', '20th Floor', 'Room 164');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('64080 ', '17', 'PO Box 1385', 'Room 1039', '17th Floor', 'Suite 10');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('30400', '18', '18th Floor', 'Suite 4', '6th Floor', 'Suite 3');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('0034', '19', 'Room 449', 'Room 453', 'Suite 6', 'Suite 63');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('9394', '20', 'Room 637', '10th Floor', 'Apt 1356', '18th Floor');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('649143', '21', 'Apt 1979', 'Room 401', 'Suite 28', '6th Floor');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('8934583', '22', 'Apt 1292', 'Room 1883', 'Room 778', 'PO Box 75449');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('690880', '23', 'Apt 460', 'Room 160', 'Apt 940', 'PO Box 14805');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('9636', '24', 'Suite 81', '19th Floor', 'Room 1548', 'Room 534');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('4503045', '25', 'PO Box 63343', 'Room 745', '8th Floor', 'Suite 32');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('4503045', '27', 'PO Box 63435', 'Room 90', '5th Floor', 'Room 23');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('4503045', '28','PO Box 63435', 'Room 90', '5th Floor', 'Room 23');




insert into categorias (idcategorias, categoria) values ('1', 'felis');
insert into categorias (idcategorias, categoria) values ('2', 'justo');
insert into categorias (idcategorias, categoria) values ('3', 'adipiscing');
insert into categorias (idcategorias, categoria) values ('4', 'fusce');
insert into categorias (idcategorias, categoria) values ('5', 'luctus');
insert into categorias (idcategorias, categoria) values ('6', 'orci');
insert into categorias (idcategorias, categoria) values ('7', 'ut');
insert into categorias (idcategorias, categoria) values ('8', 'nibh');
insert into categorias (idcategorias, categoria) values ('9', 'etiam');
insert into categorias (idcategorias, categoria) values ('10', 'sed');
insert into categorias (idcategorias, categoria) values ('11', 'gravida');
insert into categorias (idcategorias, categoria) values ('12', 'leompus');
insert into categorias (idcategorias, categoria) values ('13', 'sed ');
insert into categorias (idcategorias, categoria) values ('14', 'phasellusio');
insert into categorias (idcategorias, categoria) values ('15', 'in');
insert into categorias (idcategorias, categoria) values ('16', 'viverrac');
insert into categorias (idcategorias, categoria) values ('17', 'consectetuer');
insert into categorias (idcategorias, categoria) values ('18', 'rutrum');
insert into categorias (idcategorias, categoria) values ('19', 'id');
insert into categorias (idcategorias, categoria) values ('20', 'mauris');
insert into categorias (idcategorias, categoria) values ('21', 'metus');
insert into categorias (idcategorias, categoria) values ('22', 'nam');
insert into categorias (idcategorias, categoria) values ('23', 'in lectus');
insert into categorias (idcategorias, categoria) values ('24', 'sapien ');
insert into categorias (idcategorias, categoria) values ('25', 'semper');

-- inserts emily alves -- corrigidos


 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (82, 1, 'João',  34244624); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (83, 2, 'Bruno',  25152528); 
  insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (84, 3, 'Marco',  93856031); 

 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (85, 4, 'Patricia',  22578104); 
  insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (86, 27, 'Antonio',  25152560); 

 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (87, 6, 'Andrieli',  34343653); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (88, 7, 'Maria',  35273239); 
insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (89, 8, 'Eduarda',  37534664); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (90, 9, 'Jonatas',  37663618); 
  insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (91, 9, 'Jonatas',  37663618); 

 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (92, 11, 'Elisabeth',   33786431); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (93, 12, 'Jonas',  35308887); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (94, 13, 'Andiara',  37107347); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (95, 14, 'Jailson',  25691891); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (96, 15, 'André',  25339171); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (97, 16, 'Edson',   20288055); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (98, 17, 'Lucas',  21513859); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (99, 18, 'Wiggers',   36775208); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (100, 20, 'Carol',  24381049); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (101, 21, 'Antonio Junior',  32491146); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (102, 22, 'Ana Maria',  22856621); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (104, 24, 'Amanda',  30380604); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (105, 25, 'Bruna',  39113001); 

 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (00, 'Lincoln', 'http://dummyimage.com/221x100.png', 11, 23, 1, 'MKZ', 94, 1, 82);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (01, 'Land Rover', 'http://dummyimage.com/163x100.png', 21, 18, 2, 'Freelander', 50, 2, 83);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (02, 'Ford', 'http://dummyimage.com/167x100.png', 44, 40, 3, 'Focus', 33, 3, 84);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (03, 'Mercury', 'http://dummyimage.com/192x100.png', 89, 45, 4, 'Cougar', 53,4, 85);
 
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (04, 'Mercury', 'http://dummyimage.com/214x100.png', 30, 63, 5, 'Mountaineer', 72, 5, 86);
 
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (05, 'Chevrolet', 'http://dummyimage.com/119x100.png', 40, 3, 6, 'Malibu', 47, 6, 87);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (06, 'Volkswagen', 'http://dummyimage.com/234x100.png', 74, 1, 7, 'Cabriolet', 62, 7, 88);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (18, 'Mitsubishi', 'http://dummyimage.com/124x100.png', 3, 67, 19, 'Lancer Evolution', 46, 8, 89);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (08, 'Mazda', 'http://dummyimage.com/117x100.png', 7, 6, 9, 'B-Series Plus', 93, 9, 90);
 
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (09, 'Infiniti', 'http://dummyimage.com/171x100.png', 72, 7, 10, 'EX', 79, 10, 91);
 
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (10, 'Honda', 'http://dummyimage.com/111x100.png', 16, 41, 11, 'CR-Z', 35, 11, 92);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (11, 'Lincoln', 'http://dummyimage.com/120x100.png', 31, 56, 12, 'Mark VIII', 7, 12, 93);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (12, 'Buick', 'http://dummyimage.com/110x100.png', 29, 60, 13, 'Riviera', 65, 13, 94);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (13, 'Chevrolet', 'http://dummyimage.com/157x100.png', 96, 56, 14, 'Silverado 1500', 52, 14, 95);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (14, 'Pontiac', 'http://dummyimage.com/225x100.png', 81, 73, 15, 'Montana', 13, 15, 96);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (15, 'Buick', 'http://dummyimage.com/125x100.png', 2, 57, 16, 'LeSabre', 23,16, 97);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (16, 'Lexus', 'http://dummyimage.com/246x100.png', 12, 50, 17, 'GS', 49, 17, 98);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (17, 'Volvo', 'http://dummyimage.com/231x100.png', 22, 15, 18, 'S40', 7, 18, 99);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (19, 'GMC', 'http://dummyimage.com/216x100.png', 74, 65, 20, 'Savana 3500', 21, 20, 100);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (20, 'Dodge', 'http://dummyimage.com/121x100.png', 28, 65, 21, 'Ramcharger', 85, 21, 101);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (21, 'Lexus', 'http://dummyimage.com/187x100.png', 25, 44, 22, 'IS', 44 ,22, 102);
insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (23, 'Toyota', 'http://dummyimage.com/246x100.png', 32, 47, 24, 'Echo', 5, 24,104);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (24, 'Dodge', 'http://dummyimage.com/244x100.png', 100, 28, 25, 'Magnum', 19, 25,105);

-- inserts andri
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (1, 2574.89, 'Garreth', 'Espinoy', 'gespinoy0@cisco.com', 13.4);
insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (2, 1883.12, 'Jess', 'McMichan', 'jmcmichan1@privacy.gov.au',05.10);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (3,1883.16,'José','carols','mchan1@privacy.gov.au',05.10);

 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (4, 1844.79, 'Brigg', 'McNeill', 'bmcneill3@issuu.com', 10.2);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (7, 1386.02, 'Sol', 'Winspur', 'swinspur6@geocities.jp', 10.65);
insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (8, 2896.38, 'Caressa', 'Clair', 'cclair7@google.ca', 09.5);
insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (9, 2559.79, 'Wallis', 'Sante', 'wsante8@mashable.com', 10.5);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (11, 1437.69, 'Calla', 'Poschel', 'cposchela@yandex.ru', 2.90);
 
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (12, 2765.86, 'Averell', 'Poxson', 'apoxsonb@gnu.org', 10.2);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (14, 2207.62, 'Jsandye', 'Benyan', 'jbenyand@huffingtonpost.com', 3.5);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (15, 2227.54, 'Lilly', 'Presser', 'lpressere@linkedin.com', 10.4);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (17, 1697.44, 'Merrel', 'Foran', 'mforang@mashable.com', 2.90);
insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (19, 2900.21, 'Maggie', 'Allright', 'mallrighti@surveymonkey.com', 7.0);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (21, 2122.06, 'Link', 'Wason', 'lwasonk@examiner.com', 4.7);
insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (22, 2721.89, 'Mahmud', 'Sanders', 'msandersl@dmoz.org', 2.9);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (23, 1450.41, 'Quintana', 'Mountjoy', 'qmountjoym@indiatimes.com', 2.34);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (24, 2494.51, 'Ashlie', 'Reaney', 'areaneyn@google.com.hk', 5.7);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (25, 2527.39, 'Tedie', 'Hartwell', 'thartwello@thetimes.co.uk', 9.10);

 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('212213454', 'Joanna', 'oldey', 'joldey1@baidu.com', 2);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('768541784', 'Miguela', 'Gettens', 'mgettens3@imdb.com', 4);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('103966036', 'Olivia', 'Benedito', 'obenedito4@goo.gl', 5);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('281160955', 'Ermina', 'Renfree', 'erenfree6@archive.org', 7);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('882776294', 'Mel', 'Flagg', 'mflagg7@vistaprint.com', 8);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('747483506', 'Pennie', 'Licas', 'plicas8@eventbrite.com', 9);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('577037388', 'Ramsey', 'Pickavant', 'rpickavant9@cisco.com', 10);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('133181424', 'Julio', 'Povey', 'jpoveya@360.cn', 11);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('431436733', 'Sonya', 'Rollett', 'srollettb@slate.com', 12);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('285139482', 'Leda', 'Dreossi', 'ldreossic@pagesperso-orange.fr', 13);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('381724267', 'Rudy', 'Selwyn', 'rselwynd@hp.com', 14);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('154986955', 'Nathalia', 'Zincke', 'nzinckef@marketwatch.com', 16);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('272816143', 'Jeanette', 'Ayto', 'jaytog@sfgate.com', 17);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('854464662', 'Paulo', 'Hugnet', 'phugneti@addthis.com', 19);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('387217391', 'Cristin', 'BURWIN', 'cburwinj@fastcompany.com', 20);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('680570180', 'Milissent', 'Gillbee', 'mgillbeel@delicious.com', 22);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('847917766', 'Courtnay', 'Gwilliams', 'cgwilliamsm@etsy.com', 23);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('676149577', 'Rivalee', 'Feldon', 'rfeldonn@twitter.com', 24);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('654270414', 'Nathanael', 'Enocksson', 'nenockssono@microsoft.com', 25);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('654270415','Nathanael', 'Enocksson2','nenockssono@microsoft.com', 25);


-- inserts pat - emilySnow
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('1', 'debito', '2022-10-09', '1665.94', 'volutpat ', 1, 212213454 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('2', 'credito', '2023-3-07', '1041.56', 'turpis ', 2, 768541784 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('3', 'dinheiro', '2023-11-25', '1873.27', 'velit', 3,103966036 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('4', 'credito', '2022-11-13', '377.37', 'ante', 4, 768541784);
 
 -- corrigir
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('6', 'credito', '2023-2-20', '136.44', 'natoque',7,654270414 );
 
 
 
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('8', 'credito', '2023-3-18', '1008.27', 'convallis',8,882776294 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('9', 'debito', '2023-1-24', '1275.99', 'vivamus', 9,747483506 );
 
 -- insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('10', 'dinheiro', '2023-2-7', '938.88', 'nibh', 10,577037388 );
 
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('11', 'dinheiro', '2023-3-5', '1845.88', 'faucibus', 11, 133181424);
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('12', 'credito', '2023-9-3', '584.73', 'enim', 12,431436733 );
-- insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('13', 'credito', '2023-11-9', '1671.18', 'et ', 13,285139482 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('14', 'credito', '2023-10-19', '128.73', 'sapien', 14, 381724267);
 -- insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('15', 'credito', '2023-7-30', '259.68', 'sollicitudin', 15,534054225);
 -- insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('16', 'credito', '2021-3-8', '227.27', 'libero', 16,154986955 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('17', 'credito', '2023-4-26', '1808.33', 'gravida', 17,272816143 );
 -- insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('18', 'credito', '2023-2-19', '302.56', 'vitae', 18,724091791 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('19', 'credito', '2022-8-16', '1914.21', 'curabitur', 19,854464662 );
--  insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('20', 'credito', '2022-6-17', '84.87', 'nam', 20,387217391 );
 -- insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('21', 'credito', '2023-11-4', '834.39', 'nascetur', 21,167296885 );
-- insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('22', 'credito', '2023-3-16', '1769.19', 'pulvinar', 22,680570180 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('23', 'credito', '2022-4-25', '976.75', 'magna', 23,847917766 );
-- insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('24', 'credito', '2023-1-22', '1893.42', 'dapibus', 24,676149577 );
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('25', 'credito', '2023-6-12', '1475.45', 'est',25,654270414 );


-- inserts emily snow
insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (00, 1, 1);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (01, 2, 2);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (02, 3, 3);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (03, 4, 4);
-- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (04, 5, 5);
-- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (06, 7, 7);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (18, 8, 8);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (08, 9, 9);
-- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (09, 10, 10);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (10, 11, 11);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (11, 12, 12);
 -- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (12, 13, 13);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (13, 14, 14);
 -- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (14, 15, 15);
 -- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (15, 16, 16);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (16, 17, 17);
-- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (17, 18, 18);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (18, 19, 19);
 -- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (19, 20, 20);
 -- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (20, 21, 21);
-- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (21, 22, 22);
--  insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (22, 23, 23);
-- insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (23, 24, 24);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (24, 25, 25);


-- selects emily alves
 SELECT COUNT(*) FROM produtos;
 SELECT * FROM produtos ORDER BY idProdutos;

 SELECT COUNT(*) FROM fornecedores;
 SELECT * FROM fornecedores ORDER BY cnpj;

-- selects pat

SELECT COUNT(*) FROM categorias;
 SELECT * FROM categorias ORDER BY idCategorias;

 SELECT COUNT(*) FROM enderecos;
 SELECT * FROM enderecos ORDER BY id;

SELECT *
FROM carrinhos
INNER JOIN produtos ON carrinhos.produtos_idprodutos = produtos.idprodutos
INNER JOIN vendaRegistros ON carrinhos.vendaRegistros_idvenda = vendaRegistros.idvenda AND carrinhos.vendaRegistros_vendedores_idvendedores = vendaRegistros.vendedores_idvendedores;

-- selects andri
 SELECT COUNT(*) FROM vendedores;
SELECT * FROM vendedores ORDER BY idVendedores;

 SELECT COUNT(*) FROM clientes;
 SELECT * FROM clientes ORDER BY pessoas_cpf;

-- selects emily snow
SELECT COUNT(*) FROM carrinhos;
 SELECT * FROM carrinhos ORDER BY produtos_idprodutos;






-- updates pat
UPDATE enderecos SET cep= '11111', id='1', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 26;
-- UPDATE enderecos SET cep= '11111', id='2', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 27;
UPDATE enderecos SET cep= '2222', id='237', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 28;
UPDATE enderecos SET cep= '33333', id='4', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 29;
UPDATE enderecos SET cep= '44444', id='5', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 30;
UPDATE enderecos SET cep= '555555', id='6', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 31;
UPDATE enderecos SET cep= '66666', id='7', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 32;
UPDATE enderecos SET cep= '777777', id='8', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 33;
UPDATE enderecos SET cep= '8888888', id='9', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 34;
UPDATE enderecos SET cep= '99999', id='10', rua='aaaa', bairro='aaaaa', cidade='aaaa', estado='aaa' WHERE id = 35;

-- updates emily alves
 UPDATE fornecedores SET  nome = 'Marcos', telefone = 92178827 WHERE cnpj = 92;
 UPDATE fornecedores SET  nome = 'Ana', telefone = 92117973 WHERE cnpj =93;
 UPDATE fornecedores SET  nome = 'Renata', telefone = 91853907 WHERE cnpj = 94;
 UPDATE fornecedores SET  nome = 'Lana', telefone = 32241802 WHERE cnpj = 95;
 UPDATE fornecedores SET   nome = 'Taylor', telefone = 84241802 WHERE cnpj = 96;
 UPDATE fornecedores SET  nome = 'Henrique', telefone = 98236745 WHERE cnpj = 97;
 UPDATE fornecedores SET   nome = 'Gustavo', telefone = 98712365 WHERE cnpj = 98;
 UPDATE fornecedores SET   nome = 'Rafael', telefone = 92345568 WHERE cnpj = 99;
 UPDATE fornecedores SET   nome = 'Vitor', telefone = 91220348 WHERE cnpj = 100;


-- updates pat
UPDATE categorias SET categoria = 'compraZero' WHERE idCategorias = 1;
 UPDATE categorias SET categoria = 'compraUm' WHERE idCategorias = 2;
 UPDATE categorias SET categoria = 'compraDois' WHERE idCategorias = 3;
 UPDATE categorias SET categoria = 'compraTres' WHERE idCategorias = 4;
 UPDATE categorias SET categoria = 'compraQuatro' WHERE idCategorias = 5;
 UPDATE categorias SET categoria = 'compraCinco' WHERE idCategorias = 6;
UPDATE categorias SET categoria = 'compraSeis' WHERE idCategorias = 7;
 UPDATE categorias SET categoria = 'compraSete' WHERE idCategorias = 8;
 UPDATE categorias SET categoria = 'compraOito' WHERE idCategorias = 9;
 UPDATE categorias SET categoria = 'compraOito' WHERE idCategorias = 10;




-- updates andri
UPDATE vendedores SET salario= 1260.89, nome='Garrete', sobrenome= 'Espinosa', email='gespinosa@cisco.com', porcentagemComissao=14.0 WHERE idVendedores= 1;
 UPDATE vendedores SET salario= 1300.90, nome='Joao', sobrenome= 'pedro', email='joaop@cisco.com', porcentagemComissao=15.0 WHERE idVendedores= 2;
 UPDATE vendedores SET salario= 1400.89, nome='pedro', sobrenome= 'neves', email='pedron@cisco.com', porcentagemComissao=16.0 WHERE idVendedores= 3;
 UPDATE vendedores SET salario= 1500.89, nome='Maria', sobrenome= 'clara', email='mariac@cisco.com', porcentagemComissao=17.0 WHERE idVendedores=4;
 UPDATE vendedores SET salario= 1600.89, nome='ana', sobrenome= 'maria', email='anam@cisco.com', porcentagemComissao=18.0 WHERE idVendedores= 5;
 UPDATE vendedores SET salario= 1700.89, nome='flavia', sobrenome= 'alessandra', email='flaviaa@cisco.com', porcentagemComissao=19.0 WHERE idVendedores= 6;
 UPDATE vendedores SET salario= 1800.89, nome='mateus', sobrenome= 'matias', email='mateusm@cisco.com', porcentagemComissao=20.0 WHERE idVendedores= 7;
 UPDATE vendedores SET salario= 1900.89, nome='luiz', sobrenome= 'gabriel', email='luizg@cisco.com', porcentagemComissao=11.0 WHERE idVendedores= 8;
 UPDATE vendedores SET salario= 1950.89, nome='julia', sobrenome= 'helena', email='juliah@cisco.com', porcentagemComissao=12.0 WHERE idVendedores= 9;
 UPDATE vendedores SET salario= 1100.89, nome='miguel', sobrenome= 'henrique', email='miguelh@cisco.com', porcentagemComissao=13.0 WHERE idVendedores= 10;



-- ver chave estrangeira de endereços
 -- DELETE FROM categorias WHERE idCategorias =1;
 -- DELETE FROM categorias WHERE idCategorias=2;
 -- DELETE FROM categorias WHERE idCategorias =3;
 -- DELETE FROM categorias WHERE idCategorias =4;
 -- DELETE FROM categorias WHERE idCategorias =5;


-- DELETE FROM produtos WHERE categorias_idcategorias = 1;



-- DELETE FROM produtos WHERE idprodutos = 20;
-- DELETE FROM produtos WHERE idprodutos = 22;
-- DELETE FROM produtos WHERE idprodutos = 23;
-- DELETE FROM produtos WHERE idprodutos = 24;



-- deletes emily alves
 -- DELETE FROM fornecedores WHERE cnpj = 101;
 -- DELETE FROM fornecedores WHERE cnpj = 103;
--  DELETE FROM fornecedores WHERE cnpj = 104;
-- DELETE FROM fornecedores WHERE cnpj = 105;



-- deletes pat


-- DELETE FROM enderecos WHERE id = 1;
 -- DELETE FROM enderecos WHERE id = 2;
 -- DELETE FROM enderecos WHERE id = 3;
 -- DELETE FROM enderecos WHERE id = 4;
 -- DELETE FROM enderecos WHERE id = 5;

-- deletes andri
 -- DELETE FROM vendedores WHERE idVendedores =11;
 -- DELETE FROM vendedores WHERE idVendedores =12;
 -- DELETE FROM vendedores WHERE idVendedores =13;
 -- DELETE FROM vendedores WHERE idVendedores =14;
 -- DELETE FROM vendedores WHERE idVendedores =15;


-- deletes emily snow
 DELETE FROM carrinhos WHERE produtos_idprodutos = 00;
 DELETE FROM carrinhos WHERE produtos_idprodutos = 01;
 DELETE FROM carrinhos WHERE produtos_idprodutos = 02;
 DELETE FROM carrinhos WHERE produtos_idprodutos = 03;
 DELETE FROM carrinhos WHERE produtos_idprodutos = 16;
 
 
 SELECT * FROM vendaregistros WHERE clientes_pessoas_cpf = '212213454';
 
DELETE FROM vendaregistros WHERE clientes_pessoas_cpf = '768541784';

SELECT * FROM vendaregistros WHERE clientes_pessoas_cpf = '577037388';

DELETE FROM vendaregistros WHERE clientes_pessoas_cpf = '272816143';
 
 
 
 DELETE FROM clientes WHERE pessoas_cpf = '154986955';
 DELETE FROM clientes WHERE pessoas_cpf = '768541784';
 DELETE FROM clientes WHERE pessoas_cpf ='577037388';
 DELETE FROM clientes WHERE pessoas_cpf = '272816143';
 DELETE FROM clientes WHERE pessoas_cpf = '724091791';

 DELETE FROM carrinhos WHERE vendaRegistros_idvenda = 20;
 DELETE FROM carrinhos WHERE vendaRegistros_idvenda = 21;
 DELETE FROM carrinhos WHERE vendaRegistros_idvenda = 22;
 DELETE FROM carrinhos WHERE vendaRegistros_idvenda = 23;
 DELETE FROM carrinhos WHERE vendaRegistros_idvenda = 24;
 




