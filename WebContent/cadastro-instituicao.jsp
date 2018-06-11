<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<c:import url="/common/cabecalho.jsp" />
	<title>SAEDW - Cadastro de Instituição</title>
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
	                            	<h4 class="title">
	                                <c:choose>
										<c:when test="${empty instituicao.id}">
	                                		CADASTRAR INSTITUIÇÃO
	                                	</c:when>
	                                	<c:otherwise>
	                                		EDITAR CADASTRO DE INSTITUIÇÃO
	                                	</c:otherwise>
	                                </c:choose>
	                                <a class="btn btn-default pull-right" href="instituicao?acao=listar" role="button">VOLTAR</a>         
	                                </h4>
	                            </div>
	                            <div class="content">
	                            	<c:choose>
										<c:when test="${empty instituicao.id}">
											<form action="instituicao" method="post">
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome Fantasia</label>
			                                                <input type="text" name="nomeFantasia" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome Empresarial</label>
			                                                <input type="text" name="nomeEmpresarial" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>CNPJ</label>
			                                                <input type="text" name="cnpj" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Setor de Atuação</label>
			                                                <input type="text" name="setorDeAtuacao" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Endereço</label>
			                                                <input type="text" name="endereco" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Cidade</label>
			                                                <input type="text" name="cidade" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Estado</label>
			                                                <input type="text" name="estado" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Telefone</label>
			                                                <input type="text" name="telefone" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <input type="hidden" name="acao" value="cadastrar" />
			                                    
			                                    <button type="submit" class="btn btn-success btn-fill pull-left">CADASTRAR</button>
			                                    
			                                    <div class="clearfix"></div>
			                                </form>
										</c:when>
										<c:when test="${not empty instituicao.id}">
											<c:choose>
												<c:when test="${not empty successMessage}">
													<div class="alert alert-success" role="alert">
														<span><b>Sucesso - </b>${successMessage}</span>
													</div>											
												</c:when>
											</c:choose>
											<form action="instituicao" method="post">
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome Fantasia</label>
			                                                <input type="text" class="form-control" name="nomeFantasia" value="${instituicao.nomeFantasia}">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome Empresarial</label>
			                                                <input type="text" class="form-control" name="nomeEmpresarial" value="${instituicao.nomeEmpresarial}">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>CNPJ</label>
			                                                <input type="text" class="form-control" name="cnpj" value="${instituicao.cnpj}">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Setor de Atuação</label>
			                                                <input type="text" class="form-control" name="setorDeAtuacao" value="${instituicao.setorDeAtuacao}">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Endereço</label>
			                                                <input type="text" class="form-control" name="endereco" value="${instituicao.endereco}">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Cidade</label>
			                                                <input type="text" class="form-control" name="cidade" value="${instituicao.cidade}">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Estado</label>
			                                                <input type="text" class="form-control" name="estado" value="${instituicao.estado}">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Telefone</label>
			                                                <input type="text" class="form-control" name="telefone" value="${instituicao.telefone}">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Data de Registro</label>
			                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${instituicao.dataDeRegistro}' pattern='dd/MM/yyyy' />">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group"> 
			                                                <label>Data de Atualização de Cadastro</label>
			                                                <c:choose>
			                                                	<c:when test="${not empty instituicao.dataDeModificacao}">
			                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${instituicao.dataDeModificacao}' pattern='dd/MM/yyyy' />">
			                                                	</c:when>
			                                                	<c:otherwise>
			                                               			 <input type="text" class="form-control" disabled value="Não houve modificação"/>
			                                                	</c:otherwise>		                                                
			                                                </c:choose>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <input type="hidden" name="id" value="${instituicao.id}" />
			                                    <input type="hidden" name="acao" value="editar" />
			                                    
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