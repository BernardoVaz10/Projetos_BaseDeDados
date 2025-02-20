-- Populating the "Utilizador" table
INSERT INTO Utilizador (ID_utilizador, nome, email, data_nascimento, genero, password, nacionalidade, admin)
VALUES 
    (1, 'João Silva', 'joaosilva@example.com', '1990-01-01', 'Masculino', 'senha123', 'Portugal', false),
    (2, 'António Mendes', 'antoniomendes@example.com', '1995-01-01', 'Masculino', 'senha123', 'Portugal', false),
    (3, 'José Araujo', 'josearaujo@example.com', '1989-01-01', 'Masculino', 'senha123', 'Portugal', false),
    (4, 'Carolina Sofia', 'carolinasofia@example.com', '1999-01-01', 'Masculino', 'senha123', 'Portugal', false),
    (5, 'Sofia Almeida', 'antoniomendes@example.com', '1995-01-01', 'Masculino', 'senha123', 'Portugal', false),
    (6, 'Gabriela Vieira', 'gabrielavieira@example.com', '2000-01-01', 'Masculino', 'senha123', 'Portugal', true),
    (7, 'Ricardo Santos', 'ricardosantos@example.com', '1992-01-01', 'Masculino', 'senha123', 'Portugal', false),
	(8, 'Mariana Costa', 'marianacosta@example.com', '1991-01-01', 'Feminino', 'senha123', 'Portugal', false),
	(9, 'Pedro Oliveira', 'pedrooliveira@example.com', '1993-01-01', 'Masculino', 'senha123', 'Portugal', false),
	(10, 'Ana Santos', 'anasantos@example.com', '1994-01-01', 'Feminino', 'senha123', 'Portugal', false),
	(11, 'André Ferreira', 'andreferreira@example.com', '1996-01-01', 'Masculino', 'senha123', 'Portugal', false),
	(12, 'Inês Pereira', 'inespereira@example.com', '1997-01-01', 'Feminino', 'senha123', 'Portugal', false),
	(13, 'Miguel Silva', 'miguelsilva@example.com', '1998-01-01', 'Masculino', 'senha123', 'Portugal', false),
	(14, 'Beatriz Rodrigues', 'beatrizrodrigues@example.com', '2001-01-01', 'Feminino', 'senha123', 'Portugal', false),
	(15, 'Francisco Alves', 'franciscoalves@example.com', '2002-01-01', 'Masculino', 'senha123', 'Portugal', false),
	(16, 'Lara Sousa', 'larasousa@example.com', '2003-01-01', 'Feminino', 'senha123', 'Portugal', false),
	(17, 'Guilherme Fernandes', 'guilhermefernandes@example.com', '2004-01-01', 'Masculino', 'senha123', 'Portugal', false),
	(18, 'Matilde Gomes', 'matildegomes@example.com', '2005-01-01', 'Feminino', 'senha123', 'Portugal', false),
	(19, 'Diogo Martins', 'diogomartins@example.com', '2006-01-01', 'Masculino', 'senha123', 'Portugal', false),
	(20, 'Rita Carvalho', 'ritacarvalho@example.com', '2007-01-01', 'Feminino', 'senha123', 'Portugal', false);
    -- End

-- Populating the "Subcategoria" table
INSERT INTO Subcategoria (ID_subcategoria, nome_subcategoria)
VALUES 
    (1, 'Computadores'),
    (2, 'T-Shirts'),
    (3, 'Smartphones'),
	(4, 'Calçados'),
	(5, 'Livros'),
	(6, 'Relógios'),
	(7, 'Consoles de Jogos'),
	(8, 'Calças Jeans'),
	(9, 'Decoração de Casa'),
	(10, 'Joias'),
	(11, 'Câmeras'),
	(12, 'Bolsas'),
	(13, 'Óculos de Sol'),
	(14, 'Fones de Ouvido'),
	(15, 'Equipamentos de Fitness'),
	(16, 'Eletrodomésticos de Cozinha'),
	(17, 'Brinquedos'),
	(18, 'Produtos de Beleza'),
	(19, 'Artigos Esportivos'),
	(20, 'Móveis');
    -- End

