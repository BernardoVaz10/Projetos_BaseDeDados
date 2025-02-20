drop procedure if exists set_user_admin;
drop procedure if exists select_all_questions;
drop procedure if exists newUser;
drop procedure if exists selectAdmins;
drop procedure if exists selectUsers;
drop procedure if exists newCategory;
drop procedure if exists newFeedback;
drop procedure if exists newQuestion;
drop procedure if exists removeUser;
drop procedure if exists removeCategory;
drop procedure if exists removeFeedback;
drop procedure if exists removeQuestion;
drop procedure if exists removeAwnser;
drop procedure if exists removeSession;
drop procedure if exists removeSubcategory;
drop procedure if exists removeSearch;
drop procedure if exists removeTag;

drop table if exists utilizador_change_log;
drop trigger if exists user_removal_trigger;
drop trigger if exists user_change;

drop function if exists CalculaMediaFeedback;
drop function if exists VerificaPermissaoAdmin;



-- VIEWS --
drop view if exists ViewCategorias;
create view ViewCategorias as 
select nome_categoria AS Categoria, nome_subcategoria AS Subcategoria FROM Categoria
join Subcategoria ON categoria.ID_subcategoria = subcategoria.ID_subcategoria;

drop view if exists ViewQuestoesRespostas;
create view ViewQuestoesRespostas as
select texto_questao as Questao, resposta.texto_resposta as Resposta
from Questao
join Resposta ON questao.ID_questao = resposta.ID_questao;

drop view if exists ViewTotalRespostas;
create view ViewTotalRespostas as
select questao.ID_questao, texto_questao as Questao, COUNT(resposta.ID_resposta) AS TotalRespostas
from Questao
left join Resposta on questao.ID_questao = resposta.ID_questao
group by questao.ID_questao;

drop view if exists ViewSessoesUtilizadores;
create view ViewSessoesUtilizadores as 
select sessao.ID_sessao, sessao.token_identificador as Token, utilizador.nome AS Utilizador, sessao.data_hora_inicio as InicioSessao
from Sessao
join Utilizador on sessao.ID_utilizador = utilizador.ID_utilizador;

drop view if exists ViewRespostasRecentes;
create view ViewRespostasRecentes as
select resposta.ID_resposta, resposta.texto_resposta as Resposta, resposta.data_aprovacao as DataAprovacao
from Resposta
order by resposta.data_aprovacao DESC;


-- TRIGGERS
DELIMITER $$;
CREATE TRIGGER user_removal_trigger
AFTER DELETE ON utilizador
FOR EACH ROW
BEGIN
    -- Inserting information into the utilizador_rem table
    INSERT INTO utilizador_rem (Id_utilizador, Data_remocao)
    VALUES (OLD.Id_utilizador, NOW());
END $$;

CREATE TABLE utilizador_change_log (
    log_id INT AUTO_INCREMENT,
    utilizador_id INT,
    old_name VARCHAR(255),
    new_name VARCHAR(255),
    old_email VARCHAR(255),
    new_email VARCHAR(255),
    change_date DATETIME,
    PRIMARY KEY (log_id)
);

CREATE TRIGGER user_change
BEFORE UPDATE ON utilizador
FOR EACH ROW
BEGIN
    -- Insert the old and new values into the utilizador_change_log table
    INSERT INTO utilizador_change_log (utilizador_id, old_name, new_name, old_email, new_email, change_date)
    VALUES (OLD.ID_utilizador, OLD.nome, NEW.nome, OLD.email, NEW.email, NOW());
END;


-- PROCEDURES
DELIMITER $$;
CREATE PROCEDURE set_user_admin(IN user_id INT)
BEGIN
    -- Atualiza o utilizador definindo o campo admin como true
    UPDATE Utilizador SET admin = true WHERE ID_utilizador = user_id;
END $$;

DELIMITER $$;
CREATE PROCEDURE select_all_questions()
begin
select * from questao;
end $$;

DELIMITER $$;
CREATE PROCEDURE selectAdmins()
begin
select * from utilizador where admin is true;
end $$;

DELIMITER $$;
CREATE PROCEDURE selectUsers()
begin
select * from utilizador where admin is false;
end $$;

DELIMITER $$;
CREATE PROCEDURE newUser(in name varchar(50),in mail varchar(100),in date date,in gender varchar(10),in pass varchar(100),in nationality varchar(50),in admin boolean)
begin
insert into utilizador(nome, email, data_nascimento, genero, password, nacionalidade, admin) value (name, mail, date, gender, pass, nationality, admin);
end $$;

DELIMITER $$;
CREATE PROCEDURE newCategory(in ID_categoria int, in nome_categoria varchar(50), in ID_subcategoria int)
begin
insert into categoria(ID_categoria, nome_categoria, ID_subcategoria) value (ID_categoria, nome_categoria, ID_subcategoria);
end $$;

DELIMITER $$;
CREATE PROCEDURE newFeedback(in id_utilizador INT, in id_sessao int, in id_resposta int, in classificacao int)
begin
insert into feedback(ID_utilizador, ID_sessao, ID_resposta, classificacao) value (id_utilizador, id_sessao, id_resposta, classificacao);
end $$;

