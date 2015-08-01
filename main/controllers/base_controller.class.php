<?php
/**
 * Controlador base
 * @author Rodrigo Miss
 * @author Gustavo Pchek
 */

	session_start();

	class BaseController{

		/**
	     * @var string[] $params Os parâmetros
	     * @var string $layout O tipo do layout
	     * @var string $action O nome da ação
	     * @var string $viewPath O caminho da visão
	     * @var string $controllerName O nome do controlador
	     * @var string $headTitle O título da página
	     * @var string[] $data Os dados a serem exportados para as visões
	     * @var string $continueUrl O URL a ser salvo (quando necessário)
	     * @var string $currentTheme O tema atual
	     */
		protected $params;
		protected $layout;
		protected $action;
		protected $viewPath; 
		protected $controllerName;
		protected $headTitle;
		protected $data = array();
		protected $continueUrl;
		protected $currentTheme = "utfpr";

		public function __construct(){
			$this->layout = "layout/layout.phtml";
		}

		/**
		 * Define os parâmetros
		 * @param $params array Os parâmetros
		 */
		public function setParams($params){
			$this->params = $params;
		}

		/**
		 * Define a visão
		 * @param $view String A visão
		 */
		public function setAction($action){
			$this->action = $action;
		}

		/**
		 * Define o título da página, para ser utilizado na tag <head>
		 * @param String $pageTitle O título de página
		 */
		public function setHeadTitle($pageTitle = null){
			$siteTitle = APP_NAME;
			if ($pageTitle){
				$this->headTitle = $pageTitle . " - " . $siteTitle;
			}
			else{
				$this->headTitle = $siteTitle;
			}
		}

		/**
		 * Retorna o título da página
		 * @return String O título da página
		 */
		public function getHeadTitle(){
			return $this->headTitle;
		}

		/**
		 * Define tema atual da p[agina]
		 * @param String $currentTheme O tema atual
		 */
		public function setCurrentTheme($currentTheme = "utfpr"){
			$this->currentTheme = $currentTheme;
		}

		/**
		 * Retorna o tema atual
		 * @return String O tema atual
		 */
		public function getCurrentTheme(){
			return $this->currentTheme;
		}

		/**
		 * Redireciona para outra página
		 * @param String $uri O uri da página.
		 */
		public function redirectTo($uri){
			header("Location: " . $this->getUri($uri));
			exit();
		}

		/**
		 * Retorna para a última página acessada
		 */
		public function returnToLastPage(){
			header("Location: " . $this->back());
			exit(); 
		}

		/**
		 * Retorna para o endereço salvo no referer
		 */
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

		/**
		 * Retorna o nome da aplicação salvo no arquivo de configuração.
		 * @return string O nome da aplicação
		 */
		public function getApplicationName(){
			return APP_NAME;
		}

		/**
		 * Obtém o URI absoluto a partir do URI relativo
		 * @param string $uri O URI relativo
		 * @return string O URI absoluto
		 */
		public function getUri($uri = null){
			if (!$uri){
				return SITE_ROOT;
			}
			else{
				return SITE_ROOT . "/" . $uri;
			}
		}

		/**
		 * Retorna o caminho de uma mídia
		 * @param string $media O URI relativo da mídia
		 * @return string O caminho da mídia
		 */
		public function getMedia($media = null){
			if ($media){
				return MEDIA_FOLDER . "/" . $media;
			}
			else{
				return false;
			}
		}

		/**
		 * Retorna o caminho de um recurso (asset)
		 * @param string $resource O URI relativo
		 * @return string O caminho do recurso
		 */
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

		/**
		 * Define o caminho da visão a partir do nome da função dentro do controlador
		 */
		private function setViewPath(){
			$controller = lcfirst(str_replace('Controller', '', $this->controllerName)); //não considera a string Controller no nome do arquivo
			$controller = strtolower(preg_replace('/([a-z])([A-Z])/', '$1_$2', $controller)); //camel to snak
			$controller = str_replace('\\', '/', $controller); # for namespace
			  
		  	//em alguns métodos tais como _list e _new, remove-se o _ na busca pelo arquivo
		    if (substr($this->getAction(), 0, 1) == '_'){
		      $view = substr($this->getAction(), 1, strlen($this->getAction()));
		    } else {
		      $view = $this->getAction();
		    }

		    /*
		    if (substr($view, 0, 1) == '/') {
		    	$this->viewPath = 'views' . $this->view . '.phtml';
		    }
		    else{
		    	$this->viewPath = 'views/' . $controller . '/' . $view . '.phtml';
		    }
		    */

		    //var_dump('views/default/' . $controller . '/' . $view . '.phtml'); exit;
		    if(stream_resolve_include_path('views/'. $this->getCurrentTheme() . '/' . $controller . '/' . $view . '.phtml')){
		    	$this->viewPath = 'views/'. $this->getCurrentTheme() . '/' . $controller . '/' . $view . '.phtml';
			} else {
				$this->viewPath = 'views/default/' . $controller . '/' . $view . '.phtml';
			}
		}

		/**
		 * Retorna a ação
		 * @return string A ação
		 */
		public function getAction(){
			return $this->action;
		}

		/**
		 * Retorna o caminho da visão
		 * @return string O caminho da visão
		 */
		public function getViewPath(){
			return $this->viewPath;
		}

		/**
		 * Define o nome do controlador
		 * @param string $controllerName O nome do controlador
		 */
		public function setControllerName($controllerName){
			$this->controllerName = $controllerName;
		}

		/**
		 * Renderiza a visão
		 * @param string $view O nome da visão
		 */
		public function render($action = null){
			require_once "main/views/views_functions.php";

			if ($action !== null){
				$this->setAction($action);
			}

			$this->setViewPath();
			extract($this->data);


			//Se o arquivo de layout não existe no tema atual, busca o default
			if(stream_resolve_include_path('views/' . $this->getCurrentTheme() . '/'.$this->layout)){
				require 'views/' . $this->getCurrentTheme() . '/'.$this->layout;
			} else {
				require 'views/default/'.$this->layout;
			}
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