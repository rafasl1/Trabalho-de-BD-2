CREATE DATABASE Gerenciador_de_eventos;

CREATE TABLE EVENTO  (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Edicao int,
    Tema varchar(50),
    Publico_Alvo varchar(50)
);

INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo) VALUES (1, 'Semana de SI', 12, 'Como ficar rico', 'Estudantes de Sistemas de Informação');
INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo) VALUES (2, 'Roadsec', 34, 'Segurança na computação', 'Profissionais de tecnologia');
INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo) VALUES (3, 'SP Maker Week', 6, 'Arduino', 'Público geral');
INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo) VALUES (4, 'Brasil Games Show', 21, 'Jogos', 'Jogadores de jogos digitais');
INSERT INTO EVENTO (Id, Nome, Edicao, Tema, Publico_Alvo) VALUES (5, 'Comic Con', 16, 'Quadrinhos', 'Fãs de super heróis');

CREATE TABLE EVENTO_ONLINE (
    Link_da_Gravacao varchar(50),
    Plataforma varchar(50),
    Evento int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id)
);

INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento) VALUES ('https://www.twitch.tv/each_ssi', 'Twitch.tv', 1);
INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento) VALUES ('https://www.youtube.com/watch?v=izK5DTXWyxw', 'YouTube', 2);
INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento) VALUES ('fb.gg/SPMakerWeek', 'Facebook', 3);
INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento) VALUES ('youtube.com/adishdiash', 'YouTube', 4);
INSERT INTO EVENTO_ONLINE (Link_da_Gravacao, Plataforma, Evento) VALUES ('twitch.tv/ComicCon', 'Twitch.tv', 5);

CREATE TABLE PARTICIPANTE_EVENTO (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Email varchar(50),
    Papel INT,
    Evento int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id)
);


/*Precisa do cadastro dos PARTICIPANTE_EVENTO*/
/*INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Email, Papel, Evento) VALUES ();
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Email, Papel, Evento) VALUES ();
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Email, Papel, Evento) VALUES ();
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Email, Papel, Evento) VALUES ();
INSERT INTO PARTICIPANTE_EVENTO (Id, Nome, Email, Papel, Evento) VALUES ();*/

CREATE TABLE PAPEL (
    Papel varchar(50),
    Participante_evento int,
    FOREIGN KEY(Participante_evento) REFERENCES PARTICIPANTE_EVENTO(Id)
);

/*Precisa do cadastro dos PARTICIPANTE_EVENTO*/
/*INSERT INTO PAPEL (Papel, Participante_Evento) VALUES ('Palestrante', );
INSERT INTO PAPEL (Papel, Participante_Evento) VALUES ('Assistente', );
INSERT INTO PAPEL (Papel, Participante_Evento) VALUES ('Ouvinte', );
INSERT INTO PAPEL (Papel, Participante_Evento) VALUES ('Ministrante', );
INSERT INTO PAPEL (Papel, Participante_Evento) VALUES ('Funcionário', );*/

CREATE TABLE CONTAS_A_PAGAR (
    Tipo_da_Conta varchar(50),
    Valor int,
    Evento int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id)
);

INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento) VALUES ('Luz', 1);
INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento) VALUES ('Água', 2);
INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento) VALUES ('Energia', 3);
INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento) VALUES ('Compras', 4);
INSERT INTO CONTAS_A_PAGAR (Tipo_da_Conta, Valor, Evento) VALUES ('Contratos', 5);

CREATE TABLE ENTIDADE (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Endereco varchar(50),
    Telefone int,
    Email varchar(50)
);

INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (1, 'DASI', 'Rua Diretorio Academico', 11997826477, 'dasiusp@usp.br');
INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (2, 'Bradesco', 'Rua Bradesco', 1189647366, 'bradesco@usp.br');
INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (3, 'Itau', 'Rua Itau', 11637489288, 'itau@usp.br');
INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (4, 'Fusion', 'Rua Fusion', 11997826477, 'fusion@usp.br');
INSERT INTO ENTIDADE (Id, Nome, Endereco, Telefone, Email) VALUES (5, 'Amazon', 'Rua Amazon', 11997826477, 'amazon@usp.br');

