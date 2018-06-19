<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<c:import url="/common/cabecalho.jsp" />
	<title>SAEDW - Cadastrar Categoria de Website</title>
</head>
<body>
	<div class="wrapper">
	    <div class="sidebar" data-color="red" data-image="assets/img/sidebar-4.jpg">
	    	<div class="sidebar-wrapper">
	            <div class="logo">
	                <a href="webDesigner?acao=visualizarPainel" class="simple-text">
	                    SAEDW
	                </a>
	            </div>	
	            <ul class="nav">
	                <li class="active">
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
										<c:when test="${empty categoria.id}">
	                                		CADASTRAR CATEGORIA DE WEBSITES
	                                	</c:when>
	                                	<c:otherwise>
	                                		EDITAR CATEGORIA DE WEBSITES
	                                	</c:otherwise>
	                                </c:choose>
	                                <a href="categoriaDeWebsites?acao=listar" class="btn btn-default pull-right" role="button">VOLTAR</a>
	                                </h4>
	                            </div>
	                            <div class="content">
	                            	<c:choose>
										<c:when test="${empty categoria.id}">
											<form action="categoriaDeWebsites" method="post" data-toggle="validator" role="form">
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
			                                                <label class="control-label" for="descricao">Descrição</label>
			                                                <textarea rows="5" id="descricao" name="descricao" class="form-control" required></textarea>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    	
			                                    <input type="hidden" name="acao" value="cadastrar" />
			                                    
			                                    <button type="submit" class="btn btn-success btn-fill pull-left">CADASTRAR</button>
			                                    
			                                    <div class="clearfix"></div>
			                                </form>
										</c:when>
										<c:when test="${not empty categoria.id}">
											<c:choose>
												<c:when test="${not empty successMessage}">
													<div class="alert alert-success" role="alert">
														<span> <b>Sucesso - </b>${successMessage} </span>
													</div>											
												</c:when>
											</c:choose>
											<form action="categoriaDeWebsites" method="post" data-toggle="validator" role="form">
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="nome">Nome</label>
			                                                <input type="text" id="nome" name="nome" value="${categoria.nome}" class="form-control" required>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-6">
			                                            <div class="form-group has-feedback">
			                                                <label>Data de Cadastro</label>
			                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${categoria.dataDeCriacao}' pattern='dd/MM/yyyy' />">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-6">
			                                            <div class="form-group"> 
			                                                <label>Data de Atualização de Cadastro</label>
			                                                 <c:choose>
			                                                	<c:when test="${not empty categoria.dataDeModificacao}">
			                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${categoria.dataDeModificacao}' pattern='dd/MM/yyyy' />">
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
			                                            <div class="form-group has-feedback">
			                                                <label class="control-label" for="descricao">Descrição</label>
			                                                <textarea rows="5" id="descricao" name="descricao" class="form-control" required	>${categoria.descricao}</textarea>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                	<input type="hidden" name="id" value="${categoria.id}" />
												<input type="hidden" name="acao" value="editar" /> 
												
			                                    <button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
			                                    
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