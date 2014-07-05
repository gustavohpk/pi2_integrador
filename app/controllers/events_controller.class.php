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
	        Events::setLimitByPage(6);
	        Events::setCurrentPage($page);
	        $date = date("d-m-Y");
	        $this->events = Events::findNext($date);
	        $this->pagination = new Pager(Events::count(), Events::getlimitByPage(), $page);
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
	        $date = date("d-m-Y");
	        $this->events = Events::findPrev($date);
	        $this->pagination = new Pager(Events::count(), Events::getLimitByPage(), $page);
   		}
	} 
?>