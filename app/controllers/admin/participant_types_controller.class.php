<?php 
	namespace Admin;
	
	class ParticipantTypesController extends BaseAdminController{
		protected $participantType;
    	protected $actionForm;
    	protected $titleBtnSubmit;

		public function _list(){
   			$this->setHeadTitle("Listando Tipos de Eventos");
   			if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        \ParticipantType::setCurrentPage($page);
   			$this->participantTypes = \ParticipantType::all();
   			$this->pagination = new \Pager(\ParticipantType::count(), \ParticipantType::getLimitByPage(), $page);
   		
		}

		public function _new(){
         	//prepara formulario para inserção
         	$this->participantType = new \ParticipantType();
			$this->setHeadTitle("Nova Categoria de participante");
         	$this->actionForm = $this->getUri("admin/participantes/tipos/novo");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			//salva inserção no db
			$this->events = new \ParticipantType($this->params["participant_type"]);
			if ($this->events->save()){
				\FlashMessage::successMessage("Categoria de participante cadastro com sucesso.");
				$this->redirectTo("admin/participantes/tipos");
			}
			else{
				\FlashMessage::errorMessage("Erro ao cadastrar categoria de participante.");
				$this->setHeadTitle("Nova Categoria de participante");
	         	$this->actionForm = $this->getUri("admin/participantes/tipos/novo");
	         	$this->titleBtnSubmit = "Cadastrar";
	         	$this->render("_new");
			}
		}

		public function _edit(){
			//prepara formulario para edicao
			$this->participantType = \ParticipantType::findById($this->params[":id"])[0];
   			$this->setHeadTitle("Editar Categoria de participante");
   			$this->actionForm = $this->getUri("admin/participantes/tipos/{$this->participantType->getIdParticipantType()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			//salva edição no db  
			$this->participantType = \ParticipantType::findById($this->params[":id"])[0];
			if ($this->participantType->update($this->params['participant_type'])){
				\FlashMessage::successMessage("Categoria de participante alterada com sucesso.");
				$this->redirectTo("admin/participantes/tipos");
			}
			else{
				\FlashMessage::errorMessage("Erro ao alterar categoria de participante.");
				$this->setHeadTitle("Editar Categoria de participante");
	         	$this->actionForm = $this->getUri("admin/participantes/tipos/{$this->participantType->getIdParticipantType()}/alterar");
	         	$this->titleBtnSubmit = "Salvar";
	         	$this->render("edit");
			}
		}

		public function remove(){
			$this->participantType = \ParticipantType::findById($this->params[":id"]);
			$this->participantType->remove();
			\FlashMessage::successMessage("Categoria de participante removida com sucesso.");
			$this->redirectTo("admin/participantes/tipos");
		}
	} 
?>