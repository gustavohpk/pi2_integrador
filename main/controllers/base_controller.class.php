<?php
	class BaseController{
		protected $params;
		protected $layout;
		protected $view;
		protected $controllerName;

		public function __construct(){
			$this->layout = "layout/layout.phtml";
		}

		public function setParams($params){
			$this->params = $params;
		}

		public function setView($view){
			$this->view = $view;
		}

		public function setControllerName($controllerName){
			$this->controllerName = $controllerName;
		}

		public function render($view = null, $data = array()){
			if ($view !== null){
				$this->view = $view;
			}

			$view = $this->getViewPath();
			extract($data);
			require "views/".$this->layout;
		}

		private function getViewPath(){
			$controller = lcfirst(str_replace('Controller', '', $this->controllerName)); //não considera a string Controller no nome do arquivo
			$controller = strtolower(preg_replace('/([a-z])([A-Z])/', '$1_$2', $controller)); //camel to snak
			$view = $this->view;
			
			/*
			if (substr($view, 0, 1) == '/'){
				return 'views' . $this->view . '.phtml';
			}
			*/
			return 'views/' . $controller . '/' . $view . '.phtml';
		}

		public function beforeAction(){}
		public function afterAction(){}
	}
?>