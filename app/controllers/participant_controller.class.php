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
				FlashMessage::infoMessage("Login efetuado.");
				if($this->retrieveUrl()){
					$url = $this->retrieveUrl();
					$this->unsetUrl();
					$this->redirectTo($url);
				}
				else{
					$this->redirectTo("conta/painel");
				}
			}
			else{
				FlashMessage::errorMessage("Não foi possível realizar o cadastro:");
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
       		FlashMessage::infoMessage("Logout efetuado.");
       		$this->redirectTo("");
       	}

       	/*
       	* Cadastro do Participante
       	*/
       	public function prepareNew($saveError = false){
       		$this->setHeadTitle("Cadastro de Participante");
       		$this->actionForm = $this->getUri("conta/nova");
       		$this->participantTypes = ParticipantType::all();
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
				Message::registrationMail($this->participant);
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

		public function _edit(){
			$this->participant = Participant::findById($_SESSION["participant"]->getIdParticipant());
   			$this->setHeadTitle("Alterar Dados");
   			$this->actionForm = $this->getUri("conta/{$this->participant->getIdParticipant()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function _editpassword(){
			$this->participant = Participant::findById($_SESSION["participant"]->getIdParticipant());
   			$this->setHeadTitle("Alterar Senha");
   			$this->actionForm = $this->getUri("conta/{$this->participant->getIdParticipant()}/senha");
   			$this->titleBtnSubmit = "Alterar";
		}

		public function update(){
			$this->checkCity();

			// Verifica se a ID enviada pelo formulário é a mesma ID do participante logado
			if ($this->params[":id"] == $_SESSION["participant"]->getIdParticipant() && $this->participant = Participant::findById($this->params[":id"])) {
				if ($this->participant->update($this->params["participant"])) {
					FlashMessage::successMessage("Dados alterados com sucesso.");
					$this->redirectTo("conta/painel");
				}
				else{
					$errors = $this->participant->getErrors();
					foreach ($errors as $error){
						FlashMessage::errorMessage($error);
					}
					$this->setHeadTitle("Alterar Dados");
		         	$this->actionForm = $this->getUri("conta/{$this->participant->getIdParticipant()}/alterar");
		         	$this->titleBtnSubmit = "Salvar";
		         	$this->render("edit");
				}
			}else{
				FlashMessage::errorMessage("Não foi possível alterar os dados.");
				$this->redirectTo("conta/painel");
			}
		}

		public function updatePassword(){

			// Verifica se a ID enviada pelo formulário é a mesma ID do participante logado
			if ($this->params[":id"] == $_SESSION["participant"]->getIdParticipant() && $this->participant = Participant::findById($this->params[":id"])) {
				if ($this->participant->updatePassword($this->params)) {
					FlashMessage::successMessage("Senha Alterada com sucesso.");
					$this->redirectTo("conta/painel");
				}
				else{
					FlashMessage::errorMessage("Não foi possível alterar a senha.");
					$this->setHeadTitle("Alterar Senha");
		         	$this->actionForm = $this->getUri("conta/{$this->participant->getIdParticipant()}/senha");
		         	$this->titleBtnSubmit = "Salvar";
		         	$this->render("editpassword");
				}
			}else{
				FlashMessage::errorMessage("Não foi possível alterar a senha.");
				$this->redirectTo("conta/painel");
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
		public function enrollments(){
       		if (!isset($_SESSION["participant"])){
       			$this->redirectTo("conta/login");
       		}
			$this->setHeadTitle("Lista de inscrições");
		}
	} 
?>