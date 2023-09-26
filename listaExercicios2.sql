-- Exercício 1: Listagem de Autores
CREATE PROCEDURE sp_ListarAutores
AS
BEGIN
    SELECT Nome, Sobrenome
    FROM Autor;
END;

-- Exercício 2: Livros por Categoria
CREATE PROCEDURE sp_LivrosPorCategoria
    @CategoriaNome NVARCHAR(50)
AS
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.CategoriaID = Categoria.CategoriaID
    WHERE Categoria.Nome = @CategoriaNome;
END;
