<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String usuarioLogado = (String) session.getAttribute("usuarioLogado");

    if(usuarioLogado == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int hora =
            java.time.LocalTime.now().getHour();

    String saudacao;

    if(hora < 12){
        saudacao = "Bom dia";
    }
    else if(hora < 18){
        saudacao = "Boa tarde";
    }
    else{
        saudacao = "Boa noite";
    }

    String dataAtual =
            java.time.LocalDate.now()
                    .format(
                            java.time.format.DateTimeFormatter
                                    .ofPattern("dd/MM/yyyy")
                    );
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyPath - Menu Principal</title>
    <link rel="stylesheet" href="MenuCSS.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
    <script>
    function pesquisarCards(){
    let texto =
        document.getElementById("pesquisa")
                .value
                .toLowerCase();
    let cards =
        document.querySelectorAll(".card");
    cards.forEach(card => {
        let conteudo =
            card.innerText.toLowerCase();
        if(conteudo.includes(texto)){
            card.style.display = "flex";
        }
        else{
            card.style.display = "none";
        }
    });
    }
    </script>

</head>
<body>
    <div class="container">
    <header>
        <div class="logo">
            <h1>StudyPath</h1>
        </div>
        <div class="usuario">
            <i class="fa-solid fa-user"></i>
            <div>
                <strong>
                    <%= saudacao %>,
                    <%= usuarioLogado %>
                </strong>
                <p>
                    <%= dataAtual %>
                </p>
            </div>
        </div>
    </header>
    <section class="barra-pesquisa">
        <input
                type="text"
                id="pesquisa"
                placeholder="Pesquisar funcionalidades...">
        <button onclick="pesquisarCards()">
            <i class="fa-solid fa-magnifying-glass"></i>
        </button>
    </section>
    <section class="cards" id="cards">
        <a href="cronograma.jsp" class="card">
            <i class="fa-solid fa-calendar-days"></i>
            <h3>Cronograma</h3>
            <p>
                Monte seu plano semanal.
            </p>
        </a>
        <a href="materiais.jsp" class="card">
            <i class="fa-solid fa-book"></i>
            <h3>Materiais Gratuitos</h3>
            <p>
                PDFs e apostilas.
            </p>
        </a>
        <a href="bancoQuestoes.jsp" class="card">
            <i class="fa-solid fa-file-circle-check"></i>
            <h3>Banco de Questões</h3>
            <p>
                Exercícios e simulados.
            </p>
        </a>
        <a href="canais.jsp" class="card">
            <i class="fa-brands fa-youtube"></i>
            <h3>Canais Recomendados</h3>
            <p>
                Aulas gratuitas.
            </p>
        </a>
        <a href="Perfil.jsp" class="card">
            <i class="fa-solid fa-user-graduate"></i>
            <h3>Perfil</h3>
            <p>
                Seus dados.
            </p>
        </a>
        <a href="contato.jsp" class="card">
            <i class="fa-solid fa-headset"></i>
            <h3>Contato</h3>
            <p>
                Suporte e dúvidas.
            </p>
        </a>
        <a href="sobre.jsp" class="card">
            <i class="fa-solid fa-circle-info"></i>
            <h3>Sobre o Projeto</h3>
            <p>
                Conheça o StudyPath.
            </p>
        </a>
        <a href="Login.jsp" class="card sair">
            <i class="fa-solid fa-right-from-bracket"></i>
            <h3>Sair</h3>
            <p>
                Encerrar sessão.
            </p>
        </a>
    </section>
</div>
</body>
</html>