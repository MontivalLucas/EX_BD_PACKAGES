# Exercicio Banco de dados - Pacotes PL/SQL

Este repositório contém pacotes PL/SQL para o gerenciamento de informações relacionadas aos alunos, disciplinas e professores em um sistema acadêmico. As operações implementadas incluem a manipulação de dados, como cadastro, exclusão e consulta de alunos, disciplinas e turmas. O código foi desenvolvido para garantir a eficiência e robustez na gestão das informações acadêmicas.

## Estrutura dos Arquivos

- **Tabela.sql**: Script para criação das tabelas necessárias no banco de dados.
- **PKG_ALUNO.SQL**: Pacote PL/SQL relacionado à gestão dos alunos.
- **PKG_DISCIPLINA.SQL**: Pacote PL/SQL relacionado à gestão das disciplinas.
- **PKG_PROFESSOR.SQL**: Pacote PL/SQL relacionado à gestão dos professores.

---

## Como Executar

### Pré-requisitos:

1. **Banco de Dados Oracle**: Certifique-se de que o Oracle está instalado e configurado corretamente.

### Passos para Execução:

1. **Criação de Tabelas**:
   - Abra o SQL Developer.
   - Execute o script `Tabela.sql` para criar as tabelas no banco de dados. O comando pode ser:
     ```sql
     @Tabela.sql
     ```

2. **Criação dos Pacotes**:
   - Após criar as tabelas, execute os scripts dos pacotes para criar as funções e procedimentos:
     ```sql
     -- Criação do Pacote PKG_ALUNO
     @PKG_ALUNO.sql
     
     -- Criação do Pacote PKG_DISCIPLINA
     @PKG_DISCIPLINA.sql
     
     -- Criação do Pacote PKG_PROFESSOR
     @PKG_PROFESSOR.sql
     ```
