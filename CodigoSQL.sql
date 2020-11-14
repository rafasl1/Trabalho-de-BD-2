/* ModeloLogicoExtendido: */

CREATE TABLE Evento  (
    Nome varchar(50),
    Edi��o int,
    Tema varchar(50),
    P�blico Alvvarchar(50)ng,
    Tipo da Conta varchar(50),
    Valor int
);

CREATE TABLE Entidade (
    Nome varchar(50),
    Endere�varchar(50)ng,
    Telefone int,
    Email varchar(50)
);

CREATE TABLE Local (
    fk_Equipamentos Especiais_Equipamentos Especiais_PK INT,
    fk_Facilidades Oferecidas_Facilidades Oferecidas_PK INT,
    Qualidades da Infraestrutura varchar(50)
);

CREATE TABLE Workshop (
    Tema varchar(50),
    Dura��o double,
    P�blico Alvvarchar(50)ng,
    Valor de Inscri��o double
);

CREATE TABLE Palestra (
    Afilia��varchar(50)ng,
    Nome da Palestra varchar(50),
    Dura��o int,
    P�blico Alvvarchar(50)ng
);

CREATE TABLE Tutorial (
    Tema varchar(50),
    Dura��o double,
    P�blico Alvvarchar(50)ng,
    Valor de Inscri��o double
);

CREATE TABLE Reuni�o (
    Objetivo varchar(50),
    fk_Participantes_Participantes_PK INT
);

CREATE TABLE Concurso (
    Tema varchar(50),
    fk_Regras_Regras_PK INT,
    fk_Premia��o_Premia��o_PK INT
);

CREATE TABLE Atividade Social (
    Tipo varchar(50),
    Valor do Convite int
);

CREATE TABLE Participante (
    fk_Papel_Papel_PK INT
);

CREATE TABLE Evento Online (
    Link da Grava��varchar(50)ng,
    Plataforma varchar(50)
);

CREATE TABLE Sess�o (
    Nome varchar(50),
    Respons�vel pela Sess�varchar(50)ng
);

CREATE TABLE Artigo (
    Nome varchar(50),
    Autor varchar(50),
    Tipo varchar(50)
);

CREATE TABLE Apresenta��o (
    Sess�o Especiavarchar(50)ng
);

CREATE TABLE Atividade (
    Data varchar(50),
    Local varchar(50),
    P�blico Espec�fvarchar(50)ring
);

CREATE TABLE Participante Concurso (
    Nome varchar(50),
    Sobrenome varchar(50),
    N�mero de Inscri��o int,
    Telefone int
);

CREATE TABLE Ju�z (
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone int
);

CREATE TABLE Palestrante (
    Nome varchar(50),
    Sobrenome varchar(50),
    Mini Curr�culvarchar(50)ng
);

CREATE TABLE Ministrante (
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone int
);

CREATE TABLE Respons�vel (
    Nome varchar(50),
    Sobrenome varchar(50),
    Papel varchar(50),
    Telefone int
);

CREATE TABLE Gerenciamento Financeiro (
    Ganhos double,
    Gastos double,
    Saldo Total double
);

CREATE TABLE Loja (
);

CREATE TABLE Produto (
    Id int,
    Pre�o int,
    Qnt em estoque int,
    Data varchar(50)
);

CREATE TABLE Vendedor (
    Nome varchar(50),
    Sobrenome varchar(50),
    CPF int,
    Telefone varchar(50),
    Id int
);

CREATE TABLE Sistema Finaceiro (
    Saldo Total int,
    Impostos Retirados int,
    Data varchar(50)
);

CREATE TABLE Rede Social (
    Plataforma varchar(50),
    Usu�rivarchar(50)ng,
    Senha varchar(50)
);

CREATE TABLE Gestor (
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone int
);

CREATE TABLE Equipamentos Especiais (
    Equipamentos Especiais_PK INT NOT NULL PRIMARY KEY,
    Equipamentos Especiais varchar(50)
);

CREATE TABLE Facilidades Oferecidas (
    Facilidades Oferecidas_PK INT NOT NULL PRIMARY KEY,
    Facilidades Oferecidas varchar(50)
);

CREATE TABLE Participantes (
    Participantes_PK INT NOT NULL PRIMARY KEY,
    Participantes varchar(50)
);

CREATE TABLE Regras (
    Regras_PK INT NOT NULL PRIMARY KEY,
    Regras varchar(50)
);

CREATE TABLE Premia��o (
    Premia��o_PK INT NOT NULL PRIMARY KEY,
    Premia��varchar(50)ng
);

CREATE TABLE Papel (
    Papel_PK INT NOT NULL PRIMARY KEY,
    Papel varchar(50)
);

CREATE TABLE Promove (
);

CREATE TABLE Patrocina (
    Taxa INT,
    Categoria varchar(50)
);

CREATE TABLE Realiza (
);

CREATE TABLE Inscri��o (
    �pocvarchar(50)ng,
    Taxa int,
    Classe do P�blicvarchar(50)ng,
    Forma de Pagamento varchar(50),
    Tipo varchar(50)
);

CREATE TABLE Apresenta_Artigo_Sess�o_Apresenta��o (
);

CREATE TABLE Promove (
);

CREATE TABLE Ministra (
);

CREATE TABLE Exibe (
);

CREATE TABLE Gerencia (
);
 
ALTER TABLE Local ADD CONSTRAINT FK_Local_1
    FOREIGN KEY (fk_Equipamentos Especiais_Equipamentos Especiais_PK)
    REFERENCES Equipamentos Especiais (Equipamentos Especiais_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Local ADD CONSTRAINT FK_Local_2
    FOREIGN KEY (fk_Facilidades Oferecidas_Facilidades Oferecidas_PK)
    REFERENCES Facilidades Oferecidas (Facilidades Oferecidas_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Reuni�o ADD CONSTRAINT FK_Reuni�o_1
    FOREIGN KEY (fk_Participantes_Participantes_PK)
    REFERENCES Participantes (Participantes_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Concurso ADD CONSTRAINT FK_Concurso_1
    FOREIGN KEY (fk_Regras_Regras_PK)
    REFERENCES Regras (Regras_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Concurso ADD CONSTRAINT FK_Concurso_2
    FOREIGN KEY (fk_Premia��o_Premia��o_PK)
    REFERENCES Premia��o (Premia��o_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Participante ADD CONSTRAINT FK_Participante_1
    FOREIGN KEY (fk_Papel_Papel_PK)
    REFERENCES Papel (Papel_PK)
    ON DELETE NO ACTION;