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
						
					</div>
				  	<div class="row">
				  		<div id="col-right" class="col-lg-3 col-lg-push-9 col-md-3 col-md-push-9 col-sm-6 col-sm-push-6 col-xs-12">
				  			<div class="row">
				  				<div class="col-xs-12">
				  					<?php require_once "includes/search.php" ?>
				  				</div>
				  			</div>
				  			<div class="row">
				  				<div id="banner-slider" class="slider-wrapper theme-default col-xs-12">
				  					<div id="slider" class="nivoSlider">
									    <a href="event-special.php"><img src="media/image/banner_slider_1.png" alt="" /></a>
									    <img src="img/placeholder-evento-2.png" alt="" /></a>
									    <img src="img/placeholder-evento.png" alt="" />
									    <img src="img/placeholder-evento-2.png" alt="" />
										</div>
				  				</div>
				  			</div>
				  		</div>
				  		<div id="news-list" class="col-lg-9 col-lg-pull-3 col-md-9 col-md-pull-3 col-sm-6 col-sm-pull-6 col-xs-12">
								<div class="list-group">
								  <a href="news-item.php" class="list-group-item">
								  	<div class="col-xs-2 col-sm-5 col-md-2 col-lg-2">
								  		<img class="thumbnail" src="media/image/event1.png" alt="...">
								  	</div>
								    <h4 class="list-group-item-heading">Programação da Semana de TSI 2014</h4>
					    			<p class="list-group-item-text">Foi definida a programação da Semana Acadêmica do curso de Tecnologia em Sistemas para Internet de 2014.</p>
								  </a>
								  <a href="#" class="list-group-item">
								  	<div class="col-xs-2 col-sm-5 col-md-2 col-lg-2">
								  		<img class="thumbnail" src="img/placeholder-evento.png" alt="...">
								  	</div>
								    <h4 class="list-group-item-heading">Título da segunda notícia</h4>
								    <p class="list-group-item-text">Subtítulo da segunda notícia</p>
								  </a>
								  <a href="#" class="list-group-item">
								  	<div class="col-xs-2 col-sm-5 col-md-2 col-lg-2">
								  		<img class="thumbnail" src="img/placeholder-evento.png" alt="...">
								  	</div>
								    <h4 class="list-group-item-heading">Título da terceira notícia</h4>
								    <p class="list-group-item-text">Subtítulo da terceira notícia</p>
								  </a>
								  <a href="news.php" class="older-news">Ver Notícias Anteriores</a>

							</div>

				  	</div>
					</div>

					<div class="row events">
					  <div class="event col-lg-3 col-md-3 col-sm-6 col-xs-12">
					  	<a class="event-link" data-toggle="modal" data-target="#modalevent1">
						    <div class="thumbnail">
						      <img class="event-thumbnail" src="media/image/event1.png" alt="...">
						      <div class="caption">
						        <h3>Semana Acadêmica de TSI 2014</h3>
						        <p>De 22/09/14 a 26/09/14</p>
						      </div>
					    	</div>
					    </a>
					  </div>
					  <div class="event col-lg-3 col-md-3 col-sm-6 col-xs-12">
					    <a class="event-link" data-toggle="modal" data-target="#modalevent2">
					    	<div class="thumbnail">
					      <img class="event-thumbnail" src="media/image/event2.jpg" alt="...">
					      <div class="caption">
					        <h3>Semana Acadêmica EM 2014</h3>
					        <p>De 06/10/14 a 10/10/14</p>
					      </div>
					    </div>
					   </a>
					  </div>
					  <div class="event col-lg-3 col-md-3 col-sm-6 col-xs-12">
					    <a class="event-link" data-toggle="modal" data-target="#modalsubevent1">
					    	<div class="thumbnail">
					      <img class="event-thumbnail" src="media/image/event1.png" alt="...">
					      <div class="caption">
					        <h3>Minicurso de Linux</h3>
					        <p>26/09/14</p>
					      </div>
					    </div>
					   </a>
					  </div>
					  <div class="event col-lg-3 col-md-3 col-sm-6 col-xs-12">
					    <a class="event-link" data-toggle="modal" data-target="#modalevent4">
					    	<div class="thumbnail">
					      <img class="event-thumbnail" src="img/placeholder-evento-2.png" alt="...">
					      <div class="caption">
					        <h3>Evento 4</h3>
					        <p>30/05/14</p>
					      </div>
					    </div>
					   </a>
					  </div>
					</div>
					<div class="row">
			  		<div id="media-thumbnail" class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-12 col-xs-12"><h5>FOTOS E VÍDEOS DOS ÚLTIMOS EVENTOS</h5>
							<div class="row">
								<div class="media-item col-xs-4 col-sm-4 col-md-2 col-lg-2">
								  	<a href="media/image/image1.jpg" class="fancybox" title="Formatura de TSI 2014" rel="lightbox"><img class="thumbnail" src="media/image/image1.jpg" alt="Formatura TSI"/>FORMATURA TSI</a>
								</div>
								<div class="media-item col-xs-4 col-sm-4 col-md-2 col-lg-2">
								  	<a href="http://www.youtube.com/watch?v=Qv4-m-cIZf4" class="fancybox" title="Imagem 2" rel="lightbox"><img class="thumbnail" src="http://img.youtube.com/vi/Qv4-m-cIZf4/0.jpg" alt="Vídeo 1"/>NOMEDOEVENTO</a>
								</div>
								<div class="media-item col-xs-4 col-sm-4 col-md-2 col-lg-2">
								  	<a href="media/image/image2.jpg" class="fancybox" title="III Mostra de Talentos Campus Guarapuava" rel="lightbox"><img class="thumbnail" src="media/image/image2.jpg" alt="Mostra de Talentos"/>MOSTRA DE TALENTOS</a>
								</div>
								<div class="media-item col-xs-4 col-sm-4 col-md-2 col-lg-2">
								  	<a href="media/image/image3.jpg" class="fancybox" title="Formatura de TSI 2014" rel="lightbox"><img class="thumbnail" src="media/image/image3.jpg" alt="Formatura TSI"/>FORMATURA TSI</a>
								</div>
								<div class="media-item col-xs-4 col-sm-4 col-md-2 col-lg-2">
								  	<a href="media/image/image4.jpg" class="fancybox" title="Despedida do campus da Unicentro" rel="lightbox"><img class="thumbnail" src="media/image/image4.jpg" alt="Mudança de Campus"/>MUDANÇA DE CAMPUS</a>
								</div>
								<div class="media-item col-xs-4 col-sm-4 col-md-2 col-lg-2">
								  	<a href="media/image/image5.jpg" class="fancybox" title="UTFPR Campus Guarapuava" rel="lightbox"><img class="thumbnail" src="media/image/image5.jpg" alt="Novo Campus"/>NOVO CAMPUS</a>
								</div>
							</div>
			  		</div>
					</div>

				</div>
			</div>
			<?php require_once "includes/footer.php";?>
		</div>
		<?php require_once "includes/modals.php";?>
	</body>

	<?php require_once "includes/foot.php";?>

</html>