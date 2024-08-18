-- Declaração de variáveis
DECLARE
    v_username VARCHAR2(50) := 'nome-do-banco-de-dados';
    v_password VARCHAR2(50) := 'senha';
BEGIN
    -- Criação do usuário com as variáveis
    EXECUTE IMMEDIATE 'CREATE USER ' || v_username || ' IDENTIFIED BY "' || v_password || '" ' ||
                      'DEFAULT TABLESPACE USERS ' ||
                      'TEMPORARY TABLESPACE TEMP ' ||
                      'ACCOUNT UNLOCK';

    -- Atribuição de quotas
    EXECUTE IMMEDIATE 'ALTER USER ' || v_username || ' QUOTA 100M ON USERS';

    -- Privilégios principais
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO ' || v_username;

    -- Privilégios avançados
    EXECUTE IMMEDIATE 'GRANT DBA TO ' || v_username;

    -- Privilégios específicos
    EXECUTE IMMEDIATE 'GRANT CREATE DATABASE LINK TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE MATERIALIZED VIEW TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE PROCEDURE TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE PUBLIC SYNONYM TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE ROLE TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE SEQUENCE TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE SYNONYM TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE TABLE TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE TRIGGER TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE TYPE TO ' || v_username;
    EXECUTE IMMEDIATE 'GRANT CREATE VIEW TO ' || v_username;
END;
/
