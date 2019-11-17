# Rails REST API

Essa API foi desenhada com uma `CRUD de Plataformas`, cada uma contendo obrigatoriamente nome e email únicos,  usando o padrão `REST`.

Acesse a API pelo domínio: https://rest-platform-api.herokuapp.com/

## Resposta da API
Todos os retornos da API seguem o padrão:
``` json
{
    "message": "",
    "data": {}
}
```
* message - Carrega uma mensagem complementar ao status da resposta
* data - Quando há sucesso na requisição carrega os dados solicitados ou auxiliares da ação e quando há erros de validação envia detalhes dos erros

Veja detalhes dos Endpoints com exemplos de sucesso e erros na [documentação da API](https://documenter.getpostman.com/view/4045681/SW7T8BaP).


Antes de testar em development e test não se esqueça de configurar a autorização do BD Postgresql em `config/database.yml`

## Testes Automatizados

Os testes automatizados da API foram implementados com `Rspec` por meio da gem `rspec_rails`

Para testá-la é necessário criar o banco de dados de testes e migrar as tabelas no ambiente de testes:
```sh
    $ rake db:create db:migrate RAILS_ENV=test
```

Para executar o teste rode o comando:
```sh
    $ rails spec
```
Os testes irão verificar:
* Rotas - REST CRUD Platform
* Model - Platform
* Controller - Platforms