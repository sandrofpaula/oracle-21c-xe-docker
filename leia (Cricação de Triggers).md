# Leia-me: Criação de Triggers Automáticas e Específicas no Oracle

Este repositório contém dois arquivos SQL que automatizam a criação de triggers em tabelas de um banco de dados Oracle. Abaixo está uma descrição de cada um dos arquivos e sua funcionalidade.

## 1. Criação_Triggers_Automática.sql

**Objetivo:**  
Este script cria triggers automaticamente para todas as tabelas de um schema específico no banco de dados Oracle. Ele verifica todas as tabelas que possuem chaves primárias e cria triggers apenas para aquelas que ainda não têm.

### Funcionamento:
- O script percorre todas as tabelas do schema informado (`v_database_name`).
- Para cada tabela que possui uma chave primária e não possui uma trigger, o script cria uma trigger.
- A trigger criada atribui automaticamente um valor sequencial à chave primária sempre que um novo registro é inserido na tabela.
- Se a tabela estiver vazia, o valor inicial será `1`. Caso contrário, será o próximo valor sequencial baseado no maior valor existente na coluna da chave primária.

## 2. Criação_Triggers_Específica.sql

**Objetivo:**  
Este script cria uma trigger para uma tabela específica, garantindo que o valor da chave primária seja automaticamente incrementado durante as inserções de novos registros.

### Funcionamento:
- O usuário define três parâmetros:
  - **v_database_name**: O nome do schema onde a tabela está localizada.
  - **v_table_name**: O nome da tabela para a qual a trigger será criada.
  - **v_primary_key**: O nome da coluna de chave primária da tabela.
- A trigger gerada automaticamente incrementa a chave primária sempre que um novo registro é inserido na tabela, similar ao comportamento de uma sequência.
- O script verifica se a tabela está vazia, começando a contagem de `1` se não houver registros, ou adiciona `1` ao maior valor existente na chave primária.

---

## Como Utilizar os Scripts

1. Abra o arquivo SQL correspondente (`Criação_Triggers_Automática.sql` ou `Criação_Triggers_Específica.sql`) em sua ferramenta de SQL preferida (como Oracle SQL Developer).
2. No arquivo `Criação_Triggers_Automática.sql`, ajuste o valor de `v_database_name` para corresponder ao nome do seu schema.
3. No arquivo `Criação_Triggers_Específica.sql`, ajuste os valores de `v_database_name`, `v_table_name` e `v_primary_key` conforme necessário.
4. Execute o script na sua instância do Oracle.

## Arquivos

- **Criação_Triggers_Automática.sql**: Script para criar triggers automaticamente para todas as tabelas que possuem chaves primárias em um schema.
- **Criação_Triggers_Específica.sql**: Script para criar uma trigger específica para uma única tabela definida pelo usuário.
