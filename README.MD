# 📚 StudyPath

<p align="center">
  <strong>Uma plataforma gratuita de apoio aos estudantes na preparação para vestibulares.</strong>
</p>

---

## 📌 Status do Projeto

🚧 **Em Desenvolvimento**

O StudyPath está sendo desenvolvido em etapas, conforme o cronograma estabelecido para as Sprints acadêmicas.

### Funcionalidades

- [x] Estrutura inicial do projeto
- [x] Tela de Login
- [x] Tela de Cadastro
- [x] Menu Principal
- [x] Tela de Perfil
- [x] Controle básico de sessão com JSP
- [x] Validações com JavaScript
- [ ] Cronograma de Estudos
- [ ] Materiais Gratuitos
- [ ] Banco de Questões
- [ ] Canais Recomendados
- [ ] Meu Desempenho
- [ ] Contato/Suporte
- [ ] Sobre o Projeto

---

## 📖 Sobre o Projeto

O **StudyPath** é um projeto acadêmico desenvolvido com o objetivo de auxiliar estudantes, principalmente aqueles que não possuem condições financeiras para frequentar cursos preparatórios particulares.

A plataforma reúne funcionalidades voltadas à organização dos estudos e ao acesso a conteúdos gratuitos, como materiais de apoio, banco de questões e canais de estudo.

O projeto foi desenvolvido para a disciplina de **Web Standards / Desenvolvimento Web**, utilizando **HTML, CSS, JavaScript e JavaServer Pages (JSP)**.

---

## 🎯 Objetivo

O objetivo do StudyPath é tornar a preparação para vestibulares mais acessível, oferecendo aos estudantes uma plataforma onde possam:

- 📅 Organizar sua rotina de estudos;
- 📚 Encontrar materiais gratuitos;
- 📝 Acessar questões e simulados;
- ▶️ Encontrar canais gratuitos de estudo;
- 👤 Gerenciar seus dados pessoais;
- 📊 Acompanhar seu desempenho;
- 💬 Entrar em contato com a plataforma.

A proposta surgiu da necessidade de oferecer uma alternativa gratuita ou de baixo custo para estudantes que desejam se preparar para vestibulares.

---

## 👥 Público-Alvo

O StudyPath é direcionado principalmente a:

- Estudantes;
- Pessoas que estão se preparando para vestibulares;
- Estudantes que não possuem condições financeiras para cursos preparatórios;
- Pessoas que procuram materiais gratuitos para complementar seus estudos.

---

## 💻 Tecnologias Utilizadas

O projeto utiliza as seguintes tecnologias:

### HTML5

Responsável pela estrutura e organização dos elementos das páginas.

### CSS3

Responsável pela estilização, identidade visual, layouts, cores, botões, cards e responsividade.

### JavaScript

Utilizado para adicionar interatividade e validações às páginas, como:

- Validação de formulários;
- Validação de senha;
- Pesquisa de funcionalidades;
- Interações com botões;
- Comportamentos dinâmicos da interface.

### JavaServer Pages (JSP)

Utilizado para integrar a interface com a lógica executada no servidor.

No projeto, o JSP é utilizado para:

- Receber dados enviados pelos formulários;
- Recuperar informações através de `request`;
- Armazenar informações utilizando `session`;
- Exibir informações dinamicamente nas páginas;
- Controlar o acesso às páginas;
- Redirecionar usuários;
- Realizar o controle básico da sessão de login.

---

## 🖥️ Páginas do Projeto

O StudyPath foi planejado com as seguintes telas:

| Página | Descrição |
|---|---|
| 🔐 **Login** | Entrada do usuário na plataforma |
| 📝 **Cadastro** | Criação de uma conta |
| 🏠 **Menu Principal** | Página inicial com acesso às principais funcionalidades |
| 👤 **Perfil** | Visualização e edição dos dados do usuário |
| 📅 **Cronograma** | Organização personalizada dos estudos |
| 📚 **Materiais Gratuitos** | Acesso a materiais e conteúdos de apoio |
| 📝 **Banco de Questões** | Questões, simulados e provas anteriores |
| ▶️ **Canais Recomendados** | Indicação de canais gratuitos de estudo |
| 📊 **Meu Desempenho** | Acompanhamento do desempenho do estudante |
| 💬 **Contato/Suporte** | Envio de dúvidas e sugestões |
| ℹ️ **Sobre o Projeto** | Informações sobre a proposta do StudyPath |

