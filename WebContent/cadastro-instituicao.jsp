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
			<nav class="navbar navbar-default">
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
											<form action="instituicao" method="post" data-toggle="validator" role="form">
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nomeFantasia">Nome Fantasia</label>
			                                                <input type="text" id="nomeFantasia" name="nomeFantasia" class="form-control" required />
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nomeEmpresarial">Nome Empresarial</label>
			                                                <input type="text" id="nomeEmpresarial" name="nomeEmpresarial" class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="cnpj">CNPJ</label>
			                                                <input type="text" id="cnpj" name="cnpj" class="form-control" data-mask="00.000.000/0000.00" data-mask-reverse="true"
			                                                pattern="[0-9]{2}.[0-9]{3}.[0-9]{3}\/[0-9]{4}.[0-9]{2}$" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="setorDeAtuacao">Setor de Atuação</label>
			                                                <input type="text" id="setorDeAtuacao" name="setorDeAtuacao" class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="endereco">Endereço</label>
			                                                <input type="text" id="endereco" name="endereco" class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="cidade">Cidade</label>
			                                                <input type="text" id="cidade" name="cidade" class="form-control" required>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="estado">Estado</label>
			                                                <input type="text" id="estado" name="estado" class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="telefone">Telefone</label>
			                                                <input type="text" id="telefone" name="telefone" class="form-control telefone" 
			                                                pattern="\([0-9]{2}\) [0-9]{4,5}-[0-9]{4}$" data-mask-reverse="true" required>
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
											<form action="instituicao" method="post" data-toggle="validator" role="form">
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nomeFantasia">Nome Fantasia</label>
			                                                <input type="text" id="nomeFantasia" name="nomeFantasia" class="form-control" value="${instituicao.nomeFantasia}" required />
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nomeEmpresarial">Nome Empresarial</label>
			                                                <input type="text" id="nomeEmpresarial" name="nomeEmpresarial" class="form-control" value="${instituicao.nomeEmpresarial}" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="cnpj">CNPJ</label>
			                                                <input type="text" id="cnpj" name="cnpj" class="form-control" data-mask="00.000.000/0000.00" data-mask-reverse="true"
			                                                pattern="[0-9]{2}.[0-9]{3}.[0-9]{3}\/[0-9]{4}.[0-9]{2}$" value="${instituicao.cnpj}" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="setorDeAtuacao">Setor de Atuação</label>
			                                                <input type="text" id="setorDeAtuacao" name="setorDeAtuacao" class="form-control" value="${instituicao.setorDeAtuacao}" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="endereco">Endereço</label>
			                                                <input type="text" id="endereco" name="endereco" class="form-control" value="${instituicao.endereco}" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="cidade">Cidade</label>
			                                                <input type="text" id="cidade" name="cidade" class="form-control" value="${instituicao.cidade}" required>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="estado">Estado</label>
			                                                <input type="text" id="estado" name="estado" class="form-control" value="${instituicao.estado}" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="telefone">Telefone</label>
			                                                <input type="text" id="telefone" name="telefone" class="form-control telefone" 
			                                                pattern="\([0-9]{2}\) [0-9]{4,5}-[0-9]{4}$" data-mask-reverse="true" value="${instituicao.telefone}" required>
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
			</script>
		</div>
	</div>
</body>
</html>