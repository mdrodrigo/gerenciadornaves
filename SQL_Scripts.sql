CREATE DATABASE GerenciaNaves
GO
USE GerenciaNaves

-- Cria a tabela planetas
CREATE TABLE Planetas(
	IdPlaneta int NOT NULL,
	Nome varchar(50) NOT NULL,
	Rotacao float NOT NULL,
	Orbita float NOT NULL,
	Diametro float NOT NULL,
	Clima varchar(50) NOT NULL,
	Populacao int NOT NULL
)
GO
-- Seta o campo IdPlaneta com a chave primaria
ALTER TABLE Planetas ADD CONSTRAINT PK_Planetas PRIMARY KEY (IdPlaneta);

-- Cria a tabela naves
CREATE TABLE Naves(
	IdNave	int	NOT NULL,
	Nome	varchar(100) NOT NULL,
	Modelo	varchar(150) NOT NULL,
	Passageiros int	NOT NULL,
	Carga	float	NOT NULL,
	Classe varchar(100) NOT NULL
)
GO
-- Seta o campo IdNave como a chave primaria
ALTER TABLE Naves ADD CONSTRAINT PK_Naves PRIMARY KEY (IdNave);

-- Cria a tabela Pilotos
CREATE TABLE Pilotos(
	IdPiloto int NOT NULL,
	Nome varchar(200) NOT NULL,
	AnoNascimento varchar(10) NOT NULL,
	IdPlaneta int NOT NULL
)
GO
-- Seta o campo idPilotos como chave primária
ALTER TABLE Pilotos ADD CONSTRAINT PK_Pilotos PRIMARY KEY (IdPiloto);
GO
-- Seta o  campo idPlaneta como chave estrangeira para o campo IdPlaneta na Tabela Planetas
ALTER TABLE Pilotos ADD CONSTRAINT FK_Pilotos_Planetas FOREIGN KEY(IdPlaneta)
REFERENCES Planetas (IdPlaneta)

-- Cria
CREATE TABLE PilotosNaves(
	IdPiloto int NOT NULL,
	IdNave int NOT NULL,
	FlagAutorizado bit NOT NULL
)
GO
ALTER TABLE PilotosNaves ADD CONSTRAINT PK_PilotosNaves PRIMARY KEY (IdPiloto, IdNave);
GO
ALTER TABLE PilotosNaves ADD CONSTRAINT FK_PilotosNaves_Pilotos FOREIGN Key(IdPiloto)
REFERENCES Pilotos (IdPiloto)
GO
ALTER TABLE PilotosNaves ADD CONSTRAINT FK_PilotosNaves_Naves FOREIGN KEY (IdNave)
REFERENCES Naves (IdNave)
GO
ALTER TABLE PilotosNaves ADD CONSTRAINT DF_PilotosNaves_FlagAutorizado DEFAULT (1) FOR FlagAutorizado

-- Cria a tabela de viagens da nave
CREATE TABLE HistoricoViagens(
	IdNave int NOT NULL,
	IdPiloto int NOT NULL,
	DtSaida datetime NOT NULL,
	DtChegada datetime NULL
)
GO
ALTER TABLE HistoricoViagens ADD CONSTRAINT FK_HistoricoViagens_PilotosNaves FOREIGN KEY (IdPiloto, IdNave)
REFERENCES PilotosNaves (IdPiloto, IdNave)
GO
ALTER TABLE HistoricoViagens CHECK CONSTRAINT FK_HistoricoViagens_PilotosNaves

select * from Pilotos
select * from Planetas
select * from Naves
Select * from PilotosNaves
select * from HistoricoViagens