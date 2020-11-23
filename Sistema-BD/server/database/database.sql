/*CREATE DATABASE Gerenciador_de_eventos;*/

CREATE TABLE EVENTO  (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Edicao int,
    Tema varchar(50),
    Publico_Alvo varchar(50),
    Local_Id int,
    FOREIGN KEY(Local_Id) REFERENCES LOCAL_DO_EVENTO(Id)
);

INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo, Local_Id) VALUES (1, 'Semana de SI', 12, 'Como ficar rico', 'Estudantes de Sistemas de Informação', 1);
INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo, Local_Id) VALUES (2, 'Roadsec', 34, 'Segurança na computação', 'Profissionais de tecnologia', 2);
INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo, Local_Id) VALUES (3, 'SP Maker Week', 6, 'Arduino', 'Público geral', 3);
INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo, Local_Id) VALUES (4, 'Brasil Games Show', 21, 'Jogos', 'Jogadores de jogos digitais', 4);
INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo, Local_Id) VALUES (5, 'Comic Con', 16, 'Quadrinhos', 'Fãs de super heróis', 5);

CREATE TABLE EVENTO_ONLINE (
    Link_da_Gravacao varchar(50),
    Plataforma varchar(50),
    Evento_id int,
    FOREIGN KEY(Evento_id) REFERENCES EVENTO(Id)
);

INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento_id) VALUES ('https://www.twitch.tv/each_ssi', 'Twitch.tv', 1);
INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento_id) VALUES ('https://www.youtube.com/watch?v=izK5DTXWyxw', 'YouTube', 2);
INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento_id) VALUES ('fb.gg/SPMakerWeek', 'Facebook', 3);
INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento_id) VALUES ('youtube.com/adishdiash', 'YouTube', 4);
INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento_id) VALUES ('twitch.tv/ComicCon', 'Twitch.tv', 5);

CREATE TABLE PARTICIPANTE_EVENTO (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Sobrenome varchar(50),
    Email varchar(50),
    Evento_id int,
    FOREIGN KEY(Evento_id) REFERENCES EVENTO(Id)
);

INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (1, 'Lara', 'Zureck', 'larazureck@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (2, 'Golab', 'Guimerlhe', 'golabgolab@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (3, 'Vilma', 'Lorena', 'vilmalorena@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (4, 'Daria', 'Imar', 'dariaimar@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (5, 'Gabriela', 'Michele', 'gabrielamichele@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (6, 'Freira', 'Alexa', 'freiraalexa@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (7, 'Rodovario', 'Pinheiro', 'rodoviariopinheiro@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (8, 'Girlanda', 'Golab', 'girlandagolab@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (9, 'Alana', 'Coelhas', 'alanacoelhas@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (10, 'Lila', 'Zurek', 'lilazurek@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (11, 'Luli', 'Zurek', 'lulizurek@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (12, 'Fema', 'Rins', 'femarins@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (13, 'Natilva', 'Eva', 'natilvaeva@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (14, 'Mariana', 'Gracinha', 'marianagracinha@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (15, 'Giana', 'Armario', 'gianaarmario@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (16, 'Joelson', 'Fronha', 'joelsonfronha@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (17, 'Ferdinando', 'Evoluiu', 'ferdinandoevoluiu@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (18, 'Josiel', 'Gaffman', 'josielgaffman@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (19, 'Katiana', 'Carente', 'katianacarente@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (20, 'Robertinho', 'Orvalho', 'robertinhoorvalho@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (21, 'Clodoberto', 'Agnaldo', 'clodobertoagnaldo@gmail.com', 1);
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Sobrenome, Email, Evento_id) VALUES (22, 'Guirlanda', 'Golab', 'guirlandagolab@gmail.com', 1);


CREATE TABLE PAPEL (
    Id int PRIMARY KEY,
    Papel varchar(50),
    Participante_evento_id int,
    FOREIGN KEY(Participante_evento_id) REFERENCES PARTICIPANTE_EVENTO(Id)
);

INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (1, 'Ministrante', 1);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (2, 'Público', 1);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (3, 'Ministrante', 2);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (4, 'Público', 3);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (5, 'Ministrante', 3);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (6, 'Funcionário', 3);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (7, 'Ministrante', 4);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (8, 'Ministrante', 5);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (9, 'Participante', 5);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (10, 'Juiz', 5);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (11, 'Público', 6);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (12, 'Público', 7);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (13, 'Público', 8);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (14, 'Público', 9);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (15, 'Palestrante', 9);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (16, 'Juiz', 10);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (17, 'Juiz', 11);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (18, 'Juiz', 12);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (19, 'Juiz', 13);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (20, 'Público', 14);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (21, 'Funcionário', 14);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (23, 'Público', 15);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (24, 'Funcionario', 16);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (25, 'Funcionario', 17);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (26, 'Funcionario', 18);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (27, 'Palestrante', 19);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (28, 'Palestrante', 20);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (29, 'Palestrante', 21);
INSERT INTO PAPEL (Id, Papel, Participante_evento_id) VALUES (30, 'Palestrante', 22);

CREATE TABLE CONTAS_A_PAGAR (
    Tipo_da_Conta varchar(50),
    Valor int,
    Evento_id int,
    FOREIGN KEY(Evento_id) REFERENCES EVENTO(Id)
);

INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento_id) VALUES ('Luz', 100, 1);
INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento_id) VALUES ('Água', 100, 2);
INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento_id) VALUES ('Energia', 100, 3);
INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento_id) VALUES ('Compras', 100, 4);
INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento_id) VALUES ('Contratos', 100, 5);

CREATE TABLE ENTIDADE (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Endereco varchar(50),
    Telefone varchar(50),
    Email varchar(50)
);

INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (1, 'DASI', 'Rua Diretorio Academico', '11997826477', 'dasiusp@usp.br');
INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (2, 'Bradesco', 'Rua Bradesco', '1189647366', 'bradesco@usp.br');
INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (3, 'Itau', 'Rua Itau', '11637489288', 'itau@usp.br');
INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (4, 'Fusion', 'Rua Fusion', '11997826477', 'fusion@usp.br');
INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (5, 'Amazon', 'Rua Amazon', '11997826477', 'amazon@usp.br');

CREATE TABLE PROMOVE_EVENTO (
    Evento_id int,
    Entidade_id int,
    FOREIGN KEY(Evento_id) REFERENCES EVENTO(Id),
    FOREIGN KEY(Entidade_id) REFERENCES ENTIDADE(Id) 
);

INSERT INTO PROMOVE_EVENTO (Evento_id, Entidade_id) VALUES (1, 3);
INSERT INTO PROMOVE_EVENTO (Evento_id, Entidade_id) VALUES (2, 4);
INSERT INTO PROMOVE_EVENTO (Evento_id, Entidade_id) VALUES (3, 2);
INSERT INTO PROMOVE_EVENTO (Evento_id, Entidade_id) VALUES (4, 2);
INSERT INTO PROMOVE_EVENTO (Evento_id, Entidade_id) VALUES (5, 3);

CREATE TABLE PATROCINA (
    Taxa INT,
    Categoria varchar(50),
    Evento_id int,
    Entidade_id int,
    FOREIGN KEY(Evento_id) REFERENCES EVENTO(Id),
    FOREIGN KEY(Entidade_id) REFERENCES ENTIDADE(Id) 
);

INSERT INTO PATROCINA (Taxa, Categoria, Evento_id, Entidade_id) VALUES (300, 'Ouro', 1, 5);
INSERT INTO PATROCINA (Taxa, Categoria, Evento_id, Entidade_id) VALUES (750, 'Bronze', 2, 1);
INSERT INTO PATROCINA (Taxa, Categoria, Evento_id, Entidade_id) VALUES (20, 'Bronze', 3, 1);
INSERT INTO PATROCINA (Taxa, Categoria, Evento_id, Entidade_id) VALUES (4500, 'Ouro', 4, 4);
INSERT INTO PATROCINA (Taxa, Categoria, Evento_id, Entidade_id) VALUES (178, 'Prata', 5, 3);

CREATE TABLE REALIZA (
    Evento_id int,
    Entidade_id int,
    FOREIGN KEY(Evento_id) REFERENCES EVENTO(Id),
    FOREIGN KEY(Entidade_id) REFERENCES ENTIDADE(Id) 
);

INSERT INTO REALIZA (Evento_id, Entidade_id) VALUES (1, 4);
INSERT INTO REALIZA (Evento_id, Entidade_id) VALUES (2, 2);
INSERT INTO REALIZA (Evento_id, Entidade_id) VALUES (3, 1);
INSERT INTO REALIZA (Evento_id, Entidade_id) VALUES (4, 5);
INSERT INTO REALIZA (Evento_id, Entidade_id) VALUES (5, 5);

CREATE TABLE RESPONSAVEL_ENTIDADE (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Sobrenome varchar(50),
    Papel varchar(50),
    Telefone varchar(50),
    Entidade_id int,
    FOREIGN KEY(Entidade_id) REFERENCES ENTIDADE(Id)
);

INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade_id) VALUES (1, 'Lila', 'Maria', 'Diretora de Eventos', '999999999', 1);
INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade_id) VALUES (2, 'Luli', 'Ferreira', 'Presidente', '999999999', 2);
INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade_id) VALUES (3, 'Nicole', 'Gaiola', 'Vice-presidente', '999999999', 3);
INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade_id) VALUES (4, 'Nicolas', 'Queijo', 'Representante oficial', '999999999', 4);
INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade_id) VALUES (5, 'Kleiton', 'Marcelo', 'Diretor de relações públicas', '999999999', 5);

