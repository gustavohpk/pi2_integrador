<?php 
	class MediaController extends BaseController{
		public function media() {
      		$this->setHeadTitle("Fotos e Vídeos");
      		// if (isset($this->params[":p"])) {
	       //     $page = $this->params[":p"];
	       //  } else {
	       //     $page = 1;
	       //  }
	       //  Media::setLimitByPage(15);
	       //  Media::setCurrentPage($page);
	       //  $date = date("d-m-Y");
	       //  $this->media = Media::all();
	       //  $this->pagination = new Pager(Media::count(), Media::getlimitByPage(), $page);
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

		public function photoGallery() {

	        if(isset($this->params[":p"])) {
	        	$page = $this->params[":p"];
	        } else {
	        	$page = 1;
	        }

	        \Media::setLimitByPage(3);
	        \Media::setCurrentPage($page);

	        if (isset($this->params[":id"])){
	        	$this->media = \Media::findByIdEvent($this->params[":id"], "p");
	        }
	        else{
	            $this->media = \Media::find(array("media_type"), array("p"));
	        }

	        $media_json = array();

	        foreach ($this->media as $media){
	        	$media_json[] = (array) json_decode(json_encode(new \MediaJson($media), true));
	        }

	        echo stripslashes(json_encode($media_json));
	        exit;
	    }

		public function videoGallery() {

	        if(isset($this->params[":p"])) {
	        	$page = $this->params[":p"];
	        } else {
	        	$page = 1;
	        }

	        \Media::setLimitByPage(3);
	        \Media::setCurrentPage($page);

	        if (isset($this->params[":id"])){
	        	$this->media = \Media::findByIdEvent($this->params[":id"], "v");
	        }
	        else{
	            $this->media = \Media::find(array("media_type"), array("v"));
	        }

	        $media_json = array();

	        foreach ($this->media as $media){
	        	$media_json[] = (array) json_decode(json_encode(new \MediaJson($media), true));
	        }

	        echo stripslashes(json_encode($media_json));
	        exit;
	    }
	    
	}
?>