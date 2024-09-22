-----Script de Criação Automática de Triggers para Chaves Primárias
/*
Criação_Triggers_Automática.sql

Este script em PL/SQL verifica todas as tabelas de um schema específico no banco de dados Oracle, 
identifica as chaves primárias de cada tabela e cria triggers automáticas de inserção sequencial 
para as tabelas que ainda não possuem triggers associadas. 
O script garante que as triggers sejam geradas apenas para tabelas com chaves primárias e evita duplicação, 
criando triggers apenas quando necessário. 
A trigger gerada atribui automaticamente o próximo valor sequencial à chave primária durante a inserção de novos registros.
*/

DECLARE
    v_database_name VARCHAR2(100) := 'NOME_DB_SEMED'; -- Nome do banco de dados (schema)
    v_table_name VARCHAR2(100); -- Nome da tabela atual
    v_primary_key VARCHAR2(100); -- Nome da chave primária atual
    v_trigger_name VARCHAR2(100); -- Nome da trigger
    v_trigger_count INTEGER; -- Variável para armazenar a contagem de triggers
    
    -- Cursor para obter todas as tabelas do schema especificado
    CURSOR table_cursor IS
        SELECT table_name
        FROM all_tables
        WHERE owner = v_database_name
        AND table_name NOT LIKE 'BIN$%'; -- Exclui possíveis tabelas temporárias de recycle bin

BEGIN
    -- Loop para percorrer todas as tabelas do schema
    FOR table_rec IN table_cursor LOOP
        v_table_name := table_rec.table_name;
        v_trigger_name := 'TRG_' || v_table_name;

        -- Verificar se a tabela possui chave primária e obter o nome da chave primária
        BEGIN
            SELECT cols.column_name
            INTO v_primary_key
            FROM all_constraints cons
            JOIN all_cons_columns cols ON cons.constraint_name = cols.constraint_name
            WHERE cons.constraint_type = 'P' -- Tipo 'P' indica chave primária
            AND cons.owner = v_database_name
            AND cons.table_name = v_table_name
            AND ROWNUM = 1; -- Pega apenas a primeira coluna (caso tenha mais de uma, ou seja composta)

            -- Verificar se a trigger já existe para essa tabela
            SELECT COUNT(*)
            INTO v_trigger_count
            FROM all_triggers
            WHERE trigger_name = v_trigger_name
            AND table_name = v_table_name
            AND owner = v_database_name;

            -- Se a trigger não existir, cria a trigger
            IF v_trigger_count = 0 THEN
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
                
                DBMS_OUTPUT.PUT_LINE('Trigger criada para a tabela: ' || v_table_name);
            ELSE
                DBMS_OUTPUT.PUT_LINE('Trigger já existe para a tabela: ' || v_table_name);
            END IF;

        EXCEPTION
            -- Se não houver chave primária, captura o erro e continua para a próxima tabela
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Nenhuma chave primária encontrada para a tabela: ' || v_table_name);
        END;

    END LOOP;
END;
/
