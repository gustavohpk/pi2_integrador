<?php 
	namespace Admin;
	
	class EventsController extends BaseAdminController{
   		public function _list() {
      		$this->setHeadTitle("Lista de Eventos");
   		}

   		public function _new(){
   			$this->setHeadTitle("Novo Evento");
   		}

   		public function _edit(){
   			$this->setHeadTitle("Editar Evento");
   		}

   		public function remove(){
   			echo "implementar modelo para remover evento id: {$this->params[':id']}"; exit;
   		}
	} 
?>