-- Populating the "Categoria" table
INSERT INTO Categoria (ID_categoria, nome_categoria, ID_subcategoria)
VALUES 
    (1, 'Tecnologia', 1),
    (2, 'Saude', 2),
    (3, 'Educação', 3),
	(4, 'Entretenimento', 4),
	(5, 'Moda', 5),
	(6, 'Esportes', 6),
	(7, 'Viagens', 7),
	(8, 'Negócios', 8),
	(9, 'Gastronomia', 9),
	(10, 'Arte', 10),
	(11, 'Música', 11),
	(12, 'Automóveis', 12),
	(13, 'Ciência', 13),
	(14, 'Saúde', 14),
	(15, 'Fotografia', 15),
	(16, 'Natureza', 16),
	(17, 'Cinema', 17),
	(18, 'Tecnologia', 18),
	(19, 'Animais', 19),
	(20, 'História', 20);
    -- End

-- Populating the "Questao" table
INSERT INTO Questao (ID_questao, texto_questao, idioma, data_entrada, data_ultima_atualizacao, ID_categoria, ID_utilizador)
VALUES 
    (1, 'Como ligo o meu smartphone?', 'Português', '2023-01-01', '2023-01-01', 1, 1),
    (2, 'Qual é o tamanho das calças?', 'Português', '2023-01-02', '2023-01-02', 2, 2),
    (3, 'Como escolher um bom livro?', 'Português', '2023-01-03', '2023-01-03', 5, 3),
	(4, 'Como ajustar o horário do meu relógio?', 'Português', '2023-01-04', '2023-01-04', 6, 4),
	(5, 'Dicas para aproveitar ao máximo os jogos no console', 'Português', '2023-01-05', '2023-01-05', 7, 5),
	(6, 'Como combinar calças jeans com diferentes estilos?', 'Português', '2023-01-06', '2023-01-06', 8, 6),
	(7, 'Ideias de decoração para transformar sua casa', 'Português', '2023-01-07', '2023-01-07', 9, 7),
	(8, 'Como escolher a joia perfeita para uma ocasião especial?', 'Português', '2023-01-08', '2023-01-08', 10, 8),
	(9, 'Dicas para tirar fotos incríveis com sua câmera', 'Português', '2023-01-09', '2023-01-09', 11, 9),
	(10, 'Cuidados essenciais para manter sua bolsa em ótimo estado', 'Português', '2023-01-10', '2023-01-10', 12, 10),
	(11, 'Como escolher óculos de sol que combinem com seu rosto?', 'Português', '2023-01-11', '2023-01-11', 13, 11),
	(12, 'Melhores opções de fones de ouvido no mercado', 'Português', '2023-01-12', '2023-01-12', 14, 12),
	(13, 'Exercícios eficazes para manter a forma com equipamentos de fitness', 'Português', '2023-01-13', '2023-01-13', 15, 13),
	(14, 'Dicas para escolher eletrodomésticos de cozinha de qualidade', 'Português', '2023-01-14', '2023-01-14', 16, 14),
	(15, 'Ideias de brinquedos educativos para crianças de diferentes idades', 'Português', '2023-01-15', '2023-01-15', 17, 15),
	(16, 'Rotina de cuidados com a pele e dicas de produtos de beleza', 'Português', '2023-01-16', '2023-01-16', 18, 16),
	(17, 'Equipamentos esportivos essenciais para praticar seu esporte favorito', 'Português', '2023-01-17', '2023-01-17', 19, 17),
	(18, 'Como escolher móveis funcionais e estilosos para sua casa', 'Português', '2023-01-18', '2023-01-18', 20, 18),
	(19, 'Como resolver problemas comuns no smartphone', 'Português', '2023-01-19', '2023-01-19', 3, 1),
	(20, 'Dicas de moda masculina: como escolher a camisa perfeita', 'Português', '2023-01-20', '2023-01-20', 5, 6);
    -- End