CREATE TABLE GERENCIA (
    Responsavel_entidade_id int,
    Entidade_id int,
    FOREIGN KEY(Responsavel_entidade_id) REFERENCES RESPONSAVEL_ENTIDADE(Id),
    FOREIGN KEY(Entidade_id) REFERENCES ENTIDADE(Id) 
);

INSERT INTO GERENCIA (Responsavel_entidade_id, Entidade_id) VALUES (1, 1);
INSERT INTO GERENCIA (Responsavel_entidade_id, Entidade_id) VALUES (2, 2);
INSERT INTO GERENCIA (Responsavel_entidade_id, Entidade_id) VALUES (3, 3);
INSERT INTO GERENCIA (Responsavel_entidade_id, Entidade_id) VALUES (4, 4);
INSERT INTO GERENCIA (Responsavel_entidade_id, Entidade_id) VALUES (5, 5);

CREATE TABLE LOCAL_DO_EVENTO (
    Id int PRIMARY KEY,
    Qualidade_da_Infraestrutura varchar(50)
);

INSERT INTO LOCAL_DO_EVENTO (Id, Qualidade_da_Infraestrutura) VALUES (1, 'pessima');
INSERT INTO LOCAL_DO_EVENTO (Id, Qualidade_da_Infraestrutura) VALUES (2, 'boa');
INSERT INTO LOCAL_DO_EVENTO (Id, Qualidade_da_Infraestrutura) VALUES (3, 'ruim');
INSERT INTO LOCAL_DO_EVENTO (Id, Qualidade_da_Infraestrutura) VALUES (4, 'otima');
INSERT INTO LOCAL_DO_EVENTO (Id, Qualidade_da_Infraestrutura) VALUES (5, 'regular');

CREATE TABLE EQUIPAMENTOS_ESPECIAIS (
    Equipamento varchar(50),
    Local_do_evento_id int,
    FOREIGN KEY(Local_do_evento_id) REFERENCES LOCAL_DO_EVENTO(Id)
);

INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento_id) VALUES ('lanterna', 1);
INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento_id) VALUES ('tesoura', 2);
INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento_id) VALUES ('cola', 3);
INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento_id) VALUES ('guitarra', 4);
INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento_id) VALUES ('computador', 5);

CREATE TABLE FACILIDADES_OFERECIDAS (
    Facilidade varchar(50),
    Local_do_evento_id int,
    FOREIGN KEY(Local_do_evento_id) REFERENCES LOCAL_DO_EVENTO(Id)
);

INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento_id) VALUES ('iluminacao', 1);
INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento_id) VALUES ('rampa', 2);
INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento_id) VALUES ('elevador', 3);
INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento_id) VALUES ('traducao simultanea', 4);
INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento_id) VALUES ('traducao em libras', 5);

CREATE TABLE ATIVIDADE (
    Id int PRIMARY KEY,
    Data_atividade varchar(50),
    Local_atividade varchar(50),
    Publico_Especifico varchar(50),
    Evento_id int,
    FOREIGN KEY(Evento_id) REFERENCES EVENTO(Id)
);

INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (1, '12/04/2020', 'La longe', 'programadores', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (2, '23/01/2019', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (3, '19/07/2021', 'La longe', 'universitarios', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (4, '25/09/2020', 'La longe', 'jovens', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (5, '03/03/2023', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (6, '01/01/2021', 'La longe', 'programadores', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (7, '02/01/2021', 'La longe', 'programadores', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (8, '03/01/2021', 'La longe', 'jovens', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (9, '04/01/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (10, '05/01/2021', 'La longe', 'gamers', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (11, '06/01/2021', 'La longe', 'jovens', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (12, '07/01/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (13, '08/02/2021', 'La longe', 'programadores', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (14, '09/02/2021', 'La longe', 'jovens e adultos', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (15, '10/02/2021', 'La longe', 'jovens', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (16, '11/02/2021', 'La longe', 'programadores', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (17, '12/02/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (18, '13/03/2021', 'La longe', 'universitários', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (19, '14/03/2021', 'La longe', 'nerds', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (20, '15/03/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (21, '16/03/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (22, '17/03/2021', 'La longe', 'jovens', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (23, '18/03/2021', 'La longe', 'jovens', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (24, '19/04/2021', 'La longe', 'gamers', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (25, '20/04/2021', 'La longe', 'gamers', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (26, '21/04/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (27, '22/04/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (28, '23/04/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (29, '24/04/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (30, '25/04/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (31, '26/04/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (32, '27/04/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (33, '28/04/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (34, '29/04/2021', 'La longe', 'geral', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento_id) VALUES (35, '30/04/2021', 'La longe', 'geral', 1);

CREATE TABLE PROMOVE_ATIVIDADE (
    Entidade_id int,
    Atividade_id int,
    FOREIGN KEY(Entidade_id) REFERENCES ENTIDADE(Id),
    FOREIGN KEY(Atividade_id) REFERENCES ATIVIDADE(Id) 
);

INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (1, 1);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (2, 2);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (3, 3);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (4, 4);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (5, 5);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (1, 6);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (2, 7);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (3, 8);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (4, 9);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (5, 10);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (1, 11);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (2, 12);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (3, 13);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (4, 14);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (5, 15);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (1, 16);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (2, 17);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (3, 18);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (4, 19);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (5, 20);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (1, 21);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (2, 22);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (3, 23);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (4, 24);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (5, 25);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (1, 26);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (2, 27);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (3, 28);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (4, 29);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (5, 30);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (1, 31);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (2, 32);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (3, 33);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (4, 34);
INSERT INTO PROMOVE_ATIVIDADE (Entidade_id, Atividade_id) VALUES (5, 35);

CREATE TABLE GERENCIAMENTO_FINANCEIRO (
    Ganhos int,
    Gastos int,
    Saldo_Total int,
    Atividade_id int,
    FOREIGN KEY(Atividade_id) REFERENCES ATIVIDADE(Id)
);

INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade_id) VALUES (50, 20, 30, 1);
INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade_id) VALUES (120, 20, 100, 2);
INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade_id) VALUES (34, 44, -10, 3);
INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade_id) VALUES (90, 20, 70, 4);
INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade_id) VALUES (140, 340, -200, 5);

CREATE TABLE WORKSHOP (
    Tema varchar(50),
    Duracao int,
    Publico_Alvo varchar(50),
    Valor_de_Inscricao int,
    Atividade_id int,
    FOREIGN KEY(Atividade_id) REFERENCES ATIVIDADE(Id)
);

INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES ('Aprendendo React para entrar na RocketSeat', 95, 'jovens', 24, 1);
INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES ('Workshop de Angular', 120, 'jovens e adultos', 74, 2);
INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES ('Aplicando Calculo 2 na sua vida', 15, 'universitarios', 10, 3);
INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES ('Arduino para iniciantes', 95, 'jovens e adultos', 32, 4);
INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES ('Como sobreviver aos 4 anos de faculdade', 145, 'universitarios', 3, 5);

CREATE TABLE PALESTRA (
    Id int PRIMARY KEY,
    Afiliacao varchar(50),
    Nome_da_Palestra varchar(50),
    Duracao int,
    Publico_Alvo varchar(50),
    Atividade_id int,
    FOREIGN KEY(Atividade_id) REFERENCES ATIVIDADE(Id)
);

INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo, Atividade_id) VALUES (1, 'CIA_DEV', 'Mercado Mobile', '60', 'Desenvolvedores', 6);
INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo, Atividade_id) VALUES (2, 'DevGeeks', 'Computação em Nuvem', '60', 'Interessados por Tecnologia', 7);
INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo, Atividade_id) VALUES (3, 'StarWarsFans', 'Como se Tornar um Jedi nos Tempos Modernos', '40', 'Jovens', 8);
INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo, Atividade_id) VALUES (4, 'PsicoGroup', 'Inteligência Emocional', '40', 'Público Geral', 9);
INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo, Atividade_id) VALUES (5, 'LOLzeiro1', 'Como virar Pro-Player de LOL', '40', 'Jogadores', 10);

CREATE TABLE PALESTRANTE (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Sobrenome varchar(50),
    Mini_Curriculo varchar(50),
    Palestra_id int,
    FOREIGN KEY(Palestra_id) REFERENCES PALESTRA(Id)
);

INSERT INTO PALESTRANTE (Id, Nome, Sobrenome, Mini_Curriculo, Palestra_id) VALUES (1, 'Katiana', 'Carente', 'Graduada em Psicologia pela USP', 4);
INSERT INTO PALESTRANTE (Id, Nome, Sobrenome, Mini_Curriculo, Palestra_id) VALUES (2, 'Robertinho', 'Orvalho', 'Graduando em Marketing pela USP', 3);
INSERT INTO PALESTRANTE (Id, Nome, Sobrenome, Mini_Curriculo, Palestra_id) VALUES (3, 'Clodoberto', 'Agnaldo', 'Pro-Player', 5);
INSERT INTO PALESTRANTE (Id, Nome, Sobrenome, Mini_Curriculo, Palestra_id) VALUES (4, 'Alana', 'Coelhas', 'Graduada em Sistemas de Informação pela USP', 1);
INSERT INTO PALESTRANTE (Id, Nome, Sobrenome, Mini_Curriculo, Palestra_id) VALUES (5, 'Guirlanda', 'Golab', 'Mestre em Sistemas de Informação pela USP', 2);

CREATE TABLE TUTORIAL (
    Id int PRIMARY KEY,
    Tema varchar(50),
    Duracao int,
    Publico_Alvo varchar(50),
    Valor_de_Inscricao int,
    Atividade_id int,
    FOREIGN KEY(Atividade_id) REFERENCES ATIVIDADE(Id)
);

INSERT INTO TUTORIAL (Id, Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES (1, 'Como programar uma Pokedex em Angular', 95, 'jovens', 24, 11);
INSERT INTO TUTORIAL (Id, Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES (2, 'Como ficar milionario em uma semana', 20, 'geral', 244, 12);
INSERT INTO TUTORIAL (Id, Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES (3, 'Instalando JDK no seu computador', 35, 'programadores', 10, 13);
INSERT INTO TUTORIAL (Id, Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES (4, 'Como tocar Unsaid Emily no ukelele', 95, 'jovens e adultos', 32, 14);
INSERT INTO TUTORIAL (Id, Tema, Duracao, Publico_Alvo, Valor_de_Inscricao, Atividade_id) VALUES (5, 'Como queimar chocolate no microondas', 15, 'jovens', 3, 15);

CREATE TABLE MINISTRANTE_TUTORIAL (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone varchar(50),
    Tutorial_id int,
    FOREIGN KEY(Tutorial_id) REFERENCES TUTORIAL(Id)
);

INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone, Tutorial_id) VALUES (1, 'Lara', 'Zurek', '1189948377', 1);
INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone, Tutorial_id) VALUES (2, 'Golab', 'Guimerlhe', '19875849377', 2);
INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone, Tutorial_id) VALUES (3, 'Vilma', 'Lorena', '11698295979', 3);
INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone, Tutorial_id) VALUES (4, 'Daria', 'Imar', '11994224897', 4);
INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone, Tutorial_id) VALUES (5, 'Gabriela', 'Michele', '11958222359', 5);

CREATE TABLE MINISTRA ( 
    Ministrante_id int,
    Tutorial_id int,
    FOREIGN KEY(Ministrante_id) REFERENCES MINISTRANTE_TUTORIAL(Id),
    FOREIGN KEY(Tutorial_id) REFERENCES TUTORIAL(Id) 
);

INSERT INTO MINISTRA (Ministrante_id, Tutorial_id) VALUES (1, 1);
INSERT INTO MINISTRA (Ministrante_id, Tutorial_id) VALUES (2, 2);
INSERT INTO MINISTRA (Ministrante_id, Tutorial_id) VALUES (3, 3);
INSERT INTO MINISTRA (Ministrante_id, Tutorial_id) VALUES (4, 4);
INSERT INTO MINISTRA (Ministrante_id, Tutorial_id) VALUES (5, 5);

CREATE TABLE REUNIAO (
    Id int PRIMARY KEY,
    Objetivo varchar(50),
    Atividade_id int,
    FOREIGN KEY(Atividade_id) REFERENCES ATIVIDADE(Id)
);

INSERT INTO REUNIAO (Id, Objetivo, Atividade_id) VALUES (1, 'Discutir sobre programação', 16);
INSERT INTO REUNIAO (Id, Objetivo, Atividade_id) VALUES (2, 'Discutir sobre o COVID', 17);
INSERT INTO REUNIAO (Id, Objetivo, Atividade_id) VALUES (3, 'Discutir sobre minha dp em Calculo 2', 18);
INSERT INTO REUNIAO (Id, Objetivo, Atividade_id) VALUES (4, 'Discutir sobre Star Wars', 19);
INSERT INTO REUNIAO (Id, Objetivo, Atividade_id) VALUES (5, 'Discutir sobre as discussoes', 20);

CREATE TABLE PARTICIPANTES_REUNIAO (
    Nome varchar(50),
    Sobrenome varchar(50),
    Reuniao_id int,
    FOREIGN KEY(Reuniao_id) REFERENCES REUNIAO(Id)
);

INSERT INTO PARTICIPANTES_REUNIAO (Nome, Sobrenome, Reuniao_id) VALUES ('Mariana', 'Gracinha', 1);
INSERT INTO PARTICIPANTES_REUNIAO (Nome, Sobrenome, Reuniao_id) VALUES ('Alana', 'Coelhas', 2);
INSERT INTO PARTICIPANTES_REUNIAO (Nome, Sobrenome, Reuniao_id) VALUES ('Giana', 'Armario', 3);
INSERT INTO PARTICIPANTES_REUNIAO (Nome, Sobrenome, Reuniao_id) VALUES ('Vilma', 'Lorena', 4);
INSERT INTO PARTICIPANTES_REUNIAO (Nome, Sobrenome, Reuniao_id) VALUES ('Lara', 'Zurek', 5);

CREATE TABLE CONCURSO (
    Id int PRIMARY KEY,
    Tema varchar(50),
    Atividade_id int,
    FOREIGN KEY(Atividade_id) REFERENCES ATIVIDADE(Id)
);

INSERT INTO CONCURSO (Id, Tema, Atividade_id) VALUES (1, 'Concurso de Comer Cones', 21);
INSERT INTO CONCURSO (Id, Tema, Atividade_id) VALUES (2, 'Concurso de Beleza', 22);
INSERT INTO CONCURSO (Id, Tema, Atividade_id) VALUES (3, 'Concurso de Feiura', 23);
INSERT INTO CONCURSO (Id, Tema, Atividade_id) VALUES (4, 'Concurso de Lol', 24);
INSERT INTO CONCURSO (Id, Tema, Atividade_id) VALUES (5, 'Concurso de Among Us', 25);

CREATE TABLE PARTICIPANTE_CONCURSO (
    Nome varchar(50),
    Sobrenome varchar(50),
    Numero_de_Inscricao int,
    Telefone varchar(50),
    Concurso_id int,
    FOREIGN KEY(Concurso_id) REFERENCES CONCURSO(Id)
);

INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso_id) VALUES ('Freira', 'Alexa', 1, '1182746355', 1);
INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso_id) VALUES ('Rodovario', 'Pinheiro', 2, '1195847376', 2);
INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso_id) VALUES ('Gabriela', 'Michele', 3, '1185746355', 3);
INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso_id) VALUES ('Girlanda', 'Golab', 4, '1185746399', 4);
INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso_id) VALUES ('Alana', 'Coelhas', 5, '1185948766', 5);

CREATE TABLE JUIZ_CONCURSO (
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone varchar(50),
    Concurso_id int,
    FOREIGN KEY(Concurso_id) REFERENCES CONCURSO(Id)
);

INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso_id) VALUES ('Lila', 'Zurek', '1187654322', 1);
INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso_id) VALUES ('Luli', 'Zurek', '1185747366', 2);
INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso_id) VALUES ('Fema', 'Rins', '1186746622', 3);
INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso_id) VALUES ('Gabriela', 'Michele', '1185746322', 4);
INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso_id) VALUES ('Natilva', 'Eva', '1195847366', 5);

