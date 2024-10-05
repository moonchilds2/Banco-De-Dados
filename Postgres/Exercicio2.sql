CREATE TABLE alunos(

	matricula INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cidade VARCHAR(255) NOT NULL

);

CREATE TABLE disciplinas(

	cod_disc VARCHAR(10) PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	carga_hor INTEGER NOT NULL
	
);

CREATE TABLE professores(

	cod_prof INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	cidade VARCHAR(255) NOT NULL

);

CREATE TABLE turmas(

	cod_disc VARCHAR(10) REFERENCES disciplinas(cod_disc),
	cod_turma INTEGER NOT NULL,
	cod_prof INTEGER REFERENCES professores(cod_prof),
	ano INTEGER NOT NULL,
	horario VARCHAR(255),
	PRIMARY KEY(cod_disc, cod_turma, cod_prof, ano)

);

CREATE TABLE historico(

	matricula INTEGER REFERENCES alunos(matricula),
	cod_disc VARCHAR(10),
	cod_turma INTEGER,
	cod_prof INTEGER,
	ano INTEGER,
	frequencia INTEGER NOT NULL,
	nota NUMERIC(5,2) NOT NULL,
	FOREIGN KEY(cod_disc, cod_turma, cod_prof, ano) REFERENCES turmas(cod_disc, cod_turma, cod_prof, ano),
	PRIMARY KEY(matricula, cod_disc, cod_turma, cod_prof, ano)

);

	
INSERT INTO alunos VALUES
	(2015010101, 'JOSE DE ALENCAR', 'NATAL'),
	(2015010102, 'JOÃO JOSÉ', 'JOÃO PESSOA'),
	(2015010103, 'MARIA JOAQUINA', 'RECIFE'),
	(2015010104, 'MARIA DAS DORES', 'FORTALEZA'),
	(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'NATAL'),
	(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS','NATAL');
	
INSERT INTO disciplinas VALUES
	('BD', 'BANCO DE DADOS', 100),
	('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
	('WEB', 'AUTORIA WEB', 50),
	('ENG', 'ENGENHARIA DE SOFTWARE', 80);
	
INSERT INTO professores VALUES
	(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
	(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
	(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');
	
INSERT INTO turmas VALUES
	('BD', 1, 212131, 2015, '11H-12H'),
	('BD', 2, 212131, 2015, '13H-14H'),
	('POO', 1, 192011, 2015, '08H-09H'),
	('WEB', 1, 192011, 2015, '07H-08H'),
	('ENG', 1, 122135, 2015, '10H-11H');
	
	
 
	
	matricula INTEGER REFERENCES alunos(matricula),
	cod_disc VARCHAR(10),
	cod_turma INTEGER,
	cod_prof INTEGER,
	ano INTEGER,
	frequencia INTEGER NOT NULL,
	nota NUMERIC(5,2) NOT NULL,
	
	INSERT INTO historico VALUES
		(2015010101, 'BD', 1, 212131, 2015, )
		