CREATE TABLE PROMOVE (
    Evento int,
    Entidade int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id),
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id) 
);

INSERT INTO PROMOVE (Evento, Entidade) VALUES (1, 3);
INSERT INTO PROMOVE (Evento, Entidade) VALUES (2, 4);
INSERT INTO PROMOVE (Evento, Entidade) VALUES (3, 2);
INSERT INTO PROMOVE (Evento, Entidade) VALUES (4, 2);
INSERT INTO PROMOVE (Evento, Entidade) VALUES (5, 3);

CREATE TABLE PATROCINA (
    Taxa INT,
    Categoria varchar(50),
    Evento int,
    Entidade int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id),
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id) 
);

INSERT INTO PATROCINA (Taxa, Categoria, Evento, Entidade) VALUES (300, 'Ouro', 1, 5);
INSERT INTO PATROCINA (Taxa, Categoria, Evento, Entidade) VALUES (750, 'Bronze', 2, 1);
INSERT INTO PATROCINA (Taxa, Categoria, Evento, Entidade) VALUES (20, 'Bronze', 3, 1);
INSERT INTO PATROCINA (Taxa, Categoria, Evento, Entidade) VALUES (4500, 'Ouro', 4, 4);
INSERT INTO PATROCINA (Taxa, Categoria, Evento, Entidade) VALUES (178, 'Prata', 5, 3);

CREATE TABLE REALIZA (
    Evento int,
    Entidade int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id),
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id) 
);

INSERT INTO REALIZA (Evento, Entidade) VALUES (1, 4);
INSERT INTO REALIZA (Evento, Entidade) VALUES (2, 2);
INSERT INTO REALIZA (Evento, Entidade) VALUES (3, 1);
INSERT INTO REALIZA (Evento, Entidade) VALUES (4, 5);
INSERT INTO REALIZA (Evento, Entidade) VALUES (5, 5);

CREATE TABLE RESPONSAVEL_ENTIDADE (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Sobrenome varchar(50),
    Papel varchar(50),
    Telefone int,
    Entidade int,
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id)
);

INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade) VALUES (1, 'Lila', 'Maria', 'Diretora de Eventos', 999999999, 1);
INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade) VALUES (2, 'Luli', 'Ferreira', 'Presidente', 999999999, 2);
INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade) VALUES (3, 'Nicole', 'Gaiola', 'Vice-presidente', 999999999, 3);
INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade) VALUES (4, 'Nicolas', 'Queijo', 'Representante oficial', 999999999, 4);
INSERT INTO RESPONSAVEL_ENTIDADE (Id, Nome, Sobrenome, Papel, Telefone, Entidade) VALUES (5, 'Kleiton', 'Marcelo', 'Diretor de relações públicas', 999999999, 5);

CREATE TABLE GERENCIA (
    Responsavel_entidade int,
    Entidade int,
    FOREIGN KEY(Responsavel_entidade) REFERENCES RESPONSAVEL_ENTIDADE(Id),
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id) 
);

INSERT INTO GERENCIA (Evento, Entidade) VALUES (1, 1);
INSERT INTO GERENCIA (Evento, Entidade) VALUES (2, 2);
INSERT INTO GERENCIA (Evento, Entidade) VALUES (3, 3);
INSERT INTO GERENCIA (Evento, Entidade) VALUES (4, 4);
INSERT INTO GERENCIA (Evento, Entidade) VALUES (5, 5);

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
    Local_do_evento int,
    FOREIGN KEY(Local_do_evento) REFERENCES LOCAL_DO_EVENTO(Id)
);

INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento) VALUES ('lanterna', 1);
INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento) VALUES ('tesoura', 2);
INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento) VALUES ('cola', 3);
INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento) VALUES ('guitarra', 4);
INSERT INTO EQUIPAMENTOS_ESPECIAIS (Equipamento, Local_do_Evento) VALUES ('computador', 5);

CREATE TABLE FACILIDADES_OFERECIDAS (
    Facilidade varchar(50),
    Local_do_evento int,
    FOREIGN KEY(Local_do_evento) REFERENCES LOCAL_DO_EVENTO(Id)
);

INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento) VALUES ('iluminacao', 1);
INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento) VALUES ('rampa', 2);
INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento) VALUES ('elevador', 3);
INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento) VALUES ('traducao simultanea', 4);
INSERT INTO FACILIDADES_OFERECIDAS (Facilidade, Local_do_Evento) VALUES ('traducao em libras', 5);

CREATE TABLE ATIVIDADE (
    Id int PRIMARY KEY,
    Data_atividade varchar(50),
    Local_atividade varchar(50),
    Publico_Especifico varchar(50),
    Evento int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id)
);


/*Precisa terminar as especialiazações*/
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (1, '12/04/2020', 'programadores', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (2, '23/01/2019', 'geral', 2);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (3, '19/07/2021', 'universitarios', 3);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (4, '25/09/2020', 'jovens', 4);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (5, '03/03/2023', 'geral', 5);

CREATE TABLE PROMOVE (
    Entidade int,
    Atividade int,
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id),
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id) 
);

/*Precisa terminar as especialiazações*/
/*
INSERT INTO PROMOVE (Entidade, Atividade) VALUES (1,);
INSERT INTO PROMOVE (Entidade, Atividade) VALUES (2,);
INSERT INTO PROMOVE (Entidade, Atividade) VALUES (3,);
INSERT INTO PROMOVE (Entidade, Atividade) VALUES (4,);
INSERT INTO PROMOVE (Entidade, Atividade) VALUES (5,);
*/

CREATE TABLE GERENCIAMENTO_FINANCEIRO (
    Ganhos int,
    Gastos int,
    Saldo_Total int,
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade) VALUES (50, 20, 30, 1);
INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade) VALUES (120, 20, 100, 2);
INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade) VALUES (34, 44, -10, 3);
INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade) VALUES (90, 20, 70, 4);
INSERT INTO GERENCIAMENTO_FINANCEIRO (Ganhos, Gastos, Saldo_Total, Atividade) VALUES (140, 340, -200, 5);

