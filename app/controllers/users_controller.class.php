<?php 
	class UsersController extends BaseController{
		protected $user;
		protected $userName;

		public function beforeAction(){
			$this->user = new Users();
		}

		public function afterAction(){
			$this->userName = $this->user->getName($this->params[":id"]);
		}

   		public function remove(){
      		$this->id_usuario = $this->params[":id"];
   		}
	} 
?>