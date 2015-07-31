<?php 
	class EventsController extends BaseController{
	    protected $events;
	    protected $eventsRelated;
	    protected $eventsType;
	    protected $paymentsType;

	    public function show() {
	    	$this->setHeadTitle("Ver Evento");
	    	if (isset($this->params[":id"])) {
	    		$this->event = Event::findById($this->params[":id"])[0];
	    	}
	    	else if(isset($this->params[":url"])){
	    		$this->event = Event::findByPath($this->params[":url"])[0];
	    	}
	    	if($this->event && $this->event->getEnabled() == true){
	    		$this->eventRelated = $this->event->getEventsRelated();
	    		$this->sponsors = $this->event->getSponsors();
	    		// Une os colaboradores do evento pai
	    		if($this->event->getIdParentEvent()){
	    			$parentEventSponsors = $this->event->getParentEvent()->getSponsors();
	    			foreach ($parentEventSponsors as $key => $parentEventSponsor) {
	    				if(!in_array($parentEventSponsor, $this->sponsors)){
	    					$this->sponsors[] = $parentEventSponsor;
	    				}
	    			}
	    		}
	    		$this->hasMedia = Media::hasMedia($this->event->getIdEvent());
	    		// Subtrai o nº de vagas inicial pelo nº de inscrições não canceladas
	    		$this->remainingSpaces = $this->event->getSpaces() - count(Enrollment::find(array("id_event", "id_enrollment_status"), array($this->event->getIdEvent(), EnrollmentStatus::find(array("code"), array("cancelled"))[0]->getIdEnrollmentStatus()), array("=", "!=")));
	    		if($this->event->getRating() > 0)
	    			$this->realRating = $this->event->getRating() / $this->event->getEvaluations();
   				Event::updateViews($this->event->getIdEvent());
   				$this->isEnrolled = false;
   				if(isset($_SESSION["participant"])){
	   				if($this->enrollment = Enrollment::find(array("id_participant", "id_event"), array($_SESSION["participant"]->getIdParticipant(), $this->event->getIdEvent()))){
	   					$this->attendance = $this->enrollment[0]->getAttendance();
	   					$this->participantRating = $this->enrollment[0]->getRating();
	   					$this->isEnrolled = true;
	   				}
	   				else
	   					$this->attendance = false;
	   			}
   				else{
   					$this->attendance = false;
   					$this->isEnrolled = false;
   				}
	    	}
	    	else {
	    		flashMessage::errorMessage("O evento que você está tentando acessar não existe.");
	    		$this->redirectTo($this->back());
	    	}
	    }

		public function next() {
			$this->setHeadTitle("Próximos Eventos");
	        if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        Event::setLimitByPage(4);
	        Event::setCurrentPage($page);
	        $this->events = Event::findNext(date("Y-m-d"));
	        $this->pagination = new Pager(Event::countNext(), Event::getlimitByPage(), $page);
   		}

   		public function previous(){
      		$this->setHeadTitle("Eventos Anteriores");
	        if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        Event::setLimitByPage(6);
	        Event::setCurrentPage($page);
	        $this->events = Event::findPrev(date("Y-m-d"));
	        $this->pagination = new Pager(Event::countPrev(), Event::getLimitByPage(), $page);
   		}

   		public function calendar(){
   			sleep(1);
   			$this->layout = "admin/layout/layout_empty.phtml";
   			$this->events = Event::all();
   			$calendar = array();
   			foreach ($this->events as $key => $event) {
   				if(array_key_exists($event->getStartDate("m-d-Y"), $calendar)){
					$calendar[$event->getStartDate("m-d-Y")] .= "<span>" . $event->getName() . "</span><br>";
   				}else{
   					$calendar[$event->getStartDate("m-d-Y")] = "<span>" . $event->getName() . "</span><br>";
   				}
   			}
   			$json_calendar = json_encode($calendar);
   			// $json_calendar = substr_replace($json_calendar, ",", -1, 0);
   			echo $json_calendar;
   			exit;
   		}
	} 
?>