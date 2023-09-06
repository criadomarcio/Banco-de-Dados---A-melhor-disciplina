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

Questão 9{
SELECT produto
FROM vendas
GROUP BY produto
HAVING SUM(receita) > 10000;
}

Questão 10 {
SELECT autores.nome
FROM autores
JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
HAVING COUNT(*) > 2;
}

Questão 11 {
SELECT livros.titulo, autores.nome
FROM livros
JOIN autores ON livros.autor_id = autores.id;
}

Questão 12 {
SELECT alunos.nome, matriculas.curso
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;
}

Questão 13 {
SELECT autores.nome, livros.titulo
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id;
}

Questão 14 {
SELECT cursos.nome, alunos.nome
FROM cursos
RIGHT JOIN matriculas ON cursos.id = matriculas.curso_id
JOIN alunos ON matriculas.aluno_id = alunos.id;
}

Questão 15 {
SELECT alunos.nome, cursos.nome
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id
INNER JOIN cursos ON matriculas.curso_id = cursos.id;
}

Questão 16 {
SELECT nome
FROM autores
WHERE id = (
    SELECT autor_id
    FROM livros
    GROUP BY autor_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
}

Questão 17 {
SELECT produto
FROM vendas
GROUP BY produto
HAVING SUM(receita) = (
    SELECT MIN(receita_total)
    FROM (
        SELECT SUM(receita) as receita_total
        FROM vendas
        GROUP BY produto
    ) as subquery
);
}

Questão 18 {
SELECT autores.nome, SUM(livros_vendidos.quantidade * 20) as receita_total
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
LEFT JOIN livros_vendidos ON livros.id = livros_vendidos.livro_id
GROUP BY autores.nome;
}

Questão 19 {
SELECT alunos.nome, COUNT(matriculas.id) as num_matriculas
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.nome;
}