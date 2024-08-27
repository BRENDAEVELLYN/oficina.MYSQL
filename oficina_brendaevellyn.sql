CREATE DATABASE projetooficina_brenda;
USE projetooficina_brenda;

CREATE TABLE endereco (
    idendereco INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(100) NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE cliente (
    idcliente INT AUTO_INCREMENT PRIMARY KEY,
    nomecliente VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    sexo CHAR(1),
    id_endereco INT,
    FOREIGN KEY (id_endereco) REFERENCES endereco (idendereco)
);

CREATE TABLE telefone (
    idtelefone INT AUTO_INCREMENT PRIMARY KEY,
    ddd CHAR(2),
    numero VARCHAR(15),
    tipotelefone VARCHAR(20),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente (idcliente)
);

CREATE TABLE marca (
    idmarca INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(80)
);

CREATE TABLE modelo (
    idmodelo INT AUTO_INCREMENT PRIMARY KEY,
    nome_modelo VARCHAR(80),
    id_marca INT,
    FOREIGN KEY (id_marca) REFERENCES marca (idmarca)
);

CREATE TABLE carro (
    idcarro INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(20) NOT NULL,
    numero_chassi VARCHAR(50),
    id_cliente INT,
    id_modelo INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente (idcliente),
    FOREIGN KEY (id_modelo) REFERENCES modelo (idmodelo)
);

CREATE TABLE cor (
    idcor INT AUTO_INCREMENT PRIMARY KEY,
    cor_1 VARCHAR(50) NOT NULL,
    cor_2 VARCHAR(50),
    tipodetinta VARCHAR(50) NOT NULL
);

CREATE TABLE carro_cor (
    id_carro INT,
    id_cor INT,
    PRIMARY KEY (id_carro, id_cor),
    FOREIGN KEY (id_carro) REFERENCES carro (idcarro),
    FOREIGN KEY (id_cor) REFERENCES cor (idcor)
);

CREATE TABLE combustivel (
    idcombustivel INT AUTO_INCREMENT PRIMARY KEY,
    tipo_combustivel VARCHAR(50) NOT NULL
);

CREATE TABLE modelo_comb (
    id_combustivel INT,
    id_modelo INT,
    PRIMARY KEY (id_combustivel, id_modelo),
    FOREIGN KEY (id_combustivel) REFERENCES combustivel (idcombustivel),
    FOREIGN KEY (id_modelo) REFERENCES modelo (idmodelo)
);

INSERT INTO endereco (logradouro, uf, cidade) VALUES
('Rua das Flores', 'SP', 'São Paulo'),
('Avenida Central', 'RJ', 'Rio de Janeiro'),
('Praça da Liberdade', 'MG', 'Belo Horizonte'),
('Travessa das Palmeiras', 'RS', 'Porto Alegre'),
('Alameda dos Ipês', 'PR', 'Curitiba'),
('Largo São João', 'SC', 'Florianópolis'),
('Rua do Comércio', 'BA', 'Salvador'),
('Praça da Sé', 'PE', 'Recife'),
('Avenida Principal', 'CE', 'Fortaleza'),
('Travessa das Acácias', 'PB', 'João Pessoa'),
('Alameda das Mangueiras', 'RN', 'Natal'),
('Rua das Oliveiras', 'ES', 'Vitória'),
('Praça dos Girassóis', 'GO', 'Goiânia'),
('Avenida das Palmas', 'DF', 'Brasília'),
('Rua das Hortênsias', 'MT', 'Cuiabá');

INSERT INTO cliente (nomecliente, cpf, sexo, id_endereco) VALUES
('Ana Silva', '123.456.789-00', 'F', 1),
('Pedro Santos', '987.654.321-00', 'M', 2),
('Mariana Oliveira', '246.135.790-00', 'F', 3),
('Lucas Souza', '654.321.987-00', 'M', 4),
('Camila Costa', '135.792.468-00', 'F', 5),
('Guilherme Almeida', '789.456.123-00', 'M', 6),
('Isabela Pereira', '369.258.147-00', 'F', 7),
('Felipe Lima', '852.963.741-00', 'M', 8),
('Juliana Rodrigues', '951.753.624-00', 'F', 9),
('Bruno Martins', '456.789.123-00', 'M', 10),
('Larissa Santos', '369.147.258-00', 'F', 11),
('Rafael Oliveira', '741.852.963-00', 'M', 12),
('Amanda Costa', '258.369.147-00', 'F', 13),
('Thiago Silva', '963.852.741-00', 'M', 14),
('Letícia Pereira', '147.258.369-00', 'F', 15);


INSERT INTO telefone (ddd, numero, tipotelefone, id_cliente) VALUES
('11', '91234-5678', 'Celular', 4),
('21', '99876-5432', 'Celular', 5),
('31', '98765-4321', 'Celular', 2),
('41', '93456-7890', 'Celular', 1),
('51', '92345-6789', 'Celular', 8),
('61', '94567-8901', 'Celular', 6),
('71', '98765-4321', 'Celular', 7),
('81', '97654-3210', 'Celular', 12),
('91', '92345-6789', 'Celular', 15),
('12', '3456-7890', 'Fixo', 3),
('32', '4567-8901', 'Fixo', 2),
('22', '5678-9012', 'Fixo', 1);

INSERT INTO marca (nome_marca) VALUES
('Toyota'),
('Honda'),
('Ford'),
('Chevrolet'),
('Volkswagen (VW)'),
('BMW'),
('Mercedes-Benz'),
('Audi'),
('Nissan'),
('Hyundai');

INSERT INTO modelo (nome_modelo, id_marca) VALUES
('Corolla', 1),
('Civic', 2),
('F-150', 3),
('Silverado', 4),
('Golf', 5),
('3 Series', 6),
('C-Class', 7),
('A3', 8),
('Altima', 9),
('Kona', 10);


INSERT INTO carro (placa, numero_chassi, id_cliente, id_modelo) VALUES
('ABC1234', '1HGCM82633A123456', 1, 1),
('DEF5678', '2C3AA63H85H123457', 2, 2),
('GHI9012', '3D7KS28C89G123458', 3, 3),
('JKL3456', '4F2YZ02Z87K123459', 4, 4),
('MNO7890', '5UXWX7C58BL123460', 5, 5),
('PQR1234', '6VBDA23VXLR123461', 6, 6),
('STU5678', '7ND4J23Y24R123462', 7, 7),
('VWX9012', '8SHSR34T76L123463', 8, 8),
('YZA3456', '9PKM2343ABR123464', 9, 9),
('BCD7890', '10JH4R23PQ123465', 10, 10);


INSERT INTO cor (cor_1, cor_2, tipodetinta) VALUES
('Branco', 'Vermelho', 'Base de Água'),
('Prata', NULL, 'Base de Solvente'),
('Preto', 'Branco', 'Metálica'),
('Azul', NULL, 'Perolizada'),
('Vermelho', 'Verde', 'Fosca'),
('Verde', 'Preto', 'Texturizada'),
('Cinza', NULL, 'Acetinada'),
('Amarelo', NULL, 'Brilhante'),
('Laranja', 'Vermelho', 'Opaca'),
('Roxo', NULL, 'Transparente'),
('Marrom', 'Branco', 'Neon'),
('Bege', NULL, 'Fosca'),
('Dourado', NULL, 'Perolizada'),
('Prata', 'Preto', 'Metálica'),
('Preto', NULL, 'Brilhante');

INSERT INTO carro_cor (id_carro, id_cor) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO combustivel (tipo_combustivel) VALUES
('Gasolina'),
('Etanol'),
('Flex');

/*questao1*/
SELECT COUNT(*) AS quantidade_carros
FROM carro;

/*questao2*/
SELECT c.placa, m.nome_modelo
FROM carro c
INNER JOIN modelo m ON c.id_modelo = m.idmodelo;

/*questao3*/
SELECT cli.nomecliente, tel.ddd, tel.numero, tel.tipotelefone, cli.sexo
FROM cliente cli
INNER JOIN telefone tel ON cli.idcliente = tel.id_cliente;

/*questao4*/
SELECT cli.nomecliente, m.nome_modelo
FROM cliente cli
INNER JOIN carro c ON cli.idcliente = c.id_cliente
INNER JOIN modelo m ON c.id_modelo = m.idmodelo;

/*questao5*/
SELECT cli.nomecliente, m.nome_modelo, cor.cor_1, cor.cor_2, cor.tipodetinta
FROM carro car
INNER JOIN cliente cli ON car.id_cliente = cli.idcliente
INNER JOIN modelo m ON car.id_modelo = m.idmodelo
INNER JOIN carro_cor cc ON car.idcarro = cc.id_carro
INNER JOIN cor ON cc.id_cor = cor.idcor;

/*questao6*/
SELECT cli.nomecliente, m.nome_modelo, cor.cor_1, cor.cor_2, ma.nome_marca
FROM carro car
INNER JOIN cliente cli ON car.id_cliente = cli.idcliente
INNER JOIN modelo m ON car.id_modelo = m.idmodelo
INNER JOIN carro_cor cc ON car.idcarro = cc.id_carro
INNER JOIN cor ON cc.id_cor = cor.idcor
INNER JOIN marca ma ON m.id_marca = ma.idmarca;

/*questao7*/
/*1*/
DELIMITER //

CREATE PROCEDURE ListarClientesComEndereco()
BEGIN
    SELECT cli.nomecliente, e.logradouro, e.cidade, e.uf
    FROM cliente cli
    INNER JOIN endereco e ON cli.id_endereco = e.idendereco;
END //

DELIMITER ;

DELIMITER //

/*2*/
CREATE PROCEDURE ListarCarrosPorCliente(IN cliente_id INT)
BEGIN
    SELECT car.placa, m.nome_modelo
    FROM carro car
    INNER JOIN modelo m ON car.id_modelo = m.idmodelo
    WHERE car.id_cliente = cliente_id;
END //

DELIMITER ;

/*3*/
DELIMITER //

CREATE PROCEDURE ListarCarrosPorCor(IN cor_id INT)
BEGIN
    SELECT cli.nomecliente, car.placa, cor.cor_1, cor.cor_2, cor.tipodetinta, m.nome_modelo
    FROM carro_cor cc
    INNER JOIN carro car ON cc.id_carro = car.idcarro
    INNER JOIN cor ON cc.id_cor = cor.idcor
    INNER JOIN cliente cli ON car.id_cliente = cli.idcliente
    INNER JOIN modelo m ON car.id_modelo = m.idmodelo
    WHERE cor.idcor = cor_id;
END //

DELIMITER ;

CALL ListarClientesComEndereco();
CALL ListarCarrosPorCliente(1);
CALL ListarCarrosPorCor(1);

select*from cliente;




(61, '04:00:00', 'Ressuscita-me', 11, 7),
    (62, '03:45:00', 'Sonda-me, Usa-me', 11, 7),
    (63, '04:10:00', 'O Lugar Secreto', 11, 7),
    (64, '03:55:00', 'Pai, Eu Confiarei', 11, 7),
    (65, '04:20:00', 'Raridade', 11, 7),
    (66, '03:40:00', 'Coração Valente', 11, 7),
    (67, '03:50:00', 'Efésios 6', 11, 7),
    (68, '04:15:00', 'Meu Hospital', 11, 7),
    (69, '03:55:00', 'A Igreja Vem', 11, 7),
    (70, '04:00:00', 'Não é Tarde Demais', 11, 7);


