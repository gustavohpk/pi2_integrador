<?php 
	class MediaController extends BaseController{
		public function gallery() {
      		$this->setHeadTitle("Fotos e Vídeos");
      		if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        Media::setLimitByPage(1);
	        Media::setCurrentPage($page);
	        $date = date("d-m-Y");
	        $this->media = Media::all();
	        $this->pagination = new Pager(Media::count(), Media::getlimitByPage(), $page);
   		}
	} 
?>