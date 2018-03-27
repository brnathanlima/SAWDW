<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Usuários Comum</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
<div class="wrapper">
    <div class="sidebar" data-color="blue" data-image="assets/img/sidebar-5.jpg">
    
    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://localhost:8080/SAEDW/painel-administrador-de-instituicao.jsp" class="simple-text">
                    SAEDW
                </a>
            </div>

            <ul class="nav">
            	<li>
                    <a href="pagina-da-instituicao.jsp">
                        <i class="pe-7s-culture"></i>
                        <p>${usuario.instituicao.nomeFantasia}</p>
                    </a>
                </li>
                <li class="active">
                    <a href="ColaboradorController">
                   		<i class="pe-7s-user"></i>
                        <p>Colaboradores</p>
                    </a>
                </li>
                <li>
                    <a href="WebDesignerController">
                    	<i class="pe-7s-users"></i>
                        <p>Web-Designers</p>
                    </a>
                </li>
                <li>
                    <a href="GerenteController">
                    	<i class="pe-7s-portfolio"></i>
                        <p>Gerentes</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="LogoutController">
                                <p>SAIR</p>
                            </a>
                        </li>
						<li class="separator hidden-lg hidden-md"></li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">COLABORADORES
                                <a href="cadastro-colaborador.jsp" class="btn btn-success pull-right" role="button">NOVO COLABORADOR</a>
                            	</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    	<tr>
	                                        <th>Nome</th>
											<th>Matrícula</th>
											<th>Setor</th>
											<th>Cargo</th>
	                                    	<th>Ações</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="colaborador" items="${colaboradores}" varStatus="id">
											<tr>
												<td>${colaborador.nome} ${colaborador.sobrenome}</td>
												<td>${colaborador.matricula}</td>
												<td>${colaborador.setor}</td>
												<td>${colaborador.cargo}</td>
												
												<td class="td-actions">
													<a href="ColaboradorController?acao=visualizar&id=${colaborador.id}">
                                                    <button type="button" rel="tooltip" title="Editar" class="btn btn-info btn-simple btn-sm">
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    </a>
                                                    <a href="ColaboradorController?acao=excluir&id=${colaborador.id}">
                                                    <button type="button" rel="tooltip" title="Excluir" class="btn btn-danger btn-simple btn-sm">
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                    </a>
                                                </td>
											</tr>
										</c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="https://www.nathanaellima.com">Nathanael Lima</a>
                </p>
            </div>
        </footer>

    </div>
</div>
</body>