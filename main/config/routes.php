<?php
    require 'main.php';
    $router = new Router($_SERVER['REQUEST_URI']);

   	$router->get('/', array('controller' => 'HomeController', 'action' => 'index'));
    $router->get('/users/:id/remove', array('controller' => 'UsersController', 'action' => 'remove'));
    $router->load();
?>