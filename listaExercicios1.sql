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