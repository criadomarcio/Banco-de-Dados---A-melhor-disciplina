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

-- Exercício 6: Extração de Títulos por Categoria 
CREATE PROCEDURE sp_TitulosPorCategoria
    @CategoriaNome NVARCHAR(50)
AS
BEGIN
    DECLARE @LivroTitulo NVARCHAR(255);

    DECLARE livro_cursor CURSOR FOR
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.CategoriaID = Categoria.CategoriaID
    WHERE Categoria.Nome = @CategoriaNome;

    OPEN livro_cursor;

    FETCH NEXT FROM livro_cursor INTO @LivroTitulo;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @LivroTitulo;
        FETCH NEXT FROM livro_cursor INTO @LivroTitulo;
    END;

    CLOSE livro_cursor;
    DEALLOCATE livro_cursor;
END;

-- Exercício 7: Adição de Livro com Tratamento de Erros
CREATE PROCEDURE sp_AdicionarLivro
    @Titulo NVARCHAR(255),
    @AutorID INT,
    @CategoriaID INT,
    @AnoPublicacao INT
AS
BEGIN
    BEGIN TRY
        -- Verifica se o título do livro já existe
        IF EXISTS (SELECT 1 FROM Livro WHERE Titulo = @Titulo)
        BEGIN
            RAISEERROR('Título já existe. O livro não foi adicionado.', 16, 1);
            RETURN;
        END

        -- Insere o novo livro na tabela Livro
        INSERT INTO Livro (Titulo, AutorID, CategoriaID, AnoPublicacao)
        VALUES (@Titulo, @AutorID, @CategoriaID, @AnoPublicacao);

        PRINT 'Livro adicionado com sucesso.';
    END TRY
    BEGIN CATCH
        -- Captura e trata o erro
        PRINT 'Erro:' + ERROR_MESSAGE();
    END CATCH
END;

-- Exercício 8: Autor Mais Antigo
CREATE PROCEDURE sp_AutorMaisAntigo
AS
BEGIN
    SELECT TOP 1 Nome, Sobrenome
    FROM Autor
    ORDER BY DataNascimento ASC;
END;

-- Exercício 9: Documentação e Comentários

-- Stored Procedure: sp_ListarAutores
-- Descrição: Esta stored procedure lista todos os autores no banco de dados.
-- Autor: [Renan Salvador de Santana]
-- Data de Criação: [25/09]
-- Última Modificação: [25/09]

-- Parâmetros:
-- Nenhum

-- Retorno:
-- A stored procedure não retorna resultados, mas imprime na saída os nomes e sobrenomes de todos os autores.

CREATE PROCEDURE sp_ListarAutores
AS
BEGIN
    -- Seleciona os nomes e sobrenomes de todos os autores
    SELECT Nome, Sobrenome
    FROM Autor;
END;
