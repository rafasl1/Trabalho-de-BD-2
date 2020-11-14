/* ModeloLogicoExtendido: */

CREATE TABLE Evento  (
    Nome string,
    Edição int,
    Tema string,
    Público Alvo string,
    Tipo da Conta string,
    Valor int
);

CREATE TABLE Entidade (
    Nome string,
    Endereço string,
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
    Duração double,
    Público Alvo string,
    Valor de Inscrição double
);

CREATE TABLE Palestra (
    Afiliação string,
    Nome da Palestra string,
    Duração int,
    Público Alvo string
);

CREATE TABLE Tutorial (
    Tema string,
    Duração double,
    Público Alvo string,
    Valor de Inscrição double
);

CREATE TABLE Reunião (
    Objetivo string,
    fk_Participantes_Participantes_PK INT
);

CREATE TABLE Concurso (
    Tema string,
    fk_Regras_Regras_PK INT,
    fk_Premiação_Premiação_PK INT
);

CREATE TABLE Atividade Social (
    Tipo string,
    Valor do Convite int
);

CREATE TABLE Participante (
    fk_Papel_Papel_PK INT
);

CREATE TABLE Evento Online (
    Link da Gravação string,
    Plataforma string
);

CREATE TABLE Sessão (
    Nome string,
    Responsável pela Sessão string
);

CREATE TABLE Artigo (
    Nome string,
    Autor string,
    Tipo string
);

CREATE TABLE Apresentação (
    Sessão Especial string
);

CREATE TABLE Atividade (
    Data string,
    Local string,
    Público Específico string
);

CREATE TABLE Participante Concurso (
    Nome string,
    Sobrenome string,
    Número de Inscrição int,
    Telefone int
);

CREATE TABLE Juíz (
    Nome string,
    Sobrenome string,
    Telefone int
);

CREATE TABLE Palestrante (
    Nome string,
    Sobrenome string,
    Mini Currículo string
);

CREATE TABLE Ministrante (
    Nome string,
    Sobrenome string,
    Telefone int
);

CREATE TABLE Responsável (
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
    Preço int,
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
    Usuário string,
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

CREATE TABLE Premiação (
    Premiação_PK INT NOT NULL PRIMARY KEY,
    Premiação string
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

CREATE TABLE Inscrição (
    Época string,
    Taxa int,
    Classe do Público string,
    Forma de Pagamento string,
    Tipo string
);

CREATE TABLE Apresenta_Artigo_Sessão_Apresentação (
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
 
ALTER TABLE Reunião ADD CONSTRAINT FK_Reunião_1
    FOREIGN KEY (fk_Participantes_Participantes_PK)
    REFERENCES Participantes (Participantes_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Concurso ADD CONSTRAINT FK_Concurso_1
    FOREIGN KEY (fk_Regras_Regras_PK)
    REFERENCES Regras (Regras_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Concurso ADD CONSTRAINT FK_Concurso_2
    FOREIGN KEY (fk_Premiação_Premiação_PK)
    REFERENCES Premiação (Premiação_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Participante ADD CONSTRAINT FK_Participante_1
    FOREIGN KEY (fk_Papel_Papel_PK)
    REFERENCES Papel (Papel_PK)
    ON DELETE NO ACTION;