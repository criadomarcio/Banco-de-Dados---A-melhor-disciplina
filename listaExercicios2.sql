-- Exercício 1: Listagem de Autores
CREATE PROCEDURE sp_ListarAutores
AS
BEGIN
    SELECT Nome, Sobrenome
    FROM Autor;
END;
