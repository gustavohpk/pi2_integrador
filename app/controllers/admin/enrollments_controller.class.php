<?php 
	namespace Admin;
	
	class EnrollmentsController extends BaseAdminController{
   		public function _list() {
      		$this->setHeadTitle("Lista de Inscrições");
   		}

   		public function _new(){
   			$this->setHeadTitle("Criar inscrição");
   		}

   		public function _edit(){
   			$this->setHeadTitle("Modificar inscrição");
   		}
	} 
?>