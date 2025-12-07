# Projeto Ruby “Adivinhar Número”

Projetinho simples em Ruby onde o usuário tenta adivinhar o número escolhido pela máquina.<br/>
Aqui demonstramos:
* Como criar uma imagem Docker
* Como subir no Docker Hub
* Como rodar em uma instância remota via Play With Docker

## Dockerizando

### 1° Passo - Criar uma imagem do projeto
```bash
    docker build -t adivinhar-numero-ruby .
```
### 2° Passo - Rodar a imagem localmente
```bash
    # Verificar images existente
    docker images

    # Ou usar com filtro para buscar a imagem
    docker images | grep adivinhar-numero-ruby

    # Rodar a imagem 
    docker run -it adivinhar-numero-ruby

    # Para o container
    docker stop <ID_CONTAINER>
```
### 3° Passo - Preparar repositório no Docker Hub
Para poder subir a imagem para docker hub, você precisa ter uma conta no docker hub.<br/>
* Para fazer login acesse https://login.docker.com/u/login/, caso não tenho criar uma conta https://app.docker.com/signup.
* Selecione o botão `Create Repository`.
* Dar um nome de `adivinhar-numero-ruby`, Deixar o Repositório como `Public`.
* Selecionar `Create`
### 4° Passo - Subir a imagem para o Docker Hub
**Primeiramente fazer login no docker hub**
```bash
    docker login
```
Digite seu:
* *username*
* *senha*
Mensagem esperada:
```bash
    Login Succeeded
```
Criar tag com seu namespace
```bash
    docker tag adivinhar-numero-ruby:latest SEU_USUARIO/adivinhar-numero-ruby:latest

    # Vericar nova imagem
    docker images
    <SEU-USUARIO>/adivinhar-numero:latest         0c18d82396da        113MB         37.7MB    U  
```
**Subir a imagem para docker hub**
```bash
    docker push <SEU-USUARIO>/adivinhar-numero:latest
```
Saida:
```bash
    The push refers to repository [docker.io/SEU_USUARIO/adivinhar-numero-ruby]
    latest: digest: sha256:.... size: ...
```
### 5° Passo - Executar a imagem em uma nova instância com Play with Docker.
* Acesse https://labs.play-with-docker.com/ 
* Clique em `Start`
* Acesse `ADD NEW INSTANCE`
* Acesso ao terminal será liberado
Com acesso ao terminal rodar o seguinte comando:
```bash
    docker pull <SEU_USUARIO>/adivinhar-numero:latest

    # Verificar se a imagem foi baixada com sucesso
    docker images
```
Rodar a imagem da instância nova:
```bash
    docker run -it docker run -it SEU_USUARIO/adivinhar-numero-ruby:latest
```


