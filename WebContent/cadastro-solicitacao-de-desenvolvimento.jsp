<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Solicita��o de Desenvolvimento de Website</title>
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
									<p>Solicita��es de Desenvolvimento</p>
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
			
			<!-- In�cio do conte�do da P�gina -->
			<div class="content">
			
				<!-- Mostra o container -->
				<div class="container-fluid">
				
					<%-- Testa se ir� criar uma nova solicita��o de desenvolvimento ou editar uma j� existente --%>
					<c:choose>
					
						<%-- Exibe o formul�rio de Solicita��o de Desenvolvimento --%>
						<c:when test="${empty solicitacaoDeDesenvolvimento.id}">
						
							<%-- Cart�o do formul�rio de cadastro de Solicita��o de desenvolvimento --%>
							
							
								<%-- In�cio da Linha de Informa��es da Solicita��o (T�tulo, Status, Justificativa) --%>
								<div class="row">
									<div class="col-md-12">
										<div class="card">
											<div class="header">
												<h4>
												NOVA SOLICITA��O DE DESENVOLVIMENTO DE WEBSITE
					                			<a href="solicitacaoDeDesenvolvimento?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
												</h4>
											</div>				
											<div class="content">
												<form action="solicitacaoDeDesenvolvimento" method="post">
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<label>T�tulo</label> <input type="text" name="titulo" class="form-control">
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
																		<label>Estruturas de Websites Dispon�veis</label>
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
													<button type="submit" class="btn btn-success btn-fill pull-left">REALIZAR SOLICITA��O</button>
													<div class="clearfix"></div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<%-- Fim da Linha de Informa��es da Solicita��o (T�tulo, Status, Justificativa) --%>
								
							<%--Fim do formul�rio de cadastro de Solicita��o de desenvolvimento --%>
							
						</c:when>
						<%-- Fim da exibi��o o formul�rio de Solicita��o de Desenvolvimento --%>
						
						<%-- Exibe a solicita��o de desenvolvimento --%>
						<c:when test="${not empty solicitacaoDeDesenvolvimento.id}">
							
							<%-- In�cio da Linha de Informa��es da Solicita��o (T�tulo, Status, Justificativa) --%>
							<div class="row">
							
								<div class="col-md-12">
									<div class="card">
										
										<%-- In�cio do teste para permitir que apenas os gerentes editem a Solicita��o de desenvolvimento --%>
										<c:choose>
											<c:when test="${(tipoDeUsuario == 'gerente' && usuario.departamento != 'TI') && 
															(solicitacaoDeDesenvolvimento.status == 'Nova')}">
												<div class="header">
													<h4>
													EDITAR SOLICITA��O DE DESENVOLVIMENTO
					                				<a href="solicitacaoDeDesenvolvimento?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
													</h4>
												</div>
												<%-- In�cio do formul�rio de edi��o de Solicita��o de desenvolvimento --%>
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
																	<label>T�tulo</label> 
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
						                                                <label>Data de Atualiza��o</label>
						                                                 <c:choose>
						                                                	<c:when test="${not empty solicitacaoDeDesenvolvimento.dataDeModificacao}">
						                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.dataDeModificacao}' pattern='dd/MM/yyyy' />">
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
																			<label>Estruturas de Websites Dispon�veis</label>
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
													VISUALIZAR SOLICITA��O DE DESENVOLVIMENTO
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
																<th>T�tulo</th>
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
																<th>Data de Realiza��o</th>
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
										<%-- Fim do teste para permitir que apenas os gerentes editem a Solicita��o de desenvolvimento --%>
										
									</div>
								</div>
							</div>
							<%-- Fim da Linha de Informa��es da Solicita��o (T�tulo, Status, Justificativa) --%>
								
								
							<%-- Fim cart�o do formul�rio de edi��o de Solicita��o de desenvolvimento --%>
							
							<%-- Cart�o do Parecer T�cnico --%>
							<c:choose>
								
								<%-- Testa se h� parecer emitido para a solicita��o --%>
								<c:when test="${empty solicitacaoDeDesenvolvimento.parecer.id}">
									
									<%-- Exibir o Formul�rio para emiss�o do Parecer pelo Web-designer ou uma mensagem informando que n�o 
									h� Parecer T�cnico emitido para o Gerente de TI --%>
									<c:choose>
									
										<%-- Testa se o usu�rio � Web-designer --%>
										<c:when test="${tipoDeUsuario == 'webDesigner'}">
											<form action="parecer" method="post">
												<div class="card ">
													<div class="header">
														<h4 class="title">PARECER T�CNICO</h4>
													</div>
													<div class="content">
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Recomenda��o</label> 
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
										<%-- Fim do teste de o usu�rio ser Web-Designer --%>
										
										<%-- Testa se o usu�rio � Gerente da �rea de TI --%>
										<c:when test="${tipoDeUsuario == 'gerente' && usuario.departamento == 'TI'}">
											<div class="card">
												<div class="header">
													<h4 class="title">PARECER T�CNICO</h4>
												</div>
												<div class="content">
													<div class="row">
														<div class="col-md-12">
															<div class="alert alert-warning">
																<span>At� o momento n�o foi emitido parecer t�cnico por algum webdesigner para esta solicita��o.</span>
															</div>
														</div>
													</div>
													<p></p>
												</div>
											</div>
										</c:when>
										<%-- Fim do teste de o usu�rio ser Gerente da �rea de TI --%>
									</c:choose>
									<%-- Fim da exibi��o do formul�rio de emiss�o de Parecer T�cnico ou da mensagem de n�o haver Parecer
									T�cnico para o gerente de TI --%>
									
								</c:when>
								<%-- Fim do teste de haver Parecer para a Solicita��o --%>
								
								<%-- Testa n�o haver Parecer para a solicita��o --%>
								<c:when test="${not empty solicitacaoDeDesenvolvimento.parecer.id}">
									
									<%-- Exibe o formul�rio para edi��o de Parecer para o webdesigner ou
									exibe o parecer para o Gerente da �rea de TI --%>
									<c:choose>
									
										<%-- Testa se o usu�rio � Web-designer --%>
										<c:when test="${tipoDeUsuario == 'webDesigner'}">
											<c:choose>
												<c:when test="${solicitacaoDeDesenvolvimento.status == 'Aguardando Avalia��o'}">
													<div class="card">
														<div class="header">
															<h4 class="title">PARECER T�CNICO</h4>
														</div>
														<div class="content">
															<form action="parecer" method="post">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Recomenda��o</label> 
																			<input type="text" name="recomendacao" value="${solicitacaoDeDesenvolvimento.parecer.recomendacao}" class="form-control">
																		</div>
																	</div>
																</div>
							                                    <div class="row">
							                                        <div class="col-md-6">
							                                            <div class="form-group">
							                                                <label>Data de Emiss�o</label>
							                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeEmissao}' pattern='dd/MM/yyyy' />">
							                                            </div>
							                                        </div>
							                                        <div class="col-md-6">
							                                            <div class="form-group"> 
							                                                <label>Data de Atualiza��o</label>
							                                                <c:choose>
							                                                	<c:when test="${not empty solicitacaoDeDesenvolvimento.parecer.dataDeModificacao}">
							                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeModificacao}' pattern='dd/MM/yyyy' />">
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
															<h4 class="title">PARECER T�CNICO</h4>
														</div>
														<div class="content">
															<table class="table table-bordered table-hover">
																<thead>
																	<tr>
																		<th>Recomenda��o</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>${solicitacaoDeDesenvolvimento.parecer.recomendacao}</td>
																	</tr>
																</tbody>
																<thead>
																	<tr>
																		<th>Data de Emiss�o</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td><fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeEmissao}' pattern='dd/MM/yyyy' /></td>
																	</tr>
																</tbody>
																<thead>
																	<tr>
																		<th>Data de Modifica��o</th>
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
																				N�o houve modifica��o
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
										<%-- Fim do teste de o usu�rio ser Web-designer --%>
										
										<%-- Testa se o usu�rio � gerente da �rea de TI --%>
										<c:when test="${tipoDeUsuario == 'gerente' && usuario.departamento == 'TI'}">
											<div class="card ">
												<div class="header">
													<h4 class="title">PARECER T�CNICO</h4>
												</div>
												<div class="content">
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Recomenda��o</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.parecer.recomendacao}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Emiss�o</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${solicitacaoDeDesenvolvimento.parecer.dataDeEmissao}' pattern='dd/MM/yyyy' /></td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Modifica��o</th>
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
																		N�o houve modifica��o
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
										<%-- Fim do Test de o usu�rio ser gerente da �rea de TI --%>
										
									</c:choose>
									<%-- Fim da Exibi��o do formul�rio para edi��o de Parecer para o webdesigner ou
									da exibi��o do parecer para o Gerente da �rea de TI --%>
									
								</c:when>
								<%-- Fim do teste de n�o haver Parecer para a Solicita��o --%>
								
							</c:choose>
							<%-- Fim do Cart�o do Parecer T�cnico --%>
							
							<c:choose>
								
								<c:when test="${tipoDeUsuario == 'gerente' && usuario.departamento == 'TI'}">
								
									<c:choose>
									
										<c:when test="${solicitacaoDeDesenvolvimento.status == 'Aguardando Avalia��o'}">
										
											<div class="card">
												<div class="header">
													<h4 class="title">AVALIA��O DA SOLICITA��O</h4>
												</div>
												<div class="content">
													<form action="avaliacaoDeSolicitacaoDeDesenvolvimento" method="post">
														<div class="row">
															<div class="col-md-12">
																<label>Avalia��o</label><br />
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
													<h4 class="title">AVALIA��O DA SOLICITA��O</h4>
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
					                                                <label>Data de Emiss�o</label>
					                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeEmissao}' pattern='dd/MM/yyyy' />">
					                                            </div>
					                                        </div>
					                                        <div class="col-md-6">
					                                            <div class="form-group"> 
					                                                <label>Data de Atualiza��o</label>
					                                                <c:choose>
					                                                	<c:when test="${not empty solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeModificacao}">
					                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeModificacao}' pattern='dd/MM/yyyy' />">
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
										<c:when test="${solicitacaoDeDesenvolvimento.status == 'Inclu�da em Projeto' || solicitacaoDeDesenvolvimento.status == 'Atendida'}">
											
											<div class="card">
												<div class="header">
													<h4 class="title">AVALIA��O DA SOLICITA��O</h4>
												</div>
												<div class="content">
													
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Avalia��o</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.avaliacao}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Emiss�o</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeEmissao}' pattern='dd/MM/yyyy' /></td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Modifica��o</th>
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
																		N�o houve modifica��o
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
										<c:when test="${solicitacaoDeDesenvolvimento.status != 'Nova' && solicitacaoDeDesenvolvimento.status != 'Aguardando Avalia��o'}">
											
											<div class="card">
												<div class="header">
													<h4 class="title">AVALIA��O DA SOLICITA��O</h4>
												</div>
												<div class="content">
													
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Avalia��o</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.avaliacao}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Emiss�o</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${solicitacaoDeDesenvolvimento.avaliacaoDaSolicitacao.dataDeEmissao}' pattern='dd/MM/yyyy' /></td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Modifica��o</th>
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
																		N�o houve modifica��o
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
						<%-- Fim da exibi��o da solicita��o de desenvolvimento --%>
								
					</c:choose>
					<%-- Fim do Teste de criar uma nova solicita��o de desenvolvimento ou editar uma j� existente --%>
					
				</div>
				<!-- Fim do container -->
				
			</div>
			<!-- Fim do conte�do da P�gina -->
			
			<!-- In�cio do rodap� -->
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
			<!-- Fim do rodap� -->

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