<?php 
	class EventsController extends BaseController{
	    protected $events;
	    protected $eventsRelated;
	    protected $eventsType;
	    protected $paymentsType;

	    public function show() {
	    	$this->setHeadTitle("Ver Evento");
	    	if (isset($this->params[":id"])) {
	    		$this->events = Events::findById($this->params[":id"])[0];
	    	}
	    	else if(isset($this->params[":url"])){
	    		$this->events = Events::findByPath($this->params[":url"])[0];
	    	}
	    	if($this->events){
	    		$this->eventsRelated = $this->events->getEventsRelated();
	    		$this->sponsors = $this->events->getSponsors();
	    		$this->hasMedia = Media::hasMedia($this->events->getIdEvent());
	    		if($this->events->getRating() > 0)
	    			$this->realRating = $this->events->getRating() / $this->events->getEvaluations();
   				Events::updateViews($this->events->getIdEvent());
   				if(isset($_SESSION["participant"])){
	   				if($this->enrollment = Enrollment::find(array("id_participant", "id_event"), array($_SESSION["participant"]->getIdParticipant(), $this->events->getIdEvent()))){
	   					$this->attendance = $this->enrollment[0]->getAttendance();
	   					$this->participantRating = $this->enrollment[0]->getRating();
	   				}
	   				else
	   					$this->attendance = false;
	   			}
   				else
   					$this->attendance = false;
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
	        Events::setLimitByPage(4);
	        Events::setCurrentPage($page);
	        $this->events = Events::findNext(date("Y-m-d"));
	        $this->pagination = new Pager(Events::countNext(), Events::getlimitByPage(), $page);
   		}

   		public function previous(){
      		$this->setHeadTitle("Eventos Anteriores");
	        if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        Events::setLimitByPage(6);
	        Events::setCurrentPage($page);
	        $this->events = Events::findPrev(date("Y-m-d"));
	        $this->pagination = new Pager(Events::countPrev(), Events::getLimitByPage(), $page);
   		}

   		public function calendar(){
   			sleep(1);
   			$this->layout = "admin/layout/layout_empty.phtml";
   			$this->events = Events::all();
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