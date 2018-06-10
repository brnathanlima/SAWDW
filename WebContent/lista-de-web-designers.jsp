<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<c:import url="/common/cabecalho.jsp" />
	<title>SAEDW - Web-designers</title>
</head>
<body>
	<div class="wrapper">
	    <div class="sidebar" data-color="blue">
	    
	    	<div class="sidebar-wrapper">
	            <div class="logo">
	                <a href="administradorDeInstituicao?acao=visualizarPainel" class="simple-text">
	                    SAEDW
	                </a>
	            </div>
	
	            <ul class="nav">
	                <li>
	                    <a href="colaborador?acao=listar">
	                   		<i class="pe-7s-user"></i>
	                        <p>Colaboradores</p>
	                    </a>
	                </li>
	                <li class="active">
	                    <a href="webDesigner?acao=listar">
	                    	<i class="pe-7s-users"></i>
	                        <p>Web-Designers</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="gerente?acao=listar">
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
	                                <h4 class="title">WEB-DESIGNERS
	                                <a href="webDesigner?acao=novoCadastro" class="btn btn-success pull-right" role="button">NOVO WEB-DESIGNER</a>
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
		                                        <th>Nome</th>
												<th>Matrícula</th>
												<th>E-mail</th>
												<th style="text-align: center;">Ações</th>
											</tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach var="webDesigner" items="${webDesigners}" varStatus="id">
												<tr>
													<td>${webDesigner.nome} ${webDesigner.sobrenome}</td>
													<td>${webDesigner.matricula}</td>
													<td>${webDesigner.email}</td>
													
													<td style="text-align: center;" class="td-actions">
														<a href="webDesigner?acao=visualizar&id=${webDesigner.id}">
	                                                    <button type="button" rel="tooltip" title="Editar" class="btn btn-info btn-simple btn-sm">
	                                                        <i class="fa fa-edit"></i>
	                                                    </button>
	                                                    </a>
	                                                    <a href="webDesigner?acao=excluir&id=${webDesigner.id}">
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