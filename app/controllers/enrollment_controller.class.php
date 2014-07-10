<?php 
	class EnrollmentController extends BaseParticipantController {   
      public function __construct() {
         $this->setLoginRequired(true);
      }

		public function add() {
   		$cart = new Cart();
         if ($cart->add($this->params[":id"])) {
            FlashMessage::successMessage(
                  "O evento foi adicionado na lista de inscrição com sucesso.<br>
                  Total a Pagar: <strong> R$ {$cart->getSum()} </strong><br>
                  <a href={$this->getUri('inscricao/finalizar')} class='btn btn-default btn-larg'>
                     <span class='glyphicon glyphicon-log-in'></span> Finalizar Inscrição
                  </a>"
               );
         }
         else {
            $errors = $cart->getErrors();
            foreach ($errors as $error) {
               FlashMessage::errorMessage($error);
            }
         }
         $this->redirectTo("eventos/proximos");
		}

      public function close() {
         $cart = new Cart();
         $items = $cart->getItems();

         foreach ($items as $item) {
            $item["id_participant"] = $this->currentParticipant->getIdParticipant();
            $enrollment = new Enrollment($item);
            if ($enrollment->save()) {
               FlashMessage::successMessage(
                     "Cód. Inscrição: {$enrollment->getIdEnrollment()}<br>
                     {$enrollment->event->getName()}<br> OK."
                  );
            }
            else {
               $errors = $enrollment->getErrors();
               $msg = "";
               foreach ($errors as $error) {
                  $msg .= "$error<br>";
               }
               FlashMessage::errorMessage("Erro ao tentar realizar a inscrição no evento: {$enrollment->event->getName()}<br>$msg");
            }
         }

         $cart->close();
         $this->redirectTo("eventos/proximos");
      }
	} 
?>