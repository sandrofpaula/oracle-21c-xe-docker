# **Ambiente Docker para Oracle 21c XE**

| **Português (Brasil)** | **English** |
|------------------------|-------------|
| ## Descrição | ## Description |
| Este repositório contém a configuração de um ambiente Docker para o Oracle Database Express Edition 21c (Oracle XE). A configuração usa o Docker Compose para orquestrar os contêineres necessários para executar o banco de dados Oracle em um ambiente isolado. Este setup é ideal para desenvolvedores que precisam de um ambiente Oracle local para testes e desenvolvimento. | This repository contains the Docker setup for Oracle Database Express Edition 21c (Oracle XE). The configuration uses Docker Compose to orchestrate the containers required to run the Oracle database in an isolated environment. This setup is ideal for developers who need a local Oracle environment for testing and development. |
| ## Requisitos | ## Requirements |
| - Docker <br> - Docker Compose | - Docker <br> - Docker Compose |
| ## Instruções de Uso | ## Usage Instructions |
| 1. **Clone o repositório:** <br> ```git clone https://github.com/sandrofpaula/oracle-21c-xe-docker.git``` <br> ```cd oracle-21c-xe-docker``` <br><br> 2. **Suba os contêineres:** <br> ```docker-compose up -d``` <br> Isso iniciará o contêiner do Oracle XE e o banco de dados estará acessível em `localhost:1521`. <br><br> 3. **Acesse o Oracle Enterprise Manager:** <br> Acesse via browser em: [https://localhost:5500/em](https://localhost:5500/em) <br><br> 4. **Para parar os contêineres:** <br> ```docker-compose down``` | 1. **Clone the repository:** <br> ```git clone https://github.com/sandrofpaula/oracle-21c-xe-docker.git``` <br> ```cd oracle-21c-xe-docker``` <br><br> 2. **Start the containers:** <br> ```docker-compose up -d``` <br> This will start the Oracle XE container, and the database will be accessible at `localhost:1521`. <br><br> 3. **Access Oracle Enterprise Manager:** <br> Open in your browser: [https://localhost:5500/em](https://localhost:5500/em) <br><br> 4. **To stop the containers:** <br> ```docker-compose down``` |
| ## Configurações | ## Configuration |
| - **Portas:** <br> - `1521`: Porta padrão do Oracle Database. <br> - `5500`: Porta para o Oracle Enterprise Manager. <br><br> - **Variáveis de Ambiente:** <br> - `ORACLE_PASSWORD`: Define a senha para os usuários administrativos (`sys`, `system`). <br> - `ORACLE_CHARACTERSET`: Define o conjunto de caracteres do banco de dados para `AL32UTF8`. | - **Ports:** <br> - `1521`: Default port for Oracle Database. <br> - `5500`: Port for Oracle Enterprise Manager. <br><br> - **Environment Variables:** <br> - `ORACLE_PASSWORD`: Sets the password for administrative users (`sys`, `system`). <br> - `ORACLE_CHARACTERSET`: Sets the database character set to `AL32UTF8`. |
| ## Volumes | ## Volumes |
| O volume `oracle-data` é usado para persistir os dados do banco de dados, garantindo que eles não sejam perdidos entre reinicializações do contêiner. | The `oracle-data` volume is used to persist the database data, ensuring that it is not lost between container restarts. |
| ## Rede | ## Network |
| A rede `oracle-net` é uma rede do tipo bridge usada para a comunicação entre contêineres. | The `oracle-net` is a bridge network used for communication between containers. |
| ## Usar SQL Developer para Gerenciamento | ## Using SQL Developer for Management |
| Se você está buscando uma interface gráfica para gerenciar o banco de dados, você pode usar o Oracle SQL Developer, que é uma ferramenta gratuita e poderosa para administração de bancos de dados Oracle. <br><br> Você pode baixar o SQL Developer [aqui](https://www.oracle.com/tools/downloads/sqldev-downloads.html) e conectar-se ao Oracle 21c XE usando as seguintes credenciais: <br><br> - **Host:** localhost <br> - **Porta:** 1521 (baseado no seu mapeamento) ou 1522 (caso haja conflito) <br> - **Service Name:** XEPDB1 (para conectar ao PDB padrão) ou XE (para conectar ao CDB) <br> - **Usuário:** system <br> - **Senha:** oracle123 | If you are looking for a graphical interface to manage the database, you can use Oracle SQL Developer, which is a free and powerful tool for Oracle database administration. <br><br> You can download SQL Developer [here](https://www.oracle.com/tools/downloads/sqldev-downloads.html) and connect to Oracle 21c XE using the following credentials: <br><br> - **Host:** localhost <br> - **Port:** 1521 (based on your mapping) or 1522 (in case of conflict) <br> - **Service Name:** XEPDB1 (to connect to the default PDB) or XE (to connect to the CDB) <br> - **User:** system <br> - **Password:** oracle123 |
| ## Comandos Úteis | ## Useful Commands |
| - Para reconstruir a imagem Docker: <br> ```docker-compose up --build -d``` <br><br> - Para visualizar os logs: <br> ```docker-compose logs -f``` <br><br> - Para parar os contêineres: <br> ```docker-compose down``` | - To rebuild the Docker image: <br> ```docker-compose up --build -d``` <br><br> - To view logs: <br> ```docker-compose logs -f``` <br><br> - To stop the containers: <br> ```docker-compose down``` |

---

### … ou criar um novo repositório na linha de comando
echo "# oracle-21c-xe-docker" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/sandrofpaula/oracle-21c-xe-docker.git
git push -u origin main
### … ou envie um repositório existente a partir da linha de comando
git remote add origin https://github.com/sandrofpaula/oracle-21c-xe-docker.git
git branch -M main
git push -u origin main