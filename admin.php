<!DOCTYPE html>
<html lang="pt-br">
	<?php require_once "includes/head.php";?>	
	<body>
		<div class="container">	
			<div class="row">

				<div id="content" class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 ">
					<h3>Painel do Administrador</h3>
					<?php require_once "includes/admin/main-menu.php";?>
					<div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
						<div class="panel panel-default">
							<div class="panel-heading">
						    <h3 class="panel-title">Lista de eventos cadastrados</h3>
						  </div>
						  <div class="panel-body">
						  	<span class="glyphicon glyphicon-question-sign" style="float:right;"></span>
								<div class="row">
									<div class="col-xs-12 general-actions">
										<button class="btn btn-success btn-sm" title="Cadastrar" style="float: left"><span class="glyphicon glyphicon-plus-sign"></span></button>
										<div class="" style="float:right; font-size: 10px;"><a href="" target="blank">Acessar a página PRÓXIMOS EVENTOS <span class="glyphicon glyphicon-new-window"></span></a></div><br/>
										<div class="" style="float:right; font-size: 10px;"><a href="" target="blank">Acessar a página EVENTOS ANTERIORES <span class="glyphicon glyphicon-new-window"></span></a></div>
									</div>
								</div>
							</div>
							<table class="table">
								<tr>
									<th>Nome</th>
									<th>Tipo</th>
									<th>Ações</th>
								</tr>
								<tr>
									<td>Semana Acadêmica de TSI 2014</td>
									<td>Semana Acadêmica</td>
									<td>
										<button class="btn btn-primary btn-sm" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
										<button class="btn btn-danger btn-sm" title="Excluir"><span class="glyphicon glyphicon-remove-circle"></span></button>
									</td>
								</tr>
								<tr>
									<td>Semana Acadêmica de EM 2014</td>
									<td>Semana Acadêmica</td>
									<td>
										<button class="btn btn-primary btn-sm" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
										<button class="btn btn-danger btn-sm" title="Excluir"><span class="glyphicon glyphicon-remove-circle"></span></button>
									</td>
								</tr>
								<tr>
									<td>Minicurso de Linux</td>
									<td>Minicurso<span class="badge pull-right"><span class="glyphicon glyphicon-link" title="Subevento"></span></span></td>
									<td>
										<button class="btn btn-primary btn-sm" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
										<button class="btn btn-danger btn-sm" title="Excluir"><span class="glyphicon glyphicon-remove-circle"></span></button>
									</td>
								</tr>
								<tr>
									<td>Palestra TSI 1</td>
									<td>Palestra<span class="badge pull-right"><span class="glyphicon glyphicon-link" title="Subevento"></span></span></td>
									<td>
										<button class="btn btn-primary btn-sm" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
										<button class="btn btn-danger btn-sm" title="Excluir"><span class="glyphicon glyphicon-remove-circle"></span></button>
									</td>
								</tr>
								<tr>
									<td>Palestra 1</td>
									<td>Palestra</td>
									<td>
										<button class="btn btn-primary btn-sm" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
										<button class="btn btn-danger btn-sm" title="Excluir"><span class="glyphicon glyphicon-remove-circle"></span></button>
									</td>
								</tr>
							</table>
							<div class="panel-footer">
								<div class="row">
									<div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
										<select class="form-control">
											<option selected>Exibir no máximo 10 itens por página</option>
											<option>Exibir no máximo 20 itens por página</option>
											<option>Exibir no máximo 40 itens por página</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<ul class="pagination">
										  <li class="disabled"><a href="#">&laquo;</a></li>
										  <li class="active"><a href="#">1 <span class="sr-only">Atual</span></a></li>
										  <li class=""><a href="#">2</a></li>
										  <li class=""><a href="#">3</a></li>
										  <li class=""><a href="#">&raquo;</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<?php require_once "includes/foot.php";?>
	</body>

</html>