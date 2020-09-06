# Ambiente para desenvolvimento PHP em docker 🐳

## Contêiner para execução de múltiplos projetos PHP baseado em subdomínios.

### 📦 Stack

 - php 7.1
 - Apache 2.4.46
 - MySql 5.6
 - PhpMyAdmin *lastest*
 - Composer 7.2

### ⚙ Instalação

Em ``` sites-available ``` renomeie o arquivo ```000-default.conf.example``` para ```000-default.conf```

Intale o Docker e o Docker compose em sua máquina.

Em seu terminal execute

``` docker-composer up ```

As imagens necessárias serão baixadas e os contêineres serão levantados.

### ✨ Adicionando um projeto

 - Crie em ```projects``` uma nova pasta para o seu projeto.
 - Em ``` sites-available ```  adicione um novo sub-domínio no arquivo ```000-default.conf``` conforme o exemplo

 ```
 <VirtualHost *:80>
    DocumentRoot /var/www/html/projects/public
    ServerName subdomain.localhost
</VirtualHost>
 ```

 Em DocumentRoot informe a pasta com o arquivo de execução da aplicação, geralmente localizado em ```public```

 Em ServerName coloque o nome que desejar para acessar a aplicação em localhost. (Não remova a terminação *.localhost*)

Suba novamente o contêiner porém com o seguinte comando

``` docker-composer up --build```

### 🚪 Portas

  Por padrão as aplicações estão disponíveis nas seguites portas de *localhost* 🏠.

  - PHP/Apache :8000
  - MySql :4000
  - PhpMyAdmin :4001

### 🎲 Banco de Dados e PhpMyAdmin

  - Para importar uma base de dados, adicione um arquivo .sql na pasta ```bdimport```, ao inicar a imagem, os camandos serão executados.
  - Ao acessar o PhpMyAdmin, em server, adicione o nome do contêiner *db*

### 🙋‍♂️ Composer

  Se os seus projetos utilizarem o composer, você pode criar novas instâncias para execuções indíviduais em cada projeto ou utiliza-lo de forma manual.

  Para executar o composer pelo docker-compose crie uma nova imagem no arquivo ```docker-compose```.

```
composer:
    image: prooph/composer:7.2
    volumes:
        - ./webserverdata/projects/pasta_do_projeto:/nomeprojeto
    working_dir: /nomeprojeto
    command: install
```
Onde se encontra *nomeprojeto* altere para o Nome de seu Projeto


### 🐧 Linux

  No linux, se atente a garantir as permissões necessárias na pasta ```webserverdata```, principalmente se for necessário que o php altere/leia arquivos.