CREATE TABLE WORKSHOP (
    Tema varchar(50),
    Duracao double,
    Publico_Alvo varchar(50),
    Valor_de_Inscricao double,
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Aprendendo React para entrar na RocketSeat', 95, 'jovens', 24);
INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Workshop de Angular', 120, 'jovens e adultos', 74);
INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Aplicando Calculo 2 na sua vida', 15, 'universitarios', 10);
INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Arduino para iniciantes', 95, 'jovens e adultos', 32);
INSERT INTO WORKSHOP (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Como sobreviver aos 4 anos de faculdade', 145, 'universitarios', 3);

CREATE TABLE PALESTRA (
    Id int,
    Afiliacao varchar(50),
    Nome_da_Palestra varchar(50),
    Duracao int,
    Publico_Alvo varchar(50),
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES (1, 'CIA_DEV', 'Mercado Mobile', '60', 'Desenvolvedores');
INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES (2, 'DevGeeks', 'Computação em Nuvem', '60', 'Interessados por Tecnologia');
INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES (3, 'StarWarsFans', 'Como se Tornar um Jedi nos Tempos Modernos', '40', 'Jovens');
INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES (4, 'PsicoGroup', 'Inteligência Emocional', '40', 'Público Geral');
INSERT INTO PALESTRA (Id, Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES (5, 'LOLzeiro1', 'Como virar Pro-Player de LOL', '40', 'Jogadores');

CREATE TABLE PALESTRANTE (
    Id int,
    Nome varchar(50),
    Sobrenome varchar(50),
    Mini_Curriculo varchar(50),
    Palestra int,
    FOREIGN KEY(Palestra) REFERENCES PALESTRA(Id)
);

/*Não sei o que é mini-currículo*/
INSERT INTO PALESTRANTE (Nome, Sobrenome, Mini_Curriculo, Palestra) VALUES (1, 'Katiana', 'Carente', '', 4);
INSERT INTO PALESTRANTE (Nome, Sobrenome, Mini_Curriculo, Palestra) VALUES (2, 'Robertinho', 'Orvalho', '', 3);
INSERT INTO PALESTRANTE (Nome, Sobrenome, Mini_Curriculo, Palestra) VALUES (3, 'Clodoberto', 'Agnaldo', '', 5);
INSERT INTO PALESTRANTE (Nome, Sobrenome, Mini_Curriculo, Palestra) VALUES (4, 'Alana', 'Coelhas', '', 1);
INSERT INTO PALESTRANTE (Nome, Sobrenome, Mini_Curriculo, Palestra) VALUES (5, 'Guirlanda', 'Golab', '', 2);

CREATE TABLE TUTORIAL (
    Id int PRIMARY KEY,
    Tema varchar(50),
    Duracao int,
    Publico_Alvo varchar(50),
    Valor_de_Inscricao int,
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO TUTORIAL (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Como programar uma Pokedex em Angular', 95, 'jovens', 24);
INSERT INTO TUTORIAL (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Como ficar milionario em uma semana', 20, 'geral', 244);
INSERT INTO TUTORIAL (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Instalando JDK no seu computador', 35, 'programadores', 10);
INSERT INTO TUTORIAL (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Como tocar Unsaid Emily no ukelele', 95, 'jovens e adultos', 32);
INSERT INTO TUTORIAL (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Como queimar chocolate no microondas', 15, 'jovens', 3);

INSERT INTO TUTORIAL (Tema, Duracao, Publico_Alvo, Valor_de_Inscricao) VALUES ('Como ', 60, '', 123);

CREATE TABLE MINISTRANTE_TUTORIAL (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone int,
    Tutorial int,
    FOREIGN KEY(Tutorial) REFERENCES TUTORIAL(Id)
);

INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone) VALUES ('1', 'Lara', 'Zuerk', 1189948377);
INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone) VALUES ('2', 'Golab', 'Guimerlhe', 19875849377);
INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone) VALUES ('3', 'Vilma', 'Lorena', 11698295979);
INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone) VALUES ('4', 'Daria', 'Imar', 11994224897);
INSERT INTO MINISTRANTE_TUTORIAL (Id, Nome, Sobrenome, Telefone) VALUES ('5', 'Gabriela', 'Michele', 11958222359);

CREATE TABLE MINISTRA ( 
    Ministrante int,
    Tutorial int,
    FOREIGN KEY(Ministrante) REFERENCES MINISTRANTE_TUTORIAL(Id),
    FOREIGN KEY(Tutorial) REFERENCES TUTORIAL(Id) 
);

INSERT INTO MINISTRA (Ministrante, Tutorial) VALUES (1, 1);
INSERT INTO MINISTRA (Ministrante, Tutorial) VALUES (2, 2);
INSERT INTO MINISTRA (Ministrante, Tutorial) VALUES (3, 3);
INSERT INTO MINISTRA (Ministrante, Tutorial) VALUES (4, 4);
INSERT INTO MINISTRA (Ministrante, Tutorial) VALUES (5, 5);

CREATE TABLE REUNIAO (
    Id int PRIMARY KEY,
    Objetivo varchar(50),
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO REUNIAO (Id, Objetivo, Atividade) VALUES (1, 'Discutir sobre programação', 1);
INSERT INTO REUNIAO (Id, Objetivo, Atividade) VALUES (2, 'Discutir sobre o COVID', 2);
INSERT INTO REUNIAO (Id, Objetivo, Atividade) VALUES (3, 'Discutir sobre minha dp em Calculo 2', 3);
INSERT INTO REUNIAO (Id, Objetivo, Atividade) VALUES (4, 'Discutir sobre Star Wars', 4);
INSERT INTO REUNIAO (Id, Objetivo, Atividade) VALUES (5, 'Discutir sobre as discussoes', 5);

CREATE TABLE PARTICIPANTES_REUNIAO (
    Nome varchar(50),
    Reuniao int,
    FOREIGN KEY(Reuniao) REFERENCES REUNIAO(Id)
);

INSERT INTO PARTICIPANTES_REUNIAO (Nome, Reuniao) VALUES ('Mariana Gracinha', 1);
INSERT INTO PARTICIPANTES_REUNIAO (Nome, Reuniao) VALUES ('Alana Coelhas', 2);
INSERT INTO PARTICIPANTES_REUNIAO (Nome, Reuniao) VALUES ('Giana Armario', 3);
INSERT INTO PARTICIPANTES_REUNIAO (Nome, Reuniao) VALUES ('Vilma Lorena', 4);
INSERT INTO PARTICIPANTES_REUNIAO (Nome, Reuniao) VALUES ('Lara Zurek', 5);

CREATE TABLE CONCURSO (
    Id int PRIMARY KEY,
    Tema varchar(50),
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO CONCURSO (Id, Tema, Atividade) VALUES (1, 'Concurso de Comer Cones', 1);
INSERT INTO CONCURSO (Id, Tema, Atividade) VALUES (2, 'Concurso de Beleza', 2);
INSERT INTO CONCURSO (Id, Tema, Atividade) VALUES (3, 'Concurso de Feiura', 3);
INSERT INTO CONCURSO (Id, Tema, Atividade) VALUES (4, 'Concurso de Lol', 4);
INSERT INTO CONCURSO (Id, Tema, Atividade) VALUES (5, 'Concurso de Among Us', 5);

CREATE TABLE PARTICIPANTE_CONCURSO (
    Nome varchar(50),
    Sobrenome varchar(50),
    Numero_de_Inscricao int,
    Telefone int,
    Concurso int,
    FOREIGN KEY(Concurso) REFERENCES CONCURSO(Id)
);

INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso) VALUES ('Freira', 'Alexa', 1, 1182746355, 1);
INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso) VALUES ('Rodovario', 'Pinheiro', 2, 1195847376, 2);
INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso) VALUES ('Gabriela', 'Michele', 3, 1185746355, 3);
INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso) VALUES ('Girlanda', 'Golab', 4, 1185746399, 4);
INSERT INTO PARTICIPANTE_CONCURSO (Nome, Sobrenome, Numero_de_Inscricao, Telefone, Concurso) VALUES ('Alana', 'Coelhas', 5, 1185948766, 5);

CREATE TABLE JUIZ_CONCURSO (
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone int,
    Concurso int,
    FOREIGN KEY(Concurso) REFERENCES CONCURSO(Id)
);

INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso) VALUES ('Lila', 'Zurek', 1187654322, 1);
INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso) VALUES ('Luli', 'Zurek', 1185747366, 2);
INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso) VALUES ('Fema', 'Rins', 1186746622, 3);
INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso) VALUES ('Gabriela', 'Michele', 1185746322, 4);
INSERT INTO JUIZ_CONCURSO (Nome, Sobrenome, Telefone, Concurso) VALUES ('Natilva', 'Eva', 1195847366, 5);

