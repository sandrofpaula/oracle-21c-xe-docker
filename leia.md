
### Explicação Detalhada

1. **version: '3.8'**
   - Define a versão do `docker-compose` que está sendo usada. A versão `3.8` é compatível com as funcionalidades modernas do Docker.

2. **services:**
   - Esta seção define os serviços que serão iniciados. No nosso caso, é o serviço `oracle-db`, que representa o contêiner do Oracle Database 21c XE.

3. **image: gvenzl/oracle-xe:21-slim**
   - Especifica a imagem Docker a ser utilizada. A imagem `gvenzl/oracle-xe:21-slim` é uma versão leve do Oracle 21c XE, mantida pela comunidade, adequada para execução em contêineres.

4. **container_name: oracle-21c-xe**
   - Define um nome para o contêiner. Isso facilita a identificação e a gestão do contêiner no Docker.

5. **ports:**
   - Mapeia as portas do contêiner para o host, permitindo o acesso ao banco de dados e ao Oracle Enterprise Manager.
   - `1521:1521`: Mapeia a porta 1521 do contêiner (usada para conexões SQL*Net) para a porta 1521 do host.
   - `5500:5500`: Mapeia a porta 5500 do contêiner (usada para o Oracle Enterprise Manager) para a porta 5500 do host.

6. **environment:**
   - Define variáveis de ambiente para configurar o contêiner.
   - `ORACLE_PASSWORD=oracle123`: Define a senha padrão para os usuários `sys`, `system`, etc.
   - `ORACLE_CHARACTERSET=AL32UTF8`: Define o conjunto de caracteres do banco de dados como UTF-8, que é recomendado para garantir compatibilidade com diferentes idiomas e sistemas.

7. **volumes:**
   - Define volumes para persistência de dados.
   - `oracle-data:/opt/oracle/oradata`: Monta um volume no host que armazena os dados do Oracle DB. Isso garante que os dados do banco de dados não sejam perdidos ao reiniciar ou remover o contêiner.

8. **networks:**
   - Define a rede que será usada pelos serviços.
   - `oracle-net`: Cria uma rede do tipo `bridge`, que permite a comunicação entre contêineres no mesmo host. Isso é útil se você quiser adicionar outros serviços que precisam se comunicar com o banco de dados Oracle.

### Passos para Usar o Arquivo

1. **Salvar o arquivo `docker-compose.yml`:**
   - Salve o conteúdo acima em um arquivo chamado `docker-compose.yml`.

2. **Subir os contêineres:**
   - No diretório onde o arquivo `docker-compose.yml` foi salvo, execute o seguinte comando para iniciar o contêiner:
     ```sh
     docker-compose up -d
     ```

3. **Acessar o Oracle Enterprise Manager:**
   - Após o contêiner estar em execução, você pode acessar o Oracle Enterprise Manager em seu navegador através do endereço:
     ```
     https://localhost:5500/em
     ```
   - Para logar, você usará as credenciais definidas: usuário `sys` e senha `oracle123`.

4. **Conectar ao Banco de Dados:**
   - Host: `localhost`
   - Porta: `1521`
   - Service Name: `XEPDB1` (para o PDB padrão) ou `XE` (para o CDB)
   - Usuário: `system`
   - Senha: `oracle123`

Esse arquivo `docker-compose.yml` permite que você rapidamente configure e inicie um ambiente Oracle Database 21c XE com persistência de dados, acessível via SQL*Net e Oracle Enterprise Manager. Se precisar de mais alguma coisa ou tiver dúvidas, estou à disposição!