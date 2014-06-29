<?php 
	namespace Admin;
	
	class EventsController extends BaseAdminController{
		protected $events;
      protected $eventsType;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Eventos");
   		$this->events = \Events::all();
		}

		public function _new(){
         //prepara formulario para inserção de novo evento
			$this->setHeadTitle("Novo Evento");
         $this->eventsType = \EventsType::all();
			$this->events = new \Events();
         $this->actionForm = $this->getUri("admin/eventos");
         $this->titleBtnSubmit = "Cadastrar";
		}

      public function create(){
         //salva evento no db
         //unde data com hora e coloca no formato correto ... melhorar esta funcao depois.
         $params = $this->params["event"];
         $params["start_date"] = str_replace("/", "-", $params["start_date"]) . " " . $params["start_time"];
         $params["start_date"] = $params["start_date"] < 10 ? null : date("Y-m-d H:i:s", strtotime($params["start_date"]));
         $params["end_date"] = str_replace("/", "-", $params["end_date"]) . " " . $params["end_time"];
         $params["end_date"] = $params["end_date"] < 10 ? null : date("Y-m-d H:i:s", strtotime($params["end_date"]));
         unset($params["start_time"]);
         unset($params["end_time"]);

         $this->events = new \Events($params);
         $this->events->save();
         $this->redirectTo("admin/eventos/lista");
      }

		public function edit(){
         //prepara formulario para edição do evento
			$this->setHeadTitle("Editar Evento");
         $this->eventsType = \EventsType::all();
			$this->events = \Events::findById($this->params[":id"]);
         $this->actionForm = $this->getUri("admin/eventos/{$this->events->getIdEvent()}");
         $this->titleBtnSubmit = "Salvar";
		}

      public function update(){
         //salva edição do evento no db  
         $this->events = \Events::findById($this->params[":id"]);
         $this->events->update($this->params['event']);
         $this->redirectTo("admin/eventos/lista");
      }

		public function remove(){
         $this->events = \Events::findById($this->params[":id"]);
         $this->events->remove();
         $this->redirectTo("admin/eventos/lista");
		}
	} 
?>