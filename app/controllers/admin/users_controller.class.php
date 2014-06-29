<?php 
	namespace Admin;
	
	class UsersController extends BaseAdminController{
   		public function _list() {
      		$this->setHeadTitle("Lista de Usuários");
   		}

   		public function _new(){
   			$this->setHeadTitle("Criar usuário");
   		}

   		public function _edit(){
   			$this->setHeadTitle("Modificar usuário");
   		}
	} 
?>