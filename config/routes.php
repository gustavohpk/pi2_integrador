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

    //rotas para mídia
    $router->get('/media/gallery', array('controller' => 'MediaController', 'action' => 'gallery'));

    //rotas para contato
    $router->get('/contacts', array('controller' => 'ContactsController', 'action' => 'index'));

    //rotas para login/cadastro/painel
    $router->get('/contacts', array('controller' => 'ContactsController', 'action' => 'index'));
    $router->get('/contacts', array('controller' => 'ContactsController', 'action' => 'index'));

   	//rota apenas para teste >> remover usuários
    $router->get('/account/login', array('controller' => 'AccountController', 'action' => 'login'));
    $router->get('/account/register', array('controller' => 'AccountController', 'action' => 'register'));

    //rota para root do admin
    $router->get('/admin', array('controller' => 'Admin\HomeController', 'action' => 'index'));

    $router->load();
?>