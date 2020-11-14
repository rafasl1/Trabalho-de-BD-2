/* ModeloLogicoExtendido: */

CREATE TABLE EVENTO  (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Edicao int,
    Tema varchar(50),
    Publico_Alvo varchar(50)
);

INSERT INTO EVENTO (Nome, Edicao, Tema, Publico_Alvo) VALUES ('Semana de SI', 12, 'Como ficar rico', 'Estudantes de Sistemas de Informação');
INSERT INTO EVENTO (Nome, Edicao, Tema, Publico_Alvo) VALUES ('Roadsec', 34, 'Segurança na computação', 'Profissionais de tecnologia');
INSERT INTO EVENTO (Nome, Edicao, Tema, Publico_Alvo) VALUES ('SP Maker Week', 6, 'Arduino', 'Público geral');
INSERT INTO EVENTO (Nome, Edicao, Tema, Publico_Alvo) VALUES ('Brasil Games Show', 21, 'Jogos', 'Jogadores de jogos digitais');
INSERT INTO EVENTO (Nome, Edicao, Tema, Publico_Alvo) VALUES ('Comic Con', 16, 'Quadrinhos', 'Fãs de super heróis');

CREATE TABLE EVENTO_ONLINE (
    Link_da_Gravacao varchar(50),
    Plataforma varchar(50),
    Evento int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id)
);

CREATE TABLE PARTICIPANTE_EVENTO (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Email varchar(50),
    Papel INT,
    Evento int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id)
);

CREATE TABLE PAPEL (
    Papel varchar(50),
    Participante_evento int,
    FOREIGN KEY(Participante_evento) REFERENCES PARTICIPANTE_EVENTO(Id)
);

CREATE TABLE CONTAS_A_PAGAR (
    Tipo_da_Conta varchar(50),
    Valor int,
    Evento int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id)
);

CREATE TABLE ENTIDADE (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Endereco varchar(50),
    Telefone int,
    Email varchar(50)
);

INSERT INTO ENTIDADE (Nome, Endereco, Telefone, Email) VALUES ('DASI', 'Rua Diretorio Academico', 11997826477, 'dasiusp@usp.br');
INSERT INTO ENTIDADE (Nome, Endereco, Telefone, Email) VALUES ('Bradesco', 'Rua Bradesco', 1189647366, 'bradesco@usp.br');
INSERT INTO ENTIDADE (Nome, Endereco, Telefone, Email) VALUES ('Itau', 'Rua Itau', 11637489288, 'itau@usp.br');
INSERT INTO ENTIDADE (Nome, Endereco, Telefone, Email) VALUES ('Fusion', 'Rua Fusion', 11997826477, 'fusion@usp.br');
INSERT INTO ENTIDADE (Nome, Endereco, Telefone, Email) VALUES ('Amazon', 'Rua Amazon', 11997826477, 'amazon@usp.br');

CREATE TABLE RESPONSAVEL_ENTIDADE (
    Nome varchar(50),
    Sobrenome varchar(50),
    Papel varchar(50),
    Telefone int,
    Entidade int,
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id)
);

CREATE TABLE LOCAL_DO_EVENTO (
    Id int PRIMARY KEY,
    Qualidade_da_Infraestrutura varchar(50)
);

CREATE TABLE EQUIPAMENTOS_ESPECIAIS (
    Equipamento varchar(50),
    Local_do_evento int,
    FOREIGN KEY(Local_do_evento) REFERENCES LOCAL_DO_EVENTO(Id)
);

CREATE TABLE FACILIDADES_OFERECIDAS (
    Facilidade varchar(50),
    Local_do_evento int,
    FOREIGN KEY(Local_do_evento) REFERENCES LOCAL_DO_EVENTO(Id)
);

CREATE TABLE ATIVIDADE (
    Id int PRIMARY KEY,
    Data_atividade varchar(50),
    Local_atividade varchar(50),
    Publico_Especifico varchar(50),
    Evento int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id)
);

