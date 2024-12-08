CREATE OR REPLACE PACKAGE PKG_PROFESSOR AS
    -- Cursor para total de turmas por professor
    CURSOR total_turmas_por_professor IS
        SELECT p.nome, COUNT(t.id_turma) AS total_turmas
        FROM professor p
        LEFT JOIN turma t ON p.id_professor = t.id_professor
        GROUP BY p.id_professor, p.nome
        HAVING COUNT(t.id_turma) > 1;
    
    -- Function para total de turmas de um professor
    FUNCTION total_turmas(id_professor IN NUMBER) RETURN NUMBER;
    
    -- Function para nome do professor de uma disciplina
    FUNCTION professor_disciplina(id_disciplina IN NUMBER) RETURN VARCHAR2;
END PKG_PROFESSOR;
/

CREATE OR REPLACE PACKAGE BODY PKG_PROFESSOR AS

    -- Implementação da function total de turmas de um professor
    FUNCTION total_turmas(id_professor IN NUMBER) RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(t.id_turma) INTO v_total
        FROM turma t
        WHERE t.id_professor = id_professor;
        RETURN v_total;
    END total_turmas;

    -- Implementação da function professor de uma disciplina
    FUNCTION professor_disciplina(id_disciplina IN NUMBER) RETURN VARCHAR2 IS
        v_nome_professor VARCHAR2(100);
    BEGIN
        SELECT p.nome INTO v_nome_professor
        FROM professor p
        JOIN turma t ON p.id_professor = t.id_professor
        WHERE t.id_disciplina = id_disciplina;
        RETURN v_nome_professor;
    END professor_disciplina;

END PKG_PROFESSOR;
/
