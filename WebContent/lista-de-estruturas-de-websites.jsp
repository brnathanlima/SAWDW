<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Estruturas de Websites</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
	<div class="wrapper">
		<c:choose>
			<c:when test="${tipoDeUsuario == 'webDesigner'}">
				<div class="sidebar" data-color="red">
	    
			    	<div class="sidebar-wrapper">
			            <div class="logo">
			                <a href="webDesigner?acao=visualizarPainel" class="simple-text">
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
			                <li class="active">
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
			            </ul>
			    	</div>
			    </div>
			</c:when>
			<c:when test="${tipoDeUsuario == 'colaborador'}">
				<div class="sidebar" data-color="azure">
	    
			    	<div class="sidebar-wrapper">
			            <div class="logo">
			                <a href="colaborador?acao=visualizarPainel" class="simple-text">
			                    SAEDW
			                </a>
			            </div>
			
			            <ul class="nav">
			            	<li class="active">
			                    <a href="estruturaDeWebsites?acao=listar">
			                        <i class="pe-7s-browser"></i>
			                        <p>Estruturas de Websites</p>
			                    </a>
			                </li>
			            </ul>
			    	</div>
			    </div>
			</c:when>
		</c:choose>
	    
	
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
	                                <h4 class="title">ESTRUTURAS DE WEBSITES
	                                <c:choose>
	                                	<c:when test="${tipoDeUsuario == 'webDesigner'}">
	                                		<a href="estruturaDeWebsites?acao=novoCadastro" class="btn btn-success pull-right" role="button">NOVA ESTRUTURA DE WEBSITES</a>
	                                	</c:when>
	                                </c:choose>
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
	                                    		<th style="text-align: center;">Nome</th>
												<th style="text-align: center;">Categoria</th>
												<c:choose>
													<c:when test="${tipoDeUsuario == 'webDesigner'}">
														<th style="text-align: center;">Solicitações Pendentes</th>	
													</c:when>
												</c:choose>
												<th style="text-align: center;">Ações</th>
	                                    	</tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach var="estruturaDeWebsite" items="${estruturasDeWebsites}" varStatus="id">
												<tr style="text-align: center;">
													<td>${estruturaDeWebsite.nome}</td>
													<td>${estruturaDeWebsite.categoria.nome}</td>
													<c:choose>
														<c:when test="${tipoDeUsuario == 'webDesigner'}">
															<td>
															<c:choose>
																<c:when test="${not empty estruturaDeWebsite.solicitacoesDeDesenvolvimentoDaEstrutura}">
																	<a href="solicitacaoDeDesenvolvimento?acao=listarSolicitacoesDeDesenvolvimentoPendentesDaEstrutura&id=${estruturaDeWebsite.id}">
																		<span class="label label-success">${fn:length(estruturaDeWebsite.solicitacoesDeDesenvolvimentoDaEstrutura)}</span>
																	</a>
																</c:when>
																<c:otherwise>
																	<span class="label label-default">${fn:length(estruturaDeWebsite.solicitacoesDeDesenvolvimentoDaEstrutura)}</span>
																</c:otherwise>
															</c:choose>
															</td>
														</c:when>
													</c:choose>
													<td class="td-actions">
														<c:choose>
	                                						<c:when test="${tipoDeUsuario == 'webDesigner'}">
	                                							<a href="estruturaDeWebsites?acao=visualizar&id=${estruturaDeWebsite.id}">
			                                                    <button type="button" rel="tooltip" title="Editar" class="btn btn-info btn-simple btn-sm">
			                                                        <i class="fa fa-edit"></i>
			                                                    </button>
			                                                    </a>
			                                                    <a href="estruturaDeWebsites?acao=excluir&id=${estruturaDeWebsite.id}">
			                                                    <button type="button" rel="tooltip" title="Excluir" class="btn btn-danger btn-simple btn-sm">
			                                                        <i class="fa fa-times"></i>
			                                                    </button>
			                                                    </a>
	                                						</c:when>
	                                						<c:otherwise>
	                                							<a href="estruturaDeWebsites?acao=visualizar&id=${estruturaDeWebsite.id}">
				                                                   <button type="button" rel="tooltip" title="Visualizar" class="btn btn-info btn-simple btn-sm">
				                                                       <i class="fa fa-eye"></i>
				                                                   </button>
				                                           		</a>
	                                						</c:otherwise>
	                                					</c:choose>
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