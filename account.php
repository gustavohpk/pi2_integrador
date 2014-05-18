<!DOCTYPE html>
<html lang="pt-br">
	<?php require_once "includes/head.php";?>	
	<body>
		<div class="container">
			<?php require_once "includes/header.php";?>

			<?php require_once "includes/main-menu.php";?>

			<div class="row">
				<div id="content" class="col-lg-12 col-xs-12 col-sm-12 col-md-12">
				<div class="row">
						<div id="account-menu" class="navbar navbar-default col-xs-12 login-menu" role="navigation">
	    				<div class="container">
	<!--       				<div class="navbar-header">
		              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		                <span class="sr-only">Toggle navigation</span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		              </button>
		            </div> -->
		              <ul class="nav navbar-nav account-menu">
		                <li><a id="btn-account-login" href="#">LOGIN</a></li>
		                <li><a id="btn-account-register" href="#">CADASTRO</a></li>
		              </ul>
		            </div>
		        </div>
					</div>
				</div>
				<div id="account-login" class="row" style="display:none">
					<div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-sm-offset-1">
						<div class="input-group">
							<span class="input-group-addon glyphicon glyphicon-envelope"></span>
						  <input type="text" class="form-control input-glyphicon" placeholder="Endereço de e-mail">
						</div>
						<div class="input-group">
						  <span class="input-group-addon glyphicon glyphicon-asterisk"></span>
						  <input type="text" class="form-control input-glyphicon" placeholder="Senha">
						</div>
						<button type="submit" class="btn btn-default btn-lg">Login</button>
					</div>
				</div>
				<div id="account-register" class="row" style="display:none">
					<div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
						<form>

							<div class="row">
								<div class="col-xs-12">
									<div class="input-group">
									  <span class="input-group-addon glyphicon glyphicon-user"></span>
									  <input type="text" class="form-control input-glyphicon" placeholder="Nome">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-6">
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-envelope"></span>
									  <input type="text" class="form-control input-glyphicon" placeholder="Endereço de e-mail">
									</div>
								</div>
								<div class="col-xs-6">
									<div class="input-group">
									  <span class="input-group-addon glyphicon glyphicon-asterisk"></span>
									  <input type="text" class="form-control input-glyphicon" placeholder="Senha">
									</div>
								</div>
							</div>

							<br/>
							<div class="row">
								<div class="col-xs-6">
									<input type="text" class="form-control" placeholder="R.G.">
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control" placeholder="CPF">
								</div>
							</div>
							<br/>

							<div class="row">
								<div class="col-xs-6">
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-phone-alt"></span>
									  <input type="text" class="form-control input-glyphicon" placeholder="Telefone">
									</div>
								</div>
								<div class="col-xs-6">
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-earphone"></span>
									  <input type="text" class="form-control input-glyphicon" placeholder="Telefone 2">
									</div>
								</div>
							</div>
							<br/>

							<div class="row">
								<div class="col-xs-9">
									<input type="text" class="form-control" placeholder="Rua">
								</div>
								<div class="col-xs-3">
									<input type="text" class="form-control" placeholder="Número">
								</div>
							</div>

							<div class="row">
								<div class="col-xs-6">
									<input type="text" class="form-control" placeholder="Bairro">
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control" placeholder="Complemento">
								</div>
							</div>

							<div class="row">
								<div class="col-xs-8">
									<input type="text" class="form-control" placeholder="Cidade">
								</div>
								<div class="col-xs-4">
									<select class="form-control" placeholder="Nome">
										<option selected disabled>Estado</option>
									</select>
								</div>
							</div>
							<button type="submit" class="btn btn-default btn-lg">Cadastrar</button>
						</form>
					</div>
				</div>
			</div>
		<?php require_once "includes/footer.php";?>
		</div>

	</body>

	<?php require_once "includes/foot.php";?>

</html>