CREATE TABLE REGRAS_CONCURSO (
    Regra varchar(50),
    Concurso int,
    FOREIGN KEY(Concurso) REFERENCES CONCURSO(Id)
);

INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Não matar', 1);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Não seja feia', 1);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Não socar competidores', 2);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Sair no soco com Gabriella Michele', 2);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Não pedir para pessoas sairem de suas casas', 2);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Não dar piti quando trocar o filme', 3);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Não comprar votos', 3);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Acreditar em outras pessoas além da Giovana', 4);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Não dar cambalhota na grama', 5);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Não dar trabalho no role', 5);
INSERT INTO REGRAS_CONCURSO (Regra, Concurso) VALUES ('Não chegar atrasado na festa', 5);

CREATE TABLE PREMIACAO (
    Premio varchar(50),
    Concurso int,
    FOREIGN KEY(Concurso) REFERENCES CONCURSO(Id)
);

INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Playstation', 1);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Jogo da vida', 1);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Ingresso da Glow', 2);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Caneca e tirante', 2);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Ingresso do panelas', 2);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Viagem para Paris', 3);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Iphone 10', 3);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Plano cone ilimitado', 4);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Laura', 5);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Ingresso do Intercomp', 5);
INSERT INTO PREMIACAO (Premio, Concurso) VALUES ('Ingresso da Las Brisas', 5);

