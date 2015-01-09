<?php 
	namespace Admin;
	
	class EventsTypeController extends BaseAdminController{
		protected $eventsType;
    	protected $actionForm;
    	protected $titleBtnSubmit;

		public function _list(){
   			$this->setHeadTitle("Listando Tipos de Eventos");
   			if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        \EventsType::setCurrentPage($page);
   			$this->eventsType = \EventsType::all();
   			$this->pagination = new \Pager(\EventsType::count(), \EventsType::getLimitByPage(), $page);
   		
		}

		public function _new(){
         	//prepara formulario para inserção
         	$this->eventsType = new \EventsType();
			$this->setHeadTitle("Novo Tipo de Evento");
         	$this->actionForm = $this->getUri("admin/eventos/tipos/novo");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			//salva inserção no db
			$this->events = new \EventsType($this->params["event_type"]);
			if ($this->events->save()){
				\FlashMessage::successMessage("Tipo de evento cadastro com sucesso.");
				$this->redirectTo("admin/eventos/tipos");
			}
			else{
				\FlashMessage::errorMessage("Erro ao cadastrar tipo de evento.");
				$this->setHeadTitle("Novo Tipo de Evento");
	         	$this->actionForm = $this->getUri("admin/eventos/tipos/novo");
	         	$this->titleBtnSubmit = "Cadastrar";
	         	$this->render("_new");
			}
		}

		public function edit(){
			//prepara formulario para edicao
			$this->eventsType = \EventsType::findById($this->params[":id"])[0];
   			$this->setHeadTitle("Editar Tipo de Evento");
   			$this->actionForm = $this->getUri("admin/eventos/tipos/{$this->eventsType->getIdEventType()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			//salva edição no db  
			$this->eventsType = \EventsType::findById($this->params[":id"])[0];
			if ($this->eventsType->update($this->params['event_type'])){
				\FlashMessage::successMessage("Tipo de evento alterado com sucesso.");
				$this->redirectTo("admin/eventos/tipos");
			}
			else{
				\FlashMessage::errorMessage("Erro ao alterar tipo de evento.");
				$this->setHeadTitle("Editar Tipo de Evento");
	         	$this->actionForm = $this->getUri("admin/eventos/tipos/{$this->eventsType->getIdEventType()}/alterar");
	         	$this->titleBtnSubmit = "Salvar";
	         	$this->render("edit");
			}
		}

		public function remove(){
			$this->eventsType = \EventsType::findById($this->params[":id"]);
			$this->eventsType->remove();
			\FlashMessage::successMessage("Tipo de evento removido com sucesso.");
			$this->redirectTo("admin/eventos/tipos");
		}
	} 
?>