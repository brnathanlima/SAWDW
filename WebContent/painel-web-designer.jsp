<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<c:import url="/common/cabecalho.jsp" />
	<title>SAEDW - Painel</title>
</head>
<body>
<div class="wrapper">
    <div class="sidebar" data-color="red" data-image="assets/img/sidebar-5.jpg">
    
    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    SAEDW
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="categoriaDeWebsites?acao=listar">
                   		<i class="pe-7s-folder"></i>
                        <p>Categorias de Websites</p>
                    </a>
                </li>
                <li>
                    <a href="estruturaDeWebsites?acao=listar">
                    	<i class="pe-7s-browser"></i>
                        <p>Estruturas de Websites</p>
                    </a>
                </li>
                <li>
                    <a href="SolicitacaoDeDesenvolvimentoController">
                    	<i class="pe-7s-bell"></i>
                        <p>Solicitacoes de Desenvolvimento</p>
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
                                <h4 class="title">INFORMAÇÕES DA CONTA</h4>
                            </div>
								<div class="content">
									<form>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>Matrícula</label> <input type="text" name="nome" disabled
														value="${usuario.matricula}" class="form-control">
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Nome</label> <input type="text" name="nome" disabled
														value="${usuario.nome}" class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Sobrnome</label> <input type="text" name="sobrenome" disabled
														value="${usuario.sobrenome}" class="form-control">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>E-mail</label> <input type="text" name="email" disabled
														value="${usuario.email}" class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Telefone</label> <input type="text" name="telefone" disabled
														value="${usuario.telefone}" class="form-control">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Nome de Usuário</label> <input type="text" disabled
														name="nomeDeUsuario" value="${usuario.nomeDeUsuario}"
														class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Senha</label> <input type="password" name="senha" disabled
														value="${usuario.senha}" class="form-control">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>Nível</label> <input type="text" name="nivel" disabled
														value="${usuario.nivel}" class="form-control">
												</div>
											</div>
										</div>
									</form>
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