CREATE TABLE GERENCIAMENTO_FINANCEIRO (
    Ganhos int,
    Gastos int,
    Saldo_Total int,
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

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
    Afiliacao varchar(50),
    Nome_da_Palestra varchar(50),
    Duracao int,
    Publico_Alvo varchar(50),
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO PALESTRA (Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES ('CIA_DEV', 'Mercado Mobile', '60', 'Desenvolvedores');
INSERT INTO PALESTRA (Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES ('DevGeeks', 'Computação em Nuvem', '60', 'Interessados por Tecnologia');
INSERT INTO PALESTRA (Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES ('StarWarsFans', 'Como se Tornar um Jedi nos Tempos Modernos', '40', 'Jovens');
INSERT INTO PALESTRA (Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES ('PsicoGroup', 'Inteligência Emocional', '40', 'Público Geral');
INSERT INTO PALESTRA (Afiliacao, Nome_da_Palestra, Duracao, Publico_Alvo) VALUES ('LOLzeiro1', 'Como virar Pro-Player de LOL', '40', 'Jogadores');

CREATE TABLE PALESTRANTE (
    Nome varchar(50),
    Sobrenome varchar(50),
    Mini_Curruculo varchar(50),
    Palestra int,
    FOREIGN KEY(Palestra) REFERENCES PALESTRA(Id)
);

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
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone int,
    Tutorial int,
    FOREIGN KEY(Tutorial) REFERENCES TUTORIAL(Id)
);

INSERT INTO MINISTRANTE_TUTORIAL (Nome, Sobrenome, Telefone) VALUES ('Lara', 'Zuerk', 1189948377);
INSERT INTO MINISTRANTE_TUTORIAL (Nome, Sobrenome, Telefone) VALUES ('Golab', 'Guimerlhe', 19875849377);
INSERT INTO MINISTRANTE_TUTORIAL (Nome, Sobrenome, Telefone) VALUES ('Vilma', 'Lorena', 11698295979);
INSERT INTO MINISTRANTE_TUTORIAL (Nome, Sobrenome, Telefone) VALUES ('Daria', 'Imar', 11994224897);
INSERT INTO MINISTRANTE_TUTORIAL (Nome, Sobrenome, Telefone) VALUES ('Gabriela', 'Michele', 11958222359);

CREATE TABLE REUNIAO (
    Id int PRIMARY KEY,
    Objetivo varchar(50),
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

CREATE TABLE PARTICIPANTES_REUNIAO (
    Nome varchar(50),
    Reuniao int,
    FOREIGN KEY(Reuniao) REFERENCES REUNIAO(Id)
);

CREATE TABLE CONCURSO (
    Id int PRIMARY KEY,
    Tema varchar(50),
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

CREATE TABLE PARTICIPANTE_CONCURSO (
    Nome varchar(50),
    Sobrenome varchar(50),
    Numero_de_Inscricao int,
    Telefone int,
    Concurso int,
    FOREIGN KEY(Concurso) REFERENCES CONCURSO(Id)
);

CREATE TABLE JUIZ_CONCURSO (
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone int,
    Concurso int,
    FOREIGN KEY(Concurso) REFERENCES CONCURSO(Id)
);

CREATE TABLE REGRAS_CONCURSO (
    Regra varchar(50),
    Concurso int,
    FOREIGN KEY(Concurso) REFERENCES CONCURSO(Id)
);

CREATE TABLE PREMIACAO (
    Premio varchar(50),
    Concurso int,
    FOREIGN KEY(Concurso) REFERENCES CONCURSO(Id)
);

CREATE TABLE ATIVIDADE_SOCIAL (
    Tipo varchar(50),
    Valor_do_Convite int,
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

/* NAO ENTENDI NADA A PARTIR DAQUI */

CREATE TABLE SESSAO (
    Nome varchar(50),
    Responsavel_pela_Sessao varchar(50)
);

INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão da Manhã', 'Vilma Lorena');
INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão da Tarde', 'Mariana Gracinha');
INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão da Noite', 'Joelson Fronha');
INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão da Madrugada', 'Ferdinando Evoluiu');
INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão Extra', );

CREATE TABLE APRESENTA_ARTIGO_SESSAO_APRESENTACAO (
);

CREATE TABLE ARTIGO (
    Nome varchar(50),
    Autor varchar(50),
    Tipo varchar(50)
);

INSERT INTO ARTIGO (Nome, Autor, Tipo) VALUES ('Teorias do Marketing Digital', 'Lara Zureck', 'Científico');
INSERT INTO ARTIGO (Nome, Autor, Tipo) VALUES ('Atuação de Autômatos na Ciência de Dados', 'Giana Armario', 'TCC');
INSERT INTO ARTIGO (Nome, Autor, Tipo) VALUES ('Algoritmos de Organização aplicados ao Meio Empresarial', 'Alana Coelhas', 'Iniciação Científica');
INSERT INTO ARTIGO (Nome, Autor, Tipo) VALUES ('Inteligência Artificial: Próximos Passos', 'Ricael Mila', 'Doutorado');
INSERT INTO ARTIGO (Nome, Autor, Tipo) VALUES ('Desenvolvimento OpenSource e suas aplicações', 'Guirlanda Golab', 'Pesquisa');

CREATE TABLE APRESENTACAO (
    Sessao_Especial varchar(50)
);

INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Oral');
INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Multimídia');
INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Relato de Experiências');
INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Pôsteres');
INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Sessões da Indústria');

/* AQUI TERMINA O Q EU NAO ENTENDI */

CREATE TABLE LOJA (
    Id int PRIMARY KEY, 
    Nome varchar(50),
);

CREATE TABLE PRODUTO (
    Id int PRIMARY KEY,
    Preco int,
    Qnt_em_estoque int,
    Loja int,
    FOREIGN KEY(Loja) REFERENCES LOJA(Id)
);

CREATE TABLE VENDEDOR (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Sobrenome varchar(50),
    CPF int,
    Telefone varchar(50),
    Loja int,
    FOREIGN KEY(Loja) REFERENCES LOJA(Id)
);

CREATE TABLE SISTEMA_FINANCEIRO (
    Saldo_Total int,
    Impostos_Retirados int,
    Dia DATE,
    Loja int,
    FOREIGN KEY(Loja) REFERENCES LOJA(Id)
);

CREATE TABLE REDE_SOCIAL (
    Id PRIMARY KEY,
    Plataforma varchar(50),
    Usuario varchar(50),
    Senha varchar(50)
);

CREATE TABLE GESTOR (
    Nome varchar(50),
    Sobrenome varchar(50),
    Telefone int,
    Rede_social int,
    FOREIGN KEY(Rede_social) REFERENCES REDE_SOCIAL(Id)
);

CREATE TABLE PROMOVE (
);

CREATE TABLE PATROCINA (
    Taxa INT,
    Categoria varchar(50)
);

CREATE TABLE REALIZA (
);

CREATE TABLE INSCRICAO (
    Epoca varchar(50),
    Taxa int,
    Classe_do_Publico varchar(50),
    Forma_de_Pagamento varchar(50),
    Tipo varchar(50)
);

CREATE TABLE PROMOVE (
);

CREATE TABLE MINISTRA (
);

CREATE TABLE EXIBE (
);

CREATE TABLE GERENCIA (
);
 
ALTER TABLE Local ADD CONSTRAINT FK_Local_1
    FOREIGN KEY (fk_Equipamentos Especiais_Equipamentos Especiais_PK)
    REFERENCES EQUIPAMENTOS_ESPECIAIS (Equipamentos_Especiais_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Local ADD CONSTRAINT FK_Local_2
    FOREIGN KEY (fk_Facilidades Oferecidas_Facilidades Oferecidas_PK)
    REFERENCES FACILIDADES_OFERECIDAS (Facilidades_Oferecidas_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE REUNIAO ADD CONSTRAINT FK_Reuniao_1
    FOREIGN KEY (fk_Participantes_Participantes_PK)
    REFERENCES PARTICIPANTES (Participantes_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE CONCURSO ADD CONSTRAINT FK_Concurso_1
    FOREIGN KEY (fk_Regras_Regras_PK)
    REFERENCES REGRAS (Regras_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE CONCURSO ADD CONSTRAINT FK_Concurso_2
    FOREIGN KEY (fk_Premiacao_Premiacao_PK)
    REFERENCES PREMIACAO (Premiacao_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE PARTICIPANTE ADD CONSTRAINT FK_Participante_1
    FOREIGN KEY (fk_Papel_Papel_PK)
    REFERENCES PAPEL (Papel_PK)
    ON DELETE NO ACTION;