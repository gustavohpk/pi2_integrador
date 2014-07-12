<?php 
	class EnrollmentController extends BaseParticipantController {   
      protected $enrollment;
      protected $events;
      protected $eventsRelated;
      protected $paymentsType;   
      protected $uriBack;

      public function __construct() {
         parent::__construct();
         $this->setLoginRequired(true);
         $this->uriBack = $this->back();
      }

      public function _new() {
         if (!$this->events = Events::findById($this->params[":id"])) {
            flashMessage::errorMessage("Evento não encontrado.");
            $this->redirectTo($this->back());
         }
         else {
            $this->events = $this->events[0];
            if ($this->events->eventFinalized()) {
               flashMessage::errorMessage($this->events->getName() . " - ENCERRADO.");
               $this->redirectTo($this->back());
            }
            if (!$this->events->canEnrollment()) {
               flashMessage::errorMessage($this->events->getName() . " - Fora do prazo de inscrição.");
               $this->redirectTo($this->back());
            }
         }
  

         $this->eventsRelated = $this->events->getEventsRelated();
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