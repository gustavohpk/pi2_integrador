<?php 
	class EnrollmentController extends BaseParticipantController {   
      protected $enrollment;
      protected $events;
      protected $paymentsType;   

      public function __construct() {
         parent::__construct();
         $this->setLoginRequired(true);
      }

      public function _new() {
         if ($this->events = Events::findById($this->params[":id"])) {
            if ($this->events[0]->getEndDate() < date("Y-m-d H:i:s")) {
               flashMessage::errorMessage($this->events[0]->getName() . " - ENCERRADO.");
               $this->redirectTo("eventos/proximos");
            }
            if ($this->events[0]->getStartDateEnrollment() > date("Y-m-d H:i:s") ||
                  $this->events[0]->getEndDateEnrollment() < date("Y-m-d H:i:s")) {
               flashMessage::errorMessage($this->events[0]->getName() . " - Fora do prazo de inscrição.");
               $this->redirectTo("eventos/proximos");
            }
         }
         else {
            flashMessage::errorMessage("Evento não encontrado.");
            $this->redirectTo("eventos/proximos");
         }

         $this->paymentsType = PaymentType::all();
      }

      public function save() {
         $params = $this->params["enrollment"];
         foreach ($params["id_event"] as $id_event) {
            $cost = CostEvent::findByIdEvent($id_event);
            $cost = ($cost ? $cost[0]->getCostOfDay() : 0);
            $data = array(
                  "id_participant" => $this->currentParticipant->getIdParticipant(),
                  "id_event" => $id_event,
                  "id_payment_type" => $params["id_payment_type"],
                  "cost" => $cost
               );
            $this->enrollment = new Enrollment($data);

            if ($this->enrollment->save()) {
               $this->enrollment->setMessageSuccess("#{$this->enrollment->getIdEnrollment()} - {$this->enrollment->event->getName()}");
            }
            else {
               $errors = $this->enrollment->getErrors();
               foreach ($errors as $error) {
                  $this->enrollment->setMessageError("{$this->enrollment->event->getName()} - $error");
               }
            }
         }

         $this->redirectTo("inscricao/confirmacao");
      }

      public function confirmation() {
         $this->setHeadTitle("Confirmação");
         $this->enrollment = new Enrollment();
      }
	} 
?>