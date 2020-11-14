/* ModeloLogicoExtendido: */

CREATE TABLE Evento  (
    Nome string,
    Edicao int,
    Tema string,
    Publico Alvo string,
    Tipo da Conta string,
    Valor int
);

CREATE TABLE Entidade (
    Nome string,
    Endereco string,
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
    Duracao double,
    Publico Alvo string,
    Valor de Inscricao double
);

CREATE TABLE Palestra (
    Afiliacao string,
    Nome da Palestra string,
    Duracao int,
    Publico Alvo string
);

CREATE TABLE Tutorial (
    Tema string,
    Duracao double,
    Publico Alvo string,
    Valor de Inscricao double
);

CREATE TABLE Reuniao (
    Objetivo string,
    fk_Participantes_Participantes_PK INT
);

CREATE TABLE Concurso (
    Tema string,
    fk_Regras_Regras_PK INT,
    fk_Premiacao_Premiacao_PK INT
);

CREATE TABLE Atividade Social (
    Tipo string,
    Valor do Convite int
);

CREATE TABLE Participante (
    fk_Papel_Papel_PK INT
);

CREATE TABLE Evento Online (
    Link da Gravacao string,
    Plataforma string
);

CREATE TABLE Sessao (
    Nome string,
    Responsavel pela Sessao string
);

CREATE TABLE Artigo (
    Nome string,
    Autor string,
    Tipo string
);

CREATE TABLE Apresentacao (
    Sessao Especial string
);

CREATE TABLE Atividade (
    Data string,
    Local string,
    Publico Especafico string
);

CREATE TABLE Participante Concurso (
    Nome string,
    Sobrenome string,
    Numero de Inscricao int,
    Telefone int
);

CREATE TABLE Juiz (
    Nome string,
    Sobrenome string,
    Telefone int
);

CREATE TABLE Palestrante (
    Nome string,
    Sobrenome string,
    Mini Curruculo string
);

CREATE TABLE Ministrante (
    Nome string,
    Sobrenome string,
    Telefone int
);

CREATE TABLE Responsavel (
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
    Preco int,
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
    Usuario string,
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

CREATE TABLE Premiacao (
    Premiacao_PK INT NOT NULL PRIMARY KEY,
    Premiacao string
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

CREATE TABLE Inscricao (
    Epoca string,
    Taxa int,
    Classe do Publico string,
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
 
ALTER TABLE Reuniao ADD CONSTRAINT FK_Reuniao_1
    FOREIGN KEY (fk_Participantes_Participantes_PK)
    REFERENCES Participantes (Participantes_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Concurso ADD CONSTRAINT FK_Concurso_1
    FOREIGN KEY (fk_Regras_Regras_PK)
    REFERENCES Regras (Regras_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Concurso ADD CONSTRAINT FK_Concurso_2
    FOREIGN KEY (fk_Premiacao_Premiacao_PK)
    REFERENCES Premiacao (Premiacao_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Participante ADD CONSTRAINT FK_Participante_1
    FOREIGN KEY (fk_Papel_Papel_PK)
    REFERENCES Papel (Papel_PK)
    ON DELETE NO ACTION;