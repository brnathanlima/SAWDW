<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<c:import url="/common/cabecalho.jsp" />
	<title>SAEDW - Cadastro de Super Administrador</title>
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
	                        <p>Instituições</p>
	                    </a>
	                </li>
	                <li class="active">
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
										<c:when test="${empty superAdministrador.id}">
	                                		CADASTRAR SUPER ADMINISTRADOR
	                                	</c:when>
	                                	<c:otherwise>EDITAR CADASTRO DE SUPER ADMINISTRADOR
	                                	</c:otherwise>
	                                </c:choose>
	                                <a class="btn btn-default pull-right" href="superAdministrador?acao=listar" role="button">VOLTAR</a>         
	                                </h4>                       
	                            </div>
	                            <div class="content">
	                            	<c:choose>
										<c:when test="${empty superAdministrador.id}">
											<form action="superAdministrador" method="post">
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
			                                                <label>Nome de Usuário</label>
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
			                                    
			                                    <input type="hidden" name="acao" value="cadastrar" />
			                                    <button type="submit" class="btn btn-success btn-fill pull-left">CADASTRAR</button>
			                                    
			                                    <div class="clearfix"></div>
			                                </form>
										</c:when>
										
										<c:when test="${not empty superAdministrador.id}">
											<c:choose>
												<c:when test="${not empty successMessage}">
													<div class="alert alert-success" role="alert">
														<span> <b>Sucesso - </b>${successMessage} </span>
													</div>											
												</c:when>
											</c:choose>
											<form action="superAdministrador" method="post">
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome</label>
			                                                <input type="text" name="nome" value="${superAdministrador.nome}" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Sobrnome</label>
			                                                <input type="text" name="sobrenome" value="${superAdministrador.sobrenome}" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>E-mail</label>
			                                                <input type="text" name="email" value="${superAdministrador.email}" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Telefone</label>
			                                                <input type="text" name="telefone" value="${superAdministrador.telefone}" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Nome de Usuário</label>
			                                                <input type="text" name="nomeDeUsuario" value="${superAdministrador.nomeDeUsuario}" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Senha</label>
			                                                <input type="password" name="senha" value="${superAdministrador.senha}"class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group">
			                                                <label>Data de Registro</label>
			                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${superAdministrador.dataDeRegistro}' pattern='dd/MM/yyyy' />">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group"> 
			                                                <label>Data de Atualização de Cadastro</label>
			                                                <c:choose>
			                                                	<c:when test="${not empty superAdministrador.dataDeModificacao}">
			                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${superAdministrador.dataDeModificacao}' pattern='dd/MM/yyyy' />">
			                                                	</c:when>
			                                                	<c:otherwise>
			                                               			 <input type="text" class="form-control" disabled value="Não houve modificação"/>
			                                                	</c:otherwise>		                                                
			                                                </c:choose>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <input type="hidden" name="id" value="${superAdministrador.id}" />
			                                    <input type="hidden" name="acao" value="editar" />
			                                    
			                                    <button type="submit" class="btn btn-success btn-fill pll-left">EDITAR CADASTRO</button>		                                   
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