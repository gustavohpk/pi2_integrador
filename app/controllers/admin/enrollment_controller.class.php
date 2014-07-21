<?php 
	namespace Admin;
	
	class EnrollmentController extends BaseAdminController{
      protected $enrollments;
      protected $pagination;

		public function _list() {
   		$this->setHeadTitle("Lista de Inscrições");
         
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }

         \Enrollment::setCurrentPage($page);
         $this->enrollments = \Enrollment::all();
         $this->pagination = new \Pager(count($this->enrollments), \Enrollment::getLimitByPage(), $page);   
		}

      public function remove() {
         if ($this->enrollments = \Enrollment::findById($this->params[":id"])) {
            if ($this->enrollments[0]->remove()) {
               \FlashMessage::successMessage("Inscrição removida com sucesso");
            }
            else {
               \FlashMessage::errorMessage("Problemas ao tentar remover a incrição.");
            }
         }
         else {
            \FlashMessage::errorMessage("A inscrição informada para remover não foi localizada.");
         }
         $this->redirectTo("admin/inscricoes/lista");
      }

		public function _new(){
			$this->setHeadTitle("Criar inscrição");
		}

		public function _edit(){
			$this->setHeadTitle("Modificar inscrição");
		}
	} 
?>