<?php 
	class EventsController extends BaseController{
		public function next() {
      		$this->title = "Próximos Eventos";
      		$this->setHeadTitle("Próximos Eventos");
   		}

   		public function previous(){
   			$this->title = "Eventos Anteriores";
      		$this->setHeadTitle("Eventos Anteriores");
   		}
	} 
?>