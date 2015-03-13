<?php
    require 'config/main.php';
    $router = new Router($_SERVER['REQUEST_URI']);

    $routes = Router::allRoutes();

    foreach ($routes['GET'] as $route) {
    	$router->get($route['route'], array('controller' => $route['controller'], 'action' => $route['action']));
    }

    foreach ($routes['POST'] as $route) {
    	$router->post($route['route'], array('controller' => $route['controller'], 'action' => $route['action']));
    }

    $router->load();
?>