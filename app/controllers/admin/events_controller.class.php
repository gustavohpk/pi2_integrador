<?php 
	namespace Admin;
	
	class EventsController extends BaseAdminController{
		protected $events;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Eventos");
   		$this->events = \Events::all();
		}

		public function _new(){
         //prepara formulario para inserção de novo evento
			$this->setHeadTitle("Novo Evento");
			$this->events = new \Events();
         $this->actionForm = $this->getUri("admin/events");
         $this->titleBtnSubmit = "Cadastrar";
		}

      public function create(){
         //salva evento no db
         $this->events = new \Events($this->params["event"]);
         $this->events->save();
         $this->redirectTo("admin/events/list");
      }

		public function edit(){
         //prepara formulario para edição do evento
			$this->setHeadTitle("Editar Evento");
			$this->events = \Events::findById($this->params[":id"]);
         $this->actionForm = $this->getUri("admin/events/{$this->events->getIdEvent()}");
         $this->titleBtnSubmit = "Salvar";
		}

      public function update(){
         //salva edição do evento no db            
         $this->events = \Events::findById($this->params[":id"]);
         $this->events->update($this->params['event']);
         $this->redirectTo("admin/events/list");
      }

		public function remove(){
         $this->events = \Events::findById($this->params[":id"]);
         $this->events->remove();
         $this->redirectTo("admin/events/list");
		}
	} 
?>