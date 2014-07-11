<?php
	class Router{
		private $url;
		private $postRoutes = array();
		private $getRoutes = array();

		public function __construct($url){
      $this->url = str_replace(SITE_ROOT, '', $url);
 		}

		public function get($route, $options){
			$this->getRoutes[$route] = $options;
		}

		public function post($route, $options){
			$this->postRoutes[$route] = $options;
		}

		public function load(){
			if ($_SERVER["REQUEST_METHOD"] === "POST")
					$this->find($this->postRoutes);
			else
					$this->find($this->getRoutes);
		}

  	private function find($routes) {
      foreach($routes as $route => $options){
        $params = array();

        if ($this->isRightRoute($route, $params)) {
           $controller_name = $options['controller'];
           $action_name = $options['action'];

           $merged_params = array_merge($this->params(), $params);
           $controller = new $controller_name();
           $controller->setParams($merged_params);
           $controller->setView($action_name);
           $controller->setControllerName($controller_name);

           $controller->beforeAction();
           $controller->$action_name();
           $controller->afterAction();
           $controller->render();
           return;
        }
      }

      $controller = new BaseController;
      $controller->setView('not_found');
      $controller->setControllerName('BaseController');
       $controller->beforeAction();
       $controller->notFound();
       $controller->afterAction();
       $controller->render();
       return;

      //echo "Página não encontrada"; //melhorar isso depois
	}

  private function isRightRoute($route, &$params) {
    $route = explode('/', $route);
    $url = explode('/', $this->url);

    if (sizeof($route) != sizeof($url)) return false;

    for ($i = 0; $i < sizeof($route); $i++) {
      //se na rota encontrar uma string no formato :xxx considera com um parametro a ser recebido pela url
      if (preg_match('/^:[a-z,_]+$/', $route[$i])){
          $params[$route[$i]] = $url[$i];
          continue;
      }else if ($route[$i] !== $url[$i]) {
        return false;
      }
    }

    return true;
  }

  private function params() {
     if ($_SERVER['REQUEST_METHOD'] === 'POST')
       return $_POST;
     else
       return $_GET;
  }
}
?>