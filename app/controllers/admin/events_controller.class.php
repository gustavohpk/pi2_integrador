<?php 
	namespace Admin;
	
	class EventsController extends BaseAdminController{
		protected $events;
      protected $eventsType;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Eventos");
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         \Events::setCurrentPage($page);

         if (isset($this->params[":id"])){
            $this->events = \Events::findById($this->params[":id"]);
            $this->pagination = new \Pager(count($this->events), \Events::getLimitByPage(), $page);
         }
         else{
            $this->events = \Events::find();
            $this->pagination = new \Pager(\Events::count(), \Events::getLimitByPage(), $page);
         }
		}

      public function selectionList() {
         $this->layout = "admin/layout/layout_empty.phtml";
         $this->setHeadTitle("Seleção de Eventos");
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         \Events::setLimitByPage(5);
         \Events::setCurrentPage($page);

         if (isset($this->params[":id"])){
            $this->events = \Events::findById($this->params[":id"]);
            $this->pagination = new \Pager(count($this->events), \Events::getLimitByPage(), $page);
         }
         else{
            $this->events = \Events::find();
            $this->pagination = new \Pager(\Events::count(), \Events::getLimitByPage(), $page);
         }
      }

		public function _new(){
         //prepara formulario para inserção de novo evento
			$this->setHeadTitle("Novo Evento");
         $this->eventsType = \EventsType::all();
			$this->events = new \Events();
         $this->actionForm = $this->getUri("admin/eventos");
         $this->titleBtnSubmit = "Cadastrar";
		}

      public function create(){
         $params = $this->params["event"];
         $cost = $this->params["cost"];
         $this->events = new \Events($params);
         if ($this->events->save()){
            \Logger::creationLog($_SESSION["admin"]->getName(), "Eventos", $this->events->getIdEvent());
            \FlashMessage::successMessage("Evento cadastrado com sucesso.");
            if (!$this->events->setCost($cost)) {
               $errors = $this->events->cost[0]->getErrors();
               foreach ($errors as $error) {
                  \FlashMessage::errorMessage($error);
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
            $this->eventsType = \EventsType::all();
            $this->actionForm = $this->getUri("admin/eventos");
            $this->titleBtnSubmit = "Cadastrar";
            $this->render("_new");
         }
      }

		public function edit(){
         //prepara formulario para edição do evento
			$this->setHeadTitle("Editar Evento");
         $this->eventsType = \EventsType::all();
			$this->events = \Events::findById($this->params[":id"])[0];
         $this->actionForm = $this->getUri("admin/eventos/{$this->events->getIdEvent()}");
         $this->titleBtnSubmit = "Salvar";
		}

      public function update(){
         //salva edição do evento no db  
         $this->events = \Events::findById($this->params[":id"])[0];
         $cost = $this->params["cost"];
         if ($this->events->update($this->params['event'])){
            \Logger::updateLog($_SESSION["admin"]->getName(), "Eventos", $this->events->getIdEvent());
            \FlashMessage::successMessage("Evento modificado com sucesso.");
            if (!$this->events->setCost($cost)) {
               $errors = $this->events->cost[0]->getErrors();
               foreach ($errors as $error) {
                  \FlashMessage::errorMessage($error);
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
            $this->eventsType = \EventsType::all();
            $this->paymentsType = \PaymentType::all();
            $this->actionForm = $this->getUri("admin/eventos/{$this->events->getIdEvent()}");
            $this->titleBtnSubmit = "Salvar";
            $this->render("edit");
         }
      }

		public function remove(){
         $this->events = \Events::findById($this->params[":id"])[0];
         $this->events->remove();
         \Logger::deletionLog($_SESSION["admin"]->getName(), "Eventos", $this->events->getIdEvent());
         \FlashMessage::successMessage("Evento removido com sucesso.");
         $this->redirectTo("admin/eventos/lista");
		}

      public function checkAttendance() {
         $idEvent = $this->params[":id"];
         //var_dump($idEvent);
         $this->enrollments = \Enrollment::find(array("id_event"), array($idEvent))[0];
         //var_dump($this->enrollments);
         //var_dump(get_class_methods($this->enrollments)); exit;
         $this->enrollments->checkAttendance($this->params["enrollment"]);
         \FlashMessage::successMessage("A lista de presença foi atualizada.");
         $this->redirectTo("admin/eventos/lista");
      }

      public function attendance() {
         $this->setHeadTitle("Registrar presença");
         $this->events = \Events::findById($this->params[":id"])[0];
         $this->enrollments = \Enrollment::find(array("id_event"), array($this->params[":id"]));
         //$this->attendanceList = \Enrollment::attendanceList($this->params[":id"]);
         //var_dump($this->enrollments); exit;
         $this->actionForm = $this->getUri("admin/eventos/{$this->events->getIdEvent()}/presenca");
         $this->titleBtnSubmit = "Salvar";
      }
	} 
?>