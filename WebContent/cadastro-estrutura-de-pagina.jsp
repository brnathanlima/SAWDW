<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Cadastrar Estrutura de Página</title>
	<c:import url="/common/cabecalho.jsp" />
	<script src="assets/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript">
		tinymce.init({
			selector: '#conteudo',
			 plugins: [
					'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
					'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
					'save table contextmenu directionality emoticons template paste textcolor autoresize'
			],
			toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons',
			advlist_bullet_styles: 'squar disc circle',
			advlist_number_styles: 'lower-alpha,lower-roman,upper-alpha,upper-roman',
			codesample_dialog_width: '400',
			codesample_dialog_height: '400',
			codesample_languages: [
			        {text: 'HTML/XML', value: 'markup'},
			        {text: 'JavaScript', value: 'javascript'},
			        {text: 'CSS', value: 'css'},
			        {text: 'PHP', value: 'php'},
			        {text: 'Ruby', value: 'ruby'},
			        {text: 'Python', value: 'python'},
			        {text: 'Java', value: 'java'},
			        {text: 'C', value: 'c'},
			        {text: 'C#', value: 'csharp'},
			        {text: 'C++', value: 'cpp'}
			],
			content_css: ['//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
					'//www.tinymce.com/css/codepen.min.css'
			],
			contextmenu: "link image inserttable | cell row column deletetable",
			insertdatetime_formats: ["%H:%M:%S", "%d-%m-%Y", "%I:%M:%S %p", "%D"]
		});
  	</script>
</head>
<body>
	<div class="wrapper">
		<c:choose>
			<c:when test="${tipoDeUsuario == 'webDesigner'}">
				<div class="sidebar" data-color="red" data-image="assets/img/sidebar-4.jpg">	    
			    	<div class="sidebar-wrapper">
			            <div class="logo">
			                <a href="webDesigner?acao=visualizarPainel" class="simple-text">
			                    SAEDW
			                </a>
			            </div>			
			            <ul class="nav">
			                <li>
			                    <a href="categoriaDeWebsites?acao=listar">
			                   		<i class="pe-7s-folder"></i>
			                        <p>Categorias de Websites</p>
			                    </a>
			                </li>
			                <li class="active">
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
			</c:when>
			<c:otherwise>
				<div class="sidebar" data-color="black" data-image="assets/img/sidebar-4.jpg">	    
			    	<div class="sidebar-wrapper">
			            <div class="logo">
			                <a href="colaborador?acao=visualizarPainel" class="simple-text">
			                    SAEDW
			                </a>
			            </div>			
			            <ul class="nav">
			            	<li class="active">
			                    <a href="estruturaDeWebsites?acao=listar">
			                        <i class="pe-7s-browser"></i>
			                        <p>Estruturas de Websites</p>
			                    </a>
			                </li>
			            </ul>
			    	</div>
			    </div>
			</c:otherwise>
		</c:choose>			
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
	                    	<c:choose>
								<c:when test="${empty estruturaDePagina.id}">
			                        <div class="card">
			                            <div class="header">
			                            	<h4 class="title">
			                            	CADASTRAR ESTRUTURA DE PÁGINA
						                	<a href="estruturaDeWebsites?acao=visualizar&id=${idEstruturaDeWebsite}" class="btn btn-default pull-right" role="button">VOLTAR</a>
			                            	</h4>
			                            </div>
			                            <div class="content">
											<form action="estruturaDePaginas">
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Título</label>
			                                                <input type="text" name="titulo" class="form-control">
			                                            </div>
			                                        </div>
			                                    </div>			                                    
			                                    <div class="row">
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label>Conteúdo</label>
			                                                <textarea rows="20" id="conteudo" name="conteudo" class="form-control"></textarea>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
			                                    <input type="hidden" name="idEstruturaDeWebsite" value="${idEstruturaDeWebsite}" />
			                                    <input type="hidden" name="acao" value="cadastrar" />
			                                    
			                                    <button type="submit" class="btn btn-success btn-fill pull-left">CADASTRAR</button>
			                                    
			                                    <div class="clearfix"></div>
			                                </form>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="card">
			                            <div class="header">
			                            	<h4 class="title">
			                            	<c:choose>
			                            		<c:when test="${tipoDeUsuario == 'webDesigner'}">
			                            			EDITAR ESTRUTURA DE PÁGINA
			                            		</c:when>
			                            		<c:otherwise>
			                            			${estruturaDePagina.titulo}
			                            		</c:otherwise>
			                            	</c:choose>
						                	<a href="estruturaDeWebsites?acao=visualizar&id=${idEstruturaDeWebsite}" class="btn btn-default pull-right" role="button">VOLTAR</a>
						                	</h4>
			                            </div>
			                            <div class="content">
			                            	<c:choose>
			                            		<c:when test="${tipoDeUsuario == 'webDesigner'}">
			                            			<c:choose>
														<c:when test="${not empty successMessage}">
															<div class="alert alert-success" role="alert">
																<span> <b>Sucesso - </b>${successMessage} </span>
															</div>											
														</c:when>
													</c:choose>
													<form action="estruturaDePaginas">
					                                    <div class="row">
					                                        <div class="col-md-12">
					                                            <div class="form-group">
					                                                <label>Título</label>
					                                                <input type="text" name="titulo" value="${estruturaDePagina.titulo}" class="form-control">
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="row">
					                                        <div class="col-md-6">
					                                            <div class="form-group">
					                                                <label>Data de Registro</label>
					                                                <input type="text" class="form-control" disabled value="<fmt:formatDate value='${estruturaDePagina.dataDeCriacao}' pattern='dd/MM/yyyy' />">
					                                            </div>
					                                        </div>
					                                        <div class="col-md-6">
					                                            <div class="form-group"> 
					                                                <label>Data de Atualização</label>
					                                                <c:choose>
					                                                	<c:when test="${not empty estruturaDePagina.dataDeModificacao}">
					                                                		<input type="text" class="form-control" disabled value="<fmt:formatDate value='${estruturaDePagina.dataDeModificacao}' pattern='dd/MM/yyyy' />">
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
					                                                <label>Conteúdo</label>
					                                                <textarea rows="20" id="conteudo" name="conteudo" class="form-control">${estruturaDePagina.conteudo}</textarea>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    
					                                    <input type="hidden" name="id" value="${estruturaDePagina.id}" />
														<input type="hidden" name="acao" value="editar" />
														
					                                    <button type="submit" class="btn btn-success btn-fill pull-left">EDITAR</button>
					                                    
					                                    <div class="clearfix"></div>
					                                </form>
												</c:when>
												<c:otherwise>
													${estruturaDePagina.conteudo}
												</c:otherwise>
			                            	</c:choose>
			                            </div>
			                    	</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
	        </div>
<c:import url="common/rodape.jsp" />
		</div>
	</div>
</body>
</html>