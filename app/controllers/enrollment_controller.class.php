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
         $this->setHeadTitle("Minhas Inscrições");
         $this->enrollment = Enrollment::findByIdParticipant($this->currentParticipant->getIdParticipant());
      }

      public function show() {
         $this->setHeadTitle("Ver Inscrição");
         $this->enrollment = Enrollment::findById($this->params[":id"])[0];
      }

      public function _new() {
         $this->setHeadTitle("Nova Inscrição");

         if (!$this->paymentsType = PaymentType::all()) {
            flashMessage::errorMessage("Nenhuma forma de pagamento foi localizada.");
            $this->redirectTo("eventos/proximos");            
         }
         elseif (!$this->events = Event::findById($this->params[":id"])) {
            flashMessage::errorMessage("Evento não encontrado.");
            $this->redirectTo("eventos/proximos");
         }
         elseif ($this->events[0]->eventType->getCode() == "sem_inscricao") {
            flashMessage::warningMessage("Para participar deste evento não precisa se increver.");
            $this->redirectTo("eventos/proximos");
         }
         else {
            $this->events = $this->events[0];
            if ($this->events->eventFinalized()) {
               flashMessage::errorMessage($this->events->getName() . " - ENCERRADO.");
               $this->redirectTo("eventos/proximos");
            }
            if (!$this->events->canEnrollment()) {
               flashMessage::errorMessage($this->events->getName() . " - Fora do prazo de inscrição.");
               $this->redirectTo("eventos/proximos");
            }
         }
  

         $this->eventsRelated = $this->events->getEventsRelated();
         $this->paymentsType = PaymentType::all();
      }

      public function save() {
         $participant = $this->currentParticipant;
         $params = $this->params["enrollment"];
         foreach ($params["id_event"] as $id_event) {
            $this->events = Event::findById($id_event)[0]; 
            $cost = ($this->events->cost ? $this->events->cost[0]->getCostOfDay() : 0);            
            $data = array(
                  "id_participant" => $participant->getIdParticipant(),
                  "id_event" => $this->events->getIdEvent(),
                  "id_payment_type" => $params["id_payment_type"],
                  "cost" => $cost
               );
            $this->enrollment = new Enrollment($data);
            if ($this->enrollment->save()) {
               if ($this->events->eventType->getCode() == "sem_pagamento") {
                  $this->enrollment->setMessageSuccess("#{$this->enrollment->getIdEnrollment()} - {$this->enrollment->event->getName()} - Gratuíto");
               }
               else {
                  $url = $this->enrollment->executePayment($data);
                  $this->enrollment->setMessageSuccess("
                        #{$this->enrollment->getIdEnrollment()} - {$this->enrollment->event->getName()} - 
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

      public function updateRating(){
         if(isset($_SESSION["participant"])){
            $this->enrollment = Enrollment::find(array("id_participant", "id_event"), array($_SESSION["participant"]->getIdParticipant(), $this->params[":id"]))[0];
            echo $this->enrollment->updateRating($this->params[":r"]);
         }else{
            echo 0;
         }
         exit;
      }
	} 
?>