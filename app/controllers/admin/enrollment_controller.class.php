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

		public function show(){
			$this->setHeadTitle("Visualizar Inscrição");
         if ($this->enrollments = \Enrollment::findById($this->params[":id"])) {
            $this->enrollments = $this->enrollments[0];
         }
         else {
            \FlashMessage::errorMessage("A inscrição que você está tentando visualizar não foi localizada.");
            $this->redirectTo("admin/inscricoes/lista");
         }
		}

      public function payment() {
         if ($this->enrollments = \Enrollment::findById($this->params[":id"])) {
            if ($this->enrollments[0]->setPayment()) {
               \FlashMessage::successMessage("Inscrição definada como pago.");
            }
            else {
               \FlashMessage::errorMessage("Problemas ao tentar definir pagamento da incrição.");
            }
         }
         else {
            \FlashMessage::errorMessage("A inscrição informada para definir pagamento não foi localizada.");
         }
         $this->redirectTo("admin/inscricoes/lista");
      }

      public function cancelPayment() {
         if ($this->enrollments = \Enrollment::findById($this->params[":id"])) {
            if ($this->enrollments[0]->cancelPayment()) {
               \FlashMessage::successMessage("O pagamento da inscrição foi cancelado.");
            }
            else {
               \FlashMessage::errorMessage("Problemas ao tentar cancelar o pagamento da incrição.");
            }
         }
         else {
            \FlashMessage::errorMessage("A inscrição informada para cancelar o pagamento não foi localizada.");
         }
         $this->redirectTo("admin/inscricoes/lista");
      }
	} 
?>