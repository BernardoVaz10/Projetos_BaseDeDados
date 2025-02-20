-- Criação da tabela utilizador_rem para o trigger
CREATE TABLE IF NOT EXISTS utilizador_rem (
    Id_utilizador INT,
    Data_nascimento DATE,
    Genero VARCHAR(20),
    Password VARCHAR(255),
    Data_remocao DATETIME
);

DROP TRIGGER IF EXISTS enviar_email_sessao;
DROP TRIGGER IF EXISTS utilizador_remove;

-- Criação do trigger utilizador_remove
DELIMITER $$;

CREATE TRIGGER utilizador_remove
BEFORE UPDATE ON utilizador
FOR EACH ROW
BEGIN
    -- Insere os dados do utilizador na tabela utilizador_rem
    INSERT INTO utilizador_rem (Id_utilizador, Data_nascimento, Genero, Password, Data_remocao)
    VALUES (OLD.Id_utilizador, OLD.Data_nascimento, OLD.Genero, OLD.Password, NOW());
    
    -- Atualiza os campos do utilizador com dados fictícios
    SET NEW.Nome = 'NOME';
    SET NEW.Data_nascimento = '1900-01-01';
    SET NEW.Genero = NULL;
    SET NEW.Password = NULL;
END $$;

-- Criação do trigger enviar_email_sessao
DELIMITER $$;
CREATE TRIGGER enviar_email_sessao
AFTER INSERT ON Sessao
FOR EACH ROW
BEGIN
    -- Declaração das variáveis
    DECLARE email VARCHAR(255);
    DECLARE token VARCHAR(255);

    -- Obtém o email do utilizador associado à sessão
    SELECT email INTO email
    FROM Utilizador
    WHERE ID_utilizador = NEW.ID_utilizador;

    -- Obtém o token gerado para a sessão
    SET token = NEW.token_identificador;

    -- Chama o procedimento para enviar o email
    -- CALL enviar_email(email, token);
END $$;

