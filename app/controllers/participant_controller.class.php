<?php 
	class ParticipantController extends BaseController{
		protected $participant;
    	protected $actionForm;
    	protected $titleBtnSubmit;

    	/*
    	* LOGIN E LOGOUT DO PARTICIPANTE
    	*/
       	public function login(){
       		if (isset($_SESSION["participant"])){
       			$this->redirectTo("");
       		}
       		else{
				$this->setHeadTitle("Login");
				$this->participant = new Participant();
			}
       	}

       	public function executeLogin(){			
			$this->participant = new Participant();
			$email = $this->params["participant"]["email"];
			$password = $this->params["participant"]["password"];

			if ($this->participant->login($email, $password)){
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
       		Participant::logout();
       		$this->redirectTo("conta/login");
       	}

       	/*
       	* Cadastro do Participante
       	*/
       	public function prepareNew($saveError = false){
       		$this->setHeadTitle("Cadastro de Participante");
       		$this->actionForm = $this->getUri("conta/nova");
       		$this->titleBtnSubmit = "Cadastrar";

       		if ($saveError){
				$this->participant = new Participant($this->params["participant"]);
				$this->render("_new");
			}
			else{
				$this->participant = new Participant();	
			}
       	}

		public function _new(){
			$this->prepareNew();
		}

		public function create(){
			$this->checkCity();
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

				$this->prepareNew(true);
			}
		}

		public function edit(){
			$this->participant = Participant::findById($_SESSION["participant"]->getIdParticipant())[0];
   			$this->setHeadTitle("Editar Cadastro de Participante");
   			$this->actionForm = $this->getUri("conta/{$this->participant->getIdParticipant()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			$this->participant = Participant::findById($this->params[":id"]);
			if ($this->participant->update($_SESSION["participant"]->getIdParticipant())){
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

		/*
		* função auxiliar para criar o cadastro do participante:
		* Cria cadastro de cidade de estado caso os mesmos não sejam
		* encontrados no banco de dados
		*/
		private function checkCity(){
			$state = new State($this->params["state"]);	
					
			if ($state = $state->save()){
				$this->params["city"]["id_state"] = $state[0]->getIdState();
				$city = new City($this->params["city"]);

				if ($city = $city->save()){	
					$this->params["participant"]["id_city"] = $city[0]->getIdCity();
				}
			}
		}

		public function dashboard(){
       		if (!isset($_SESSION["participant"])){
       			$this->redirectTo("conta/login");
       		}
			$this->setHeadTitle("Painel do usuário");
		}
	} 
?>