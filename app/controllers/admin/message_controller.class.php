<?php 
	namespace Admin;
	
	class MessageController extends BaseAdminController{
      protected $message;
      protected $actionForm;

		public function _list() {
         $this->setHeadTitle("Lista de Notícias");
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         \Message::setCurrentPage($page);

         if (isset($this->params[":id"])){
            $this->messages = \Message::findById($this->params[":id"]);
            $this->pagination = new \Pager(count($this->message), \Message::getLimitByPage(), $page);
         }
         else{
            $this->messages = \Message::find();
            $this->pagination = new \Pager(\Message::count(), \Message::getLimitByPage(), $page);
         }
      }

		public function _new(){
   		$this->setHeadTitle("Enviar mensagem");
		}

		public function _edit(){
		$this->setHeadTitle("Modificar notícia");
      $this->message = \Message::findById($this->params[":id"])[0];
        $this->actionForm = $this->getUri("admin/noticias/{$this->message->getIdMessage()}");
        $this->titleBtnSubmit = "Salvar";
		}

      public function create(){
         $params = $this->params["message"];
         $this->message = new \Message($params);
         if ($this->message->save()){
            \Logger::creationLog($_SESSION["admin"]->getName(), "Notícias", $this->message->getIdMessage());
            \FlashMessage::successMessage("Notícia cadastrada com sucesso.");
            $this->redirectTo("admin/noticias/lista");
         }
         else{
            \FlashMessage::errorMessage("Erro ao cadastrar a notícia.");
            $this->setHeadTitle("Cadastro de notícia");           
            $this->actionForm = $this->getUri("admin/noticias");
            $this->titleBtnSubmit = "Cadastrar";
            $this->render("_new");
         }
      }

      public function update(){ 
         $this->message = \Message::findById($this->params[":id"])[0];
         if ($this->message->update($this->params['message'])){
            \Logger::updateLog($_SESSION["admin"]->getName(), "Notícias", $this->message->getIdMessage());
            \FlashMessage::successMessage("Notícia alterada com sucesso.");
            $this->redirectTo("admin/noticias/lista");
         }
         else{
            \FlashMessage::errorMessage("Erro ao alterar a notícia.");
            $this->setHeadTitle("Editar Notícia");
            $this->actionForm = $this->getUri("admin/noticias/{$this->message->getIdMessage()}");
            $this->titleBtnSubmit = "Salvar";
            $this->render("edit");
         }
      }

      public function remove(){
         $this->message = \Message::findById($this->params[":id"])[0];
         if ($this->message->remove()){
            \Logger::deletionLog($_SESSION["admin"]->getName(), "Notícias", $this->message->getIdMessage());
            \FlashMessage::successMessage("Notícia excluída com sucesso.");
         }
         else {
            \FlashMessage::errorMessage("Não foi possível excluír a notícia.");
         }
         $this->redirectTo("admin/noticias/lista");
      }
	} 
?>