<!DOCTYPE html>
<html lang="pt-br">
	<?php require_once "includes/head.php";?>	
	<body>
		<div class="container">

			<div class="row">

				<div id="content" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Painel do Administrador</h3>
					<?php require_once "includes/admin/main-menu.php";?>
					<?php require_once "includes/admin/events-list.php";?>
					<?php require_once "includes/admin/news-list.php";?>
					<?php require_once "includes/admin/users-list.php";?>
					<?php require_once "includes/admin/media-list.php";?>
					<?php require_once "includes/admin/inscriptions-list.php";?>
				</div>
			</div>
			
		</div>

		<?php require_once "includes/foot.php";?>
	</body>

</html>