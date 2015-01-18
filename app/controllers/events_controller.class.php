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
	} 
?>