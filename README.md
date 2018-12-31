<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/43869499-ce6ce122-9b40-11e8-8894-e0c48eabf270.png" width="320" alt="Web Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/web-template">
        <img src="https://circleci.com/gh/vapor/web-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.1-brightgreen.svg" alt="Swift 4.1">
    </a>
</p>

# Zap Talk Swift Server Side
> Exemplo de projeto backend com Vapor 3.0

## Requisitos do ambiente

### Dependências e Versões
* Swift 4.2
* PostgreSQL 11
* Vapor 3.0

----

## Executando o Projeto

Após clonar o repositório, execute o seguinte comando para gerar a build do projeto:
```sh
$ vapor build
```

Em seguida, inicie o projeto utilizando:
```sh
$ vapor run
```

### Usuários de macOS
Também há opção de utilizar o Xcode com o projeto. Para isso, execute:
```sh
$ vapor xcode
```

----

## End Points

### Client
* http://localhost:8080/client/drivers

### API
* Create - POST http://localhost:8080/api/drivers
com o seguinte body:
```
{
    "name": "Ayrton Senna",
    "team": "McLaren"
}
```

* Read - GET http://localhost:8080/api/drivers
* Update - PATCH http://localhost:8080/api/drivers/1 (onde 1 é id do registro a ser atualizado)
com o seguinte body:
```
{
    "name": "Novo nome",
    "team": "Novo time"
}
```
* Destroy - DELETE http://localhost:8080/api/drivers/1 (onde 1 é id do registro a ser removido)
