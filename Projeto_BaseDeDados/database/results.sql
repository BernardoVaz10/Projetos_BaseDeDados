drop procedure if exists sp_criar_sessao;
drop procedure if exists sp_adicionar_questao;
drop procedure if exists sp_remover_sessao;
drop procedure if exists sp_clonar_sessao;
drop procedure if exists sp_registar_resposta;

-- criar registo de uma nova sessão
DELIMITER $$;
CREATE PROCEDURE sp_criar_sessao(
    IN id_utilizador INT,
    IN data_hora_inicio DATETIME,
    IN data_hora_fim DATETIME,
    IN IP VARCHAR(255),
    IN tipo_dispositivo VARCHAR(255),
    OUT token_identificador VARCHAR(255)
)
BEGIN
    -- Gerar o token automaticamente
    SET token_identificador = UUID();

    -- Inserir os dados na tabela Sessao
    INSERT INTO Sessao (token_identificador, data_hora_inicio, data_hora_fim, IP, tipo_dispositivo, ID_utilizador)
    VALUES (token_identificador, data_hora_inicio, data_hora_fim, IP, tipo_dispositivo, id_utilizador);
END $$;

-- adicionar questão à lista de questões pesquisadas na sessão
DELIMITER $$;
CREATE PROCEDURE sp_adicionar_questao(
	IN Tipo_pesquisa VARCHAR(50),
    IN id_questao INT,
    IN ID_resposta int,
    IN ID_categoria int,
    IN ID_utilizador int
)
BEGIN
    -- Inserir o registo na tabela Pesquisa
    INSERT INTO Pesquisa ( Tipo_pesquisa, id_questao, ID_resposta, ID_categoria, ID_utilizador)
    VALUES (Tipo_pesquisa, id_questao, ID_resposta, ID_categoria, ID_utilizador);
END $$;

-- registar respostas obtidas como resultado da pesquisa na sessão
DELIMITER $$;
CREATE PROCEDURE sp_registar_resposta(
    IN id_resposta INT
)
BEGIN
    -- Inserir o registo na tabela Resposta
    INSERT INTO Resposta (ID_resposta)
    VALUES ( id_resposta);
END $$;

-- remover sessão identificada no parâmetro
DELIMITER $$;
CREATE PROCEDURE sp_remover_sessao(IN ID_sessao INT)
BEGIN
        -- Remove pesquisas associated with the sessao
        DELETE FROM Pesquisa WHERE ID_sessao = ID_sessao;
        
        -- Remove administracao associated with the sessao
        DELETE FROM Administracao WHERE ID_sessao = ID_sessao;
        
        -- Remove sessao
        DELETE FROM Sessao WHERE ID_sessao = ID_sessao;
END $$;

-- criar uma nova sessão com uma cópia dos dados existentes na sessão indicada
DELIMITER $$;
CREATE PROCEDURE sp_clonar_sessao(
    IN id_sessao INT
)
BEGIN
    DECLARE token_identificador_clone VARCHAR(255);

    -- Obter os dados da sessão a ser clonada
    SELECT CONCAT('TEMP ', token_identificador) INTO token_identificador_clone
    FROM Sessao
    WHERE ID_sessao = id_sessao;

    -- Inserir os dados clonados na tabela Sessao
    INSERT INTO Sessao (token_identificador, data_hora_inicio, data_hora_fim, IP, tipo_dispositivo, ID_utilizador)
    SELECT token_identificador_clone, data_hora_inicio, NULL, IP, tipo_dispositivo, ID_utilizador
    FROM Sessao
    WHERE ID_sessao = id_sessao;
END $$;

