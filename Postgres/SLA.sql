CREATE TABLE COMPRADOR (
	CDGcomprador INTEGER NOT NULL,
	NMcomprador VARCHAR(40) NULL,
	NMendereço VARCHAR(40) NULL,
	NRcpf DECIMAL(11) NULL,
	NMcidade VARCHAR(20) NULL,
	NMbairro VARCHAR(20) NULL,
	SGestado CHAR(2) NULL,
	TELEFONE VARCHAR(20) NULL,
	EMAIL VARCHAR(80) NULL,
	PRIMARY KEY(CDGcomprador)
);

CREATE TABLE OFERTA(
	CDGimovel INTEGER NOT NULL,
	CDGcomprador INTEGER NOT NULL,
	VLoferta NUMERIC(16,2) NULL,
	DToferta DATE NULL,
	PRIMARY KEY(CDGimovel, CDGcomprador),
	
	FOREIGN KEY(CDGcomprador) REFERENCES COMPRADOR 
		ON UPDATE CASCADE,
	
	FOREIGN KEY(CDGimovel) REFERENCES IMOVEL
		ON UPDATE CASCADE
);

CREATE TABLE FAIXA_IMOVEL(
	CDGfaixa INTEGER NOT NULL,
	NMfaixa VARCHAR(30) NULL,
	VLminimo DECIMAL(14,2) NULL,
	VLmaximo DECIMAL(14,2) NULL,
	PRIMARY KEY(CDGfaixa)
);


CREATE TABLE ESTADO(
	SGestado CHAR(2) NOT NULL,
	NMestado VARCHAR(20) NULL,
	PRIMARY KEY(SGestado)
);

CREATE TABLE CIDADE(
	CDGcidade INTEGER NOT NULL,
	SGestado CHAR(2) NOT NULL,
	NMcidade VARCHAR(20) NULL,
	PRIMARY KEY(CDGcidade, SGestado),
	
	FOREIGN KEY(SGestado) REFERENCES ESTADO
		ON UPDATE CASCADE
);

CREATE TABLE BAIRRO(
	CDGbairro INTEGER NOT NULL,
	CDGcidade INTEGER NOT NULL,
	SGestado CHAR(2) NOT NULL,
	NMbairro VARCHAR(20) NULL,
	PRIMARY KEY(CDGbairro, CDGcidade, SGestado),
	
	FOREIGN KEY(CDGcidade, SGestado) REFERENCES CIDADE(CDGcidade, SGestado)
		ON UPDATE CASCADE

);


CREATE TABLE VENDEDOR(
	CDGvendedor INTEGER NOT NULL,
	NMvendedor VARCHAR(40) NULL,
	NMendereco VARCHAR(20) NULL,
	NRcpf DECIMAL(11) NULL,
	NMcidade VARCHAR(20) NULL,
	NMbairro VARCHAR(20) NULL,
	SGestado CHAR(2) NULL,
	telefone VARCHAR(20) NULL,
	email VARCHAR(80) NULL,
	PRIMARY KEY(CDGvendedor)
);

CREATE TABLE IMOVEL(
	CDGimovel INTEGER NOT NULL,
	CDGvendedor INTEGER NOT NULL,
	CDGbairro INTEGER NOT NULL,
	CDGcidade INTEGER NOT NULL,
	SGestado CHAR(2) NOT NULL,
	NMendereco VARCHAR(40) NULL,
	VLpreco DECIMAL(16, 2) NULL,
	NRofertas INTEGER NULL,
	vendido CHAR(1) NULL,
	DTvendido DATE,
	PRIMARY KEY(CDGimovel),
	FOREIGN KEY(CDGvendedor) REFERENCES VENDEDOR 
		ON UPDATE CASCADE,
	FOREIGN KEY(CDGbairro, CDGcidade, SGestado) REFERENCES BAIRRO(CDGbairro, CDGcidade, SGestado)
		ON UPDATE CASCADE
);


CREATE INDEX X1NMvendedor ON VENDEDOR(NMvendedor ASC);
CREATE INDEX X2NMcomprador ON COMPRADOR(NMcomprador ASC);
CREATE INDEX X3CDGimovel ON IMOVEL(CDGimovel ASC);


INSERT INTO ESTADO VALUES 
	('SP', 'São Paulo'),
	('RJ', 'Rio de Janeiro'),
	('CE', 'Fortaleza')
	
	
INSERT INTO CIDADE(CDGcidade, NMcidade, SGestado) VALUES
	(1, 'São Paulo', 'SP'),
	(2, 'Rio de Janeiro', 'RJ'),
	(3, 'Fortaleza', 'CE')
	


INSERT INTO BAIRRO(CDGbairro, NMbairro, CDGcidade, SGestado) VALUES
	(1, 'Jardins', 1, 'SP'),
	(2, 'Morumbi', 1, 'SP'),
	(3, 'Aeroporto', 1, 'SP'),
	(1, 'Aeroporto', 2, 'RJ'),
	(2, 'Flamengo', 2, 'RJ')
	
INSERT INTO VENDEDOR(CDGvendedor, NMvendedor, NMendereco, email) VALUES
	(1, 'Maria da Silva', 'Rua do Grito, 45','msilva@novatec.com.br'),
	(2, 'Marcos Andrade', 'Av. da Saudade, 325','mandrade@novatec.com.br'),
	(3, 'Andre Cardoso', 'Av. Brasil, 401','acardoso@novatec.com.br'),
	(4, 'Tatiana Souza', 'Rua do Imperador,778','tsouza@novatec.com.br'),
	(5, 'Luiz Gonzaga', 'Rua da Paz, 145','gonzaga@novatec.com.br'),
	(6, 'Renato Russo', 'Rua do Sono, 15','rrusso@novatec.com.br'),
	(7, 'Jorge Benjor', 'Rua da Musica, 1025','jben@novatec.com.br'),
	(8, 'Gal Costa', 'Rua do Itapoã, 12','gal@novatec.com.br')
	
INSERT INTO IMOVEL(CDGimovel, CDGvendedor, CDGbairro, CDGcidade, SGestado, NMendereco, VLpreco, vendido) VALUES
	(1, 1, 1, 1, 'SP', 'Al Tiete, 3304, ap101', 180000.00, 'N')

SELECT * FROM IMOVEL;
UPDATE IMOVEL SET VLpreco = VLpreco + 20000 WHERE CDGimovel = 1;

SELECT CDGbairro, CDGcidade, NMbairro FROM BAIRRO WHERE SGestado = 'RJ'

SELECT CDGbairro, NMbairro, CDGcidade, SGestado FROM BAIRRO WHERE SGestado = 'SP';

SELECT CDGVENDEDOR, NMVENDEDOR, EMAIL FROM VENDEDOR ORDER BY NMVENDEDOR DESC;

