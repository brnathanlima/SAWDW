<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Cadastrar Estrutura de Website</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
	<div class="wrapper">
		<c:choose>
			<c:when test="${tipoDeUsuario == 'webDesigner'}">
				<div class="sidebar" data-color="red" data-image="assets/img/sidebar-4.jpg">	    
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
			<c:when test="${tipoDeUsuario == 'colaborador'}">
				<div class="sidebar" data-color="black" data-image="assets/img/sidebar-4.jpg">	    
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
	            	<c:choose>
						<c:when test="${empty estruturaDeWebsite.id}">
			                <div class="row">
			                    <div class="col-md-12">
			                        <div class="card">
			                            <div class="header">
			                                <h4 class="title">
			                                CADASTRAR ESTRUTURA DE WEBSITE
	                                		<a href="estruturaDeWebsites?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
			                                </h4>
			                            </div>
			                            <div class="content">
											<form action="estruturaDeWebsites" method="post" data-toggle="validator" role="form">
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nome">Nome</label>
			                                                <input type="text" id="nome" name="nome" class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
									            	<div class="col-md-12">
									            		<div class="form-group has-feedback">
											               	<label class="control-label" for="idCategoria">Categoria</label>
								                        	<select id="idCategoria" name="idCategoria" class="form-control" required>
																<option value="">Selecione</option>
																<c:forEach var="categoria" items="${categorias}">
																	<option value="${categoria.id}">${categoria.nome}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>	
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="descricao">Descri��o</label>
			                                                <textarea rows="5" id="descricao" name="descricao" class="form-control" required></textarea>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <input type="hidden" name="acao" value="cadastrar" /> 
			                                    <button type="submit" class="btn btn-success btn-fill pull-left">CADASTRAR</button>
			                                    
			                                    <div class="clearfix"></div>
			                                </form>
			                            </div>
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${not empty estruturaDeWebsite.id}">
							 <div class="row">
			                    <div class="col-md-12">
			                        <div class="card">
			                            <div class="header">
			                            	<h4 class="title">
			                            	<c:choose>
			                            		<c:when test="${tipoDeUsuario == 'webDesigner'}">
			                                		EDITAR ESTRUTURA DE WEBSITE
			                                	</c:when>
			                                	<c:otherwise>
			                                		VISUALIZAR ESTRUTURA DE WEBSITE
			                                	</c:otherwise>
			                                </c:choose>
	                                		<a href="estruturaDeWebsites?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
	                                		</h4>
			                            </div>
			                            <div class="content">
			                            	<c:choose>
			                            		<c:when test="${tipoDeUsuario == 'webDesigner'}">
			                            			<c:choose>
														<c:when test="${not empty successMessage}">
															<div class="alert alert-success" role="alert">
																<span> <b>Sucesso - </b>${successMessage} </span>
															</div>											
														</c:when>
													</c:choose>
					                            	<form action="estruturaDeWebsites" method="post" data-toggle="validator" role="form">
					                                    <div class="row">
					                                        <div class="col-md-12">
					                                            <div class="form-group has-feedback">
					                                                <label class="control-label" for="nome">Nome</label>
					                                                <input type="text" id="nome" name="nome" value="${estruturaDeWebsite.nome}" class="form-control" required>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="row">
					                                        <div class="col-md-12">
					                                        	<div class="form-group has-feedback">
						                                        	<label class="control-label" for="idCategoria">Categoria</label>
								                                    <select id="idCategoria" name="idCategoria" class="form-control" required>
																		<option>Selecione</option>
																		<c:forEach var="categoria" items="${categorias}">
																			<c:choose>
																				<c:when test="${categoria.id == estruturaDeWebsite.categoria.id}">
																					<option value="${categoria.id}" selected>${categoria.nome}</option>
																				</c:when>
																				<c:otherwise>
																					<option value="${categoria.id}">${categoria.nome}</option>
																				</c:otherwise>
																			</c:choose>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>
														<div class="row">
					                                        <div class="col-md-6">
					                                            <div class="form-group">
					                                                <label>Data de Cadastro</label>
					                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${estruturaDeWebsite.dataDeCriacao}' pattern='dd/MM/yyyy' />">
					                                            </div>
					                                        </div>
					                                        <div class="col-md-6">
					                                            <div class="form-group"> 
					                                                <label>Data de Atualiza��o de Cadastro</label>
					                                                 <c:choose>
					                                                	<c:when test="${not empty estruturaDeWebsite.dataDeModificacao}">
					                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${estruturaDeWebsite.dataDeModificacao}' pattern='dd/MM/yyyy' />">
					                                                	</c:when>
					                                                	<c:otherwise>
					                                               			 <input type="text" class="form-control" disabled value="N�o houve modifica��o"/>
					                                                	</c:otherwise>		                                                
					                                                </c:choose>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="row">
					                                        <div class="col-md-12">
					                                            <div class="form-group has-feedback">
					                                                <label class="control-label" for="descricao">Descri��o</label>
					                                                <textarea rows="5" id="descricao" name="descricao" class="form-control" required>${estruturaDeWebsite.descricao}</textarea>
					                                            </div>
					                                        </div>
					                                    </div>
							
														<input type="hidden" name="id" value="${estruturaDeWebsite.id}" />
					                                    <input type="hidden" name="acao" value="editar" /> 
					                                    
					                                    <button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
					                                    
					                                    <div class="clearfix"></div>
					                                </form>
			                            		</c:when>
			                            		<c:otherwise>
			                            			<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Nome da Estrutura de Websites</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${estruturaDeWebsite.nome}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Categoria</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${estruturaDeWebsite.categoria.nome}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Descri��o da Estrutura de Websites</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${estruturaDeWebsite.descricao}</td>
															</tr>
														</tbody>
													</table>
			                            		</c:otherwise>
			                            	</c:choose>		                            	
			                            </div>
			                        </div>
			                    </div>
			                </div>   
	                        <div class="row">
	                			<div class="col-md-12">        
	                                <div class="row">
					                	<div class="col-md-12">
						                	<div class="card">
						                		<div class="header">
						                			<h4>P�GINAS DA ESTRUTURA DE WEBSITE
						                			<c:choose>
			                            				<c:when test="${tipoDeUsuario == 'webDesigner'}">
						                					<a href="estruturaDePaginas?acao=novoCadastro&idEstruturaDeWebsite=${estruturaDeWebsite.id}" class="btn btn-success pull-right" role="button">NOVA P�GINA</a>
						                				</c:when>
						                			</c:choose>
						                			</h4>
						                		</div>
						                		<div class="content table-responsive table-full-width">
						                			<c:choose>
							              				<c:when test="${empty estruturaDeWebsite.estruturasDePaginasDoWebsite}">
							              					<div class="alert alert-warning" role="alert">
																<span>Ainda n�o h� p�ginas cadastras relacionadas � esta estrutura de website.</span>
															</div>
							              				</c:when>
							              				<c:otherwise>
							              					<table class="table table-hover table-striped">
																<thead>
																	<tr>
																		<th>T�tulo</th>
																		<th style="text-align: center;">A��es</th>
																	</tr>
																</thead>
																<tbody>
																<c:forEach var="estruturaDePagina" items="${estruturaDeWebsite.estruturasDePaginasDoWebsite}" varStatus="id">
																	<tr>
																		<td>${estruturaDePagina.titulo}</td>
																		<td style="text-align: center;">
																			<c:choose>
			                            										<c:when test="${tipoDeUsuario == 'webDesigner'}">
																					<a href="estruturaDePaginas?acao=visualizar&idEstruturaDePagina=${estruturaDePagina.id}&idEstruturaDeWebsite=${estruturaDeWebsite.id}">
								                                                    <button type="button" rel="tooltip" title="Editar" class="btn btn-info btn-simple btn-sm">
								                                                        <i class="fa fa-edit"></i>
								                                                    </button>
								                                                    </a>
								                                                    <a href="estruturaDePaginas?acao=excluir&idEstruturaDePagina=${estruturaDePagina.id}&idEstruturaDeWebsite=${estruturaDeWebsite.id}">
								                                                    <button type="button" rel="tooltip" title="Excluir" class="btn btn-danger btn-simple btn-sm">
								                                                        <i class="fa fa-times"></i>
								                                                    </button>
								                                                    </a>
								                                        		</c:when>
								                                        		<c:otherwise>
								                                        			<a href="estruturaDePaginas?acao=visualizar&idEstruturaDePagina=${estruturaDePagina.id}&idEstruturaDeWebsite=${estruturaDeWebsite.id}">
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
							              				</c:otherwise>
							                		</c:choose>
						                		</div>
						                	</div>
					                	</div>
					                </div>
					    		</div>
					   		</div>
						</c:when>
					</c:choose>
				</div>
	        </div>
<c:import url="common/rodape.jsp" />
			<script src="assets/js/validator.min.js"></script>
			<script src="assets/js/jquery.mask.min.js"></script>
		</div>
	</div>
</body>
</html>