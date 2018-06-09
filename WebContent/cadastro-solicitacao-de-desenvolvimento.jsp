<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Solicitação de Desenvolvimento de Website</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
	<div class="wrapper">
		<c:choose>
			<c:when test="${tipoDeUsuario == 'webDesigner'}">
				<div class="sidebar" data-color="red"  data-image="assets/img/sidebar-5.jpg">

					<div class="sidebar-wrapper">
						<div class="logo">
							<a href="http://localhost:8080/SAEDW/painel-web-designer.jsp" class="simple-text"> SAEDW </a>
						</div>

						<ul class="nav">
							<li><a href="categoriaDeWebsites?acao=listar"> <i
									class="pe-7s-folder"></i>
									<p>Categorias de Websites</p>
							</a></li>
							<li><a href="estruturaDeWebsites?acao=listar"> <i
									class="pe-7s-browser"></i>
									<p>Estruturas de Websites</p>
							</a></li>
							<li class="active"><a href="solicitacaoDeDesenvolvimento?acao=listar"> <i
									class="pe-7s-bell"></i>
									<p>Solicitacoes de Desenvolvimento</p>
							</a></li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:when test="${tipoDeUsuario == 'gerente'}">
				<div class="sidebar" data-color="orange"data-image="assets/img/sidebar-5.jpg">

					<div class="sidebar-wrapper">
						<div class="logo">
							<a href="http://localhost:8080/SAEDW/painel-gerente.jsp" class="simple-text"> SAEDW </a>
						</div>

						<ul class="nav">
							<li class="active"><a
								href="solicitacaoDeDesenvolvimento?acao=listar"> <i
									class="pe-7s-bell"></i>
									<p>Solicitações de Desenvolvimento</p>
							</a></li>
							<li><a href="projeto?acao=listar"> <i
									class="pe-7s-network"></i>
									<p>Projetos</p>
							</a></li>
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
							<li><a href="LogoutController">
									<p>SAIR</p>
							</a></li>
							<li class="separator hidden-lg hidden-md"></li>
						</ul>
					</div>
				</div>
			</nav>
			
			<!-- Início do conteúdo da Página -->
			<div class="content">
			
				<!-- Mostra o container -->
				<div class="container-fluid">
				
					<%-- Testa se irá criar uma nova solicitação de desenvolvimento ou editar uma já existente --%>
					<c:choose>
					
						<%-- Exibe o formulário de Solicitação de Desenvolvimento --%>
						<c:when test="${empty solicitacaoDeDesenvolvimento.id}">
						
							<%-- Cartão do formulário de cadastro de Solicitação de desenvolvimento --%>
							
							
								<%-- Início da Linha de Informações da Solicitação (Título, Status, Justificativa) --%>
								<div class="row">
									<div class="col-md-12">
										<div class="card">
											<div class="header">
												<h4>
												NOVA SOLICITAÇÃO DE DESENVOLVIMENTO DE WEBSITE
					                			<a href="solicitacaoDeDesenvolvimento?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
												</h4>
											</div>				
											<div class="content">
												<form action="solicitacaoDeDesenvolvimento" method="post">
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<label>Título</label> <input type="text" name="titulo" class="form-control">
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<label>Justificativa</label>
																<textarea rows="5" name="justificativa" class="form-control"></textarea>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<div class="row">
																	<div class="col-md-5">
																		<label>Estruturas de Websites Disponíveis</label>
																		<select name="estruturasDeWebsitesDaInstituicao" class="js-multiselect form-control" size="9" multiple="multiple">
																			<c:forEach var="estruturaDeWebsite" items="${estruturasDeWebsites}" varStatus="id">
																				<option value="${estruturaDeWebsite.id}">${estruturaDeWebsite.nome}</option>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="col-md-2">
																		<br />
																		<button type="button" id="incluirTodas"
																			class="btn btn-block">
																			<i class="fa fa-angle-double-right"></i>
																		</button>
																		<button type="button" id="incluirUma"
																			class="btn btn-block">
																			<i class="fa fa-angle-right"></i>
																		</button>
																		<button type="button" id="excluirUma"
																			class="btn btn-block">
																			<i class="fa fa-angle-left"></i>
																		</button>
																		<button type="button" id="excluirTodas"
																			class="btn btn-block">
																			<i class="fa fa-angle-double-left"></i>
																		</button>
																	</div>
																	<div class="col-md-5">
																		<label>Estruturas de Websites a Serem Solicitadas</label>
																		<select name="estruturasDeWebsitesSolicitadas" id="estruturasDeWebsitesSolicitadas" class="form-control" size="9" multiple="multiple">
																		</select>
																	</div>
																</div>
															</div>
														</div>
													</div>
													
													<input type="hidden" name="acao" value="cadastrar" />
													<button type="submit" class="btn btn-success btn-fill pull-left">REALIZAR SOLICITAÇÃO</button>
													<div class="clearfix"></div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<%-- Fim da Linha de Informações da Solicitação (Título, Status, Justificativa) --%>
								
							<%--Fim do formulário de cadastro de Solicitação de desenvolvimento --%>
							
						</c:when>
						<%-- Fim da exibição o formulário de Solicitação de Desenvolvimento --%>
						
						<%-- Exibe a solicitação de desenvolvimento --%>
						<c:when test="${not empty solicitacaoDeDesenvolvimento.id}">
							
							<%-- Início da Linha de Informações da Solicitação (Título, Status, Justificativa) --%>
							<div class="row">
							
								<div class="col-md-12">
									<div class="card">
										
										<%-- Início do teste para permitir que apenas os gerentes editem a Solicitação de desenvolvimento --%>
										<c:choose>
											<c:when test="${(tipoDeUsuario == 'gerente' && usuario.departamento != 'TI') && 
															(solicitacaoDeDesenvolvimento.status == 'Nova')}">
												<div class="header">
													<h4>
													EDITAR SOLICITAÇÃO DE DESENVOLVIMENTO
					                				<a href="solicitacaoDeDesenvolvimento?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
													</h4>
												</div>
												<%-- Início do formulário de edição de Solicitação de desenvolvimento --%>
												<form action="solicitacaoDeDesenvolvimento" method="post">
													<div class="content">
														<c:choose>
															<c:when test="${ not empty successMessage }">
																<div class="alert alert-success" role="alert">
																	<span><b>Sucesso - </b> ${successMessage} </span>
																</div>											
															</c:when>
														</c:choose>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Título</label> 
																	<input type="text" value="${solicitacaoDeDesenvolvimento.titulo}" 
																	name="titulo" class="form-control">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Status</label> 
																	<input type="text" value="${solicitacaoDeDesenvolvimento.status}" 
																	name="status" class="form-control" readonly>
																</div>
															</div>
														</div>
						                                    <div class="row">
						                                        <div class="col-md-6">
						                                            <div class="form-group">
						                                                <label>Data de Registro</label>
						                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.dataDeRealizacao}' pattern='dd/MM/yyyy' />">
						                                            </div>
						                                        </div>
						                                        <div class="col-md-6">
						                                            <div class="form-group"> 
						                                                <label>Data de Atualização</label>
						                                                 <c:choose>
						                                                	<c:when test="${not empty solicitacaoDeDesenvolvimento.dataDeModificacao}">
						                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.dataDeModificacao}' pattern='dd/MM/yyyy' />">
						                                                	</c:when>
						                                                	<c:otherwise>
						                                               			 <input type="text" class="form-control" disabled value="Não houve modificação"/>
						                                                	</c:otherwise>		                                                
						                                                </c:choose>
						                                            </div>
						                                        </div>
						                                    </div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Justificativa</label>
																	<textarea rows="5" name="justificativa"class="form-control">${solicitacaoDeDesenvolvimento.justificativa}</textarea>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<div class="row">
																		<div class="col-md-5">
																			<label>Estruturas de Websites Disponíveis</label>
																			<select name="estruturasDeWebsitesDaInstituicao" class="js-multiselect form-control" size="9" multiple="multiple">
																				<c:forEach var="estruturaDeWebsite" items="${estruturasDeWebsites}">
																					<option value="${estruturaDeWebsite.id}">${estruturaDeWebsite.nome}</option>
																				</c:forEach>
																			</select>
																		</div>
																		<div class="col-md-2">
																			<br />
																			<button type="button" id="incluirTodas"
																				class="btn btn-block">
																				<i class="fa fa-angle-double-right"></i>
																			</button>
																			<button type="button" id="incluirUma"
																				class="btn btn-block">
																				<i class="fa fa-angle-right"></i>
																			</button>
																			<button type="button" id="excluirUma"
																				class="btn btn-block">
																				<i class="fa fa-angle-left"></i>
																			</button>
																			<button type="button" id="excluirTodas"
																				class="btn btn-block">
																				<i class="fa fa-angle-double-left"></i>
																			</button>
																		</div>
																		<div class="col-md-5">
																			<label>Estruturas de Websites Solicitadas</label>
																			<select name="estruturasDeWebsitesSolicitadas" id="estruturasDeWebsitesSolicitadas" class="form-control" size="9" multiple="multiple">
																				<c:forEach var="estruturaDeWebsiteSolicitada" items="${solicitacaoDeDesenvolvimento.estruturasDeWebsitesSolicitadas}">
																					<option value="${estruturaDeWebsiteSolicitada.id}">${estruturaDeWebsiteSolicitada.nome}</option>
																				</c:forEach>
																			</select>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														
														<input type="hidden" name="id" value="${solicitacaoDeDesenvolvimento.id}" />
														<input type="hidden" name="acao" value="editar" />
														
														<button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
														<div class="clearfix"></div>
													</div>
												</form>
												
											</c:when>
											<c:otherwise>
											
												<div class="header">
													<h4>
													VISUALIZAR SOLICITAÇÃO DE DESENVOLVIMENTO
					                				<a href="solicitacaoDeDesenvolvimento?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
													</h4>
												</div>				
												<div class="content">
													<c:choose>
														<c:when test="${ not empty successMessage }">
															<div class="row">
																<div class="col-md-12">
																	<div class="alert alert-success" role="alert">
																		<span><b>Sucesso - </b> ${successMessage} </span>
																	</div>
																</div>
															</div>								
														</c:when>
													</c:choose>
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Título</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.titulo}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Status</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.status}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Realização</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${solicitacaoDeDesenvolvimento.dataDeRealizacao}' pattern='dd/MM/yyyy' /></td>
															</tr>
														</tbody>
														<c:choose>
															<c:when test="${(tipoDeUsuario == 'gerente' && usuario.departamento == 'TI') || (tipoDeUsuario == 'webDesigner')}">
																<thead>
																	<tr>
																		<th>Solicitante</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>${solicitacaoDeDesenvolvimento.solicitante.nome} ${solicitacaoDeDesenvolvimento.solicitante.sobrenome}</td>
																	</tr>
																</tbody>
															</c:when>
														</c:choose>
														<thead>
															<tr>
																<th>Justificativa</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.justificativa}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Estrutura(s) de Website(s) Solicitada(s)</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<ul>
																	<c:forEach var="estruturaDeWebsiteSolicitada" items="${solicitacaoDeDesenvolvimento.estruturasDeWebsitesSolicitadas}">
																		<li>${estruturaDeWebsiteSolicitada.nome}</li>
																	</c:forEach>
																	</ul>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</c:otherwise>
										</c:choose>
										<%-- Fim do teste para permitir que apenas os gerentes editem a Solicitação de desenvolvimento --%>
										
									</div>
								</div>
							</div>
							<%-- Fim da Linha de Informações da Solicitação (Título, Status, Justificativa) --%>
								
								
							<%-- Fim cartão do formulário de edição de Solicitação de desenvolvimento --%>
							
							<%-- Cartão do Parecer Técnico --%>
							<c:choose>
								
								<%-- Testa se há parecer emitido para a solicitação --%>
								<c:when test="${empty solicitacaoDeDesenvolvimento.parecer.id}">
									
									<%-- Exibir o Formulário para emissão do Parecer pelo Web-designer ou uma mensagem informando que não 
									há Parecer Técnico emitido para o Gerente de TI --%>
									<c:choose>
									
										<%-- Testa se o usuário é Web-designer --%>
										<c:when test="${tipoDeUsuario == 'webDesigner'}">
											<form action="parecer" method="post">
												<div class="card ">
													<div class="header">
														<h4 class="title">PARECER TÉCNICO</h4>
													</div>
													<div class="content">
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Recomendação</label> 
																	<input type="text" name="recomendacao" class="form-control">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Justificativa</label>
																	<textarea rows="5" name="justificativa" class="form-control"></textarea>
																</div>
															</div>
														</div>
														
														<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" /> 
														<input type="hidden" name="acao" value="emitir" />
														
														<button type="submit" class="btn btn-success btn-fill pull-left">EMITIR PARECER</button>
														<div class="clearfix"></div>
													</div>
												</div>
											</form>
										</c:when>
										<%-- Fim do teste de o usuário ser Web-Designer --%>
										
										<%-- Testa se o usuário é Gerente da área de TI --%>
										<c:when test="${tipoDeUsuario == 'gerente' && usuario.departamento == 'TI'}">
											<div class="card">
												<div class="header">
													<h4 class="title">PARECER TÉCNICO</h4>
												</div>
												<div class="content">
													<div class="row">
														<div class="col-md-12">
															<div class="alert alert-warning">
																<span>Até o momento não foi emitido parecer técnico por algum webdesigner para esta solicitação.</span>
															</div>
														</div>
													</div>
													<p></p>
												</div>
											</div>
										</c:when>
										<%-- Fim do teste de o usuário ser Gerente da área de TI --%>
									</c:choose>
									<%-- Fim da exibição do formulário de emissão de Parecer Técnico ou da mensagem de não haver Parecer
									Técnico para o gerente de TI --%>
									
								</c:when>
								<%-- Fim do teste de haver Parecer para a Solicitação --%>
								
								<%-- Testa não haver Parecer para a solicitação --%>
								<c:when test="${not empty solicitacaoDeDesenvolvimento.parecer.id}">
									
									<%-- Exibe o formulário para edição de Parecer para o webdesigner ou
									exibe o parecer para o Gerente da área de TI --%>
									<c:choose>
									
										<%-- Testa se o usuário é Web-designer --%>
										<c:when test="${tipoDeUsuario == 'webDesigner'}">
											<c:choose>
												<c:when test="${solicitacaoDeDesenvolvimento.status == 'Aguardando Avaliação'}">
													<div class="card">
														<div class="header">
															<h4 class="title">PARECER TÉCNICO</h4>
														</div>
														<div class="content">
															<form action="parecer" method="post">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Recomendação</label> 
																			<input type="text" name="recomendacao" value="${solicitacaoDeDesenvolvimento.parecer.recomendacao}" class="form-control">
																		</div>
																	</div>
																</div>
							                                    <div class="row">
							                                        <div class="col-md-6">
							                                            <div class="form-group">
							                                                <label>Data de Emissão</label>
							                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeEmissao}' pattern='dd/MM/yyyy' />">
							                                            </div>
							                                        </div>
							                                        <div class="col-md-6">
							                                            <div class="form-group"> 
							                                                <label>Data de Atualização</label>
							                                                <c:choose>
							                                                	<c:when test="${not empty solicitacaoDeDesenvolvimento.parecer.dataDeModificacao}">
							                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeModificacao}' pattern='dd/MM/yyyy' />">
							                                                	</c:when>
							                                                	<c:otherwise>
							                                               			 <input type="text" class="form-control" disabled value="Não houve modificação"/>
							                                                	</c:otherwise>		                                                
							                                                </c:choose>
							                                            </div>
							                                        </div>
							                                    </div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Justificativa</label>
																			<textarea rows="5" name="justificativa" class="form-control">${solicitacaoDeDesenvolvimento.parecer.justificativa}</textarea>
																		</div>
																	</div>
																</div>
																
																<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" /> 
																<input type="hidden" name="id" value="${solicitacaoDeDesenvolvimento.parecer.id}" />
																<input type="hidden" name="acao" value="editar" /> 
																
																<button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
															</form>
															<form action="parecer">
																<input type="hidden" name="acao" value="excluir" /> 
																<input type="hidden" name="id" value="${solicitacaoDeDesenvolvimento.parecer.id}" />
																<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" />
																
																<button type="submit" class="btn btn-danger btn-fill pull-right">EXCLUIR PARECER</button>
																<div class="clearfix"></div>
															</form>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="card ">
														<div class="header">
															<h4 class="title">PARECER TÉCNICO</h4>
														</div>
														<div class="content">
															<table class="table table-bordered table-hover">
																<thead>
																	<tr>
																		<th>Recomendação</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>${solicitacaoDeDesenvolvimento.parecer.recomendacao}</td>
																	</tr>
																</tbody>
																<thead>
																	<tr>
																		<th>Data de Emissão</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td><fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeEmissao}' pattern='dd/MM/yyyy' /></td>
																	</tr>
																</tbody>
																<thead>
																	<tr>
																		<th>Data de Modificação</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>
																		<c:choose>
																			<c:when test=""> 
																				<fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeModificacao}' pattern='dd/MM/yyyy' />
																			</c:when>
																			<c:otherwise>
																				Não houve modificação
																			</c:otherwise>
																		</c:choose>
																		</td>
																	</tr>
																</tbody>
																<thead>
																	<tr>
																		<th>Justificativa</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>${solicitacaoDeDesenvolvimento.parecer.justificativa}</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</c:otherwise>
											</c:choose>
										</c:when>
										<%-- Fim do teste de o usuário ser Web-designer --%>
										
										<%-- Testa se o usuário é gerente da área de TI --%>
										<c:when test="${tipoDeUsuario == 'gerente' && usuario.departamento == 'TI'}">
											<div class="card ">
												<div class="header">
													<h4 class="title">PARECER TÉCNICO</h4>
												</div>
												<div class="content">
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Recomendação</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.parecer.recomendacao}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Emissão</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeEmissao}' pattern='dd/MM/yyyy' /></td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Modificação</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																<c:choose>
																	<c:when test=""> 
																		<fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeModificacao}' pattern='dd/MM/yyyy' />
																	</c:when>
																	<c:otherwise>
																		Não houve modificação
																	</c:otherwise>
																</c:choose>
																</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Justificativa</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.parecer.justificativa}</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</c:when>
										<%-- Fim do Test de o usuário ser gerente da área de TI --%>
										
									</c:choose>
									<%-- Fim da Exibição do formulário para edição de Parecer para o webdesigner ou
									da exibição do parecer para o Gerente da área de TI --%>
									
								</c:when>
								<%-- Fim do teste de não haver Parecer para a Solicitação --%>
								
							</c:choose>
							<%-- Fim do Cartão do Parecer Técnico --%>
							
							<c:choose>
								
								<c:when test="${tipoDeUsuario == 'gerente' && usuario.departamento == 'TI'}">
								
									<c:choose>
									
										<c:when test="${solicitacaoDeDesenvolvimento.status == 'Aguardando Avaliação'}">
										
											<div class="card">
												<div class="header">
													<h4 class="title">AVALIAÇÃO DA SOLICITAÇÃO</h4>
												</div>
												<div class="content">
													<form action="avaliacaoDeSolicitacaoDeDesenvolvimento" method="post">
														<div class="row">
															<div class="col-md-12">
																<label>Avaliação</label><br />
																<input type="radio" name="avaliacao" value="Aceita" /> Aceita <br />
																<input type="radio" name="avaliacao" value="Rejeitada" /> Rejeitada <br />
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Justificativa</label>
																	<textarea rows="5" name="justificativa"
																		class="form-control"></textarea>
																</div>
															</div>
														</div>
														
														<input type="hidden" name="acao" value="emitir" />
														<input type="hidden" name="idSolicitacaoDeDesenvolvimento"
															value="${solicitacaoDeDesenvolvimento.id}" /> 
														<button type="submit" class="btn btn-success btn-fill pull-left">AVALIAR</button>
															<div class="clearfix"></div>
													</form>
												</div>
											</div>
										
										</c:when>
										<c:when test="${solicitacaoDeDesenvolvimento.status == 'Aceita' || solicitacaoDeDesenvolvimento.status == 'Rejeitada'}">
										
											<div class="card">
												<div class="header">
													<h4 class="title">AVALIAÇÃO DA SOLICITAÇÃO</h4>
												</div>
												<div class="content">
													<form action="avaliacaoDeSolicitacaoDeDesenvolvimento" method="post">
														<c:choose>
															<c:when test="${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.avaliacao == 'Aceita'}">
																<div class="form-check form-check-radio">
																	<label class="form-check-label">
																		<input type="radio" class="form-check-input" name="avaliacao" value="Aceita" checked /> 
																		<span class="form-check-sign"></span>
																		Aceita
																	</label>
																</div>
																<div class="form-check form-check-radio">
																	<label class="form-check-label">
																		<input type="radio" class="form-check-input" name="avaliacao" value="Rejeitada" />
																		<span class="form-check-sign"></span>
																		Rejeitada
																	</label>
																</div>
															</c:when>
															<c:otherwise>
																<div class="form-check form-check-radio disabled">
																	<label class="form-check-label">
																		<input type="radio" class="form-check-input" name="avaliacao" value="Aceita" />
																		<span class="form-check-sign"></span>
																		Aceita
																	</label>
																</div>
																<div class="form-check form-check-radio disabled">
																	<label class="form-check-label">
																		<input type="radio" class="form-check-input" name="avaliacao" value="Rejeitada" checked />
																		<span class="form-check-sign"></span>
																		Rejeitada
																	</label>
																</div>
															</c:otherwise>
														</c:choose>
					                                    <div class="row">
					                                        <div class="col-md-6">
					                                            <div class="form-group">
					                                                <label>Data de Emissão</label>
					                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeEmissao}' pattern='dd/MM/yyyy' />">
					                                            </div>
					                                        </div>
					                                        <div class="col-md-6">
					                                            <div class="form-group"> 
					                                                <label>Data de Atualização</label>
					                                                <c:choose>
					                                                	<c:when test="${not empty solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeModificacao}">
					                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeModificacao}' pattern='dd/MM/yyyy' />">
					                                                	</c:when>
					                                                	<c:otherwise>
					                                               			 <input type="text" class="form-control" disabled value="Não houve modificação"/>
					                                                	</c:otherwise>		                                                
					                                                </c:choose>
					                                            </div>
					                                        </div>
					                                    </div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Justificativa</label>
																	<textarea rows="5" name="justificativa"
																		class="form-control">${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.justificativa}</textarea>
																</div>
															</div>
														</div>
														
														<input type="hidden" name="acao" value="editar" />
														<input type="hidden" name="id" value="${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.id}" />
														<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" />
														<button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
													</form>
													<form action="avaliacaoDeSolicitacaoDeDesenvolvimento">
														<input type="hidden" name="acao" value="excluir" />
														<input type="hidden" name="id" value="${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.id}" />
														<input type="hidden" name="idSolicitacaoDeDesenvolvimento" value="${solicitacaoDeDesenvolvimento.id}" />
														<button type="submit" class="btn btn-danger btn-fill pull-right">EXCLUIR</button>
														<div class="clearfix"></div>
													</form>	
												</div>
											</div>
										
										</c:when>
										<c:when test="${solicitacaoDeDesenvolvimento.status == 'Incluída em Projeto' || solicitacaoDeDesenvolvimento.status == 'Atendida'}">
											
											<div class="card">
												<div class="header">
													<h4 class="title">AVALIAÇÃO DA SOLICITAÇÃO</h4>
												</div>
												<div class="content">
													
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Avaliação</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.avaliacao}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Emissão</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeEmissao}' pattern='dd/MM/yyyy' /></td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Modificação</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																<c:choose>
																	<c:when test=""> 
																		<fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeModificacao}' pattern='dd/MM/yyyy' />
																	</c:when>
																	<c:otherwise>
																		Não houve modificação
																	</c:otherwise>
																</c:choose>
																</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Justificativa</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.justificativa}</td>
															</tr>
														</tbody>
													</table>
													
												</div>
											</div>
											
										</c:when>
									
									</c:choose>
								
								</c:when>
								
								<c:otherwise>
									<c:choose>
										<c:when test="${solicitacaoDeDesenvolvimento.status != 'Nova' && solicitacaoDeDesenvolvimento.status != 'Aguardando Avaliação'}">
											
											<div class="card">
												<div class="header">
													<h4 class="title">AVALIAÇÃO DA SOLICITAÇÃO</h4>
												</div>
												<div class="content">
													
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Avaliação</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.avaliacao}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Emissão</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeEmissao}' pattern='dd/MM/yyyy' /></td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Modificação</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																<c:choose>
																	<c:when test=""> 
																		<fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeModificacao}' pattern='dd/MM/yyyy' />
																	</c:when>
																	<c:otherwise>
																		Não houve modificação
																	</c:otherwise>
																</c:choose>
																</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Justificativa</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.justificativa}</td>
															</tr>
														</tbody>
													</table>
													
												</div>
											</div>
											
										</c:when>
									</c:choose>
								</c:otherwise>
							
							</c:choose>
								
						</c:when>
						<%-- Fim da exibição da solicitação de desenvolvimento --%>
								
					</c:choose>
					<%-- Fim do Teste de criar uma nova solicitação de desenvolvimento ou editar uma já existente --%>
					
				</div>
				<!-- Fim do container -->
				
			</div>
			<!-- Fim do conteúdo da Página -->
			
			<!-- Início do rodapé -->
			<footer class="footer">
				<div class="container-fluid">
					<p class="copyright pull-right">
						&copy;
						<script>
							document.write(new Date().getFullYear())
						</script>
						<a href="https://www.nathanaellima.com">Nathanael Lima</a>
					</p>
				</div>
			</footer>
			<!-- Fim do rodapé -->

		</div>
	</div>
	
	<c:import url="/common/rodape.jsp" />
	
	<!--  Two-side Multi Select Plugin    -->
    <script src="assets/js/multiselect.js"></script>
    <script type="text/javascript">
	    jQuery(document).ready(function($) {
	        $('.js-multiselect').multiselect({
	            right: '#estruturasDeWebsitesSolicitadas',
	            rightAll: '#incluirTodas',
	            rightSelected: '#incluirUma',
	            leftSelected: '#excluirUma',
	            leftAll: '#excluirTodas'
	        });
	    });
	</script>
    
</body>
</html>