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

   	//rota para login/cadastro - usuários
    $router->get('/account/login', array('controller' => 'AccountController', 'action' => 'login'));
    $router->get('/account/register', array('controller' => 'AccountController', 'action' => 'register'));

    //rota para root do admin
    $router->get('/admin', array('controller' => 'Admin\HomeController', 'action' => 'index'));

    //rota para eventos - area admin
    $router->get('/admin/events/list', array('controller' => 'Admin\EventsController', 'action' => '_list'));
    
    $router->get('/admin/events/new', array('controller' => 'Admin\EventsController', 'action' => '_new'));
    $router->post('/admin/events', array('controller' => 'Admin\EventsController', 'action' => 'create'));    
    $router->get('/admin/events/:id/edit', array('controller' => 'Admin\EventsController', 'action' => 'edit'));
    $router->post('/admin/events/:id', array('controller' => 'Admin\EventsController', 'action' => 'update'));

    $router->get('/admin/events/:id/remove', array('controller' => 'Admin\EventsController', 'action' => 'remove'));

    $router->load();
?>