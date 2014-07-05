<?php 
	class EventsController extends BaseController{
	    protected $events;
	    protected $eventsType;
	    protected $paymentsType;
	    protected $actionForm;

		public function next() {
			$this->setHeadTitle("Próximos Eventos");
	        if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        $limit = 6;
	        $date = date("d-m-Y");
	        $this->events = Events::findNext($date, $limit, $page);
	        $this->count = Events::countNext();
	        $this->pagination = new Pager($this->count, $limit, $page);
   		}

   		public function previous(){
      		$this->setHeadTitle("Eventos Anteriores");
	        if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        $limit = 6;
	        $date = date("d-m-Y");
	        $this->events = Events::findPrev($date, $limit, $page);
	        $this->count = Events::countPrev();
	        $this->pagination = new Pager($this->count, $limit, $page);
   		}
	} 
?>