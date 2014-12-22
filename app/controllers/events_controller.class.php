<?php 
	class EventsController extends BaseController{
	    protected $events;
	    protected $eventsRelated;
	    protected $eventsType;
	    protected $paymentsType;

	    public function show() {
	    	$this->setHeadTitle("Ver Evento");
	    	if ($this->events = Events::findById($this->params[":id"])) {
	    		$this->events = $this->events[0];
	    		$this->eventsRelated = $this->events->getEventsRelated();
	    		$this->sponsors = $this->events->getSponsors();
   				Events::updateViews($this->params[":id"]);
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