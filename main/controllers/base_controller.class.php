	<?php
	class BaseController{
		protected $params;
		protected $layout;
		protected $view;
		protected $viewPath;
		protected $controllerName;
		protected $data = array(); //dados/variáveis que serão exportados para as views

		public function __construct(){
			$this->layout = "layout/layout.phtml";
		}

		public function setParams($params){
			$this->params = $params;
		}

		public function setView($view){
			$this->view = $view;
		}


		//Título para tag title da tag head
		public function setHeadTitle($pageTitle = null){
			if ($pageTitle){
				$this->headTitle = $pageTitle . " - " . APP_NAME;
			}
			else{
				$this->headTitle = APP_NAME;
			}
			return $this->headTitle;
		}

		public function getHeadTitle(){
			return $this->headTitle;
		}

		//Caminho da visão
		private function setViewPath(){
			$controller = lcfirst(str_replace('Controller', '', $this->controllerName)); //não considera a string Controller no nome do arquivo
			$controller = strtolower(preg_replace('/([a-z])([A-Z])/', '$1_$2', $controller)); //camel to snak
			$view = $this->view;
			
			/*
			if (substr($view, 0, 1) == '/'){
				return 'views' . $this->view . '.phtml';
			}
			*/
			$this->viewPath = 'views/' . $controller . '/' . $view . '.phtml';
		}

		function getViewPath(){
			return $this->viewPath;
		}

		//Seta o controllador
		public function setControllerName($controllerName){
			$this->controllerName = $controllerName;
		}

		public function render($view = null){
			if ($view !== null){
				$this->view = $view;
			}

			$this->setViewPath();
			extract($this->data);
			require "views/".$this->layout;
		}

		public function beforeAction(){}
		public function afterAction(){}
	}
?>