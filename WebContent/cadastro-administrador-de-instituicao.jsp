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
											<form action="administradorDeInstituicao" method="post" data-toggle="validator" role="form">
												<div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="matricula">Matricula</label>
			                                                <input type="number" id="matricula" name="matricula" class="form-control" 
			                                               	pattern="[0-9]+$" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nome">Nome</label>
			                                                <input type="text" id="nome" name="nome" class="form-control" required>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="sobrenome">Sobrnome</label>
			                                                <input type="text" id="sobrenome" name="sobrenome" class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="email">E-mail</label>
			                                                <input type="email" id="email" name="email" class="form-control" required>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="telefone">Telefone</label>
			                                                <input type="text" id="telefone" name="telefone" class="form-control telefone" 
			                                                pattern="\([0-9]{2}\) [0-9]{4,5}-[0-9]{4}$" data-mask-reverse="true" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="setor">Setor</label>
			                                                <input type="text" id="setor" name="setor" class="form-control" required>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="cargo">Cargo</label>
			                                                <input type="text" id="cargo"  name="cargo" class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="row">
			                                        <div class="col-md-4">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nomeDeUsuario">Nome de Usu�rio</label>
			                                                <input type="text" id="nomeDeUsuario" name="nomeDeUsuario" 
			                                                class="form-control" pattern="[a-z,0-9]+$" required>
			                                                <span class="help-block">Apenas letras e n�meros.</span>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-4">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="senha">Senha</label>
			                                                <input type="password" id="senha" name="senha" class="form-control" data-min-length="6" 
			                                                minlength="6" required />
			                                                <span class="help-block">No m�nimo 6 d�gitos.</span>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-4">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="confirmarSenha">Confirmar a senha</label>
			                                                <input type="password" id="confirmarSenha" name="confirmarSenha" class="form-control"  
			                                                data-match="#senha" data-match-error="Aten��o! As senhas n�o est�o iguais." required />
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="idInstituicao">Institui��o a que Pertence</label>
			                                                <select id="idInstituicao"  name="idInstituicao" class="form-control" required>
			                                                	<option value="">Selecione</option>
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
											<form action="administradorDeInstituicao" method="post" data-toggle="validator" role="form">
												<div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="matricula">Matricula</label>
			                                                <input type="number" id="matricula" name="matricula" value="${administradorDeInstituicao.matricula}" 
			                                                pattern="[0-9]+$"  class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nome">Nome</label>
			                                                <input type="text" id="nome" name="nome" value="${administradorDeInstituicao.nome}" 
			                                                class="form-control" required>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="sobrenome">Sobrnome</label>
			                                                <input type="text" id="sobrenome" name="sobrenome" value="${administradorDeInstituicao.sobrenome}" 
			                                                class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>			                                    
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="email">E-mail</label>
			                                                <input type="text" id="email" name="email" value="${administradorDeInstituicao.email}" 
			                                                class="form-control" required>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="telefone">Telefone</label>
			                                                <input type="text" id="telefone" name="telefone" value="${administradorDeInstituicao.telefone}" 
			                                                class="form-control telefone" pattern="\([0-9]{2}\) [0-9]{4,5}-[0-9]{4}$" data-mask-reverse="true" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="setor">Setor</label>
			                                                <input type="text" id="setor" name="setor" value="${administradorDeInstituicao.setor}" 
			                                                class="form-control" required>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="cargo">Cargo</label>
			                                                <input type="text" id="cargo" name="cargo" value="${administradorDeInstituicao.cargo}" 
			                                                class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>			                                    
			                                    <div class="row">
			                                        <div class="col-md-4">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nomeDeUsuario">Nome de Usu�rio</label>
			                                                <input type="text" id="nomeDeUsuario" name="nomeDeUsuario" value="${administradorDeInstituicao.nomeDeUsuario}" 
			                                                class="form-control" pattern="[a-z,0-9]+$" required>
			                                                <span class="help-block">Apenas letras e n�meros.</span>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-4">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="senha">Senha</label>
			                                                <input type="password" id="senha" name="senha" value="${administradorDeInstituicao.senha}"
			                                                class="form-control" required>
			                                                <span class="help-block">No m�nimo 6 d�gitos.</span>
			                                        	</div>
			                                        </div>
			                                        <div class="col-md-4">
				                                    	<div class="form-group has-feedback">
				                                    	    <label class="control-label" for="confirmarSenha">Confirmar a senha</label>
				                                            <input type="password" id="confirmarSenha" name="confirmarSenha"  value="${administradorDeInstituicao.senha}" 
				                                            class="form-control" data-match="#senha" data-match-error="Aten��o! As senhas n�o est�o iguais." required />
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
			                                        	<div class="form-group has-feedback">
				                                        	<label class="control-label" for="idInstituicao">Institui��o a que pertence</label>
						                                    <select id="idInstituicao" name="idInstituicao" class="form-control" required>
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
			<script src="assets/js/validator.min.js"></script>
			<script src="assets/js/jquery.mask.min.js"></script>
			<script>
				var comportamentoTelefone = function (val) {
				  	return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
				},
				telOpcoes = {
				  	onKeyPress: function(val, e, field, options) {
				      	field.mask(comportamentoTelefone.apply({}, arguments), options);
				    },
				};

				$('.telefone').mask(comportamentoTelefone, telOpcoes);
				
				var senha = document.getElementById('senha');
				
				senha.addEventListener('invalid', function () {
					this.setCustomValidity(this.value.length < 6 ? 'Por favor, complete a senha.' : '');
				}, false);

			</script>
		</div>
	</div>
</body>
</html>
