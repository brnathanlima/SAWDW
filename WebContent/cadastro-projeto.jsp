<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Cadastro de Projeto</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
	<div class="wrapper">
		<c:choose>
			<c:when test="${tipoDeUsuario == 'webDesigner'}">
				<div class="sidebar" data-color="red">

					<div class="sidebar-wrapper">
						<div class="logo">
							<a href="webDesigner?acao=visualizarPainel" class="simple-text"> SAEDW </a>
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
							<li><a href="solicitacaoDeDesenvolvimento?acao=listar"> <i
									class="pe-7s-bell"></i>
									<p>Solicitacoes de Desenvolvimento</p>
							</a></li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:when test="${tipoDeUsuario == 'gerente'}">
				<div class="sidebar" data-color="orange">

					<div class="sidebar-wrapper">
						<div class="logo">
							<a href="gerente?acao=visualizarPainel" class="simple-text"> SAEDW </a>
						</div>

						<ul class="nav">
							<li><a
								href="solicitacaoDeDesenvolvimento?acao=listar"> <i
									class="pe-7s-bell"></i>
									<p>Solicitações de Desenvolvimento</p>
							</a></li>
							<li class="active"><a href="projeto?acao=listar"> <i
									class=pe-7s-network></i>
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
				
					<%-- Exibe o formulário de criação ou edição de Projeto --%>
					<c:choose>
					
						<%-- Mostra o formulário de criação do projeto --%>
						<c:when test="${empty projeto}">
							
							<%-- Testa se há solicitações de desenvolvimento aprovadas --%>
							<c:choose>
								
								<%-- Mostra cartão com mensagem de não haver solicitações de desenvolvimento aprovadas --%>
								<c:when test="${empty solicitacoesDeDesenvolvimento}">
									<div class="card">
										<div class="header">
											<h4 class="title">
											 NOVO PROJETO
											<a href="projeto?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>											
											</h4>
										</div>
										<div class="content">
											<div class="row">
												<div class="col-md-12">
													<div class="alert alert-warning">
														<span>Não há solicitações de desenvolvimento aprovadas que possam ser utilizadas em um novo projeto</span>
													</div>
												</div>
											</div>
											<p></p>
										</div>
									</div>
								</c:when>
								<%-- Fim do cartão com mensagem de não haver solicitações de desenvolvimento aprovadas --%>
								
								<%-- Mostra cartão com formulário de criação de novo projeto --%>
								<c:when test="${not empty solicitacoesDeDesenvolvimento}">
									
									<div class="card ">
										<div class="header">
											<h4 class="title">
											PROJETO DE DESENVOLVIMENTO
											<a href="projeto?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
											</h4>
										</div>
										<div class="content">
											<form action="projeto" method="post">
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
														<label>Descrição</label>
														<textarea rows="5" name="descricao" class="form-control"></textarea>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<div class="row">
															<div class="col-md-5">
																<label>Solicitações de Websites Disponíveis</label>
																<select name="solicitacoesDeDesenvolvimentoAprovadas" class="js-multiselect form-control" size="9" multiple="multiple">
																	<c:forEach var="solicitacaoDeDesenvolvimento" items="${solicitacoesDeDesenvolvimento}" varStatus="id">
																		<option value="${solicitacaoDeDesenvolvimento.id}">${solicitacaoDeDesenvolvimento.titulo}</option>
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
																<label>Solicitações de Desenvolvimento Aprovadas a Serem Incluídas</label>
																<select name="solicitacoesDeDesenvolvimentoIncluidas" id="solicitacoesDeDesenvolvimentoIncluidas" class="form-control" size="9" multiple="multiple">
																</select>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<input type="hidden" name="acao" value="cadastrar">
											<button type="submit" class="btn btn-success btn-fill pull-left">CRIAR PROJETO</button>
											
											<div class="clearfix"></div>
											
											</form>
										</div>
									</div>
									
								</c:when>
								<%-- Fim do cartão com formulário de criação de novo projeto --%>
								
							</c:choose>
							<%-- Fim do teste de haver solicitações de desenvolvimento aprovadas --%>
							
						</c:when>
						<%-- Fim do formulário de criação do projeto --%>
						
						<%-- Formulário de edição do Projeto --%>
						<c:when test="${not empty projeto}">
						
							<%-- Habilita ou desabilita a edição do projeto de acordo com o status --%>
							<c:choose>
								<c:when test="${projeto.status == 'Novo'}">
									
									<%-- Mostra formulário de edião para o gerente do setor de TI e mostra as informações do projeto para os outros gerentes --%>
									<c:choose>
									
										<%-- Teste se o usuário é o gerente de TI --%>
										<c:when test="${tipoDeUsuario == 'gerente' && usuario.departamento == 'TI'}">
											<div class="row">
												<div class="col-md-12">
													<div class="card ">
														<div class="header">
															<h4 class="title">
															EDITAR PROJETO DE DESENVOLVIMENTO
															<a href="projeto?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>											
															</h4>
														</div>
														<div class="content">
															<c:choose>
																<c:when test="${ not empty successMessage }">
																	<div class="alert alert-success" role="alert">
																		<span><b>Sucesso - </b> ${successMessage} </span>
																	</div>											
																</c:when>
															</c:choose>
															<form action="projeto" method="post">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Título</label> 
																			<input type="text" name="titulo" class="form-control" value="${projeto.titulo}">
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Status</label> 
																			<input type="text" name="status" class="form-control" value="${projeto.status}" readonly>
																		</div>
																	</div>
																</div>
							                                    <div class="row">
							                                        <div class="col-md-6">
							                                            <div class="form-group">
							                                                <label>Data de Registro</label>
							                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${projeto.dataDeCriacao}' pattern='dd/MM/yyyy' />">
							                                            </div>
							                                        </div>
							                                        <div class="col-md-6">
							                                            <div class="form-group"> 
							                                                <label>Data de Atualização de Cadastro</label>
							                                                <c:choose>
							                                                	<c:when test="${not empty projeto.dataDeModificacao}">
							                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${projeto.dataDeModificacao}' pattern='dd/MM/yyyy' />">
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
																			<label>Descrição</label>
																			<textarea rows="5" name="descricao" class="form-control">${projeto.descricao}</textarea>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<div class="row">
																				<div class="col-md-5">
																					<label>Solicitações de Websites Disponíveis</label>
																					<select name="solicitacoesDeDesenvolvimentoAprovadas" class="js-multiselect form-control" size="9" multiple="multiple">
																						<c:forEach var="solicitacaoDeDesenvolvimento" items="${solicitacoesDeDesenvolvimento}" varStatus="id">
																							<option value="${solicitacaoDeDesenvolvimento.id}">${solicitacaoDeDesenvolvimento.titulo}</option>
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
																					<label>Solicitações de Desenvolvimento Incluídas no Projeto</label>
																					<select name="solicitacoesDeDesenvolvimentoIncluidas" id="solicitacoesDeDesenvolvimentoIncluidas" class="form-control" size="9" multiple="multiple">
																						<c:forEach var="solicitacoesDeDesenvolvimentoIncluidas" items="${projeto.solicitacoesDeDesenvolvimentoDoProjeto}">
																							<option value="${solicitacoesDeDesenvolvimentoIncluidas.id}">${solicitacoesDeDesenvolvimentoIncluidas.titulo}</option>
																						</c:forEach>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																
																<input type="hidden" name="id" value="${projeto.id}">
																<input type="hidden" name="acao" value="editar">
																<button type="submit" class="btn btn-success btn-fill pull-left">EDITAR PROJETO</button>
																<div class="clearfix"></div>
															</form>
														</div>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-12">
													<div class="card ">
														<div class="header">
															<h4 class="title">FINALIZAR PROJETO</h4>
														</div>
														<div class="content">
															<form action="projeto" method="post">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Resumo</label>
																			<textarea rows="5" name="resumo" class="form-control"></textarea>
																		</div>
																	</div>
																</div>
																
																<input type="hidden" name="acao" value="finalizar" /> 
																<input type="hidden" name="id" value="${projeto.id}" />
																
																<button type="submit" class="btn btn-warning btn-fill pull-left">FINALIZAR PROJETO</button>
																<div class="clearfix"></div>
															</form>
														</div>
													</div>
												</div>
											</div>
											
										</c:when>
										<%-- Fim do teste de o usuário ser o gerente de TI --%>
										
										<%-- Testa se o usuário é gerente --%>
										<c:otherwise>
											<div class="card ">
												<div class="header">
													<h4 class="title">
													PROJETO DE DESENVOLVIMENTO
													<a href="projeto?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
													</h4>
												</div>
												<div class="content">
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Título</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${projeto.titulo}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Criação</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${projeto.dataDeCriacao}' pattern='dd/MM/yyyy' /></td>
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
																	<c:when test="${not empty projeto.dataDeModificacao}">
																		<fmt:formatDate value='${projeto.dataDeModificacao}' pattern='dd/MM/yyyy' />
																	</c:when>
																	<c:otherwise>
																		Não houve alteração.
																	</c:otherwise>
																</c:choose>
																</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Status</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${projeto.status}</td>
															</tr>
														</tbody>
														<c:choose>
															<c:when test="${(tipoDeUsuario == 'gerente' && usuario.departamento != 'TI') || (tipoDeUsuario == 'webDesigner')}">
																<thead>
																	<tr>
																		<th>Gerente do Projeto</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>${projeto.gerenteDoProjeto.nome} ${projeto.gerenteDoProjeto.sobrenome}</td>
																	</tr>
																</tbody>
															</c:when>
														</c:choose>
														<thead>
															<tr>
																<th>Descrição</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${projeto.descricao}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Solicitação(ções) Desenvolvimento de Website(s) Incluídas(s)</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<ul>
																	<c:forEach var="solicitacaoDeDesenvolvimentoDoProjeto" items="${projeto.solicitacoesDeDesenvolvimentoDoProjeto}">
																		<li>${solicitacaoDeDesenvolvimentoDoProjeto.titulo}</li>
																	</c:forEach>
																	</ul>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											
										</c:otherwise>
										<%-- Fim do teste de o usuário ser gerente --%>
										
									</c:choose>
									<%-- Fim da exibição do formulário de edião para o gerente do setor de TI e mostra as informações do projeto para os outros gerentes --%>
									
									
								</c:when>
								
								<c:when test="${projeto.status != 'Novo'}">
									<div class="card ">
										<div class="header">
											<h4 class="title">
											PROJETO DE DESENVOLVIMENTO
											<a href="projeto?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
											</h4>
										</div>
										<div class="content">
											<c:choose>
												<c:when test="${ not empty successMessage }">
													<div class="alert alert-success" role="alert">
														<span><b>Sucesso - </b> ${successMessage} </span>
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
														<td>${projeto.titulo}</td>
													</tr>
												</tbody>
												<thead>
													<tr>
														<th>Status</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${projeto.status}</td>
													</tr>
												</tbody>
												<thead>
													<tr>
														<th>Data de Criação</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><fmt:formatDate value='${projeto.dataDeCriacao}' pattern='dd/MM/yyyy' /></td>
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
															<c:when test="${not empty projeto.dataDeModificacao}">
																<fmt:formatDate value='${projeto.dataDeModificacao}' pattern='dd/MM/yyyy' />
															</c:when>
															<c:otherwise>
																Não houve alteração.
															</c:otherwise>
														</c:choose>
														</td>
													</tr>
												</tbody>
												<c:choose>
													<c:when test="${(tipoDeUsuario == 'gerente' && usuario.departamento != 'TI') || (tipoDeUsuario == 'webDesigner')}">
														<thead>
															<tr>
																<th>Gerente do Projeto</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${projeto.gerenteDoProjeto.nome} ${projeto.gerenteDoProjeto.sobrenome}</td>
															</tr>
														</tbody>
													</c:when>
												</c:choose>
												<thead>
													<tr>
														<th>Descrição</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${projeto.descricao}</td>
													</tr>
												</tbody>
												<thead>
													<tr>
														<th>Solicitação(ções) Desenvolvimento de Website(s) Incluídas(s)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<ul>
															<c:forEach var="solicitacaoDeDesenvolvimentoDoProjeto" items="${projeto.solicitacoesDeDesenvolvimentoDoProjeto}">
																<li>${solicitacaoDeDesenvolvimentoDoProjeto.titulo}</li>
															</c:forEach>
															</ul>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<c:choose>
										<c:when test="${projeto.status == 'Finalizado' && tipoDeUsuario == 'gerente' && usuario.departamento == 'TI'}">
											<div class="row">
												<div class="col-md-12">
													<div class="card ">
														<div class="header">
															<h4 class="title">EDITAR RESULTADOS DO PROJETO</h4>
														</div>
														<div class="content">
															<form action="projeto" method="post">
																<div class="row">
							                                        <div class="col-md-12">
							                                            <div class="form-group">
							                                                <label>Data de Conclusão do Projeto</label>
							                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${projeto.dataDeConclusao}' pattern='dd/MM/yyyy' />">
							                                            </div>
							                                        </div>
							                                    </div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Resumo</label>
																			<textarea rows="5" name="resumo" class="form-control">${projeto.resumo}</textarea>
																		</div>
																	</div>
																</div>
																
																<input type="hidden" name="acao" value="editarFinalizacao" /> 
																<input type="hidden" name="id" value="${projeto.id}" />
																
																<button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
															</form>
															<form action="projeto" method="post">
																<input type="hidden" name="acao" value="reabrirProjeto" /> 
																<input type="hidden" name="id" value="${projeto.id}" />
																
																<button type="submit" class="btn btn-warning btn-fill pull-right">REABRIR</button>
																<div class="clearfix"></div>
															</form>
														</div>
													</div>
												</div>
											</div>								
										</c:when>
										<c:otherwise>
											<div class="card ">
												<div class="header">
													<h4 class="title">RESULTADOS DO PROJETO</h4>
												</div>
												<div class="content">
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Data de Conclusão</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${projeto.dataDeConclusao}' pattern='dd/MM/yyyy' /></td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Resumo</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${projeto.resumo}</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>									
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${empty projeto.avaliacaoDoProjeto && tipoDeUsuario == 'gerente' && usuario.departamento != 'TI'}">
											<div class="row">
												<div class="col-md-12">
													<div class="card ">
														<div class="header">
															<h4 class="title">AVALIAR PROJETO</h4>
														</div>
														<div class="content">
															<form action="avaliacaoDeProjeto" method="post">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Título da Avaliação</label>
																			<input type="text" name="titulo" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Que nota você dá ao Projeto?</label>
																			<input type="number" min="0" max="10" name="nota" class="form-control" placeholder="0 - 10" />
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Deixe o seu Comentário</label>
																			<textarea rows="5" name="comentario" class="form-control"></textarea>
																		</div>
																	</div>
																</div>
																
																<input type="hidden" name="acao" value="emitir" /> 
																<input type="hidden" name="id" value="${projeto.id}" />
																
																<button type="submit" class="btn btn-success btn-fill pull-left">AVALIAR</button>
																<div class="clearfix"></div>
															</form>
														</div>
													</div>
												</div>
											</div>								
										</c:when>
										<c:when test="${not empty projeto.avaliacaoDoProjeto && tipoDeUsuario == 'gerente' && usuario.departamento != 'TI'}">
											<div class="row">
												<div class="col-md-12">
													<div class="card ">
														<div class="header">
															<h4 class="title">EDITAR AVALIAÇÃO DO PROJETO</h4>
														</div>
														<div class="content">
															<form action="avaliacaoDeProjeto" method="post">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Título da Avaliação</label>
																			<input type="text" name="titulo" class="form-control" value="${projeto.avaliacaoDoProjeto.titulo}"/>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label>Que nota você dá ao Projeto?</label>
																			<input type="number" min="0" max="10" name="nota" class="form-control" value="${projeto.avaliacaoDoProjeto.nota}"/>
																		</div>
																	</div>
																</div>
							                                    <div class="row">
							                                        <div class="col-md-6">
							                                            <div class="form-group">
							                                                <label>Data de Emissão</label>
							                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${projeto.avaliacaoDoProjeto.dataDeEmissao}' pattern='dd/MM/yyyy' />">
							                                            </div>
							                                        </div>
							                                        <div class="col-md-6">
							                                            <div class="form-group"> 
							                                                <label>Data de Atualização</label>
							                                                <c:choose>
							                                                	<c:when test="${not empty projeto.avaliacaoDoProjeto.dataDeModificacao}">
							                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${projeto.avaliacaoDoProjeto.dataDeModificacao}' pattern='dd/MM/yyyy' />">
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
																			<label>Deixe o seu Comentário</label>
																			<textarea rows="5" name="comentario" class="form-control">${projeto.avaliacaoDoProjeto.comentario}</textarea>
																		</div>
																	</div>
																</div>
																
																<input type="hidden" name="acao" value="editar" />
																<input type="hidden" name="idProjeto" value="${projeto.id}" />
																<input type="hidden" name="id" value="${projeto.avaliacaoDoProjeto.id}" />
																
																<button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
															</form>
															<form action="avaliacaoDeProjeto" method="post">
																<input type="hidden" name="acao" value="excluir" />
																<input type="hidden" name="idProjeto" value="${projeto.id}" />
																<input type="hidden" name="id" value="${projeto.avaliacaoDoProjeto.id}" />
																
																<button type="submit" class="btn btn-danger btn-fill pull-right">EXCLUIR</button>
																<div class="clearfix"></div>
															</form>
														</div>
													</div>
												</div>
											</div>						
										</c:when>
										<c:when test="${not empty projeto.avaliacaoDoProjeto && tipoDeUsuario == 'gerente' && usuario.departamento == 'TI'}">
											<div class="card ">
												<div class="header">
													<h4 class="title">AVALIAÇÃO DO PROJETO</h4>
												</div>
												<div class="content">
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>Título da Avaliação</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${projeto.avaliacaoDoProjeto.titulo}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Nota</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${projeto.avaliacaoDoProjeto.nota}</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Data de Emissão</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><fmt:formatDate value='${projeto.avaliacaoDoProjeto.dataDeEmissao}' pattern='dd/MM/yyyy' /></td>
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
																	<c:when test="${not empty projeto.avaliacaoDoProjeto.dataDeModificacao}">
																		<fmt:formatDate value='${projeto.avaliacaoDoProjeto.dataDeModificacao}' pattern='dd/MM/yyyy' />
																	</c:when>
																	<c:otherwise>
																		Não houve alteração.
																	</c:otherwise>
																</c:choose>
																</td>
															</tr>
														</tbody>
														<thead>
															<tr>
																<th>Comentário</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>${projeto.avaliacaoDoProjeto.comentario}</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</c:when>
									</c:choose>
								</c:when>
								
							</c:choose>
							<%-- Fim da Habilitação ou desabilitação da edição do projeto de acordo com o status --%>
						</c:when>
						<%-- Fim Formulário de edição do Projeto --%>
						
					</c:choose>
					<%-- Fim da Exibição do formulário de criação ou edição de Projeto --%>
	
				</div>
				<!-- Fim do container -->
				
			</div>
			<!-- Fim do conteúdo da Página -->
	
			<!--  Two-side Multi Select Plugin    -->
		    <script src="assets/js/multiselect.js"></script>
		    <script type="text/javascript">
			    jQuery(document).ready(function($) {
			        $('.js-multiselect').multiselect({
			            right: '#solicitacoesDeDesenvolvimentoIncluidas',
			            rightAll: '#incluirTodas',
			            rightSelected: '#incluirUma',
			            leftSelected: '#excluirUma',
			            leftAll: '#excluirTodas'
			        });
			    });
			</script>
<c:import url="common/rodape.jsp" />
		</div>
	</div>
</body>
</html>