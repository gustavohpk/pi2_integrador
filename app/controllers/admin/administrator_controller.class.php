<?php 
	namespace Admin;
	
	class AdministratorController extends BaseAdminController{
      protected $administrators;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Usuários");
         $this->administrators = Administrator::all();
		}

		public function _new(){
			$this->setHeadTitle("Criar usuário");
         $this->administrators = new Administrator();
		}

		public function _edit(){
			$this->setHeadTitle("Modificar usuário");
         if ($this->administrators = Administrator::findById($this->params[":id"])) {
            $this->administrators = $this->administrator[0];
         }
		}
	} 
?>