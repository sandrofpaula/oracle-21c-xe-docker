----Script de  Individual e Incremento de Triggers para Chaves Primárias Específica

/*
Criação_Triggers_Específica.sql
Este script PL/SQL cria dinamicamente uma trigger associada a uma tabela específica no banco de dados Oracle. 
A trigger é gerada para inserir automaticamente um valor sequencial na chave primária durante a inserção de novos registros na tabela. 
A trigger verifica se a tabela está vazia para iniciar a contagem de 1 ou calcula o próximo valor com base no maior valor existente na coluna da chave primária. 
O script é parametrizado para receber o nome da tabela, 
o nome da chave primária e o nome do banco de dados, permitindo flexibilidade na geração da trigger.
*/
DECLARE
    v_database_name VARCHAR2(100) := 'NOME_DB_SEMED'; -- Nome do banco de dados
    v_table_name VARCHAR2(100) := 'TB_TABELA_NOME'; -- Nome da tabela
    v_primary_key VARCHAR2(100) := 'TABELA_COD_PK'; -- Nome da chave primária
    v_trigger_name VARCHAR2(100) := 'TRG_' || v_table_name; -- Nome da trigger gerado
BEGIN
    EXECUTE IMMEDIATE '
    CREATE OR REPLACE TRIGGER ' || v_trigger_name || ' 
    BEFORE INSERT ON ' || v_database_name || '.' || v_table_name || '
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
    DECLARE
        total INTEGER;
    BEGIN
        SELECT COUNT(*) INTO total FROM ' || v_database_name || '.' || v_table_name || ';
        IF (total = 0) THEN
            SELECT 1 INTO :NEW.' || v_primary_key || ' FROM dual;
        ELSE
            SELECT MAX(NVL(' || v_primary_key || ', 0)) + 1
            INTO :NEW.' || v_primary_key || '
            FROM ' || v_database_name || '.' || v_table_name || ';
        END IF;
    END;';
    
    DBMS_OUTPUT.PUT_LINE('Trigger criada: ' || v_trigger_name);
END;
/