-- Populating the "Resposta" table
INSERT INTO Resposta (ID_resposta, texto_resposta, data_aprovacao, estado, ID_questao, ID_utilizador)
VALUES 
    (1, 'Resposta 1', '2023-01-01', 'Aprovada', 1, 1),
    (2, 'Resposta 1', '2023-01-02', 'Aprovada', 3, 1),
	(3, 'Resposta 2', '2023-01-03', 'Aprovada', 5, 3),
	(4, 'Resposta 3', '2023-01-04', 'Aprovada', 6, 4),
	(5, 'Resposta 4', '2023-01-05', 'Aprovada', 7, 5),
	(6, 'Resposta 5', '2023-01-06', 'Aprovada', 8, 6),
	(7, 'Resposta 6', '2023-01-07', 'Aprovada', 9, 7),
	(8, 'Resposta 7', '2023-01-08', 'Aprovada', 10, 8),
	(9, 'Resposta 8', '2023-01-09', 'Aprovada', 11, 9),
	(10, 'Resposta 9', '2023-01-10', 'Aprovada', 12, 10),
	(11, 'Resposta 10', '2023-01-11', 'Aprovada', 13, 11),
	(12, 'Resposta 11', '2023-01-12', 'Aprovada', 14, 12),
	(13, 'Resposta 12', '2023-01-13', 'Aprovada', 15, 13),
	(14, 'Resposta 13', '2023-01-14', 'Aprovada', 16, 14),
	(15, 'Resposta 14', '2023-01-15', 'Aprovada', 17, 15),
	(16, 'Resposta 15', '2023-01-16', 'Aprovada', 18, 16),
	(17, 'Resposta 16', '2023-01-17', 'Aprovada', 19, 17),
	(18, 'Resposta 17', '2023-01-18', 'Aprovada', 20, 18),
	(19, 'Resposta 18', '2023-01-19', 'Aprovada', 3, 1),
	(20, 'Resposta 19', '2023-01-20', 'Aprovada', 5, 6);
    -- End

-- Populating the "Sessao" table
INSERT INTO Sessao (ID_sessao, token_identificador, data_hora_inicio, data_hora_fim, IP, tipo_dispositivo, ID_utilizador)
VALUES 
    (1, 'token1', '2023-01-01 10:00:00', '2023-01-01 11:00:00', '127.0.0.1', 'Desktop', 1),
	(2, 'token2', '2023-01-02 14:00:00', '2023-01-02 15:00:00', '192.168.0.1', 'Móvel', 2),
	(3, 'token3', '2023-01-03 16:30:00', '2023-01-03 17:30:00', '10.0.0.2', 'Desktop', 3),
	(4, 'token4', '2023-01-04 12:45:00', '2023-01-04 13:45:00', '192.168.1.2', 'Móvel', 4),
	(5, 'token5', '2023-01-05 09:15:00', '2023-01-05 10:15:00', '172.16.0.2', 'Desktop', 5),
	(6, 'token6', '2023-01-06 15:30:00', '2023-01-06 16:30:00', '192.168.2.2', 'Móvel', 6),
	(7, 'token7', '2023-01-07 11:45:00', '2023-01-07 12:45:00', '10.0.0.3', 'Desktop', 7),
	(8, 'token8', '2023-01-08 14:15:00', '2023-01-08 15:15:00', '192.168.1.3', 'Móvel', 8),
	(9, 'token9', '2023-01-09 13:30:00', '2023-01-09 14:30:00', '172.16.0.3', 'Desktop', 9),
	(10, 'token10', '2023-01-10 10:45:00', '2023-01-10 11:45:00', '192.168.2.3', 'Móvel', 10),
	(11, 'token11', '2023-01-11 16:00:00', '2023-01-11 17:00:00', '10.0.0.4', 'Desktop', 11),
	(12, 'token12', '2023-01-12 12:15:00', '2023-01-12 13:15:00', '192.168.1.4', 'Móvel', 12),
	(13, 'token13', '2023-01-13 09:30:00', '2023-01-13 10:30:00', '172.16.0.4', 'Desktop', 13),
	(14, 'token14', '2023-01-14 15:45:00', '2023-01-14 16:45:00', '192.168.2.4', 'Móvel', 14),
	(15, 'token15', '2023-01-15 11:00:00', '2023-01-15 12:00:00', '10.0.0.5', 'Desktop', 15),
	(16, 'token16', '2023-01-16 14:00:00', '2023-01-16 15:00:00', '192.168.1.5', 'Móvel', 16),
	(17, 'token17', '2023-01-17 13:00:00', '2023-01-17 14:00:00', '172.16.0.5', 'Desktop', 17),
	(18, 'token18', '2023-01-18 10:00:00', '2023-01-18 11:00:00', '192.168.2.5', 'Móvel', 18),
	(19, 'token19', '2023-01-19 16:00:00', '2023-01-19 17:00:00', '10.0.0.6', 'Desktop', 19),
	(20, 'token20', '2023-01-20 12:00:00', '2023-01-20 13:00:00', '192.168.1.6', 'Móvel', 20);
    -- End

