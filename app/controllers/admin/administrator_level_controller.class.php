<?php 
	namespace Admin;
	
	class AdministratorLevelController extends BaseAdminController{
      protected $administrators;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Usuários");
         $this->administrators = AdministratorLevel::all();
		}

		public function _new(){
			$this->setHeadTitle("Criar nível de administrador");
         $this->actionForm = $this->getUri("admin/niveis/novo");
         $this->administrators = new AdministratorLevel();
		}

      public function save() {
         $this->administrators = new AdministratorLevel($this->params["admin_level"]);
         if ($this->administrators->save()) {
            \FlashMessage::successMessage("Cadastro de nível de administrador realizado com sucesso.");
            $this->redirectTo("admin/niveis/lista");
         }
         else {
            $errors = $this->administratorLevels->getErrors();
            foreach ($errors as $error) {
               \FlashMessage::errorMessage($error);
            }
            $this->setHeadTitle("Criar nível de administrador");
            $this->render("_new");
         }
      }

		public function edit(){
			$this->setHeadTitle("Modificar nível de administrador");
         $this->actionForm = $this->getUri("admin/niveis/{$this->params[":id"]}/alterar");
         if ($this->administratorLevels = AdministratorLevel::findById($this->params[":id"])) {
            $this->administratorLevels = $this->administratorLevels[0];
         }
		}

      public function update() {
         $this->administrators = Administrator::findById($this->params[":id"])[0];
         if ($this->administrators->update($this->params["admin"])) {
            \flashMessage::successMessage("Nível de administrador alterado com sucesso.");
            $this->redirectTo("admin/niveis/lista");
         }
         else {
            $errors = $this->administratorLevels->getErrors();
            foreach ($errors as $error) {
               \flashMessage::errorMessage($error);
            }
            $this->setHeadTitle("Modificar nível de administrador");
            $this->actionForm = $this->getUri("admin/niveis/{$this->params[":id"]}/alterar");
            $this->render("edit");
         }
      }

      public function remove() {
         if ($this->administrators = AdministratorLevel::findById($this->params[":id"])) {
            if ($this->administratorLevels[0]->remove()) {
               \flashMessage::successMessage("Nível de administrador removido com sucesso.");
               $this->redirectTo("admin/niveis/lista");
            }
            else {
               \flashMessage::errorMessage("Erro ao tentar remover nível de administrador.");
               $this->redirectTo("admin/niveis/lista");               
            }
         }
         else {
            \flashMessage::errorMessage("O nível de administrador que você está tentando remover não existe.");
            $this->redirectTo("admin/niveis/lista");  
         }
      }
	} 
?>