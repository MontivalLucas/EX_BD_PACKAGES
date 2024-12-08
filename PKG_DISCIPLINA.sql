CREATE OR REPLACE PACKAGE PKG_DISCIPLINA AS
    -- Procedure para cadastrar uma nova disciplina
    PROCEDURE cadastrar_disciplina(nome IN VARCHAR2, descricao IN CLOB, carga_horaria IN NUMBER);
    
    -- Cursor para contar o total de alunos por disciplina
    CURSOR total_alunos_por_disciplina IS
        SELECT d.nome, COUNT(m.id_aluno) AS total_alunos
        FROM disciplina d
        LEFT JOIN matricula m ON d.id_disciplina = m.id_disciplina
        GROUP BY d.id_disciplina, d.nome
        HAVING COUNT(m.id_aluno) > 10;
    
    -- Cursor para média de idade por disciplina
    CURSOR media_idade_por_disciplina(id_disciplina IN NUMBER) IS
        SELECT AVG(MONTHS_BETWEEN(SYSDATE, a.data_nascimento) / 12) AS media_idade
        FROM aluno a
        JOIN matricula m ON a.id_aluno = m.id_aluno
        WHERE m.id_disciplina = id_disciplina;
    
    -- Procedure para listar alunos de uma disciplina
    PROCEDURE listar_alunos_por_disciplina(id_disciplina IN NUMBER);
END PKG_DISCIPLINA;
/

CREATE OR REPLACE PACKAGE BODY PKG_DISCIPLINA AS

    -- Implementação da procedure cadastrar disciplina
    PROCEDURE cadastrar_disciplina(nome IN VARCHAR2, descricao IN CLOB, carga_horaria IN NUMBER) IS
    BEGIN
        INSERT INTO disciplina (nome, descricao, carga_horaria) 
        VALUES (nome, descricao, carga_horaria);
    END cadastrar_disciplina;

    -- Implementação da procedure listar alunos por disciplina
    PROCEDURE listar_alunos_por_disciplina(id_disciplina IN NUMBER) IS
        CURSOR c_alunos IS
            SELECT a.nome
            FROM aluno a
            JOIN matricula m ON a.id_aluno = m.id_aluno
            WHERE m.id_disciplina = id_disciplina;
    BEGIN
        FOR aluno IN c_alunos LOOP
            DBMS_OUTPUT.PUT_LINE('Aluno: ' || aluno.nome);
        END LOOP;
    END listar_alunos_por_disciplina;

END PKG_DISCIPLINA;
/
