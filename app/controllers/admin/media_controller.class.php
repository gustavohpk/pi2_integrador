<?php 
	namespace Admin;
	
	class MediaController extends BaseAdminController{
   		public function _list() {
      		$this->setHeadTitle("Lista de Mídia");
   		}

   		public function _new(){
   			$this->setHeadTitle("Upload de mídia");
   		}

   		public function _edit(){
   			$this->setHeadTitle("Modificar mídia");
   		}
	} 
?>