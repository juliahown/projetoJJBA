CREATE DATABASE ProjectJJBA;

-- DROP DATABASE ProjectJJBA;

USE ProjectJJBA;

CREATE TABLE Personagem (
idPersonagem INT PRIMARY KEY auto_increment,
Nome VARCHAR(50) NOT NULL
);

INSERT INTO Personagem VALUES
(null, 'Jonathan Joestar'),
(null, 'Joseph Joestar'),
(null, 'Jotaro Kujo'),
(null, 'Josuke Higashikata'),
(null, 'Giorno Giovanna'),
(null, 'Jolyne Kujo');

-- DROP TABLE PersonagemFav;

CREATE TABLE Temporada (
idTemporada INT PRIMARY KEY auto_increment,
Nome VARCHAR(100) NOT NULL
);

INSERT INTO Temporada VALUES
(null, 'Phantom Blood'),
(null, 'Battle Tendency'),
(null, 'Stardust Crusaders'),
(null, 'Diamond is Unbreakable'),
(null, 'Vento Aureo'),
(null, 'Stone Ocean');

-- DROP TABLE TemporadaFav;

CREATE TABLE Usuario (
idUsuario INT PRIMARY KEY auto_increment,
Nome VARCHAR(50) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
Senha CHAR(100) NOT NULL,
fkPersonagem INT,
FOREIGN KEY (fkPersonagem)
	REFERENCES Personagem(idPersonagem),
fkTemporada INT,
FOREIGN KEY (fkTemporada)
	REFERENCES Temporada(idTemporada)
);

-- DROP TABLE Usuario;

CREATE TABLE Pontuacao (
idPontuacao INT PRIMARY KEY auto_increment,
fkUsuario INT,
FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
Pontuacao INT,
PercentualPontos FLOAT
) auto_increment = 100;

-- DROP TABLE Pontuacao;

SELECT * FROM Personagem;
SELECT * FROM Temporada;
SELECT * FROM Usuario;
SELECT * FROM Pontuacao;

SELECT * FROM Usuario WHERE fkTemporada = 4;
SELECT * FROM Usuario WHERE fkTemporada = 3;

SELECT COUNT(fkPersonagem) AS PersonagemFav FROM Usuario GROUP BY fkPersonagem;
SELECT COUNT(fkTemporada) AS TemporadaFav FROM Usuario GROUP BY fkTemporada;

-- SELECT PARA O GRÁFICO DE PERSONAGEM
SELECT COUNT(fkPersonagem) AS qtdEscolhido, Personagem.Nome FROM Usuario JOIN Personagem ON fkPersonagem = idPersonagem GROUP BY fkPersonagem;

-- SELECT PARA O GRÁFICO DE TEMPORADA
SELECT COUNT(fkTemporada) AS qtdEscolhido, Temporada.Nome FROM Usuario JOIN Temporada ON fkTemporada = idTemporada GROUP BY fkTemporada;