CREATE TABLE REGRAS_CONCURSO (
    Regra varchar(50),
    Concurso_id int,
    FOREIGN KEY(Concurso_id) REFERENCES CONCURSO(Id)
);

INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Não matar', 1);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Não seja feia', 1);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Não socar competidores', 2);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Sair no soco com Gabriella Michele', 2);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Não pedir para pessoas sairem de suas casas', 2);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Não dar piti quando trocar o filme', 3);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Não comprar votos', 3);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Acreditar em outras pessoas além da Giovana', 4);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Não dar cambalhota na grama', 5);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Não dar trabalho no role', 5);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso_id) VALUES ('Não chegar atrasado na festa', 5);

CREATE TABLE PREMIACAO (
    Premio varchar(50),
    Concurso_id int,
    FOREIGN KEY(Concurso_id) REFERENCES CONCURSO(Id)
);

INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Playstation', 1);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Jogo da vida', 1);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Ingresso da Glow', 2);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Caneca e tirante', 2);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Ingresso do panelas', 2);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Viagem para Paris', 3);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Iphone 10', 3);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Plano cone ilimitado', 4);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Laura', 5);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Ingresso do Intercomp', 5);
INSERT INTO PREMIACAO (Premio, Concurso_id) VALUES ('Ingresso da Las Brisas', 5);

