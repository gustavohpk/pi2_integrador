<?php 
	namespace Admin;
	
	class EventsTypeController extends BaseAdminController{
		protected $eventsType;
    	protected $actionForm;
    	protected $titleBtnSubmit;

		public function _list(){
   			$this->setHeadTitle("Listando Tipos de Eventos");
   			$this->eventsType = \EventsType::all();
		}

		public function _new(){
         	//prepara formulario para inserção
         	$this->eventsType = new \EventsType();
			$this->setHeadTitle("Novo Evento");
         	$this->actionForm = $this->getUri("admin/eventos/tipos/novo");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			//salva inserção no db
			$this->events = new \EventsType($this->params["event_type"]);
			$this->events->save();
			$this->redirectTo("admin/eventos/tipos");
		}

		public function edit(){
			//prepara formulario para edicao
			$this->eventsType = \EventsType::findById($this->params[":id"]);
   			$this->setHeadTitle("Editar Tipos de Eventos");
   			$this->actionForm = $this->getUri("admin/eventos/tipos/{$this->eventsType->getIdEventType()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			//salva edição no db  
			$this->eventsType = \EventsType::findById($this->params[":id"]);
			$this->eventsType->update($this->params['event_type']);
			$this->redirectTo("admin/eventos/tipos");
		}

		public function remove(){
			$this->eventsType = \EventsType::findById($this->params[":id"]);
			$this->eventsType->remove();
			$this->redirectTo("admin/eventos/tipos");
		}
	} 
?>