<?php 
	class HomeController extends BaseController{
		protected $events;

   		public function index() {
      		$this->setHeadTitle();
	        $page = 1;
	        News::setLimitByPage(3);
	        News::setCurrentPage($page);
	        $date = date("d-m-Y");
	        $this->news = News::find(array(), array(), "=", "AND", "modification_date");
	        Media::setLimitByPage(6);
	        Media::setCurrentPage($page);
	        $this->media = Media::all();
	        Events::setLimitByPage(4);
	        $this->events = Events::all();
	        $this->bannersNames = Settings::find(array("description"), array("banner%_name"), "LIKE");
         	$this->bannersPaths = Settings::find(array("description"), array("banner%_path"), "LIKE");
   		}
	} 
?>