CREATE TABLE ATIVIDADE_SOCIAL (
    Tipo varchar(50),
    Valor_do_Convite int,
    Atividade_id int,
    FOREIGN KEY(Atividade_id) REFERENCES ATIVIDADE(Id)
);

INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade_id) VALUES ('Confraternizacao', 13, 26);
INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade_id) VALUES ('Bingo', 12, 27);
INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade_id) VALUES ('Rifa', 23, 28);
INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade_id) VALUES ('Beneficente', 10, 29);
INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade_id) VALUES ('Comemorativa', 30, 30);

CREATE TABLE SESSAO (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Responsavel_pela_Sessao varchar(50),
    Atividade_id int,
    FOREIGN KEY(Atividade_id) REFERENCES ATIVIDADE(Id)
);

INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao, Atividade_id) VALUES (1, 'Sessão da Manhã', 'Vilma Lorena', 31);
INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao, Atividade_id) VALUES (2, 'Sessão da Tarde', 'Mariana Gracinha', 32);
INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao, Atividade_id) VALUES (3, 'Sessão da Noite', 'Joelson Fronha', 33);
INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao, Atividade_id) VALUES (4, 'Sessão da Madrugada', 'Ferdinando Evoluiu', 34);
INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao, Atividade_id) VALUES (5, 'Sessão Extra', 'Josiel Gaffman', 35);

CREATE TABLE ARTIGO (
    Id int PRIMARY KEY,
    Nome varchar(100),
    Autor varchar(50),
    Tipo varchar(50)
);

