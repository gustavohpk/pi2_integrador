<?php 
	namespace Admin;
	
	class AdministratorLevelController extends BaseAdminController{
      protected $administrators;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Usuários");
         $this->administratorLevels = AdministratorLevel::all();
		}

		public function _new(){
			$this->setHeadTitle("Novo nível de administrador");
         $this->actionForm = $this->getUri("admin/niveis/novo");
         $this->administratorLevel = new AdministratorLevel();
         $this->routes = array();
         $routes = \Router::allRoutes();
         foreach ($routes["GET"] as $key => $route) {
            if(substr($route["route"], 0, 6) != "/admin"){
               unset($routes["GET"][$key]);
            }else{
               $this->routes[$route["controller"]][] = array("method" => "GET", "route" => $route["route"], "action" => $route["action"]);
            }
         }
         foreach ($routes["POST"] as $key => $route) {

            if(substr($route["route"], 0, 6) != "/admin"){
               unset($routes["POST"][$key]);
            }else{
               $this->routes[$route["controller"]][] = array("method" => "POST", "route" => $route["route"], "action" => $route["action"]);
            }
         }
		}

      public function create() {
         $params = $this->params;
         foreach ($params as $key => $value) {
            if($key != "admin_level")
               $areas[$key] = array_keys($value);
         }
         $params["admin_level"]["permissions"] = json_encode($areas);
         
         $this->administratorLevel = new AdministratorLevel($params["admin_level"]);
         if ($this->administratorLevel->save()) {
            \FlashMessage::successMessage("Cadastro de nível de administrador realizado com sucesso.");
            $this->redirectTo("admin/niveis/lista");
         }
         else {
            \FlashMessage::errorMessage("Erro ao cadastrar nível de administrador.");
            $this->setHeadTitle("Novo nível de administrador");
            $this->actionForm = $this->getUri("admin/niveis/novo");
            $this->titleBtnSubmit = "Cadastrar";
            $this->render("_new");
         }
      }

		public function edit(){
			$this->setHeadTitle("Modificar nível de administrador");
         $this->actionForm = $this->getUri("admin/niveis/{$this->params[":id"]}/alterar");
         if ($this->administratorLevel = AdministratorLevel::findById($this->params[":id"])) {
            $this->administratorLevel = $this->administratorLevel[0];
         }
         $this->routes = array();
         $routes = \Router::allRoutes();
         foreach ($routes["GET"] as $key => $route) {
            if(substr($route["route"], 0, 6) != "/admin"){
               unset($routes["GET"][$key]);
            }else{
               $this->routes[$route["controller"]][] = array("method" => "GET", "route" => $route["route"], "action" => $route["action"]);
            }
         }
         foreach ($routes["POST"] as $key => $route) {

            if(substr($route["route"], 0, 6) != "/admin"){
               unset($routes["POST"][$key]);
            }else{
               $this->routes[$route["controller"]][] = array("method" => "POST", "route" => $route["route"], "action" => $route["action"]);
            }
         }
		}

      public function update() {
         $this->administratorLevel = AdministratorLevel::findById($this->params[":id"])[0];

         $params = $this->params;
         foreach ($params as $key => $value) {
            if($key != "admin_level" && $key != ":id"){
               $areas[$key] = array_keys($value);
            }
         }
         $params["admin_level"]["permissions"] = json_encode($areas);

         if ($this->administratorLevel->update($params["admin_level"])) {
            \flashMessage::successMessage("Nível de administrador alterado com sucesso.");
            $this->redirectTo("admin/niveis/lista");
         }
         else {
            $errors = $this->administratorLevel->getErrors();
            foreach ($errors as $error) {
               \flashMessage::errorMessage($error);
            }
            
            $this->routes = array();
            $routes = \Router::allRoutes();
            foreach ($routes["GET"] as $key => $route) {
               if(substr($route["route"], 0, 6) != "/admin"){
                  unset($routes["GET"][$key]);
               }else{
                  $this->routes[$route["controller"]][] = array("method" => "GET", "route" => $route["route"], "action" => $route["action"]);
               }
            }
            foreach ($routes["POST"] as $key => $route) {

               if(substr($route["route"], 0, 6) != "/admin"){
                  unset($routes["POST"][$key]);
               }else{
                  $this->routes[$route["controller"]][] = array("method" => "POST", "route" => $route["route"], "action" => $route["action"]);
               }
            }
            $this->setHeadTitle("Modificar nível de administrador");
            $this->actionForm = $this->getUri("admin/niveis/{$this->params[":id"]}/alterar");
            $this->render("edit");
         }
      }

      public function remove() {
         if ($this->administratorLevel = AdministratorLevel::findById($this->params[":id"])) {
            if ($this->administratorLevel[0]->remove()) {
               \flashMessage::successMessage("Nível de administrador removido com sucesso.");
               $this->redirectTo("admin/niveis/lista");
            }
            else {
               \flashMessage::errorMessage("Erro ao tentar remover nível de administrador.");
               $this->redirectTo("admin/niveis/lista");               
            }
         }
         else {
            \flashMessage::errorMessage("O nível de administrador que você está tentando remover não existe.");
            $this->redirectTo("admin/niveis/lista");  
         }
      }
	} 
?>