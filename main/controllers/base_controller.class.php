<?php
/**
 * Controlador base
 * @author Rodrigo Miss
 * @author Gustavo Pchek
 */

	session_start();

	class BaseController{
		protected $params;
		protected $layout;
		protected $view;
		protected $viewPath; 
		protected $controllerName;
		protected $headTitle; //tag <title></title>
		protected $data = array(); //dados/variáveis que serão exportados para as views
		protected $continueUrl;

		public function __construct(){
			if(Settings::checkMaintenance() == '1'){
				$this->layout = "layout/layout_maintenance.phtml";
			}else{
				$this->layout = "layout/layout.phtml";
			}
		}

		public function setParams($params){
			$this->params = $params;
		}

		public function setView($view){
			$this->view = $view;
		}

		//Título para tag title da tag head
		public function setHeadTitle($pageTitle = null){
			$siteTitle = Settings::getSiteTitle()->getValue();
			if ($pageTitle){
				$this->headTitle = $pageTitle . " - " . $siteTitle;
			}
			else{
				$this->headTitle = $siteTitle;
			}
			return $this->headTitle;
		}

		public function getHeadTitle(){
			return $this->headTitle;
		}

		//funcões auxiliares
		public function redirectTo($uri){
			header("Location: " . $this->getUri($uri));
			exit();
		}

		public function returnToLastPage(){
			header("Location: " . $this->back());
			exit(); 
		}

		public function back() {
			if (isset($_SERVER['HTTP_REFERER'])) {
				return $_SERVER['HTTP_REFERER']; 
			}
		}

		/**
		 * Salva um URL que pode ser recuperado posteriormente. Útil para redirecionar após login.
	     * @param string $url O URL
	     */
		public function saveUrl($url){
			$_SESSION["continueUrl"] = str_replace(SITE_ROOT . "/", "", $url);
		}

		/**
		 * Recupera o URL salvo pela função saveUrl
	     * @return string O URL
	     */
		public function retrieveUrl() {
			return $_SESSION["continueUrl"];
		}

		/**
		 * Destrói o URL salvo.
	     */
		public function unsetUrl(){
			unset($_SESSION["continueUrl"]);
		}

		//Retorna constantes
		public function getApplicationName(){
			return APP_NAME;
		}

		public function getUri($uri = null){
			if (!$uri){
				return SITE_ROOT;
			}
			else{
				return SITE_ROOT . "/" . $uri;
			}
		}

		public function getMedia($media = null){
			if ($media){
				return MEDIA_FOLDER . "/" . $media;
			}
			else{
				return false;
			}
		}

		public function getResource($resource = null){
			if ($resource){
				return RESOURCES_FOLDER . "/" . $resource;
			}
			else{
				return false;
			}
		}

		public function getUploadFolder($resource = null){
			if (!file_exists(UPLOAD_FOLDER . $resource)){
				mkdir(UPLOAD_FOLDER . $resource, 644, true);
			}
			return UPLOAD_FOLDER . "$resource/";
		}

		//Caminho da visão
		private function setViewPath(){
			$controller = lcfirst(str_replace('Controller', '', $this->controllerName)); //não considera a string Controller no nome do arquivo
			$controller = strtolower(preg_replace('/([a-z])([A-Z])/', '$1_$2', $controller)); //camel to snak
			$controller = str_replace('\\', '/', $controller); # for namespace
			  
		  	//em alguns métodos tais como _list e _new, remove-se o _ na busca pelo arquivo
		    if (substr($this->view, 0, 1) == '_'){
		      $view = substr($this->view, 1, strlen($this->view));
		    } else {
		      $view = $this->view;
		    }

		    /*
		    if (substr($view, 0, 1) == '/') {
		    	$this->viewPath = 'views' . $this->view . '.phtml';
		    }
		    else{
		    	$this->viewPath = 'views/' . $controller . '/' . $view . '.phtml';
		    }
		    */
		    
		    $this->viewPath = 'views/' . $controller . '/' . $view . '.phtml';
		}

		public function getViewPath(){
			return $this->viewPath;
		}

		//Seta o controllador
		public function setControllerName($controllerName){
			$this->controllerName = $controllerName;
		}

		public function render($view = null){
			require_once "main/views/views_functions.php";

			if ($view !== null){
				$this->view = $view;
			}

			$this->setViewPath();
			extract($this->data);
			require 'views/'.$this->layout;
			exit();
		}

		public function validateCpf(){
         if (isset($this->params[":cpf"])) {
            $cpf = $this->params[":cpf"];
         } else {
            $cpf = 1;
         }
			echo BaseModel::validateCpf($cpf);
			exit();
		}

		public function beforeAction(){}
		public function afterAction(){}

		public function notFound(){
			
		}
	}
?>