<?php 
	class UsuariosController extends BaseController{
		public function beforeAction(){
			echo "Antes<br>";
		}

		public function afterAction(){
			echo "Depois<br>";
		}

   		public function remover(){
      		$this->id_usuario = $this->params[":id"];
   		}
	} 
?>