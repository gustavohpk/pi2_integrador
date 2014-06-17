<?php 
	class UsersController extends BaseController{
		public function beforeAction(){
			echo "Antes<br>";
		}

		public function afterAction(){
			echo "Depois<br>";
		}

   		public function remove(){
      		$this->id_usuario = $this->params[":id"];
   		}
	} 
?>