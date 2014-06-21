<?php 
	class EventsController extends BaseController{
		public function next() {
      		$this->setHeadTitle("Próximos Eventos");
   		}

   		public function previous(){
      		$this->setHeadTitle("Eventos Anteriores");
   		}
	} 
?>