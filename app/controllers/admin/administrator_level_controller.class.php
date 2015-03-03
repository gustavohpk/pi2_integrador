<?php 
	namespace Admin;
	
	class AdministratorLevelController extends BaseAdminController{
      protected $administrators;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Usuários");
         $this->administratorLevels = AdministratorLevel::all();
		}

		public function _new(){
			$this->setHeadTitle("Novo nível de administrador");
         $this->actionForm = $this->getUri("admin/niveis/novo");
         $this->administratorLevel = new AdministratorLevel();
		}

      public function create() {
         $this->administratorLevel = new AdministratorLevel($this->params["admin_level"]);
         if ($this->administratorLevel->save()) {
            \FlashMessage::successMessage("Cadastro de nível de administrador realizado com sucesso.");
            $this->redirectTo("admin/niveis/lista");
         }
         else {
            \FlashMessage::errorMessage("Erro ao cadastrar nível de administrador.");
            $this->setHeadTitle("Novo nível de administrador");
            $this->actionForm = $this->getUri("admin/niveis/novo");
            $this->titleBtnSubmit = "Cadastrar";
            $this->render("_new");
         }
      }

		public function edit(){
			$this->setHeadTitle("Modificar nível de administrador");
         $this->actionForm = $this->getUri("admin/niveis/{$this->params[":id"]}/alterar");
         if ($this->administratorLevel = AdministratorLevel::findById($this->params[":id"])) {
            $this->administratorLevel = $this->administratorLevel[0];
         }
		}

      public function update() {
         $this->administratorLevel = AdministratorLevel::findById($this->params[":id"])[0];
         if ($this->administratorLevel->update($this->params["admin_level"])) {
            \flashMessage::successMessage("Nível de administrador alterado com sucesso.");
            $this->redirectTo("admin/niveis/lista");
         }
         else {
            $errors = $this->administratorLevel->getErrors();
            foreach ($errors as $error) {
               \flashMessage::errorMessage($error);
            }
            $this->setHeadTitle("Modificar nível de administrador");
            $this->actionForm = $this->getUri("admin/niveis/{$this->params[":id"]}/alterar");
            $this->render("edit");
         }
      }

      public function remove() {
         if ($this->administratorLevel = AdministratorLevel::findById($this->params[":id"])) {
            if ($this->administratorLevel[0]->remove()) {
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