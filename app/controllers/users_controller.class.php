<?php 
	class UsersController extends BaseController{
		private $user;
		
		public function beforeAction(){
			$this->user = new Users();
		}

		public function afterAction(){}

   		public function remove(){
   			$this->data = $this->user->getName($this->params[":id"]);
   		}
	} 
?>