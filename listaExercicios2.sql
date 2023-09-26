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

-- Exercício 3: Contagem de Livros por Categoria
CREATE PROCEDURE sp_ContarLivrosPorCategoria
    @CategoriaNome NVARCHAR(50)
AS
BEGIN
    SELECT COUNT(Livro.Titulo) AS TotalLivros
    FROM Livro
    INNER JOIN Categoria ON Livro.CategoriaID = Categoria.CategoriaID
    WHERE Categoria.Nome = @CategoriaNome;
END;

-- Exercício 4: Verificação de Livros por Categoria
CREATE PROCEDURE sp_VerificarLivrosCategoria
    @CategoriaNome NVARCHAR(50)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Livro
        INNER JOIN Categoria ON Livro.CategoriaID = Categoria.CategoriaID
        WHERE Categoria.Nome = @CategoriaNome
    )
    BEGIN
        PRINT 'A categoria possui livros.';
    END
    ELSE
    BEGIN
        PRINT 'A categoria não possui livros.';
    END
END;

-- Exercício 5: Listagem de Livros por Ano
CREATE PROCEDURE sp_LivrosAteAno
    @Ano INT
AS
BEGIN
    SELECT Titulo
    FROM Livro
    WHERE AnoPublicacao <= @Ano;
END;