---

## 🔐 Sistema de Login

O sistema de login utiliza JSP para realizar o controle básico da sessão do usuário.

O fluxo desenvolvido é:

```text
Cadastro
   ↓
Dados armazenados na sessão
   ↓
Login
   ↓
Validação de e-mail e senha
   ↓
Criação da sessão do usuário
   ↓
Menu Principal
```

## 🚀 Como Executar o Projeto Localmente

### 📋 Pré-requisitos

Antes de executar o projeto, certifique-se de ter instalado:

- XAMPP
- MySQL
- MySQL Workbench ou phpMyAdmin
- Java/JDK
- Apache Tomcat
- Uma IDE para execução do projeto

### 🔧 Passo a Passo

#### 1. Clone o repositório

Clone o repositório dentro da pasta `webapps`, localizada na pasta do Tomcat do seu XAMPP:

```text
C:\xampp\tomcat\webapps\
```

Execute o comando:

```bash
git clone https://github.com/anniedesiree/ProjetoJavaServerPage_Faculdade.git
```

#### 2. Inicie os serviços

Abra o **Painel de Controle do XAMPP** e clique em **Start** nos serviços:

* Apache
* MySQL

#### 3. Importe o Banco de Dados

Acesse o **phpMyAdmin** pelo navegador:

```text
http://localhost/phpmyadmin
```

Em seguida:

1. Crie um banco de dados chamado `studypath`;
2. Acesse a aba **Importar**;
3. Selecione o arquivo `studypath.sql`, disponível na raiz do projeto;
4. Execute a importação;
5. Verifique se as tabelas do banco foram criadas corretamente.

#### 4. Execute o projeto

Após configurar o banco de dados, abra o projeto na sua IDE e execute-o utilizando o **Apache Tomcat**.

Com o projeto em execução, acesse a tela de **Cadastro** pelo navegador.

Preencha as informações solicitadas e realize o cadastro.

Os dados inseridos poderão ser conferidos diretamente na tabela correspondente do banco de dados `studypath/usuarios`.

#### 5. Teste o Login

Após realizar o cadastro, acesse a tela de **Login** e utilize os dados cadastrados.

Se o login for realizado corretamente, será possível acessar o **Menu Principal** e navegar pelas funcionalidades disponíveis do StudyPath.

### 🔄 Fluxo de Execução

```text
Clone do projeto
       ↓
Configuração do XAMPP
       ↓
Apache + MySQL
       ↓
Criação do banco "studypath"
       ↓
Importação do "studypath.sql"
       ↓
Execução pelo Apache Tomcat
       ↓
Cadastro do usuário
       ↓
Dados gravados no MySQL
       ↓
Login
       ↓
Acesso ao StudyPath
```

---

## 🔮 Futuras Atualizações

O StudyPath encontra-se em desenvolvimento e possui algumas funcionalidades que poderão ser aprimoradas ou adicionadas futuramente.

Entre as principais atualizações planejadas estão:

* [ ] Aprimorar o sistema de autenticação e gerenciamento de usuários;
* [ ] Implementar a recuperação de senha;
* [ ] Permitir o upload e alteração da foto de perfil;
* [ ] Desenvolver o cronograma de estudos personalizado;
* [ ] Implementar o banco de questões;
* [ ] Adicionar e organizar mais materiais gratuitos para estudo;
* [ ] Desenvolver a área de canais recomendados;
* [ ] Implementar o acompanhamento de desempenho do usuário;
* [ ] Desenvolver a área de contato e suporte;
* [ ] Aprimorar a página "Sobre o Projeto";
* [ ] Melhorar a responsividade para diferentes tamanhos de tela;
* [ ] Implementar melhorias de acessibilidade;
* [ ] Realizar melhorias na interface e experiência do usuário;
* [ ] Aprimorar a integração entre as páginas, JSP e banco de dados;
* [ ] Realizar testes e correções gerais no sistema;
* [ ] Hospedar o projeto para disponibilização online.

---

### 🌐 Hospedagem

Como uma das futuras etapas do projeto, o **StudyPath será hospedado na Vercel**, permitindo que a plataforma possa ser acessada online sem a necessidade de executar o projeto localmente.

A hospedagem fará parte das etapas após a conclusão e adaptação de algumas funcionalidades necessárias para o ambiente de produção.