<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mensagemErro = "";
    String mensagemSucesso = "";

    if("POST".equalsIgnoreCase(request.getMethod())){

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if(nome != null && email != null && senha != null && !nome.isEmpty() && !email.isEmpty() && !senha.isEmpty()) {
            
            String url = "jdbc:mysql://localhost:3306/studypath";
            String usuarioBD = "root";
            String senhaBD = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, usuarioBD, senhaBD);

                String sql = "INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, nome);
                stmt.setString(2, email);
                stmt.setString(3, senha);

                int linhasAfetadas = stmt.executeUpdate();

                if(linhasAfetadas > 0){
                    mensagemSucesso = "Cadastro realizado com sucesso! Faça seu login.";
                    // CORREÇÃO 2: Apontando para o L maiúsculo (Login.jsp)
                    response.setHeader("Refresh", "2; URL=Login.jsp");
                }
                stmt.close();
                conn.close();

            } catch (ClassNotFoundException e) {
                mensagemErro = "Erro: Driver não encontrado.";
            } catch (SQLIntegrityConstraintViolationException e) {
                mensagemErro = "Este email já está cadastrado!";
            } catch (SQLException e) {
                mensagemErro = "Erro ao cadastrar: " + e.getMessage();
            }
        } else {
            mensagemErro = "Por favor, preencha todos os campos.";
        }
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>StudyPath - Cadastro</title>
    <link rel="stylesheet" href="CadastroCSS.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <script>
        function validarCadastro(){
            let senha = document.querySelector('[name="senha"]').value;
            let confirmar = document.querySelector('[name="confirmarSenha"]').value;

            if(senha !== confirmar){
                alert("As senhas não coincidem!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="decor decor1"></div>
    <div class="decor decor2"></div>
    <div class="decor decor3"></div>
    <div class="decor decor4"></div>
    <div class="decor decor5"></div>

    <div class="cadastro-card">
        <h1>StudyPath</h1>
        <div class="linha"></div>
        <h2>Cadastro</h2>

        <% if(!mensagemSucesso.isEmpty()){ %>
            <div style="background:#d4edda; color:#155724; padding:10px; border-radius:5px; margin-bottom:15px; text-align:center;">
                <%= mensagemSucesso %>
            </div>
        <% } %>
        
        <% if(!mensagemErro.isEmpty()){ %>
            <div style="background:#ffd6d6; color:#c00000; padding:10px; border-radius:5px; margin-bottom:15px; text-align:center;">
                <%= mensagemErro %>
            </div>
        <% } %>

        <form action="Cadastro.jsp" method="post" onsubmit="return validarCadastro();">
            
            <div class="input-box">
                <span class="icon"><i class="fa-solid fa-user"></i></span>
                <input type="text" name="nome" placeholder="Nome Completo" required>
            </div>
            
            <div class="input-box">
                <span class="icon"><i class="fa-solid fa-envelope"></i></span>
                <input type="email" name="email" placeholder="Email" required>
            </div>
            
            <div class="input-box">
                <span class="icon"><i class="fa-solid fa-lock"></i></span>
                <input type="password" name="senha" placeholder="Senha" required>
            </div>
            
            <div class="input-box">
                <span class="icon"><i class="fa-solid fa-lock"></i></span>
                <input type="password" name="confirmarSenha" placeholder="Confirmar Senha" required>
            </div>
            
            <button type="submit">Criar Conta</button>
            
            <p class="login-link">
                Já possui uma conta?
                <a href="Login.jsp">Entrar</a>
            </p>
        </form>
    </div>
</div>
</body>
</html>