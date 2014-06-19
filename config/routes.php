<?php
    require 'main.php';
    $router = new Router($_SERVER['REQUEST_URI']);

    //rota para raiz
   	$router->get('/', array('controller' => 'HomeController', 'action' => 'index'));
   	
   	//rotas para eventos
   	$router->get('/events/next', array('controller' => 'EventsController', 'action' => 'next'));
   	$router->get('/events/previous', array('controller' => 'EventsController', 'action' => 'previous'));

   	//rotas para notícias
   	$router->get('/news/list', array('controller' => 'NewsController', 'action' => 'show'));
   	$router->get('/news/item', array('controller' => 'NewsController', 'action' => 'item'));

   	//rota apenas para teste >> remover usuários
    $router->get('/users/:id/remove', array('controller' => 'UsersController', 'action' => 'remove'));
    
    $router->load();
?>