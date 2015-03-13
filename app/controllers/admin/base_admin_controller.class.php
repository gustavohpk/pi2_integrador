<?php
	namespace Admin;

	class BaseAdminController extends \BaseController{
		public function __construct(){
			$this->layout = "admin/layout/layout.phtml";
		}

		public function beforeAction(){		
			if (!isset($_SESSION["admin"])){
				$this->redirectTo("admin/login");			
			}
			// $currentController = get_class($this);
			// $currentAction = $this->getAction();
			// $permissions = $_SESSION["admin"]->administratorLevel->getPermissions();
			// $granted = false;
			// if($currentAction != "index"){
			// 	foreach ($permissions as $controller => $actions) {
			// 		if($currentController == $controller){
			// 			foreach ($actions as $action) {
			// 				if($action == $currentAction){
			// 					$granted = true;
			// 					break;
			// 				}
			// 			}
			// 		}
			// 		if($granted){
			// 			break;
			// 		}
			// 	}
			// 	if(!$granted){
			// 		\flashMessage::warningMessage("Você não possui acesso a esta área.");
			// 		$this->redirectTo("admin");	
			// 	}
			// }
		}
	}
?>