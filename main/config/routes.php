<?php
    require 'main.php';
    $router = new Router($_SERVER['REQUEST_URI']);

   	$router->get('/', array('controller' => 'HomeController', 'action' => 'index'));
    $router->get('/usuarios/:id/deletar', array('controller' => 'UsuariosController', 'action' => 'remover'));
    $router->load();
?>