CREATE TABLE ATIVIDADE_SOCIAL (
    Tipo varchar(50),
    Valor_do_Convite int,
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade) VALUES ('Confraternizacao', 13, 1);
INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade) VALUES ('Bingo', 12, 2);
INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade) VALUES ('Rifa', 23, 3);
INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade) VALUES ('Beneficente', 10, 4);
INSERT INTO ATIVIDADE_SOCIAL (Tipo, Valor_do_Convite, Atividade) VALUES ('Comemorativa', 30, 5);

CREATE TABLE SESSAO (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Responsavel_pela_Sessao varchar(50),
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao) VALUES (1, 'Sessão da Manhã', 'Vilma Lorena');
INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao) VALUES (2, 'Sessão da Tarde', 'Mariana Gracinha');
INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao) VALUES (3, 'Sessão da Noite', 'Joelson Fronha');
INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao) VALUES (4, 'Sessão da Madrugada', 'Ferdinando Evoluiu');
INSERT INTO SESSAO (Id, Nome, Responsavel_Pela_Sessao) VALUES (5, 'Sessão Extra', 'Josiel Gaffman');

CREATE TABLE ARTIGO (
    Id int PRIMARY KEY,
    Nome varchar(50),
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
    Sessao int,
    Artigo int,
    Apresentacao int,
    FOREIGN KEY(Sessao) REFERENCES SESSAO(Id),
    FOREIGN KEY(Artigo) REFERENCES ARTIGO(Id),
    FOREIGN KEY(Apresentacao) REFERENCES APRESENTACAO(Id)
);

INSERT INTO APRESENTA_ARTIGO (Sessao, Artigo, Apresentacao) VALUES (1, 1, 1);
INSERT INTO APRESENTA_ARTIGO (Sessao, Artigo, Apresentacao) VALUES (2, 2, 2);
INSERT INTO APRESENTA_ARTIGO (Sessao, Artigo, Apresentacao) VALUES (3, 3, 3);
INSERT INTO APRESENTA_ARTIGO (Sessao, Artigo, Apresentacao) VALUES (4, 4, 4);
INSERT INTO APRESENTA_ARTIGO (Sessao, Artigo, Apresentacao) VALUES (5, 5, 5);

CREATE TABLE LOJA (
    Id int PRIMARY KEY, 
    Nome varchar(50)
);

INSERT INTO LOJA (Id, nome) VALUES (1, 'Vendinha do Cone');
INSERT INTO LOJA (Id, nome) VALUES (2, 'HappyCorno Conveniência');
INSERT INTO LOJA (Id, nome) VALUES (3, 'Hot Dog no Palito e CIA');
INSERT INTO LOJA (Id, nome) VALUES (4, 'Personali Camisetas');
INSERT INTO LOJA (Id, nome) VALUES (5, 'Sorveteria Sorvetão');

CREATE TABLE PRODUTO (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Preco int,
    Qnt_em_estoque int,
    Loja int,
    FOREIGN KEY(Loja) REFERENCES LOJA(Id)
);

INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja) VALUES (1, 'Cone de Sensação', 6, 5, 1);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja) VALUES (2, 'Cone de Brigadeiro', 6, 4, 1);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja) VALUES (3, 'Cone de Prestígio', 6, 10, 1);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja) VALUES (4, 'Cone de Ovomaltine', 6, 15, 1);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_Estoque, Loja) VALUES (5, 'Chifres de Plástico', 5, 23, 2);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja) VALUES (6, 'Garrafinha Térmica do Evento', 500, 76, 2);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja) VALUES (7, 'Carteira de Couro Personalizável', 1000, 5, 2);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja) VALUES (8, 'Hot Dog Vegano', 20, 10, 3);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja) VALUES (9, 'Hot Dog Taca Tudo', 20, 25, 3);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja) VALUES (10, 'Camiseta do Evento', 35, 65, 4);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja) VALUES (11, 'Camiseta Colorida', 25, 34, 4);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja) VALUES (12, 'Sorvete de Morango', 15, 10, 5);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja) VALUES (13, 'Sorvete de Chocolate', 15, 15, 5);
INSERT INTO PRODUTO (Id, Nome, Preco, Qnt_em_estoque, Loja) VALUES (14, 'Sorvete de Menta', 10, 10, 5);


