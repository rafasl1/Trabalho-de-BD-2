/* ModeloLogicoExtendido: */

CREATE TABLE Evento  (
    Nome string,
    Edi��o int,
    Tema string,
    P�blico Alvo string,
    Tipo da Conta string,
    Valor int
);

CREATE TABLE Entidade (
    Nome string,
    Endere�o string,
    Telefone int,
    Email string
);

CREATE TABLE Local (
    fk_Equipamentos Especiais_Equipamentos Especiais_PK INT,
    fk_Facilidades Oferecidas_Facilidades Oferecidas_PK INT,
    Qualidades da Infraestrutura string
);

CREATE TABLE Workshop (
    Tema string,
    Dura��o double,
    P�blico Alvo string,
    Valor de Inscri��o double
);

CREATE TABLE Palestra (
    Afilia��o string,
    Nome da Palestra string,
    Dura��o int,
    P�blico Alvo string
);

CREATE TABLE Tutorial (
    Tema string,
    Dura��o double,
    P�blico Alvo string,
    Valor de Inscri��o double
);

CREATE TABLE Reuni�o (
    Objetivo string,
    fk_Participantes_Participantes_PK INT
);

CREATE TABLE Concurso (
    Tema string,
    fk_Regras_Regras_PK INT,
    fk_Premia��o_Premia��o_PK INT
);

CREATE TABLE Atividade Social (
    Tipo string,
    Valor do Convite int
);

CREATE TABLE Participante (
    fk_Papel_Papel_PK INT
);

CREATE TABLE Evento Online (
    Link da Grava��o string,
    Plataforma string
);

CREATE TABLE Sess�o (
    Nome string,
    Respons�vel pela Sess�o string
);

CREATE TABLE Artigo (
    Nome string,
    Autor string,
    Tipo string
);

CREATE TABLE Apresenta��o (
    Sess�o Especial string
);

CREATE TABLE Atividade (
    Data string,
    Local string,
    P�blico Espec�fico string
);

CREATE TABLE Participante Concurso (
    Nome string,
    Sobrenome string,
    N�mero de Inscri��o int,
    Telefone int
);

CREATE TABLE Ju�z (
    Nome string,
    Sobrenome string,
    Telefone int
);

CREATE TABLE Palestrante (
    Nome string,
    Sobrenome string,
    Mini Curr�culo string
);

CREATE TABLE Ministrante (
    Nome string,
    Sobrenome string,
    Telefone int
);

CREATE TABLE Respons�vel (
    Nome string,
    Sobrenome string,
    Papel string,
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
    Data string
);

CREATE TABLE Vendedor (
    Nome string,
    Sobrenome string,
    CPF int,
    Telefone string,
    Id int
);

CREATE TABLE Sistema Finaceiro (
    Saldo Total int,
    Impostos Retirados int,
    Data string
);

CREATE TABLE Rede Social (
    Plataforma string,
    Usu�rio string,
    Senha string
);

CREATE TABLE Gestor (
    Nome string,
    Sobrenome string,
    Telefone int
);

CREATE TABLE Equipamentos Especiais (
    Equipamentos Especiais_PK INT NOT NULL PRIMARY KEY,
    Equipamentos Especiais string
);

CREATE TABLE Facilidades Oferecidas (
    Facilidades Oferecidas_PK INT NOT NULL PRIMARY KEY,
    Facilidades Oferecidas string
);

CREATE TABLE Participantes (
    Participantes_PK INT NOT NULL PRIMARY KEY,
    Participantes string
);

CREATE TABLE Regras (
    Regras_PK INT NOT NULL PRIMARY KEY,
    Regras string
);

CREATE TABLE Premia��o (
    Premia��o_PK INT NOT NULL PRIMARY KEY,
    Premia��o string
);

CREATE TABLE Papel (
    Papel_PK INT NOT NULL PRIMARY KEY,
    Papel string
);

CREATE TABLE Promove (
);

CREATE TABLE Patrocina (
    Taxa INT,
    Categoria string
);

CREATE TABLE Realiza (
);

CREATE TABLE Inscri��o (
    �poca string,
    Taxa int,
    Classe do P�blico string,
    Forma de Pagamento string,
    Tipo string
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