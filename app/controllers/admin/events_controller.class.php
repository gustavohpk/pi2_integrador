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
        	$this->setHeadTitle("Novo Evento");
            $this->eventsType = \EventType::all();
        	$this->events = new \Event();
            $this->actionForm = $this->getUri("admin/eventos");
            $this->titleBtnSubmit = "Cadastrar";
		}

        public function create(){
            $params = $this->params["event"];
            $this->event = new \Event($params);
            if ($this->event->save()){
                \Logger::creationLog($_SESSION["admin"]->getName(), "Eventos", $this->event->getIdEvent());
                \FlashMessage::successMessage("Evento cadastrado com sucesso.");
                $this->redirectTo("admin/eventos/lista");
            }
            else{
                $errors = $this->event->getErrors();
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
            $this->events = \Event::findById($this->params[":id"])[0];
            $this->actionForm = $this->getUri("admin/eventos/{$this->events->getIdEvent()}");
            $this->titleBtnSubmit = "Salvar";
		}

        public function update(){
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                if ($this->event->update($this->params['event'])){
                    \Logger::updateLog($_SESSION["admin"]->getName(), "Eventos", $this->event->getIdEvent());
                    \FlashMessage::successMessage("Evento modificado com sucesso.");
                    $this->redirectTo("admin/eventos/lista");
                }
                else{
                    $errors = $this->event->getErrors();
                    foreach ($errors as $error) {
                       \FlashMessage::errorMessage($error);
                    }
                    $this->setHeadTitle("Editar Evento");
                    $this->actionForm = $this->getUri("admin/eventos/{$this->event->getIdEvent()}");
                    $this->titleBtnSubmit = "Salvar";
                    $this->render("edit");
                }
            }else{
                \FlashMessage::errorMessage("Erro ao atualizar evento.");
                $this->redirectTo("admin/eventos/lista");
            }
        }

    	public function remove(){
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                if($this->event->remove()){
                    \Logger::deletionLog($_SESSION["admin"]->getName(), "Eventos", $this->event->getIdEvent());
                    \FlashMessage::successMessage("Evento excluído com sucesso.");
                    $this->redirectTo("admin/eventos/lista");
                }else{
                    \FlashMessage::errorMessage("Erro ao excluir evento.");
                    $this->redirectTo("admin/eventos/lista");
                }
            }else{
                \FlashMessage::errorMessage("Erro ao excluir evento.");
                $this->redirectTo("admin/eventos/lista");
            }
    	}

        public function checkAttendance() {
            $idEvent = $this->params[":id"];
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
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
            }else{
                \FlashMessage::errorMessage("O evento não foi encontrado.");
                $this->redirectTo("admin/eventos/lista");
            }
        }

        public function attendance() {
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                $this->setHeadTitle("Registrar presença");
                $this->enrollments = \Enrollment::find(array("id_event"), array($this->params[":id"]));
                // $this->attendanceList = \Enrollment::attendanceList($this->params[":id"]);
                //var_dump($this->enrollments); exit;
                $this->actionForm = $this->getUri("admin/eventos/{$this->event->getIdEvent()}/presenca");
                $this->titleBtnSubmit = "Salvar";
            }else{
                \FlashMessage::errorMessage("O evento não foi encontrado.");
                $this->redirectTo("admin/eventos/lista");
            }
             
        }

        public function stats(){
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                $this->setHeadTitle("Estatísticas do evento");
                $this->enrollmentsCount = count(\Enrollment::find(array("id_event"), array($this->event->getIdEvent())));
                $this->confirmedEnrollmentsCount = count(\Enrollment::find(array("id_event", "id_enrollment_status"), array($this->event->getIdEvent(), \EnrollmentStatus::find(array("code"), array("confirmed"))[0]->getIdEnrollmentStatus()), "="));
                $this->pendingEnrollmentsCount = count(\Enrollment::find(array("id_event", "id_enrollment_status"), array($this->event->getIdEvent(), \EnrollmentStatus::find(array("code"), array("pending"))[0]->getIdEnrollmentStatus()), "="));
                $this->cancelledEnrollmentsCount = count(\Enrollment::find(array("id_event", "id_enrollment_status"), array($this->event->getIdEvent(), \EnrollmentStatus::find(array("code"), array("cancelled"))[0]->getIdEnrollmentStatus()), "="));
                $this->suspendedEnrollmentsCount = count(\Enrollment::find(array("id_event", "id_enrollment_status"), array($this->event->getIdEvent(), \EnrollmentStatus::find(array("code"), array("suspended"))[0]->getIdEnrollmentStatus()), "="));
                $this->validEnrollmentsCount = $this->enrollmentsCount - $this->cancelledEnrollmentsCount;
            }else{
                \FlashMessage::errorMessage("O evento não foi encontrado.");
                $this->redirectTo("admin/eventos/lista");
            }
        }

        public function sponsorship() {
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                $this->setHeadTitle("Organizar Colaboradores");
                $this->titleBtnSubmit = "Salvar";
                $this->actionForm = $this->getUri("admin/eventos/{$this->event->getIdEvent()}/colaboracao");
                $this->sponsors = \Sponsor::all();
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

        public function badges() {
            require_once APP_ROOT_FOLDER . '/app/resources/php/phpqrcode/qrlib.php';
            $this->event = \Event::findById($this->params[":id"])[0];
            if($this->event){
                $this->setHeadTitle("Imprimir Crachás");
                // $this->titleBtnSubmit = "Salvar";
                // $this->actionForm = $this->getUri("admin/eventos/{$this->event->getIdEvent()}/colaboracao");
                $this->enrollments = \Enrollment::findByIdEvent($this->event->getIdEvent());
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