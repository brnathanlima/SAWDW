<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Estruturas de Websites</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
<div class="wrapper">
	<c:choose>
		<c:when test="${tipoDeUsuario == 'webDesigner'}">
			<div class="sidebar" data-color="red" data-image="assets/img/sidebar-5.jpg">
    
		    	<div class="sidebar-wrapper">
		            <div class="logo">
		                <a href="http://localhost:8080/SAEDW/painel-web-designer.jsp" class="simple-text">
		                    SAEDW
		                </a>
		            </div>
		
		            <ul class="nav">
		                <li>
		                    <a href="CategoriaDeWebsitesController">
		                   		<i class="pe-7s-folder"></i>
		                        <p>Categorias de Websites</p>
		                    </a>
		                </li>
		                <li class="active">
		                    <a href="EstruturaDeWebsiteController">
		                    	<i class="pe-7s-browser"></i>
		                        <p>Estruturas de Websites</p>
		                    </a>
		                </li>
		                <li>
		                    <a href="SolicitacaoDeDesenvolvimentoController">
		                    	<i class="pe-7s-bell"></i>
		                        <p>Solicitacoes de Desenvolvimento</p>
		                    </a>
		                </li>
		            </ul>
		    	</div>
		    </div>
		</c:when>
		<c:when test="${tipoDeUsuario == 'usuarioComum'}">
			<div class="sidebar" data-color="blue" data-image="assets/img/sidebar-5.jpg">
    
		    	<div class="sidebar-wrapper">
		            <div class="logo">
		                <a href="#" class="simple-text">
		                    SAEDW
		                </a>
		            </div>
		
		            <ul class="nav">
		                <li class="active">
		                    <a href="EstruturaDeWebsiteController">
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
                                <h4 class="title">ESTRUTURAS DE WEBSITES
                                <c:choose>
                                	<c:when test="${tipoDeUsuario == 'webDesigner'}">
                                		<a href="EstruturaDeWebsiteController?acao=novoCadastro" class="btn btn-success pull-right" role="button">NOVA ESTRUTURA DE WEBSITES</a>
                                	</c:when>
                                </c:choose>
                                </h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                            	<c:choose>
									<c:when test="${not empty successMessage}">
										<div class="alert alert-success" role="alert">
											<span> <b>Sucesso - </b>${successMessage} </span>
										</div>											
									</c:when>
								</c:choose>
                                <table class="table table-hover table-striped">
                                    <thead>
                                    	<tr>
                                    		<th style="text-align: center;">Nome</th>
											<th style="text-align: center;">Categoria</th>
											<th style="text-align: center;">Solicita��es Pendentes</th>
											<th style="text-align: center;">A��es</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="estruturaDeWebsite" items="${estruturasDeWebsites}" varStatus="id">
											<tr style="text-align: center;">
												<td>${estruturaDeWebsite.nome}</td>
												<td>${estruturaDeWebsite.categoria.nome}</td>
												<td>
												<c:choose>
													<c:when test="${not empty estruturaDeWebsite.solicitacoesDeDesenvolvimentoDaEstrutura}">
														<a href="SolicitacaoDeDesenvolvimentoController?acao=listarSolicitacoesDeDesenvolvimentoPendentesDaEstrutura&id=${estruturaDeWebsite.id}">
															<span class="label label-success">${fn:length(estruturaDeWebsite.solicitacoesDeDesenvolvimentoDaEstrutura)}</span>
														</a>
													</c:when>
													<c:otherwise>
														<span class="label label-default">${fn:length(estruturaDeWebsite.solicitacoesDeDesenvolvimentoDaEstrutura)}</span>
													</c:otherwise>
												</c:choose>
												</td>
												<td class="td-actions">
													<c:choose>
                                						<c:when test="${tipoDeUsuario == 'webDesigner'}">
                                							<a href="EstruturaDeWebsiteController?acao=visualizar&id=${estruturaDeWebsite.id}">
		                                                    <button type="button" rel="tooltip" title="Editar" class="btn btn-info btn-simple btn-sm">
		                                                        <i class="fa fa-edit"></i>
		                                                    </button>
		                                                    </a>
		                                                    <a href="EstruturaDeWebsiteController?acao=excluir&id=${estruturaDeWebsite.id}">
		                                                    <button type="button" rel="tooltip" title="Excluir" class="btn btn-danger btn-simple btn-sm">
		                                                        <i class="fa fa-times"></i>
		                                                    </button>
		                                                    </a>
                                						</c:when>
                                						<c:otherwise>
                                							<a href="EstruturaDeWebsiteController?acao=visualizar&id=${estruturaDeWebsite.id}">Visualizar</a>
                                						</c:otherwise>
                                					</c:choose>
                                                </td>
											</tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="https://www.nathanaellima.com">Nathanael Lima</a>
                </p>
            </div>
        </footer>

    </div>
</div>
</body>