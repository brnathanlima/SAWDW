<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<title>SAEDW - Cadastro de Colaborador</title>
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
<div class="wrapper">
    <div class="sidebar" data-color="blue" data-image="assets/img/sidebar-5.jpg">
    
    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://localhost:8080/SAEDW/painel-administrador-de-instituicao.jsp" class="simple-text">
                    SAEDW
                </a>
            </div>

            <ul class="nav">
            	<li>
                    <a href="pagina-da-instituicao.jsp">
                        <i class="pe-7s-culture"></i>
                        <p>${usuario.instituicao.nomeFantasia}</p>
                    </a>
                </li>
                <li class="active">
                    <a href="ColaboradorController">
                   		<i class="pe-7s-user"></i>
                        <p>Colaboradores</p>
                    </a>
                </li>
                <li>
                    <a href="WebDesignerController">
                    	<i class="pe-7s-users"></i>
                        <p>Web-Designers</p>
                    </a>
                </li>
                <li>
                    <a href="GerenteController">
                    	<i class="pe-7s-portfolio"></i>
                        <p>Gerentes</p>
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
									<c:when test="${empty colaborador.id}">
                                		<h4 class="title">CADASTRAR COLABORADOR</h4>
                                	</c:when>
                                	<c:otherwise>
                                		<h4 class="title">EDITAR CADASTRO DE COLABORADOR</h4>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="content">
                            	<c:choose>
									<c:when test="${empty colaborador.id}">
										<form action="ColaboradorController">
											<div class="row">
		                                        <div class="col-md-12">
		                                            <div class="form-group">
		                                                <label>Matr�cula</label>
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
		                                    
		                                    <input type="hidden" name="tipoDeUsuario" value="usuarioComum" />
		                                    <input type="hidden" name="acao" value="cadastrar" />
		                                    <input type="hidden" name="idInstituicao" value="${usuario.instituicao.id}" />
		                                    
		                                    <button type="submit" class="btn btn-success btn-fill pull-left">CADASTRAR</button>
		                                    
		                                    <div class="clearfix"></div>
		                                </form>
									</c:when>
									
									<c:when test="${not empty colaborador.id}">
										
										<form action="ColaboradorController">
											<div class="row">
		                                        <div class="col-md-12">
		                                            <div class="form-group">
		                                                <label>Matr�cula</label>
		                                                <input type="text" name="matricula" value="${colaborador.matricula}" class="form-control">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="row">
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>Nome</label>
		                                                <input type="text" name="nome" value="${colaborador.nome}" class="form-control">
		                                            </div>
		                                        </div>
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>Sobrnome</label>
		                                                <input type="text" name="sobrenome" value="${colaborador.sobrenome}" class="form-control">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="row">
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>E-mail</label>
		                                                <input type="text" name="email" value="${colaborador.email}" class="form-control">
		                                            </div>
		                                        </div>
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>Telefone</label>
		                                                <input type="text" name="telefone" value="${colaborador.telefone}" class="form-control">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="row">
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>Nome de Usu�rio</label>
		                                                <input type="text" name="nomeDeUsuario" value="${colaborador.nomeDeUsuario}" class="form-control">
		                                            </div>
		                                        </div>
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>Senha</label>
		                                                <input type="password" name="senha" value="${colaborador.senha}" class="form-control">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="row">
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>Setor</label>
		                                                <input type="text" name="setor" value="${colaborador.setor}" class="form-control">
		                                            </div>
		                                        </div>
		                                        <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>Cargo</label>
		                                                <input type="text" name="cargo" value="${colaborador.cargo}" class="form-control">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <input type="hidden" name="acao" value="editar" />
		                                    <input type="hidden" name="id" value="${colaborador.id}" />
		                                    <input type="hidden" name="idInstituicao" value="${usuario.instituicao.id}" />
		                                    
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