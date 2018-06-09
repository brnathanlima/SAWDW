<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="pt-br">
<head>
	<meta charset="ISO-8859-1" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<link href="assets/css/login.css" rel="stylesheet"/>
	
	<title>SAEDW - Login</title>
	
	<c:import url="/common/cabecalho.jsp" />
</head>
<body>
	<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-md-12">
								<h6>SAEDW</h6>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								
								<c:choose>
									<c:when test="${not empty errorMessage}">
										<div class="alert alert-danger" role="alert">
											<p> ${errorMessage} </p>
											<% session.invalidate(); %>
										</div>											
									</c:when>
								</c:choose>
								
								<form action="LoginController" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="nomeDeUsuario" tabindex="1" class="form-control" placeholder="Nome de Usuário" autofocus>
									</div>
									<div class="form-group">
										<input type="password" name="senha" tabindex="2" class="form-control" placeholder="Senha">
									</div>
									<div class="form-group">
										<select name="tipoDeUsuario" class="form-control">
											<option value="superAdministrador">Super Administrador</option>
											<option value="administradorDeInstituicao">Administrador de Instituição</option>
											<option value="colaborador">Colaborador</option>
											<option value="webDesigner">Web Designer</option>
											<option value="gerente">Gerente</option>
										</select>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" tabindex="4" class="form-control btn btn-login" value="Entrar">
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
	</div>
	<script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
</body>