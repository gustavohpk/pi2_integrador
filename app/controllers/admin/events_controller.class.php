<?php 
	namespace Admin;
	
	class EventsController extends BaseAdminController{
		protected $events;
      protected $eventsType;
      protected $eventBonus;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Eventos");
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         \Event::setCurrentPage($page);

         if (isset($this->params[":id"])){
            $this->events = \Event::findById($this->params[":id"]);
            $this->pagination = new \Pager(count($this->events), \Event::getLimitByPage(), $page);
         }
         else{
            $this->events = \Event::find();
            $this->pagination = new \Pager(\Event::count(), \Event::getLimitByPage(), $page);
         }
		}

      public function selectionList() {
         $this->layout = "admin/layout/layout_empty.phtml";
         $this->setHeadTitle("Seleção de Eventos");
         $this->inputName = "event[id_parent_event]";
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         \Event::setLimitByPage(5);
         \Event::setCurrentPage($page);

         if (isset($this->params[":id"])){
            $this->events = \Event::findById($this->params[":id"]);
            $this->pagination = new \Pager(count($this->events), \Event::getLimitByPage(), $page);
         }
         else{
            $this->events = \Event::find();
            $this->pagination = new \Pager(\Event::count(), \Event::getLimitByPage(), $page);
         }
      }

		public function _new(){
         //prepara formulario para inserção de novo evento
			$this->setHeadTitle("Novo Evento");
         $this->eventsType = \EventType::all();
         $this->sponsors = \Sponsors::all();
			$this->events = new \Event();
         $this->eventBonus = \EventBonus::findByIdEvent($this->events->getIdEvent());
         $this->actionForm = $this->getUri("admin/eventos");
         $this->titleBtnSubmit = "Cadastrar";
		}

      public function create(){
         $params = $this->params["event"];
         if(isset($this->params["cost"]))
            $cost = $this->params["cost"];
         if(isset($this->params["event_bonus"]))
            $eventBonus = $this->params["event_bonus"];

         $this->events = new \Event($params);
         if ($this->events->save()){
            \Logger::creationLog($_SESSION["admin"]->getName(), "Eventos", $this->events->getIdEvent());
            \FlashMessage::successMessage("Evento cadastrado com sucesso.");
            if($cost){
               if (!$this->events->setCost($cost)) {
                  $errors = $this->events->cost[0]->getErrors();
                  foreach ($errors as $error) {
                     \FlashMessage::errorMessage($error);
                  }
               }
            }
            if(isset($sponsors)){
               if (!$this->events->setSponsorship($sponsors)) {
                  // $errors = $this->events->sponsors[0]->getErrors();
                  // foreach ($errors as $error) {
                  //    \FlashMessage::errorMessage($error);
                  // }
               }
            }
            if($eventBonus){
               if (!$this->events->setEventBonus($eventBonus)) {
                  // $errors = $this->events->eventBonus[0]->getErrors();
                  foreach ($errors as $error) {
                     \FlashMessage::errorMessage($error);
                  }
               }
            }
            $this->redirectTo("admin/eventos/lista");
         }
         else{
            $errors = $this->events->getErrors();
            foreach ($errors as $error) {
               \FlashMessage::errorMessage($error);
            }
            
            $this->setHeadTitle("Novo Evento");
            $this->eventsType = \EventType::all();
            $this->actionForm = $this->getUri("admin/eventos");
            $this->titleBtnSubmit = "Cadastrar";
            $this->render("_new");
         }
      }

		public function _edit(){
			$this->setHeadTitle("Editar Evento");
         $this->eventsType = \EventType::all();
         $this->sponsors = \Sponsors::all();
			$this->events = \Event::findById($this->params[":id"])[0];
         $this->eventBonus = \EventBonus::findByIdEvent($this->events->getIdEvent());
         $this->actionForm = $this->getUri("admin/eventos/{$this->events->getIdEvent()}");
         $this->titleBtnSubmit = "Salvar";
		}

      public function update(){
         $this->events = \Event::findById($this->params[":id"])[0];
         if(isset($this->params["cost"]))
            $cost = $this->params["cost"];
         if(isset($this->params["sponsors"]))
            $sponsors = $this->params["sponsors"];
         if(isset($this->params["event_bonus"]))
            $eventBonus = $this->params["event_bonus"];
         if ($this->events->update($this->params['event'])){
            \Logger::updateLog($_SESSION["admin"]->getName(), "Eventos", $this->events->getIdEvent());
            \FlashMessage::successMessage("Evento modificado com sucesso.");
            if(isset($cost)){
               if (!$this->events->setCost($cost)) {
                  $errors = $this->events->cost[0]->getErrors();
                  foreach ($errors as $error) {
                     \FlashMessage::errorMessage($error);
                  }
               }
            }
            if(isset($sponsors)){
               if (!$this->events->setSponsorship($sponsors)) {
                  // $errors = $this->events->sponsors[0]->getErrors();
                  // foreach ($errors as $error) {
                  //    \FlashMessage::errorMessage($error);
                  // }
               }
            }
            if($eventBonus){
               if (!$this->events->setEventBonus($eventBonus)) {
                  // $errors = $this->events->eventBonus[0]->getErrors();
                  // foreach ($errors as $error) {
                  //    \FlashMessage::errorMessage($error);
                  // }
               }
            }
            $this->redirectTo("admin/eventos/lista");
         }
         else{
            $errors = $this->events->getErrors();
            foreach ($errors as $error) {
               \FlashMessage::errorMessage($error);
            }

            $this->setHeadTitle("Editar Evento");
            $this->eventsType = \EventType::all();
            $this->paymentsType = \PaymentType::all();
            $this->actionForm = $this->getUri("admin/eventos/{$this->events->getIdEvent()}");
            $this->titleBtnSubmit = "Salvar";
            $this->render("edit");
         }
      }

		public function remove(){
         $this->events = \Event::findById($this->params[":id"])[0];
         $this->events->remove();
         \Logger::deletionLog($_SESSION["admin"]->getName(), "Eventos", $this->events->getIdEvent());
         \FlashMessage::successMessage("Evento removido com sucesso.");
         $this->redirectTo("admin/eventos/lista");
		}

      public function checkAttendance() {
         $idEvent = $this->params[":id"];
         $this->event = \Event::findById($this->params[":id"])[0];
         if(strtotime($this->event->getStartDate("d-m-Y H:i")) < strtotime(date("d-m-Y H:i")) && !$this->event->getNoEnrollment()){
            $this->enrollments = \Enrollment::find(array("id_event"), array($idEvent))[0];
            $this->enrollments->checkAttendance($this->params["enrollment"]);
            \FlashMessage::successMessage("A lista de presença foi atualizada.");
            $this->redirectTo("admin/eventos/lista");
         }else{
            $this->enrollments = \Enrollment::find(array("id_event"), array($this->params[":id"]));
            \FlashMessage::warningMessage("Não é possível alterar a lista de presença.");
            $this->setHeadTitle("Registrar Presença");
            $this->actionForm = $this->getUri("admin/eventos/{$this->event->getIdEvent()}/presenca");
            $this->titleBtnSubmit = "Salvar";
            $this->render("attendance");
         }
      }

      public function attendance() {
         $this->setHeadTitle("Registrar presença");
         $this->event = \Event::findById($this->params[":id"])[0];
         $this->enrollments = \Enrollment::find(array("id_event"), array($this->params[":id"]));
         //$this->attendanceList = \Enrollment::attendanceList($this->params[":id"]);
         //var_dump($this->enrollments); exit;
         $this->actionForm = $this->getUri("admin/eventos/{$this->event->getIdEvent()}/presenca");
         $this->titleBtnSubmit = "Salvar";
      }

      public function stats(){
         $this->setHeadTitle("Estatísticas do evento");
         $this->event = \Event::findById($this->params[":id"])[0];
         $this->enrollmentsCount = count(\Enrollment::find(array("id_event"), array($this->event->getIdEvent())));
         $this->confirmedEnrollmentsCount = count(\Enrollment::find(array("id_event", "id_enrollment_status"), array($this->event->getIdEvent(), \EnrollmentStatus::find(array("code"), array("confirmed"))[0]->getIdEnrollmentStatus()), "="));
         $this->pendingEnrollmentsCount = count(\Enrollment::find(array("id_event", "id_enrollment_status"), array($this->event->getIdEvent(), \EnrollmentStatus::find(array("code"), array("pending"))[0]->getIdEnrollmentStatus()), "="));
         $this->cancelledEnrollmentsCount = count(\Enrollment::find(array("id_event", "id_enrollment_status"), array($this->event->getIdEvent(), \EnrollmentStatus::find(array("code"), array("cancelled"))[0]->getIdEnrollmentStatus()), "="));
         $this->suspendedEnrollmentsCount = count(\Enrollment::find(array("id_event", "id_enrollment_status"), array($this->event->getIdEvent(), \EnrollmentStatus::find(array("code"), array("suspended"))[0]->getIdEnrollmentStatus()), "="));


         $this->validEnrollmentsCount = $this->enrollmentsCount - $this->cancelledEnrollmentsCount;
      }

        public function sponsorship() {
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                $this->setHeadTitle("Organizar Colaboradores");
                $this->titleBtnSubmit = "Salvar";
                $this->actionForm = $this->getUri("admin/eventos/{$this->event->getIdEvent()}/colaboracao");
                $this->sponsors = \Sponsors::all();
                // var_dump($this->event->sponsorship[0]->getIdEvent()); exit;
            }else{
                \FlashMessage::errorMessage("O evento não foi encontrado.");
                $this->redirectTo("admin/eventos/lista");
            }
        }

         public function prices() {
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                if($this->event->getFree()){
                    \FlashMessage::warningMessage("Este é um evento gratuito, portanto não é necessário definir preços.");
                    $this->redirectTo("admin/eventos/lista");
                }
                $this->setHeadTitle("Preços Personalizados");
                $this->titleBtnSubmit = "Salvar";
                $this->actionForm = $this->getUri("admin/eventos/{$this->event->getIdEvent()}/precos");
            }else{
                \FlashMessage::errorMessage("O evento não foi encontrado.");
                $this->redirectTo("admin/eventos/lista");
            }
        }

        public function bonus() {
          $this->event = \Event::findById($this->params[":id"])[0];
          if($this->event){
              $this->setHeadTitle("Bônus de Evento");
              $this->titleBtnSubmit = "Salvar";
              $this->actionForm = $this->getUri("admin/eventos/{$this->event->getIdEvent()}/bonus");
              $this->eventTypes = \EventType::all();
          }else{
              \FlashMessage::errorMessage("O evento não foi encontrado.");
              $this->redirectTo("admin/eventos/lista");
          }
        }

        public function updateBonus() {
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                $this->event->setBonus($this->params["event_bonus"]);
                if(\EventBonus::saveMultiple($this->event->eventBonus, $this->event->getIdEvent())){
                    \FlashMessage::successMessage("Preços alterados com sucesso.");
                    $this->redirectTo("admin/eventos/lista");
                }else{
                    \FlashMessage::errorMessage("Não foi possível atualizar os preços.");
                    $this->redirectTo("admin/eventos/{$this->params[':id']}/precos");
                }
            }else{
                \FlashMessage::errorMessage("O evento não foi encontrado.");
                $this->redirectTo("admin/eventos/lista");
            }
        }

        public function updateSponsorship() {
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                $this->event->setSponsorship($this->params["sponsorship"]);
                if(\Sponsorship::saveMultiple($this->event->sponsorship, $this->event->getIdEvent())){
                    \FlashMessage::successMessage("Colaboradores alterados com sucesso.");
                    $this->redirectTo("admin/eventos/lista");
                }else{
                    \FlashMessage::errorMessage("Não foi possível atualizar os colaboradores.");
                    $this->redirectTo("admin/eventos/{$this->params[':id']}/colaboracao");
                }
            }else{
                \FlashMessage::errorMessage("O evento não foi encontrado.");
                $this->redirectTo("admin/eventos/lista");
            }
        }

        public function updatePrices() {
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                $this->event->setCost($this->params["cost"]);
                if(\CostEvent::saveMultiple($this->event->cost, $this->event->getIdEvent())){
                    \FlashMessage::successMessage("Preços alterados com sucesso.");
                    $this->redirectTo("admin/eventos/lista");
                }else{
                    \FlashMessage::errorMessage("Não foi possível atualizar os preços.");
                    $this->redirectTo("admin/eventos/{$this->params[':id']}/precos");
                }
            }else{
                \FlashMessage::errorMessage("O evento não foi encontrado.");
                $this->redirectTo("admin/eventos/lista");
            }
        }
	} 
?>