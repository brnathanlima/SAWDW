<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<c:import url="/common/cabecalho.jsp" />
	<title>SAEDW - Instituições</title>
</head>
<body>
	<div class="wrapper">
	    <div class="sidebar" data-color="green"  data-image="assets/img/sidebar-4.jpg">
	    	<div class="sidebar-wrapper">
	            <div class="logo">
	                <a href="superAdministrador?acao=visualizarPainel" class="simple-text">
	                    SAEDW
	                </a>
	            </div>
	            <ul class="nav">
	                <li class="active">
	                    <a href="instituicao?acao=listar">
	                        <i class="pe-7s-culture"></i>
	                        <p>Instituições</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="superAdministrador?acao=listar">
	                        <i class="pe-7s-user"></i>
	                        <p>Super Administradores</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="administradorDeInstituicao?acao=listar">
	                        <i class="pe-7s-users"></i>
	                        <p>Administradores de Instituições</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    </div>
	    <div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="navbar-header">
			        <button type="button" class="navbar-toggle" data-toggle="collapse">
			            <span class="sr-only">Toggle navigation</span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			        </button>
			    </div>
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
	                                <h4 class="title">INSTITUIÇÕES
	                                <a href="instituicao?acao=novoCadastro" class="btn btn-success pull-right" role="button">CRIAR NOVA</a>
	                                </h4>
	                            </div>
	                            <div class="content table-responsive table-full-width">
	                            	<c:choose>
										<c:when test="${not empty successMessage}">
											<div class="alert alert-success" role="alert">
												<span> <b>Sucesso - </b>${successMessage} </span>
											</div>											
										</c:when>
									</c:choose>
	                                <table class="table table-hover table-striped">
	                                    <thead>
	                                    	<tr>
		                                        <th>Nome Fantasia</th>
		                                    	<th>CNPJ</th>
		                                    	<th>Telefone</th>
		                                    	<th style="text-align: center;">Ações</th>
	                                    	</tr>
	                                    </thead>
	                                    <tbody>
	                                        <c:forEach var="instituicao" items="${instituicoes}">
												<tr>
													<td>${instituicao.nomeFantasia}</td>
													<td>${instituicao.cnpj}</td>
													<td>${instituicao.telefone}</td>
													
													<td style="text-align: center;" class="td-actions">
														<a href="instituicao?acao=visualizar&id=${instituicao.id}">
	                                                    <button type="button" rel="tooltip" title="Editar" class="btn btn-info btn-simple btn-sm">
	                                                        <i class="fa fa-edit"></i>
	                                                    </button>
	                                                    </a>
	                                                    <a href="instituicao?acao=excluir&id=${instituicao.id}">
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
<c:import url="common/rodape.jsp" />
		</div>
	</div>
</body>
</html>