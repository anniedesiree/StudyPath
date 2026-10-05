<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String usuario =
            (String) session.getAttribute("usuarioLogado");
    if(usuario == null){
        response.sendRedirect("login.jsp");
        return;
    }
    String nome =
            (String) session.getAttribute("nomeUsuario");
    String email =
            (String) session.getAttribute("emailUsuario");
    String cpf =
            (String) session.getAttribute("cpfUsuario");
    String celular =
            (String) session.getAttribute("celularUsuario");

    if(nome == null){
        nome = "";
    }
    if(email == null){
        email = "";
    }
    if(cpf == null){
        cpf = "";
    }
    if(celular == null){
        celular = "";
    }
    String mensagem = "";
    if("POST".equalsIgnoreCase(request.getMethod())){
        nome =
            request.getParameter("nome");
        email =
            request.getParameter("email");
        cpf =
            request.getParameter("cpf");
        celular =
            request.getParameter("celular");

        session.setAttribute(
                "nomeUsuario",
                nome
        );
        session.setAttribute(
                "emailUsuario",
                email
        );
        session.setAttribute(
                "cpfUsuario",
                cpf
        );
        session.setAttribute(
                "celularUsuario",
                celular
        );
        mensagem =
                "Perfil atualizado com sucesso!";
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyPath - Perfil</title>
    <link rel="stylesheet" href="PerfilCSS.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
    <script>
    function validarPerfil(){
    let nome =
        document.getElementById("nome").value;
    let email =
        document.getElementById("email").value;
    let cpf =
        document.getElementById("cpf").value;
    if(nome.trim() === ""){
        alert("Informe seu nome.");
        return false;
    }
    if(email.trim() === ""){
        alert("Informe seu e-mail.");
        return false;
    }
    if(cpf.trim() === ""){
        alert("Informe seu CPF.");
        return false;
    }
    return true;
    }
    </script>
</head>
<body>
<div class="container">
    <div class="perfil-card">
        <div class="avatar">
            <i class="fa-solid fa-user-graduate"></i>
        </div>
        <h1>Meu Perfil</h1>
        <% if(!mensagem.isEmpty()){ %>
            <div class="sucesso">
                <%= mensagem %>
            </div>
        <% } %>
        <form method="post" onsubmit="return validarPerfil()">
            <div class="campo">
                <label>Nome</label>
                <input
                        type="text"
                        id="nome"
                        name="nome"
                        value="<%= nome %>">
            </div>
            <div class="campo">
                <label>Email</label>
                <input
                        type="email"
                        id="email"
                        name="email"
                        value="<%= email %>">
            </div>
            <div class="campo">
                <label>CPF</label>
                <input
                        type="text"
                        id="cpf"
                        name="cpf"
                        value="<%= cpf %>">
            </div>
            <div class="campo">
                <label>Celular</label>
                <input
                        type="text"
                        id="celular"
                        name="celular"
                        value="<%= celular %>">
            </div>
            <div class="esqueci-senha">
            <a href="#">
                Esqueci minha senha
            </a>
            </div>
            <button type="submit">
                Salvar Alterações
            </button>
        </form>
        <div class="acoes">
            <a href="Menu.jsp">
                <i class="fa-solid fa-house"></i>
                Voltar ao Menu
            </a>
            <a href="Login.jsp">
                <i class="fa-solid fa-right-from-bracket"></i>
                Sair
            </a>
        </div>
    </div>
</div>
</body>
</html>