<?php 
	class ParticipantController extends BaseController{
		protected $participant;
    	protected $actionForm;
    	protected $titleBtnSubmit;

       	public function login(){
       		if (isset($_SESSION["participant"])){
       			$this->redirectTo("");
       		}
       		else{
				$this->setHeadTitle("Login");
				$this->participant = new Participant();
			}
       	}

       	public function validateLogin(){			
			$this->participant = new Participant();

			if ($this->participant->login($this->params["participant"]["email"], $this->params["participant"]["password"])){
				FlashMessage::successMessage("Login OK");
				$this->redirectTo("");
			}
			else{
				FlashMessage::errorMessage("Os seguintes ocorreram ao tentar acessar sua conta:");
				$errors = $this->participant->getErrors();

				foreach ($errors as $error){
					FlashMessage::errorMessage($error);
				}

				$this->setHeadTitle("Login");
				$this->participant = new Participant();
				$this->render("login");
			}
       	}

       	public function logout(){
       		$this->participant = Participant::logout();
       		$this->redirectTo("conta/login");
       	}

		public function _new(){
         	$this->participant = new Participant();
			$this->setHeadTitle("Cadastro de Participante");
         	$this->actionForm = $this->getUri("conta/nova");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			$this->participant = new Participant($this->params["participant"]);
			if ($this->participant->save()){
				FlashMessage::successMessage("Cadastro realizado com sucesso.");
				$this->redirectTo("conta/login");
			}
			else{
				FlashMessage::errorMessage("Os seguintes ocorreram ao tentar realizar o cadastro:");
				$errors = $this->participant->getErrors();
				
				foreach ($errors as $error){
					FlashMessage::errorMessage($error);
				}
				$this->setHeadTitle("Cadastro de Participante");
				$this->participant = new Participant($this->params["participant"]);
         		$this->actionForm = $this->getUri("conta/nova");
         		$this->titleBtnSubmit = "Cadastrar";
	         	$this->render("_new");
			}
		}

		public function edit(){
			$this->participant = Participant::findById($this->params[":id"]);
   			$this->setHeadTitle("Editar Cadastro de Participante");
   			$this->actionForm = $this->getUri("conta/{$this->participant->getIdParticipant()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			$this->participant = Participant::findById($this->params[":id"]);
			if ($this->participant->update($this->params['participant'])){
				FlashMessage::successMessage("Cadastro do participante alterado com sucesso.");
				$this->redirectTo("conta/nova");
			}
			else{
				FlashMessage::errorMessage("Os seguintes ocorreram ao alterar o cadastro do participante:");
				$errors = $this->participant->getErrors();

				foreach ($errors as $error){
					FlashMessage::errorMessage($error);
				}
				$this->setHeadTitle("Editar Tipo de Evento");
	         	$this->actionForm = $this->getUri("conta/{$this->participant->getIdParticipant()}/alterar");
	         	$this->titleBtnSubmit = "Salvar";
	         	$this->render("edit");
			}
		}
	} 
?>