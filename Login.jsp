<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mensagemErro = "";
    if("POST".equalsIgnoreCase(request.getMethod())){

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String url = "jdbc:mysql://localhost:3306/studypath";
        String usuarioBD = "root";
        String senhaBD = ""; 

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, usuarioBD, senhaBD);

            String sql = "SELECT nome FROM usuarios WHERE email = ? AND senha = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, senha); 

            ResultSet rs = stmt.executeQuery();

            if(rs.next()){
                String nomeUsuario = rs.getString("nome");
                session.setAttribute("usuarioLogado", nomeUsuario);
                
                response.sendRedirect("Menu.jsp");
                return;
            } else {
                mensagemErro = "Email ou senha incorretos.";
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (ClassNotFoundException e) {
            mensagemErro = "Erro: Driver não encontrado.";
        } catch (SQLException e) {
            mensagemErro = "Erro no banco: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyPath - Login</title>
    <link rel="stylesheet" href="LoginCSS.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <script>
    function validarLogin(){
        let email = document.getElementById("email").value;
        let senha = document.getElementById("senha").value;

        if(email.trim() === ""){
            alert("Informe seu email.");
            return false;
        }
        if(senha.trim() === ""){
            alert("Informe sua senha.");
            return false;
        }
        if(senha.length < 6){
            alert("A senha deve ter pelo menos 6 caracteres.");
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

    <div class="login-card">
        <h1>StudyPath</h1>
        <div class="linha"></div>
        <h2>Login</h2>
        
        <% if(!mensagemErro.isEmpty()){ %>
            <div class="erro">
                <%= mensagemErro %>
            </div>
        <% } %>

        <form action="Login.jsp" method="post" onsubmit="return validarLogin();">
            
            <div class="input-box">
                <span class="icon"><i class="fa-solid fa-envelope"></i></span>
                <input type="email" id="email" name="email" placeholder="Email">
            </div>
            
            <div class="input-box">
                <span class="icon"><i class="fa-solid fa-lock"></i></span>
                <input type="password" id="senha" name="senha" placeholder="Senha">
            </div>
            
            <div class="lembrar">
                <input type="checkbox" id="lembrar">
                <label for="lembrar">Lembrar de mim</label>
            </div>
            
            <button type="submit">Entrar</button>
            
            <p class="cadastro">
                Não possui conta?
                <a href="Cadastro.jsp">Cadastre-se</a>
            </p>
        </form>
    </div>
</div>
</body>
</html>