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
	<c:choose>
		<c:when test="${tipoDeUsuario == 'administradorDeInstituicao'}">
			<div class="sidebar" data-color="blue" data-image="assets/img/sidebar-5.jpg">
		    	<div class="sidebar-wrapper">
		            <div class="logo">
		                <a href="http://localhost:8080/SAEDW/painel-administrador-de-instituicao.jsp" class="simple-text">
		                    SAEDW
		                </a>
		            </div>
		
		            <ul class="nav">
		                <li class="active">
		                    <a href="pagina-da-instituicao.jsp">
		                        <i class="pe-7s-culture"></i>
		                        <p>${usuario.instituicao.nomeFantasia}</p>
		                    </a>
		                </li>
		                <li>
		                    <a href="ColaboradorController">
		                   		<i class="pe-7s-user"></i>
		                        <p>Colaboradores</p>
		                    </a>
		                </li>
		                <li>
		                    <a href=WebDesignerController>
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
		</c:when>
		<c:otherwise>
			<div class="sidebar" data-color="azure" data-image="assets/img/sidebar-5.jpg">
		    	<div class="sidebar-wrapper">
		            <div class="logo">
		                <a href="http://localhost:8080/SAEDW/painel-colaborador.jsp" class="simple-text">
		                    SAEDW
		                </a>
		            </div>
		
		            <ul class="nav">
		                <li class="active">
		                    <a href="pagina-da-instituicao.jsp">
		                        <i class="pe-7s-culture"></i>
		                        <p>${usuario.instituicao.nomeFantasia}</p>
		                    </a>
		                </li>
		            	<li>
		                    <a href="EstruturaDeWebsiteController">
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
                                <h4>INFORMAÇÕES DA INSTITUIÇÃO</h4>
                            </div>
                            <div class="content">
                            	<form action="">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nome Fantasia</label>
                                                <input type="text" class="form-control" name="nomeFantasia" value="${usuario.instituicao.nomeFantasia}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nome Empresarial</label>
                                                <input type="text" class="form-control" name="nomeEmpresarial" value="${usuario.instituicao.nomeEmpresarial}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>CNPJ</label>
                                                <input type="text" class="form-control" name="cnpj" value="${usuario.instituicao.cnpj}" readonly>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Setor de Atuação</label>
                                                <input type="text" class="form-control" name="setorDeAtuacao" value="${usuario.instituicao.setorDeAtuacao}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Endereço</label>
                                                <input type="text" class="form-control" name="endereco" value="${usuario.instituicao.endereco}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Cidade</label>
                                                <input type="text" class="form-control" name="cidade" value="${usuario.instituicao.cidade}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Estado</label>
                                                <input type="text" class="form-control" name="estado" value="${usuario.instituicao.estado}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Telefone</label>
                                                <input type="text" class="form-control" name="telefone" value="${usuario.instituicao.telefone}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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