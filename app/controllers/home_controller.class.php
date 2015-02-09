<?php 
	class HomeController extends BaseController{
		protected $events;

   		public function index() {
      		$this->setHeadTitle();
	        $page = 1;
	        News::setLimitByPage(4);
	        News::setCurrentPage($page);
	        $date = date("d-m-Y");
	        $this->news = News::find(array(), array(), "=", "AND", "modification_date");
	        Media::setLimitByPage(6);
	        Media::setCurrentPage($page);
	        $this->media = Media::all();
	        Event::setLimitByPage(4);
	        $this->nextEvents = Event::findNext(date("Y-m-d"));
	        $this->countNext = count($this->nextEvents);
	        if($this->countNext < 4){
	        	Event::setLimitByPage(4 - $this->countNext);
	        	$this->prevEvents = Event::findPrev(date("Y-m-d"));
	        	$this->countPrev = count($this->prevEvents);
	        }
	        $this->events = array_merge($this->nextEvents, $this->prevEvents);
	        //var_dump($this->events); exit;
	        $this->bannersNames = Settings::find(array("description"), array("banner%_name"), "LIKE");
         	$this->bannersPaths = Settings::find(array("description"), array("banner%_path"), "LIKE");
   		}

   		public function about() {
   			$this->setHeadTitle("Sobre");
   		}
	} 
?>