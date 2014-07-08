<?php 
	class NewsController extends BaseController{
   		public function item(){}
   
   		public function show(){
      		$this->setHeadTitle("Notícias");
      		if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
	        News::setLimitByPage(8);
	        News::setCurrentPage($page);
	        $date = date("d-m-Y");
	        $this->news = News::all();
	        $this->pagination = new Pager(News::count(), News::getlimitByPage(), $page);
   		}
	} 
?>