<?php 
	class HomeController extends BaseController{
		protected $events;
		
   		public function index() {
      		$this->setHeadTitle();
	        $page = 1;
	        News::setLimitByPage(3);
	        News::setCurrentPage($page);
	        $date = date("d-m-Y");
	        $this->news = News::all();
	        Media::setLimitByPage(3);
	        Media::setCurrentPage($page);
	        $this->media = Media::all();

	        Events::setLimitByPage(4);
	        $this->events = Events::all();
   		}
	} 
?>