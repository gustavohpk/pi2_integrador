<?php 
	namespace Admin;
	
	class HomeController extends BaseAdminController{
   		public function index() {
      		$this->setHeadTitle();
      		$this->maintenance = \Settings::checkMaintenance();
   		}
	} 
?>