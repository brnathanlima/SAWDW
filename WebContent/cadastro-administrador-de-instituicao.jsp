<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<c:import url="/common/cabecalho.jsp" />
	<title>SAEDW - Cadastro  de Administrador de Institui��o</title>
</head>
<body>
	<div class="wrapper">
	    <div class="sidebar" data-color="green" data-image="assets/img/sidebar-4.jpg">	    
	    	<div class="sidebar-wrapper">	    	
	            <div class="logo">
	                <a href="superAdministrador?acao=visualizarPainel" class="simple-text">
	                    SAEDW
	                </a>
	            </div>
	            <ul class="nav">
	                <li>
	                    <a href="instituicao?acao=listar">
	                        <i class="pe-7s-culture"></i>
	                        <p>Institui��es</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="superAdministrador?acao=listar">
	                        <i class="pe-7s-user"></i>
	                        <p>Super Administradores</p>
	                    </a>
	                </li>
	                <li class="active">
	                    <a href="administradorDeInstituicao?acao=listar">
	                        <i class="pe-7s-users"></i>
	                        <p>Administradores de Institui��es</p>
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
	                            	<h4 class="title">
	                            	<c:choose>
										<c:when test="${empty administradorDeInstituicao.id}">
	                                		CADASTRAR ADMINISTRADOR DE INSTITUI��O
	                                	</c:when>
	                                	<c:otherwise>
	                                		EDITAR CADASTRO DE ADMINISTRADOR DE INSTITUI��O
	                                	</c:otherwise>
	                                </c:choose>
	                                <a class="btn btn-default pull-right" href="administradorDeInstituicao?acao=listar" role="button">VOLTAR</a>
	                                </h4>
	                            </div>
	                            <div class="content">
	                            	<c:choose>
										<c:when test="${empty administradorDeInstituicao.id}">
											<form action="administradorDeInstituicao" method="post">
												<div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Matricula</label>
			                                                <input type="text" name="matricula" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome</label>
			                                                <input type="text" name="nome" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Sobrnome</label>
			                                                <input type="text" name="sobrenome" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>E-mail</label>
			                                                <input type="text" name="email" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Telefone</label>
			                                                <input type="text" name="telefone" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Setor</label>
			                                                <input type="text" name="setor" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Cargo</label>
			                                                <input type="text" name="cargo" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome de Usu�rio</label>
			                                                <input type="text" name="nomeDeUsuario" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Senha</label>
			                                                <input type="password" name="senha" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Institui��o a que Pertence</label>
			                                                <select name="idInstituicao" class="form-control">
			                                                	<c:forEach var="instituicao" items="${instituicoes}">
																	<option value="${instituicao.id}">${instituicao.nomeFantasia}</option>
																</c:forEach>
			                                                </select>
			                                            </div>
			                                        </div>
			                                    </div>			                                    
			                                    <input type="hidden" name="acao" value="cadastrar" />
			                                    			                                    
			                                    <button type="submit" class="btn btn-success btn-fill pull-left">CADASTRAR</button>		
			                                    	                                    
			                                    <div class="clearfix"></div>
			                                </form>
										</c:when>										
										<c:when test="${not empty administradorDeInstituicao.id}">
											<c:choose>
												<c:when test="${not empty successMessage}">
													<div class="alert alert-success" role="alert">
														<span> <b>Sucesso - </b>${successMessage} </span>
													</div>											
												</c:when>
											</c:choose>
											<form action="administradorDeInstituicao" method="post">
												<div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Matricula</label>
			                                                <input type="text" name="matricula" value="${administradorDeInstituicao.matricula}" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome</label>
			                                                <input type="text" name="nome" value="${administradorDeInstituicao.nome}" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Sobrnome</label>
			                                                <input type="text" name="sobrenome" value="${administradorDeInstituicao.sobrenome}" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>E-mail</label>
			                                                <input type="text" name="email" value="${administradorDeInstituicao.email}" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Telefone</label>
			                                                <input type="text" name="telefone" value="${administradorDeInstituicao.telefone}" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Setor</label>
			                                                <input type="text" name=setor value="${administradorDeInstituicao.setor}" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Cargo</label>
			                                                <input type="text" name="cargo" value="${administradorDeInstituicao.cargo}" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome de Usu�rio</label>
			                                                <input type="text" name="nomeDeUsuario" value="${administradorDeInstituicao.nomeDeUsuario}" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Senha</label>
			                                                <input type="password" name="senha" value="${administradorDeInstituicao.senha}"class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Data de Registro</label>
			                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${administradorDeInstituicao.dataDeRegistro}' pattern='dd/MM/yyyy' />">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group"> 
			                                                <label>Data de Atualiza��o de Cadastro</label>
			                                                 <c:choose>
			                                                	<c:when test="${not empty administradorDeInstituicao.dataDeModificacao}">
			                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${administradorDeInstituicao.dataDeModificacao}' pattern='dd/MM/yyyy' />">
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
				                                        	<label>Institui��o a que pertence</label>
						                                    <select name="idInstituicao" class="form-control">
																<c:forEach var="instituicao" items="${instituicoes}">
																	<c:choose>
																		<c:when test="${instituicao.id == administradorDeInstituicao.instituicao.id}">
																			<option value="${instituicao.id}" selected>${instituicao.nomeFantasia}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${instituicao.id}">${instituicao.nomeFantasia}</option>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
			                                    
			                                    <input type="hidden" name="id" value="${administradorDeInstituicao.id}" />
			                                    <input type="hidden" name="acao" value="editar" />
			                                    <input type="hidden" name="tipoDeUsuario" value="administradorDeInstituicao" />
			                                    
			                                    <button type="submit" class="btn btn-success btn-fill pull-left">EDITAR CADASTRO</button>
			                                    
			                                    <div class="clearfix"></div>
			                                </form>
										</c:when>
									</c:choose>
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
