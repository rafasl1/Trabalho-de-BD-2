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
INSERT INTO PROMOVE (Evento, Entidade) VALUES (5, 'Rua Bradesco');
INSERT INTO PROMOVE (Evento, Entidade) VALUES ('Itau', 'Rua Itau');
INSERT INTO PROMOVE (Evento, Entidade) VALUES ('Fusion', 'Rua Fusion');
INSERT INTO PROMOVE (Evento, Entidade) VALUES ('Amazon', 'Rua Amazon');

CREATE TABLE PATROCINA (
    Taxa INT,
    Categoria varchar(50),
    Evento int,
    Entidade int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id),
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id) 
);

CREATE TABLE REALIZA (
    Evento int,
    Entidade int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id),
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id) 
);

CREATE TABLE RESPONSAVEL_ENTIDADE (
    Nome varchar(50),
    Sobrenome varchar(50),
    Papel varchar(50),
    Telefone int,
    Entidade int,
    FOREIGN KEY(Entidade) REFERENCES ENTIDADE(Id)
);

CREATE TABLE GERENCIA (
    Responsavel_entidade int,
    Entidade int,
    FOREIGN KEY(Responsavel_entidade) REFERENCES RESPONSAVEL_ENTIDADE(Id),
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

INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (1, '12/04/2020', 'programadores', 1);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (2, '23/01/2019', 'geral', 2);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (3, '19/07/2021', 'universitarios', 3);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (4, '25/09/2020', 'jovens', 4);
INSERT INTO ATIVIDADE (Id, Data_Atividade, Local_Atividade, Publico_Especifico, Evento) VALUES (5, '03/03/2023', 'geral', 5);

CREATE TABLE PROMOVE (
    Evento int,
    Atividade int,
    FOREIGN KEY(Evento) REFERENCES EVENTO(Id),
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id) 
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

CREATE TABLE EXIBE (
    Palestrante int,
    Palestra int,
    FOREIGN KEY(Palestrante) REFERENCES PALESTRANTE(Id),
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

CREATE TABLE MINISTRA ( 
    Ministrante int,
    Tutorial int,
    FOREIGN KEY(Ministrante) REFERENCES MINISTRANTE_TUTORIAL(Id),
    FOREIGN KEY(Tutorial) REFERENCES TUTORIAL(Id) 
);

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

CREATE TABLE SESSAO (
    Id int PRIMARY KEY,
    Nome varchar(50),
    Responsavel_pela_Sessao varchar(50),
    Atividade int,
    FOREIGN KEY(Atividade) REFERENCES ATIVIDADE(Id)
);

INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão da Manhã', 'Vilma Lorena');
INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão da Tarde', 'Mariana Gracinha');
INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão da Noite', 'Joelson Fronha');
INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão da Madrugada', 'Ferdinando Evoluiu');
INSERT INTO SESSAO (Nome, Responsavel_Pela_Sessao) VALUES ('Sessão Extra', 'Josiel Gaffman');

CREATE TABLE ARTIGO (
    Id int PRIMARY KEY,
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
    Id int PRIMARY KEY,
    Sessao_Especial varchar(50)
);

INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Oral');
INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Multimídia');
INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Relato de Experiências');
INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Pôsteres');
INSERT INTO APRESENTACAO (Sessao_Especial) VALUES ('Sessões da Indústria');

CREATE TABLE APRESENTA_ARTIGO (
    Sessao int,
    Artigo int,
    Apresentacao int,
    FOREIGN KEY(Sessao) REFERENCES SESSAO(Id),
    FOREIGN KEY(Artigo) REFERENCES ARTIGO(Id),
    FOREIGN KEY(Apresentacao) REFERENCES APRESENTACAO(Id)
);

CREATE TABLE LOJA (
    Id int PRIMARY KEY, 
    Nome varchar(50)
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
    Id int PRIMARY KEY,
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

CREATE TABLE INSCRICAO (
    Epoca varchar(50),
    Taxa int,
    Classe_do_Publico varchar(50),
    Forma_de_Pagamento varchar(50),
    Tipo varchar(50)
);