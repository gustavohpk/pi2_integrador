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
		}
	}
?>