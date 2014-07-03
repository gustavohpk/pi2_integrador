<?php 
	class EventsController extends BaseController{
	    protected $events;
	    protected $eventsType;
	    protected $paymentsType;
	    protected $actionForm;

		public function next() {

	        if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        $limit = 6;
	        $this->events = Events::find(null, $limit, $page);
	        $this->count = Events::count();
	        $this->pagination = new Pager($this->count, $limit, $page);
   		}

   		public function previous(){
      		$this->setHeadTitle("Eventos Anteriores");
   		}
	} 
?>