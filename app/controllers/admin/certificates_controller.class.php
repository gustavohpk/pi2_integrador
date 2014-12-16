<?php 
	namespace Admin;
	
	class CertificatesController extends BaseAdminController{
		protected $certificates;
    	protected $actionForm;
    	protected $titleBtnSubmit;

		public function _list(){
   			$this->setHeadTitle("Lista de Patrocinadores");
	        if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
         	\Certificates::setLimitByPage(5);
	        \Certificates::setCurrentPage($page);

	        if (isset($this->params[":id"])){
	           $this->certificates = \Certificates::findById($this->params[":id"]);
	           $this->pagination = new \Pager(count($this->certificates), \Certificates::getLimitByPage(), $page);
	        }
	        else{
	           $this->certificates = \Certificates::find();
	           $this->pagination = new \Pager(\Certificates::count(), \Certificates::getLimitByPage(), $page);
	        }
		}

		public function _new(){
         	//prepara formulario para inserção
         	$this->certificates = new \Certificates();
         	$this->events = \Events::find(array("end_date"), array(date("Y-m-d")), "<", "AND", "name", "ASC");
			$this->setHeadTitle("Novo Certificado");
         	$this->actionForm = $this->getUri("admin/patrocinadores/novo");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			//salva inserção no db
			$this->certificates = new \Certificates($this->params["certificate"]);
			if ($this->certificates->save()){
				\FlashMessage::successMessage("Patrocinador cadastro com sucesso.");
				$this->redirectTo("admin/patrocinadores/lista");
			}
			else{
				\FlashMessage::errorMessage("Erro ao cadastrar patrocinador.");
				$this->setHeadTitle("Novo Patrocinador");
	         	$this->actionForm = $this->getUri("admin/patrocinadores/novo");
	         	$this->titleBtnSubmit = "Cadastrar";
	         	$this->render("_new");
			}
		}

		public function edit(){
			//prepara formulario para edicao
			$this->certificates = \Certificates::findById($this->params[":id"])[0];
   			$this->setHeadTitle("Editar Patrocinador");
   			$this->actionForm = $this->getUri("admin/patrocinadores/{$this->certificates->getIdSponsor()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			//salva edição no db  
			$this->certificates = \Certificates::findById($this->params[":id"])[0];
			if ($this->certificates->update($this->params['certificate'])){
				\FlashMessage::successMessage("Patrocinador alterado com sucesso.");
				$this->redirectTo("admin/patrocinadores/lista");
			}
			else{
				\FlashMessage::errorMessage("Erro ao alterar patrocinador.");
				$this->setHeadTitle("Editar Patrocinador");
	         	$this->actionForm = $this->getUri("admin/patrocinadores/{$this->certificates->getIdEventType()}/alterar");
	         	$this->titleBtnSubmit = "Salvar";
	         	$this->render("edit");
			}
		}

		public function remove(){
			$this->certificates = \Certificates::findById($this->params[":id"])[0];
			$this->certificates->remove();
			\FlashMessage::successMessage("Patrocinador removido com sucesso.");
			$this->redirectTo("admin/patrocinadores/lista");
		}

		public function enrollments(){
			$this->enrollments = \Enrollment::findByIdEvent($this->params[":id"]);
			$enrollments_json = array();
			foreach ($this->enrollments as $enrollment) {
				$enrollments_json[] = (array) json_decode(json_encode(new \EnrollmentJson($enrollment), true));
			}
			echo json_encode($enrollments_json);
			exit;
		}
	} 
?>