CREATE OR REPLACE PACKAGE PKG_ALUNO AS
    -- Procedure para excluir aluno e suas matrículas
    PROCEDURE excluir_aluno(id_aluno IN NUMBER);
    
    -- Cursor para listar alunos maiores de 18 anos
    CURSOR lista_maiores_18 IS
        SELECT nome, data_nascimento
        FROM aluno
        WHERE data_nascimento <= ADD_MONTHS(SYSDATE, -18 * 12);
    
    -- Cursor para listar alunos por curso
    CURSOR lista_alunos_por_curso(id_curso IN NUMBER) IS
        SELECT a.nome
        FROM aluno a
        JOIN matricula m ON a.id_aluno = m.id_aluno
        WHERE m.id_disciplina IN (SELECT id_disciplina FROM disciplina WHERE id_curso = id_curso);
END PKG_ALUNO;
/

CREATE OR REPLACE PACKAGE BODY PKG_ALUNO AS

    -- Implementação da procedure excluir aluno
    PROCEDURE excluir_aluno(id_aluno IN NUMBER) IS
    BEGIN
        DELETE FROM matricula WHERE id_aluno = id_aluno;
        DELETE FROM aluno WHERE id_aluno = id_aluno;
    END excluir_aluno;
    
END PKG_ALUNO;
/
