<?php 
	class HomeController extends BaseController{
		protected $title;
		
   		public function index() {
      		$this->title = 'Testando Index <br>Digite na url /users/10/remove';
      		$this->setHeadTitle();
   		}
	} 
?>