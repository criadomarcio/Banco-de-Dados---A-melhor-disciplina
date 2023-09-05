Questão 1 {
SELECT titulo
FROM livros;
}

Questão 2 {
SELECT nome
FROM autores
WHERE ano_nascimento < 1900;
}

Questão 3 {
SELECT titulo
FROM livros
WHERE autor_id = (SELECT id FROM autores WHERE nome = 'J.K. Rowling');
}

Questão 4 {
SELECT nome
FROM alunos
WHERE curso = 'Engenharia de Software';
}

Questão 5 {
SELECT produto, SUM(receita) as receita_total
FROM vendas
GROUP BY produto;
}

Questão 6 {
SELECT autores.nome, COUNT(*) as num_livros
FROM livros
JOIN autores ON livros.autor_id = autores.id
GROUP BY autores.nome;
}

Questão 7{
SELECT curso, COUNT(*) as num_alunos
FROM alunos
GROUP BY curso;
}

Questão 8{
SELECT produto, AVG(receita) as media_receita
FROM vendas
GROUP BY produto;
}


