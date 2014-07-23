<?php 
	class NewsController extends BaseController{
		protected $news;

   		public function item(){
   			if (!$this->news = News::findById($this->params[":id"])) {
   				flashMessage::errorMessage("A notícia que você está tentando acessar não existe").
   				$this->redirectTo("noticias/lista");
   			}

   			$this->setHeadTitle("Notícia");
   		}
   
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
	        $this->news = News::find(array(), array(), "=", "AND", "modification_date");
	        $this->pagination = new Pager(News::count(), News::getlimitByPage(), $page);
   		}
	} 
?>