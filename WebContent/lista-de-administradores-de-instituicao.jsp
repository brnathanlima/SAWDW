<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<c:import url="/common/cabecalho.jsp" />
	<title>SAEDW - Administradores de Instituição</title>
</head>
<body>
<div class="wrapper">
    <div class="sidebar" data-color="green" data-image="assets/img/sidebar-5.jpg">

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://localhost:8080/SAEDW/painel-super-administrador.jsp" class="simple-text">
                    SAEDW
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="InstituicaoController">
                        <i class="pe-7s-culture"></i>
                        <p>Instituições</p>
                    </a>
                </li>
                <li>
                    <a href="SuperAdministradorController">
                        <i class="pe-7s-user"></i>
                        <p>Super Administradores</p>
                    </a>
                </li>
                <li class="active">
                    <a href="AdministradorDeInstituicaoController">
                        <i class="pe-7s-users"></i>
                        <p>Administradores de Instituições</p>
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
                                <h4 class="title">ADMINISTRADORES DE INSTITUIÇÃO
                                <a href="AdministradorDeInstituicaoController?acao=novoCadastro" class="btn btn-success pull-right" role="button">NOVO ADMINISTRADOR DE INSTITUIÇÃO</a>
                            	</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    	<tr>
                                    		<th>Nome</th>
	                                    	<th>Instituição</th>
	                                    	<th>E-mail</th>
	                                    	<th>Ações</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="administradorDeInstituicao" items="${administradoresDeInstituicao}">
											<tr>
												
												<td>${administradorDeInstituicao.nome} ${administradorDeInstituicao.sobrenome}</td>
												<td>${administradorDeInstituicao.instituicao.nomeFantasia}</td>
												<td>${administradorDeInstituicao.email}</td>
												
												<td class="td-actions">
													<a href="AdministradorDeInstituicaoController?acao=visualizar&id=${administradorDeInstituicao.id}">
                                                    <button type="button" rel="tooltip" title="Editar" class="btn btn-info btn-simple btn-sm">
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    </a>
                                                    <a href="AdministradorDeInstituicaoController?acao=excluir&id=${administradorDeInstituicao.id}">
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