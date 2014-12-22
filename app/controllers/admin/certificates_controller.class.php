<?php 
	namespace Admin;
	
	class CertificatesController extends BaseAdminController{
		protected $certificates;
    	protected $actionForm;
    	protected $titleBtnSubmit;

		public function _list(){
   			$this->setHeadTitle("Lista de Certificados");
	        if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
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
         	$this->certificates = new \Certificates();
         	$this->events = \Events::find(array("end_date"), array(date("Y-m-d")), "<", "AND", "name", "ASC");
			$this->setHeadTitle("Novo Certificado");
         	$this->actionForm = $this->getUri("admin/certificados");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			$this->certificates = new \Certificates($this->params["certificate"]);
			if(\Certificates::findByIdEnrollment($this->params["certificate"]["id_enrollment"])){
				\FlashMessage::errorMessage("Já existe um certificado para esta inscrição.");
				$this->setHeadTitle("Novo Certificado");
	         	$this->actionForm = $this->getUri("admin/certificados/novo");
	         	$this->titleBtnSubmit = "Cadastrar";
	         	$this->render("_new");
			}
			else if ($this->certificates->save()){
				\FlashMessage::successMessage("Certificado criado com sucesso.");
				$this->redirectTo("admin/certificados/" . $this->certificates->getIdCertificate() . "/ver");
			}
			else{
				\FlashMessage::errorMessage("Erro ao criar certificado.");
				$this->setHeadTitle("Novo Certificado");
	         	$this->actionForm = $this->getUri("admin/certificados/novo");
	         	$this->titleBtnSubmit = "Cadastrar";
	         	$this->render("_new");
			}
		}

		public function show(){
			$this->certificates = \Certificates::findById($this->params[":id"])[0];
   			$this->setHeadTitle("Visualizar Certificado");
   			$this->events[] = \Enrollment::findById($this->certificates->getIdEnrollment())[0]->getEvent();
   			//var_dump(get_class_methods(\Enrollment::findById($this->certificates->getIdEnrollment())[0]));
   			$this->participant = \Enrollment::findById($this->certificates->getIdEnrollment())[0]->participant;
   			//$this->actionForm = $this->getUri("admin/patrocinadores/{$this->certificates->getIdCertificate()}/alterar");
   			//$this->titleBtnSubmit = "Salvar";   			
		}

		// public function update(){
		// 	//salva edição no db  
		// 	$this->certificates = \Certificates::findById($this->params[":id"])[0];
		// 	if ($this->certificates->update($this->params['certificate'])){
		// 		\FlashMessage::successMessage("Patrocinador alterado com sucesso.");
		// 		$this->redirectTo("admin/patrocinadores/lista");
		// 	}
		// 	else{
		// 		\FlashMessage::errorMessage("Erro ao alterar patrocinador.");
		// 		$this->setHeadTitle("Editar Patrocinador");
	 //         	$this->actionForm = $this->getUri("admin/patrocinadores/{$this->certificates->getIdEventType()}/alterar");
	 //         	$this->titleBtnSubmit = "Salvar";
	 //         	$this->render("edit");
		// 	}
		// }

		public function remove(){
			$this->certificates = \Certificates::findById($this->params[":id"])[0];
			$this->certificates->remove();
			\FlashMessage::successMessage("Certificado removido com sucesso.");
			$this->redirectTo("admin/certificados");
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