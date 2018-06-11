<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="pt-br">
<head>
	<c:import url="/common/cabecalho.jsp" />
	<title>SAEDW - Categorias de Websites</title>
</head>
<body>
	<div class="wrapper">
	    <div class="sidebar" data-color="red" data-image="assets/img/sidebar-4.jpg">
	    
	    	<div class="sidebar-wrapper">
	            <div class="logo">
	                <a href="webDesigner?acao=visualizarPainel" class="simple-text">
	                    SAEDW
	                </a>
	            </div>
	
	            <ul class="nav">
	                <li class="active">
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
	                    <a href="solicitacaoDeDesenvolvimento?acao=listar">
	                    	<i class="pe-7s-bell"></i>
	                        <p>Solicitacoes de Desenvolvimento</p>
	                    </a>
	                </li>
	                <li>
						<a href="projeto?acao=listar"> 
							<i class="pe-7s-network"></i>
							<p>Projetos</p>
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
	                                <h4 class="title">CATEGORIAS DE WEBSITES
	                                <a href="categoriaDeWebsites?acao=novoCadastro" class="btn btn-success pull-right" role="button">NOVA CATEGORIA</a>
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
		                                        <th style="text-align: center;">Estruturas de Websites</th>
		                                    	<th style="text-align: center;">Ações</th>
	                                    	</tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach var="categoria" items="${categorias}" varStatus="id">
												<tr>
													<td>${categoria.nome}</td>
													<td style="text-align: center;">
													<c:choose>
														<c:when test="${not empty categoria.estruturasDeWebsitesDaCategoria}">
															<a href="estruturaDeWebsites?acao=listarEstruturasDeWebsitesDaCategoria&id=${categoria.id}">
																<span class="label label-success">${fn:length(categoria.estruturasDeWebsitesDaCategoria)}</span>
															</a>
														</c:when>
														<c:otherwise>
															<span class="label label-default">${fn:length(categoria.estruturasDeWebsitesDaCategoria)}</span>
														</c:otherwise>
													</c:choose>
													</td>
													<td style="text-align: center;" class="td-actions">
														<a href="categoriaDeWebsites?acao=visualizar&id=${categoria.id}">
	                                                    <button type="button" rel="tooltip" title="Editar" class="btn btn-info btn-simple btn-sm">
	                                                        <i class="fa fa-edit"></i>
	                                                    </button>
	                                                    </a>
	                                                    <a href="categoriaDeWebsites?acao=excluir&id=${categoria.id}">
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