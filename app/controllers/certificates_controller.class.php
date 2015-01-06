<?php 
	
	class CertificatesController extends BaseController{
		protected $certificates;
    	protected $actionForm;
    	protected $titleBtnSubmit;

    	public function index(){
    		$this->setHeadTitle("Verificar Autenticidade");
    		$this->certificate = new \Certificates();
    		$this->actionForm = $this->getUri("certificados/verificar");
         	$this->titleBtnSubmit = "Procurar";
    	}

		public function verification(){
			$this->certificate = Certificates::findByCode($this->params["certificate"]["code"])[0];
			if($this->certificate){
				$this->event = \Enrollment::findById($this->certificate->getIdEnrollment())[0]->getEvent();
   				$this->participant = \Enrollment::findById($this->certificate->getIdEnrollment())[0]->participant;
   				\FlashMessage::successMessage("Este código é referente a um certificado autêntico.");
				$this->setHeadTitle("Verificar Autenticidade");
	         	$this->actionForm = $this->getUri("certificados/verificar");
	         	$this->titleBtnSubmit = "Procurar";
	         	$this->render("show");
			}
			else {
				\FlashMessage::warningMessage("Certificado não encontrado.");
				$this->redirectTo("certificados");
			}
		}

		public function _list() {
	        $this->setHeadTitle("Meus Certificados");
	        $this->enrollments = Enrollment::findByIdParticipant($_SESSION["participant"]->getIdParticipant());
	        $this->certificates = array();
	        foreach ($this->enrollments as $key => $enrollment) {
	        	$this->certificates[] = Certificates::findByIdEnrollment($enrollment->getIdEnrollment())[0];
	        }
      	}

      	public function show(){
			$this->certificate = Certificates::findByCode($this->params[":code"])[0];
			if($this->certificate){
				$this->event = \Enrollment::findById($this->certificate->getIdEnrollment())[0]->getEvent();
   				$this->participant = \Enrollment::findById($this->certificate->getIdEnrollment())[0]->participant;
				$this->setHeadTitle("Verificar Autenticidade");
	         	$this->actionForm = $this->getUri("certificados/verificar");
	         	$this->titleBtnSubmit = "Procurar";
	         	$this->render("panelshow");
			}
			else {
				\FlashMessage::warningMessage("Certificado não encontrado.");
				$this->redirectTo("/conta/certificados");
			}
		}
	}

?>