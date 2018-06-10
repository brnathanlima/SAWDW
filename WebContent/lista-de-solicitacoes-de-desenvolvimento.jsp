<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Solicitações de Desenvolvimento</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
	<div class="wrapper">
		<c:choose>
			<c:when test="${tipoDeUsuario == 'gerente'}">
				<div class="sidebar" data-color="orange">
	    
			    	<div class="sidebar-wrapper">
			            <div class="logo">
			                <a href="gerente?acao=visualizarPainel" class="simple-text">
			                    SAEDW
			                </a>
			            </div>
			
			            <ul class="nav">
			                <li class="active">
			                    <a href="solicitacaoDeDesenvolvimento?acao=listar">
			                   		<i class="pe-7s-bell"></i>
			                        <p>Solicitações de Desenvolvimento</p>
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
			</c:when>
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
			                <li>
			                    <a href="estruturaDeWebsites?acao=listar">
			                    	<i class="pe-7s-browser"></i>
			                        <p>Estruturas de Websites</p>
			                    </a>
			                </li>
			                <li class="active">
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
	                                <h4 class="title">SOLICITAÇÕES DE DESENVOLVIMENTO
	                                <c:choose>
										<c:when test="${tipoDeUsuario == 'gerente' && usuario.departamento != 'TI'}">
											<a href="solicitacaoDeDesenvolvimento?acao=novoCadastro" class="btn btn-success pull-right" role="button">NOVA SOLICITAÇÃO DE DESENVOLVIMENTO</a>
										</c:when>
									</c:choose>
									</h4>
	                            </div>
	                            <div class="content table-responsive table-full-width">
	                            	<c:choose>
										<c:when test="${ not empty successMessage }">
											<div class="alert alert-success" role="alert">
												<span><b>Sucesso - </b> ${successMessage} </span>
											</div>											
										</c:when>
									</c:choose>
	                                <table class="table table-hover table-striped">
	                                    <thead>
	                                    	<tr>
		                                        <th>Título</th>
												<th>Status</th>
												<c:choose>
													<c:when test="${(tipoDeUsuario == 'gerente' && usuario.departamento == 'TI') || (tipoDeUsuario == 'webDesigner')}">
														<th>Solicitante</th>
													</c:when>
												</c:choose>
												<th>Data de Realização</th>
												<th style="text-align: center;">Ações</th>
											</tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach var="solicitacaoDeDesenvolvimento" items="${solicitacoesDeDesenvolvimento}" varStatus="id">
												<tr>
													<td>${solicitacaoDeDesenvolvimento.titulo}</td>
													<td>${solicitacaoDeDesenvolvimento.status}</td>
													<c:choose>
														<c:when test="${(tipoDeUsuario == 'gerente' && usuario.departamento == 'TI') || (tipoDeUsuario == 'webDesigner')}">
															<td>${solicitacaoDeDesenvolvimento.solicitante.nome} ${solicitacaoDeDesenvolvimento.solicitante.sobrenome}</td>
														</c:when>
													</c:choose>
													<td><fmt:formatDate value="${solicitacaoDeDesenvolvimento.dataDeRealizacao}" pattern="dd/MM/yyyy"/></td>
													<c:choose>
														<c:when test="${tipoDeUsuario == 'gerente' && usuario.departamento != 'TI' && solicitacaoDeDesenvolvimento.status == 'Nova'}">
															<td style="text-align: center;" class="td-actions">
																<a href="solicitacaoDeDesenvolvimento?acao=visualizar&id=${solicitacaoDeDesenvolvimento.id}">
				                                                   <button type="button" rel="tooltip" title="Editar" class="btn btn-info btn-simple btn-sm">
				                                                       <i class="fa fa-edit"></i>
				                                                   </button>
				                                                   </a>
				                                                   <a href="solicitacaoDeDesenvolvimento?acao=excluir&id=${solicitacaoDeDesenvolvimento.id}">
				                                                   <button type="button" rel="tooltip" title="Excluir" class="btn btn-danger btn-simple btn-sm">
				                                                       <i class="fa fa-times"></i>
				                                                   </button>
				                                                   </a>
				                                               </td>
														</c:when>
														<c:otherwise>
															<td style="text-align: center;" class="td-actions">
																<a href="solicitacaoDeDesenvolvimento?acao=visualizar&id=${solicitacaoDeDesenvolvimento.id}">
				                                                   <button type="button" rel="tooltip" title="Visualizar" class="btn btn-info btn-simple btn-sm">
				                                                       <i class="fa fa-eye"></i>
				                                                   </button>
				                                            	</a>
				                                        	</td>
														</c:otherwise>
													</c:choose>
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