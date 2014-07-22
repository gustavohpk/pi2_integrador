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

      public function _list() {
         $this->enrollment = Enrollment::findByIdParticipant($this->currentParticipant->getIdParticipant());
      }

      public function show() {
         $this->enrollment = Enrollment::findById($this->params[":id"])[0];
      }

      public function _new() {
         if (!$this->events = Events::findById($this->params[":id"])) {
            flashMessage::errorMessage("Evento não encontrado.");
            $this->redirectTo($this->back());
         }
         elseif ($this->events[0]->eventType->getEventType() == "sem_inscricao") {
            flashMessage::warningMessage("Para participar deste evento não precisa se increver.");
            $this->returnToLastPage();
         }
         else {
            $this->events = $this->events[0];
            if ($this->events->eventFinalized()) {
               flashMessage::errorMessage($this->events->getName() . " - ENCERRADO.");
               $this->returnToLastPage();
            }
            if (!$this->events->canEnrollment()) {
               flashMessage::errorMessage($this->events->getName() . " - Fora do prazo de inscrição.");
               $this->returnToLastPage();
            }
         }
  

         $this->eventsRelated = $this->events->getEventsRelated();
         $this->paymentsType = PaymentType::all();
      }

      public function save() {
         $participant = $this->currentParticipant;
         $params = $this->params["enrollment"];
         foreach ($params["id_event"] as $id_event) {
            $this->events = Events::findById($id_event)[0]; 
            $cost = ($this->events->cost ? $this->events->cost[0]->getCostOfDay() : 0);            
            $data = array(
                  "id_participant" => $participant->getIdParticipant(),
                  "id_event" => $this->events->getIdEvent(),
                  "id_payment_type" => $params["id_payment_type"],
                  "cost" => $cost
               );
            $this->enrollment = new Enrollment($data);
            if ($this->enrollment->save()) {
               if ($this->events->eventType->getEventType() == "sem_pagamento") {
                  $this->enrollment->setMessageSuccess("#{$this->enrollment->getIdEnrollment()} - {$this->enrollment->event->getName()}");
               }
               else {
                  $url = $this->enrollment->executePayment($data);
                  $this->enrollment->setMessageSuccess("
                        #{$this->enrollment->getIdEnrollment()} - {$this->enrollment->event->getName()}
                        <a href='{$url}' target='_blank'>Clique aqui</a> para fazer o pagamento"
                     );
               }
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