INSERT INTO ARTIGO (Id, Nome, Autor, Tipo) VALUES (1, 'Teorias do Marketing Digital', 'Lara Zureck', 'Científico');
INSERT INTO ARTIGO (Id, Nome, Autor, Tipo) VALUES (2, 'Atuação de Autômatos na Ciência de Dados', 'Giana Armario', 'TCC');
INSERT INTO ARTIGO (Id, Nome, Autor, Tipo) VALUES (3, 'Algoritmos de Organização aplicados ao Meio Empresarial', 'Alana Coelhas', 'Iniciação Científica');
INSERT INTO ARTIGO (Id, Nome, Autor, Tipo) VALUES (4, 'Inteligência Artificial: Próximos Passos', 'Ricael Mila', 'Doutorado');
INSERT INTO ARTIGO (Id, Nome, Autor, Tipo) VALUES (5, 'Desenvolvimento OpenSource e suas aplicações', 'Guirlanda Golab', 'Pesquisa');

CREATE TABLE APRESENTACAO (
    Id int PRIMARY KEY,
    Sessao_Especial varchar(50)
);

INSERT INTO APRESENTACAO (Id, Sessao_Especial) VALUES (1, 'Oral');
INSERT INTO APRESENTACAO (Id, Sessao_Especial) VALUES (2, 'Multimídia');
INSERT INTO APRESENTACAO (Id, Sessao_Especial) VALUES (3, 'Relato de Experiências');
INSERT INTO APRESENTACAO (Id, Sessao_Especial) VALUES (4, 'Pôsteres');
INSERT INTO APRESENTACAO (Id, Sessao_Especial) VALUES (5, 'Sessões da Indústria');

CREATE TABLE APRESENTA_ARTIGO (
    Sessao_id int,
    Artigo_id int,
    Apresentacao_id int,
    FOREIGN KEY(Sessao_id) REFERENCES SESSAO(Id),
    FOREIGN KEY(Artigo_id) REFERENCES ARTIGO(Id),
    FOREIGN KEY(Apresentacao_id) REFERENCES APRESENTACAO(Id)
);

INSERT INTO APRESENTA_ARTIGO (Sessao_id, Artigo_id, Apresentacao_id) VALUES (1, 1, 1);
INSERT INTO APRESENTA_ARTIGO (Sessao_id, Artigo_id, Apresentacao_id) VALUES (2, 2, 2);
INSERT INTO APRESENTA_ARTIGO (Sessao_id, Artigo_id, Apresentacao_id) VALUES (3, 3, 3);
INSERT INTO APRESENTA_ARTIGO (Sessao_id, Artigo_id, Apresentacao_id) VALUES (4, 4, 4);
INSERT INTO APRESENTA_ARTIGO (Sessao_id, Artigo_id, Apresentacao_id) VALUES (5, 5, 5);

CREATE TABLE LOJA (
    Id int PRIMARY KEY, 
    Nome varchar(50),
    Evento_Id int,
    FOREIGN KEY(Evento_Id) REFERENCES EVENTO(Id)
);

INSERT INTO LOJA (Id, nome) VALUES (1, 'Vendinha do Cone', 1);
INSERT INTO LOJA (Id, nome) VALUES (2, 'HappyCorno Conveniência', 1);
INSERT INTO LOJA (Id, nome) VALUES (3, 'Hot Dog no Palito e CIA', 1);
INSERT INTO LOJA (Id, nome) VALUES (4, 'Personali Camisetas', 1);
INSERT INTO LOJA (Id, nome) VALUES (5, 'Sorveteria Sorvetão', 1);

CREATE TABLE PRODUTO (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Preco int,
    Qnt_em_estoque int,
    Loja_id int,
    FOREIGN KEY(Loja_id) REFERENCES LOJA(Id)
);

INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja_id) VALUES (1, 'Cone de Sensação', 6, 5, 1);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja_id) VALUES (2, 'Cone de Brigadeiro', 6, 4, 1);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja_id) VALUES (3, 'Cone de Prestígio', 6, 10, 1);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja_id) VALUES (4, 'Cone de Ovomaltine', 6, 15, 1);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja_id) VALUES (5, 'Chifres de Plástico', 5, 23, 2);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja_id) VALUES (6, 'Garrafinha Térmica do Evento', 500, 76, 2);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja_id) VALUES (7, 'Carteira de Couro Personalizável', 1000, 5, 2);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja_id) VALUES (8, 'Hot Dog Vegano', 20, 10, 3);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja_id) VALUES (9, 'Hot Dog Taca Tudo', 20, 25, 3);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja_id) VALUES (10, 'Camiseta do Evento', 35, 65, 4);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja_id) VALUES (11, 'Camiseta Colorida', 25, 34, 4);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja_id) VALUES (12, 'Sorvete de Morango', 15, 10, 5);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja_id) VALUES (13, 'Sorvete de Chocolate', 15, 15, 5);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja_id) VALUES (14, 'Sorvete de Menta', 10, 10, 5);

