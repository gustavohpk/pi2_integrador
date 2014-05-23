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
		                <li><a id="btn-media-photos" href="#">FOTOS</a></li>
		                <li><a id="btn-media-videos" href="#">VÍDEOS</a></li>
		              </ul>
		            </div>
		        </div>
					</div>
				</div>
				<div id="media-photos" class="row" style="display:none">
					<h3>Fotos</h3>
					<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
						<div id="progress-photos" class="progress progress-striped active">
			        <div id="progressbar1" aria-valuemax="100" aria-valuemin="100" aria-valuenow="100" class="progress-bar progress-bar-default" role="progressbar" style="width: 100%">Carregando...
			         	<span class="sr-only">Progress Bar</span>
			        </div>
			    	</div>
		    	</div>
		    	<div class="row photos-list" style="display:none">
          	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          		<a href="img/placeholder-evento.png" class="fancybox" title="Foto 1" rel="lightbox"><img class="thumbnail" src="img/placeholder-evento.png" alt="Foto 1"/></span></a>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          		<a href="img/placeholder-evento.png" class="fancybox" title="Foto 2" rel="lightbox"><img class="thumbnail" src="img/placeholder-evento.png" alt="Foto 2"/></a>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          		<a href="img/placeholder-evento.png" class="fancybox" title="Foto 3" rel="lightbox"><img class="thumbnail" src="img/placeholder-evento.png" alt="Foto 3"/></a>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          		<a href="img/placeholder-evento.png" class="fancybox" title="Foto 4" rel="lightbox"><img class="thumbnail" src="img/placeholder-evento.png" alt="Foto 4"/></span></a>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          		<a href="img/placeholder-evento.png" class="fancybox" title="Foto 5" rel="lightbox"><img class="thumbnail" src="img/placeholder-evento.png" alt="Foto 5"/></a>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          		<a href="img/placeholder-evento.png" class="fancybox" title="Foto 6" rel="lightbox"><img class="thumbnail" src="img/placeholder-evento.png" alt="Foto 6"/></a>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          		<a href="img/placeholder-evento.png" class="fancybox" title="Foto 7" rel="lightbox"><img class="thumbnail" src="img/placeholder-evento.png" alt="Foto 7"/></span></a>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          		<a href="img/placeholder-evento.png" class="fancybox" title="Foto 8" rel="lightbox"><img class="thumbnail" src="img/placeholder-evento.png" alt="Foto 8"/></a>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          		<a href="img/placeholder-evento.png" class="fancybox" title="Foto 9" rel="lightbox"><img class="thumbnail" src="img/placeholder-evento.png" alt="Foto 9"/></a>
          	</div>
          </div>
				</div>
				<div id="media-videos" class="row" style="display:none">
					<h3>Vídeos</h3>
				</div>
			</div>
		<?php require_once "includes/footer.php";?>
		</div>

	</body>

	<?php require_once "includes/foot.php";?>

</html>