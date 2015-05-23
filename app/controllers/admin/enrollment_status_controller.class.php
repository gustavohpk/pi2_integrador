<?php 
	namespace Admin;
	
	class EnrollmentStatusController extends BaseAdminController{
		protected $enrollmentStatus;
    	protected $actionForm;
    	protected $titleBtnSubmit;

		public function _list(){
   			$this->setHeadTitle("Listando Estados de Inscrição");
   			if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        \EnrollmentStatus::setCurrentPage($page);
   			$this->enrollmentStatus = \EnrollmentStatus::all();
   			$this->pagination = new \Pager(\EnrollmentStatus::count(), \EnrollmentStatus::getLimitByPage(), $page);
   		
		}

		public function _new(){
         	//prepara formulario para inserção
         	$this->enrollmentStatus = new \EnrollmentStatus();
			$this->setHeadTitle("Novo Estado de Inscrição");
         	$this->actionForm = $this->getUri("admin/inscricoes/estados/novo");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			//salva inserção no db
			$this->enrollmentStatus = new \EnrollmentStatus($this->params["enrollment_status"]);
			if ($this->enrollmentStatus->save()){
				\FlashMessage::successMessage("Estado de inscrição cadastro com sucesso.");
				$this->redirectTo("admin/inscricoes/estados");
			}
			else{
				\FlashMessage::errorMessage("Erro ao cadastrar estado de inscrição.");
				$this->setHeadTitle("Novo Estado de Inscrição");
	         	$this->actionForm = $this->getUri("admin/inscricoes/estados/novo");
	         	$this->titleBtnSubmit = "Cadastrar";
	         	$this->render("_new");
			}
		}

		public function _edit(){
			//prepara formulario para edicao
			$this->enrollmentStatus = \EnrollmentStatus::findById($this->params[":id"])[0];
   			$this->setHeadTitle("Editar Estado de Inscrição");
   			$this->actionForm = $this->getUri("admin/inscricoes/estados/{$this->enrollmentStatus->getIdEnrollmentStatus()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			//salva edição no db  
			$this->enrollmentStatus = \EnrollmentStatus::findById($this->params[":id"])[0];
			if ($this->enrollmentStatus->update($this->params['enrollment_status'])){
				\FlashMessage::successMessage("Estado de inscrição alterado com sucesso.");
				$this->redirectTo("admin/inscricoes/estados");
			}
			else{
				\FlashMessage::errorMessage("Erro ao alterar estado de inscrição.");
				$this->setHeadTitle("Editar Estado de Inscrição");
	         	$this->actionForm = $this->getUri("admin/inscricoes/estados/{$this->enrollmentStatus->getIdEnrollmentStatus()}/alterar");
	         	$this->titleBtnSubmit = "Salvar";
	         	$this->render("edit");
			}
		}

		public function remove(){
			$this->enrollmentStatus = \EnrollmentStatus::findById($this->params[":id"]);
			$this->enrollmentStatus->remove();
			\FlashMessage::successMessage("Estado de inscrição removido com sucesso.");
			$this->redirectTo("admin/eventos/tipos");
		}
	} 
?>