-- Populating the "Administracao" table
INSERT INTO Administracao (ID_sessao, admin, ID_utilizador)
VALUES 
    (1, true, 1),
	(2, false, 2),
	(3, false, 3),
	(4, true, 4),
	(5, false, 5),
	(6, true, 6),
	(7, false, 7),
	(8, true, 8),
	(9, false, 9),
	(10, true, 10),
	(11, false, 11),
	(12, true, 12),
	(13, false, 13),
	(14, true, 14),
	(15, false, 15),
	(16, true, 16),
	(17, false, 17),
	(18, true, 18),
	(19, false, 19),
	(20, true, 20);
    -- End

-- Populating the "Feedback" table
INSERT INTO Feedback (ID_utilizador, ID_sessao, ID_resposta, classificacao)
VALUES 
    (1, 1, 1, 5),
	(2, 2, 2, 4),
	(3, 3, 3, 3),
	(4, 4, 4, 4),
	(5, 5, 5, 5),
	(6, 6, 6, 4),
	(7, 7, 7, 3),
	(8, 8, 8, 4),
	(9, 9, 9, 5),
	(10, 10, 10, 4),
	(11, 11, 11, 3),
	(12, 12, 12, 4),
	(13, 13, 13, 5),
	(14, 14, 14, 4),
	(15, 15, 15, 3),
	(16, 16, 16, 4),
	(17, 17, 17, 5),
	(18, 18, 18, 4),
	(19, 19, 19, 3),
	(20, 20, 20, 4);
    -- End

-- Populating the "Tag" table
INSERT INTO Tag (ID_tag, nome)
VALUES 
	(1, 'Tag 1'),
	(2, 'Tag 2'),
	(3, 'Tag 3'),
	(4, 'Tag 4'),
	(5, 'Tag 5'),
	(6, 'Tag 6'),
	(7, 'Tag 7'),
	(8, 'Tag 8'),
	(9, 'Tag 9'),
	(10, 'Tag 10'),
	(11, 'Tag 11'),
	(12, 'Tag 12'),
	(13, 'Tag 13'),
	(14, 'Tag 14'),
	(15, 'Tag 15'),
	(16, 'Tag 16'),
	(17, 'Tag 17'),
	(18, 'Tag 18'),
	(19, 'Tag 19'),
	(20, 'Tag 20');
    -- End

-- Populating the "Pesquisa" table
INSERT INTO Pesquisa (Tipo_pesquisa, ID_questao, ID_resposta, ID_categoria, ID_utilizador)
VALUES 
   ('Pesquisa 1', 1, 1, 1, 1),
	('Pesquisa 2', 2, 2, 2, 2),
	('Pesquisa 3', 3, 3, 3, 3),
	('Pesquisa 4', 4, 4, 4, 4),
	('Pesquisa 5', 5, 5, 5, 5),
	('Pesquisa 6', 6, 6, 6, 6),
	('Pesquisa 7', 7, 7, 7, 7),
	('Pesquisa 8', 8, 8, 8, 8),
	('Pesquisa 9', 9, 9, 9, 9),
	('Pesquisa 10', 10, 10, 10, 10),
	('Pesquisa 11', 11, 11, 11, 11),
	('Pesquisa 12', 12, 12, 12, 12),
	('Pesquisa 13', 13, 13, 13, 13),
	('Pesquisa 14', 14, 14, 14, 14),
	('Pesquisa 15', 15, 15, 15, 15),
	('Pesquisa 16', 16, 16, 16, 16),
	('Pesquisa 17', 17, 17, 17, 17),
	('Pesquisa 18', 18, 18, 18, 18),
	('Pesquisa 19', 19, 19, 19, 19),
	('Pesquisa 20', 20, 20, 20, 20);
    -- End