DELIMITER $$;
CREATE PROCEDURE newQuestion(in texto_questao text, in idioma varchar(50), in data_entrada date, in data_ultima_atualizacao date)
begin
insert into questao(texto_questao, idioma, data_entrada, data_ultima_atualizacao) value (texto_questao, idioma, data_entrada, data_ultima_atualizacao);
end $$;

DELIMITER $$;
CREATE PROCEDURE removeUser(IN id INT)
BEGIN
    DELETE FROM feedback WHERE ID_utilizador = id;
    DELETE FROM sessao WHERE ID_utilizador = id;
    DELETE FROM administracao WHERE ID_utilizador = id;
    DELETE FROM pesquisa WHERE ID_utilizador = id;
    DELETE FROM utilizador WHERE ID_utilizador = id;
END $$;

DELIMITER $$;
CREATE PROCEDURE removeCategory(IN ID_categoria INT)
BEGIN
    DELETE FROM Questao WHERE ID_categoria = ID_categoria;
    DELETE FROM Categoria WHERE ID_categoria = ID_categoria;
END $$;

DELIMITER $$;
CREATE PROCEDURE removeFeedback(IN ID_feedback INT)
BEGIN
    DELETE FROM Feedback WHERE ID_feedback = ID_feedback;
END $$;


DELIMITER $$;
CREATE PROCEDURE removeQuestion(IN ID_questao INT)
BEGIN
    -- Remove feedback associated with the question
    DELETE FROM Feedback WHERE ID_questao = ID_questao;
    
    -- Remove pesquisa associated with the question
    DELETE FROM Pesquisa WHERE ID_questao = ID_questao;
    
    -- Remove resposta associated with the question
    DELETE FROM Resposta WHERE ID_questao = ID_questao;
    
    -- Remove questao from its category
    DELETE FROM Questao_Categoria WHERE ID_questao = ID_questao;
    
    -- Remove questao from its subcategory
    DELETE FROM Questao_Subcategoria WHERE ID_questao = ID_questao;
    
    -- Remove the question
    DELETE FROM Questao WHERE ID_questao = ID_questao;
    
    -- Optionally, remove the category and subcategory if they have no more associated questions
    DELETE FROM Categoria WHERE ID_categoria NOT IN (SELECT ID_categoria FROM Questao_Categoria);
    DELETE FROM Subcategoria WHERE ID_subcategoria NOT IN (SELECT ID_subcategoria FROM Questao_Subcategoria);
END $$;

DELIMITER $$;
CREATE PROCEDURE removeAwnser(IN ID_resposta INT)
BEGIN
    -- Remove feedback associated with the resposta
    DELETE FROM Feedback WHERE ID_resposta = ID_resposta;
    
    -- Remove pesquisa associated with the resposta
    DELETE FROM Pesquisa WHERE ID_resposta = ID_resposta;
    
    -- Remove the resposta
    DELETE FROM Resposta WHERE ID_resposta = ID_resposta;
    
    -- Optionally, remove the question if it has no more associated respostas
    DELETE FROM Questao WHERE ID_questao NOT IN (SELECT ID_questao FROM Resposta);
END $$;


DELIMITER $$;
CREATE PROCEDURE removeSession(IN ID_sessao INT)
BEGIN
        -- Remove pesquisas associated with the sessao
        DELETE FROM Pesquisa WHERE ID_sessao = ID_sessao;
        
        -- Remove administracao associated with the sessao
        DELETE FROM Administracao WHERE ID_sessao = ID_sessao;
        
        -- Remove sessao
        DELETE FROM Sessao WHERE ID_sessao = ID_sessao;
END $$;

DELIMITER $$;
CREATE PROCEDURE removeSubcategory(IN id INT)
BEGIN
	DELETE FROM questao WHERE ID_categoria = id;
    DELETE FROM categoria WHERE ID_subcategoria = id;
    DELETE FROM subcategoria WHERE ID_subcategoria = id;
END $$;

DELIMITER $$;
CREATE PROCEDURE removeSearch(IN id_questao INT, in id_resposta int, in id_categoria int, in id_utilizador int)
BEGIN
    -- Delete records from associated tables
    DELETE FROM Pesquisa WHERE ID_questao = id_questao AND ID_resposta = id_resposta AND ID_categoria = id_categoria AND ID_utilizador = id_utilizador;
END $$;

DELIMITER $$;
CREATE PROCEDURE removeTag(IN id INT)
BEGIN
    -- Delete records from associated tables
    DELETE FROM Tag WHERE ID_tag = id;
END $$;



-- STORED FUNCTIONS --
DELIMITER $$;
create function CalculaMediaFeedback(P_ID_utilizador INT) returns decimal(5,2)
deterministic
begin
	declare media decimal(5,2);
    select avg(classificacao) into media
    from Feedback
    where ID_utilizador = P_ID_utilizador;
    return media;
end $$;
DELIMITER ;

DELIMITER $$;
create function VerificaPermissaoAdmin(P_ID_utilizador INT) returns BOOLEAN 
deterministic
begin
	declare permissao BOOLEAN;
	select admin into permissao
	from Utilizador
	where ID_utilizador = P_ID_utilizador;
	return permissao;
end $$;
DELIMITER ;

