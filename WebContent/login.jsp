<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<link href="assets/css/login.css" rel="stylesheet"/>
	
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
								<form action="LoginController" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="nomeDeUsuario" tabindex="1" class="form-control" placeholder="Nome de Usu�rio" value="">
									</div>
									<div class="form-group">
										<input type="password" name="senha" tabindex="2" class="form-control" placeholder="Senha">
									</div>
									<select name="tipoDeUsuario" class="form-control">
										<option value="superAdministrador">Super Administrador</option>
										<option value="administradorDeInstituicao">Administrador de Institui��o</option>
										<option value="usuarioComum">Usu�rio Comum</option>
										<option value="webDesigner">Web Designer</option>
										<option value="gerente">Gerente</option>
									</select>
									<br>
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
</body>

<c:import url="/common/rodape.jsp" />