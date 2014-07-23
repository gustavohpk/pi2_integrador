<?php 
	class ContactsController extends BaseController{
		public function index() {
      		$this->setHeadTitle("Contato");
        	$this->actionForm = $this->getUri("contato");
        	$this->titleBtnSubmit = "Enviar mensagem";
   		}

   		public function sendMessage(){
   			$to = Settings::getContactEmail()->getValue();
   			var_dump($to); exit;
   			$name = $this->params["name"];
   			$subject = "Contato UTFPR Eventos: Mensagem Enviada por $name";
			$message = $this->params["message"];
			$headers = 'From : ' . $this->params["email"];
			if (mail($to, $subject, $message, $headers)){
            	FlashMessage::successMessage("Sua mensagem foi enviada com sucesso. Em breve será respondida.");
			}else{
				FlashMessage::errorMessage("A mensagem não pôde ser enviada. Tente novamente mais tarde.");
			}
			$this->redirectTo();
   		}
	} 
?>