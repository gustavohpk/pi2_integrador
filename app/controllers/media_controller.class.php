<?php 
	class MediaController extends BaseController{
		public function gallery() {
      		$this->setHeadTitle("Fotos e Vídeos");
      		if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        Media::setLimitByPage(15);
	        Media::setCurrentPage($page);
	        $date = date("d-m-Y");
	        $this->media = Media::all();
	        $this->pagination = new Pager(Media::count(), Media::getlimitByPage(), $page);
   		}

   		public function photos(){
      		$this->setHeadTitle("Fotos");
      		if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        Media::setLimitByPage(9);
	        Media::setCurrentPage($page);
	        $this->media = Media::photos(); 			
   		}

   		public function videos(){
      		$this->setHeadTitle("Fotos");
      		if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        Media::setLimitByPage(9);
	        Media::setCurrentPage($page);
	        $this->media = Media::videos();  
   		}
	} 
?>