CREATE TABLE VENDEDOR (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Sobrenome varchar(50),
    CPF varchar(50),
    Telefone varchar(50),
    Loja_id int,
    FOREIGN KEY(Loja_id) REFERENCES LOJA(Id)
);

INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja_id) VALUES (1, 'Luci', 'Moni', '04937857463', '11994837466', 1);
INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja_id) VALUES (2, 'Harrida', 'Stilosa', '04837263849', '11049382746', 2);
INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja_id) VALUES (3, 'Zaine', 'Malika', '08736251467', '11093829866', 3);
INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja_id) VALUES (4, 'Liana', 'Panini', '039594837188', '11039485766', 4);
INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja_id) VALUES (5, 'Niala', 'Horana', '01937465890', '11039384755', 5);

CREATE TABLE VENDE (
    Vendedor_Id int,
    Produto_Id,
    Qnt_Vendidos int,
    Data_da_Venda varchar(50),
    FOREIGN KEY(Vendedor_Id) REFERENCES VENDEDOR(Id),
    FOREIGN KEY(Produto_Id) REFERENCES PRODUTO(Id)
);

INSERT INTO VENDE (Vendedor_Id, Produto_Id, Qnt_Vendidos, Data_da_Venda) VALUES (1, 1, 10, '15/04/2021');
INSERT INTO VENDE (Vendedor_Id, Produto_Id, Qnt_Vendidos, Data_da_Venda) VALUES (1, 2, 5, '17/04/2021');
INSERT INTO VENDE (Vendedor_Id, Produto_Id, Qnt_Vendidos, Data_da_Venda) VALUES (1, 3, 5, '13/04/2021');
INSERT INTO VENDE (Vendedor_Id, Produto_Id, Qnt_Vendidos, Data_da_Venda) VALUES (1, 4, 8, '15/04/2021');
INSERT INTO VENDE (Vendedor_Id, Produto_Id, Qnt_Vendidos, Data_da_Venda) VALUES (2, 6, 12, '23/04/2021');

CREATE TABLE SISTEMA_FINANCEIRO (
    Saldo_Total int,
    Impostos_Retirados int,
    Dia DATE,
    Loja_id int,
    FOREIGN KEY(Loja_id) REFERENCES LOJA(Id)
);

INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja_id) VALUES (1000, 350, '11/09/2020', 1);
INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja_id) VALUES (2000, 1200, '04/05/2020', 2);
INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja_id) VALUES (450, 129, '29/07/2020', 3);
INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja_id) VALUES (1600, 340, '01/01/2021', 4);
INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja_id) VALUES (1500, 500, '02/04/2021', 5);

CREATE TABLE REDE_SOCIAL (
    Id int PRIMARY KEY,
    Plataforma varchar(50),
    Usuario varchar(50),
    Senha varchar(50),
    Evento_id int,
    FOREIGN KEY(Evento_id) REFERENCES EVENTO(Id)
);

INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (1, 'Instagram', 'SSIOnline', 'batata', 1);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (2, 'Twitter', 'SSIOnline', 'batatinha', 1);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (3, 'Instagram', 'RoadSeC', 'cenoura', 2);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (4, 'Twitter', 'RoadSeC', 'cenourinha', 2);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (5, 'Facebook', 'SPMakerWeek', 'carne', 3);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (6, 'Pinterest', 'SPMakerWeek', 'carninha', 3);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (7, 'Instagram', 'BGS', 'arroz', 4);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (8, 'Facebook',  'BGS', 'arrozinho', 4);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (9, 'Twitter', 'ComicCon', 'feijão', 5);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento_id) VALUES (10, 'Pinterest', 'ComicCon', 'feijãozinho', 5);

CREATE TABLE GESTOR (
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone varchar(50),
    Rede_social_id int,
    FOREIGN KEY(Rede_social_id) REFERENCES REDE_SOCIAL(Id)
);

INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social_id) VALUES ('Gisele', 'Butchaca', '1185039288', 1);
INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social_id) VALUES ('Chris', 'Hesmwosht', '119583929400', 2);
INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social_id) VALUES ('Tom', 'Holanda', '19884765433', 3);
INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social_id) VALUES ('Charles', 'Tatic', '11998706544', 4);
INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social_id) VALUES ('Rodovaldo', 'Cesar', '11885746533', 5);

CREATE TABLE INSCRICAO (
    Epoca varchar(50),
    Taxa int,
    Classe_do_Publico varchar(50),
    Forma_de_Pagamento varchar(50),
    Tipo varchar(50)
);

INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Verao', 240, 'Premium', 'Cartao', 'Normal');
INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Inverno', 340, 'Standard', 'Boleto', 'Membro de sindicato');
INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Verao', 560, 'Premium', 'Dinheiro', 'Em lote');
INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Verao', 390, 'Premium', 'Cheque', 'Normal');
INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Inverno', 200, 'Standard', 'Dinheiro', 'Em lote');