CREATE TABLE VENDEDOR (
    Id int PRIMARY KEY,
    Nome int,
    Sobrenome varchar(50),
    CPF int,
    Telefone varchar(50),
    Loja int,
    FOREIGN KEY(Loja) REFERENCES LOJA(Id)
);

INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja) VALUES (1, 'Luci', 'Moni', 04937857463, 11994837466, 1);
INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja) VALUES (2, 'Harrida', 'Stilosa', 04837263849, 11049382746, 2);
INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja) VALUES (3, 'Zaine', 'Malika', 08736251467, 11093829866, 3);
INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja) VALUES (4, 'Liana', 'Panini', 039594837188, 11039485766, 4);
INSERT INTO VENDEDOR (Id, Nome, Sobrenome, CPF, Telefone, Loja) VALUES (5, 'Niala', 'Horana', 01937465890, 11039384755, 5);

CREATE TABLE SISTEMA_FINANCEIRO (
    Saldo_Total int,
    Impostos_Retirados int,
    Dia DATE,
    Loja int,
    FOREIGN KEY(Loja) REFERENCES LOJA(Id)
);

INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja) VALUES (1000, 350, '11/09/2020', 1);
INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja) VALUES (2000, 1200, '04/05/2020', 2);
INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja) VALUES (450, 129, '29/07/2020', 3);
INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja) VALUES (1600, 340, '01/01/2021', 4);
INSERT INTO SISTEMA_FINANCEIRO (Saldo_Total, Impostos_Retirados, Dia, Loja) VALUES (1500, 500, '02/04/2021', 5);

CREATE TABLE REDE_SOCIAL (
    Id int PRIMARY KEY,
    Plataforma varchar(50),
    Usuario varchar(50),
    Senha varchar(50)
);

INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (1, 'Instagram', 'SSIOnline', 'batata', 1);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (2, 'Twitter', 'SSIOnline', 'batatinha', 1);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (3, Instagram, 'RoadSeC', 'cenoura', 2);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (4, Twitter, 'RoadSeC', 'cenourinha', 2);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (5, Facebook, 'SPMakerWeek', 'carne', 3);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (6, Pinterest, 'SPMakerWeek', 'carninha', 3);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (7, Instagram, 'BGS', 'arroz', 4);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (8, Facebook,  'BGS', 'arrozinho', 4);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (9, Twitter, 'ComicCon', 'feijão', 5);
INSERT INTO REDE_SOCIAL (Id, Plataforma, Usuario, Senha, Evento) VALUES (10, Pinterest, 'ComicCon', 'feijãozinho', 5);

CREATE TABLE GESTOR (
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone int,
    Rede_social int,
    FOREIGN KEY(Rede_social) REFERENCES REDE_SOCIAL(Id)
);

INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social) VALUES ('Gisele', 'Butchaca', 1185039288, 1);
INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social) VALUES ('Chris', 'Hesmwosht', 119583929400, 2);
INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social) VALUES ('Tom', 'Holanda', 19884765433, 3);
INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social) VALUES ('Charles', 'Tatic', 11998706544, 4);
INSERT INTO GESTOR (Nome, Sobrenome, Telefone, Rede_Social) VALUES ('Rodovaldo', 'Cesar', 11885746533, 5);

CREATE TABLE INSCRICAO (
    Epoca varchar(50),
    Taxa int,
    Classe_do_Publico varchar(50),
    Forma_de_Pagamento varchar(50),
    Tipo varchar(50)
);

INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Verao', 240, 'Premium', 'Cartao');
INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Inverno', 340, 'Standard', 'Boleto');
INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Verao', 560, 'Premium', 'Dinheiro');
INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Verao', 390, 'Premium', 'Cheque');
INSERT INTO INSCRICAO (Epoca, Taxa, Classe_do_Publico, Forma_de_Pagamento, Tipo) VALUES ('Inverno', 200, 'Standard', 'Dinheiro');