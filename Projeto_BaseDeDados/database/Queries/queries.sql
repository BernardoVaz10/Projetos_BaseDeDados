-- Primeira consulta
-- 1.1 -> Ordenar por nacionalidade
-- SELECT * FROM Utilizador ORDER BY nacionalidade;

-- 1.2 -> Ordenar por utilizadores do sexo feminino
-- SELECT * FROM Utilizador WHERE genero = 'Feminino';

-- 1.3 -> Filtrar por utilizadores com contas ativas
-- SELECT * FROM Utilizador WHERE admin = true;

-- Segunda consulta
-- 2.1 -> Ordenar por data de entrada na forma decrescente
-- SELECT * FROM Questao ORDER BY data_entrada DESC;

-- 2.2 -> Filtrar por questoes com o idioma Português
-- SELECT * FROM Questao WHERE idioma = "Português";

-- Terceira consulta
-- 3.1 -> Filtrar por respostas aprovadas
-- SELECT * FROM Resposta WHERE estado = "Aprovada";

-- 3.2


-- Quarta consulta
-- 4.1 -> Filtrar por sessões com dispositivos móveis
-- SELECT * FROM Sessao WHERE tipo_dispositivo = 'Móvel';

-- 4.2 -> 
-- SELECT * FROM Sessao WHERE data_hora_inicio < '2023-01-01 12:00:00';

-- 4.3 -> Filtrar por sessoes com um IP especifico
-- SELECT * FROM Sessao WHERE IP = '192.168.0.1';

-- Quinta consulta -> Lista de sessoes de cada utilizador ordenadas por duraçao
-- SELECT ID_utilizador, data_hora_inicio, data_hora_fim, data_hora_fim - data_hora_inicio AS duracao FROM Sessao ORDER BY ID_utilizador, duracao;

-- Sexta consulta -> Lista das questoes que nao foram pesquisadas no ano atual
-- SELECT * FROM Questao  WHERE ID_questao NOT IN (SELECT DISTINCT ID_questao FROM Pesquisa WHERE YEAR(CURDATE()) = YEAR(NOW()));

-- Setima consulta ->
 
-- Oitava consulta
-- 8.1 -> Agrupar por tipo de pesquisa e calcular as estatisticas
-- SELECT Tipo_pesquisa, AVG(ID_questao) AS media_questao, MIN(ID_questao) AS min_questao, MAX(ID_questao) AS max_questao, STDDEV(ID_questao) AS desvio_questao FROM Pesquisa GROUP BY Tipo_pesquisa;

-- 8.2 -> Filtrar por pesquisas realizadas por utlizadores com ID superior a 10
 -- SELECT Tipo_pesquisa, AVG(ID_resposta) AS media_resposta, MIN(ID_resposta) AS min_resposta, MAX(ID_resposta) AS max_resposta, STDDEV(ID_resposta) AS desvio_resposta FROM Pesquisa GROUP BY Tipo_pesquisa;

-- Nona consulta -> Lista com o número médio, mínimo, máximo e desvio padrão da classificação das respostas por categoria de questão
-- SELECT c.nome_categoria AS categoria, AVG(f.classificacao) AS media_classificacao, MIN(f.classificacao) AS min_classificacao, MAX(f.classificacao) AS max_classificacao, STDDEV(f.classificacao) AS desvio_classificacao FROM Feedback AS f JOIN Resposta AS r ON f.ID_resposta = r.ID_resposta JOIN Questao AS q ON r.ID_questao = q.ID_questao JOIN Categoria AS c ON q.ID_categoria = c.ID_categoria GROUP BY c.nome_categoria;

-- Decima consulta
-- AINDA PRECISAMOS DE VER

-- Decima-primeira consulta -> Lista dos 5 utilizadores com mais pesquisas
-- SELECT u.nome, COUNT(*) AS total_pesquisas FROM Utilizador AS u JOIN Pesquisa AS p ON u.ID_utilizador = p.ID_utilizador GROUP BY u.nome ORDER BY total_pesquisas DESC LIMIT 5;

-- Decima-segunda consulta -> Consulta adicional recorrendo a, pelo menos, 3 tabelas
-- SELECT q.texto_questao AS questao, r.texto_resposta AS resposta, u.nome AS utilizador FROM Questao q JOIN Resposta r ON q.ID_questao = r.ID_questao JOIN Utilizador u ON r.ID_utilizador = u.ID_utilizador WHERE r.estado = 'Aprovada' LIMIT 10;

-- Decima-terceira consulta -> Consulta adiciona recorrendo a, pelo menos, 3 tabelas que inclua WHERE e HAVING

-- Decima-quarta consulta -> NAO SEI



