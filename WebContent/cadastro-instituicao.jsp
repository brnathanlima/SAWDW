<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Cadastro de Instituição</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
<div class="wrapper">
    <div class="sidebar" data-color="green" data-image="assets/img/sidebar-5.jpg">

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://localhost:8080/SAEDW/painel-super-administrador.jsp" class="simple-text">
                    SAEDW
                </a>
            </div>

            <ul class="nav">
                <li class="active">
                    <a href="InstituicaoController">
                        <i class="pe-7s-culture"></i>
                        <p>Instituições</p>
                    </a>
                </li>
                <li>
                    <a href="SuperAdministradorController">
                        <i class="pe-7s-user"></i>
                        <p>Super Administradores</p>
                    </a>
                </li>
                <li>
                    <a href="listarAdministradoresDeInstituicoes">
                        <i class="pe-7s-users"></i>
                        <p>Administradores de Instituições</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>

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
                                <c:choose>
									<c:when test="${empty instituicao.id}">
                                		<h4 class="title">CADASTRAR INSTITUIÇÃO</h4>
                                	</c:when>
                                	<c:otherwise>
                                		<h4 class="title">EDITAR CADASTRO DE INSTITUIÇÃO</h4>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="content">
                            	<c:choose>
									<c:when test="${empty instituicao.id}">
										<form action="InstituicaoController">
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
										<form action="InstituicaoController">
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