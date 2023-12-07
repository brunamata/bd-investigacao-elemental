-- Seleciona as áreas em que a amostra específica é pesquisada
select area from pesquisa where amostra = '777' and planeta_amostra = '987654321'

select amostra, planeta_amostra, area from pesquisa;

SELECT DISTINCT p.amostra, p.planeta_amostra 
FROM pesquisa p WHERE 
NOT EXISTS 
((SELECT p2.area FROM pesquisa p2 
  WHERE p2.amostra = '777' AND p2.planeta_amostra = '987654321')
EXCEPT 
(SELECT p3.area FROM pesquisa p3 
 WHERE p3.amostra = p.amostra AND p3.planeta_amostra = p.planeta_amostra));

select * from pesquisa


-- contar as viagens que cada astronauta fez depois do ano 2002
SELECT f.nome, count(*) AS total_viagens 
FROM viagem v JOIN astronauta a
ON v.nave = a.nave JOIN funcionario f
ON f.cpf = a.cpf
WHERE EXTRACT(year FROM v.data_partida) > 2002
GROUP BY v.nave, f.nome;

