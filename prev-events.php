<!DOCTYPE html>
<html lang="pt-br">
	<?php require_once "includes/head.php";?>	
	<body>
		<div class="container">
			<?php require_once "includes/header.php";?>

			<?php require_once "includes/main-menu.php";?>

			<div id="next-events">
	  		<h3>Eventos Anteriores</h3>
				<div class="row">
				  <div class="event col-lg-3 col-md-3 col-sm-6 col-xs-12">
				  	<a class="event-link" data-toggle="modal" data-target="#modalevent1">
					    <div class="thumbnail">
					      <img class="event-thumbnail" src="img/placeholder-evento-2.png" alt="...">
					      <div class="caption">
					        <h3>Evento 1</h3>
					        <p>18/04/14</p>
					      </div>
				    	</div>
				    </a>
				  </div>
				  <div class="event col-lg-3 col-md-3 col-sm-6 col-xs-12">
				    <a class="event-link" data-toggle="modal" data-target="#modalevent2">
				    	<div class="thumbnail">
				      <img class="event-thumbnail" src="img/placeholder-evento-2.png" alt="...">
				      <div class="caption">
				        <h3>Evento 2</h3>
				        <p>14/04/14</p>
				      </div>
				    </div>
				   </a>
				  </div>
				  <div class="event col-lg-3 col-md-3 col-sm-6 col-xs-12">
				    <a class="event-link" data-toggle="modal" data-target="#modalsubevent1">
				    	<div class="thumbnail">
				      <img class="event-thumbnail" src="img/placeholder-evento.png" alt="...">
				      <div class="caption">
				        <h3>Evento 3</h3>
				        <p>20/03/14</p>
				      </div>
				    </div>
				   </a>
				  </div>
				  <div class="event col-lg-3 col-md-3 col-sm-6 col-xs-12">
				    <a class="event-link" data-toggle="modal" data-target="#modalevent4">
				    	<div class="thumbnail">
				      <img class="event-thumbnail" src="img/placeholder-evento.png" alt="...">
				      <div class="caption">
				        <h3>Evento 4</h3>
				        <p>11/03/14</p>
				      </div>
				    </div>
				   </a>
				  </div>
				</div>
			</div>
			
		<?php require_once "includes/footer.php";?>
		</div>
		<?php require_once "includes/modals.php";?>
		<?php require_once "includes/foot.php";?>
	</body>

</html>