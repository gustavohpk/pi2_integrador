<?php 
	class SearchController extends BaseController{

   		public function events(){
      		$this->setHeadTitle("Pesquisa por eventos");
	         if (isset($this->params[":p"])) {
	            $page = $this->params[":p"];
	         } else {
	             $page = 1;
	         }
	         Events::setLimitByPage(8);
	         Events::setCurrentPage($page);
	         if (isset($this->params[":s"])){
	         	if ($this->params[":s"] != ""){
	            	$this->events = Events::customerSearch($this->params[":s"]);
	            	$this->pagination = new Pager(Events::count(), Events::getLimitByPage(), $page);
	         	} else{
					FlashMessage::warningMessage("Digite algo para pesquisar.");
	         	}
	         }
	         else{			
	            $this->pagination = new Pager(Events::count(), Events::getLimitByPage(), $page);
			}
   		}

		public function findEvents(){
			$searchValue = $_POST["searchValue"];
			$searchValue = Search::formatSearchString($searchValue);
			$this->redirectTo("pesquisa/eventos/" . $searchValue);
		}

   		public function news(){
      		$this->setHeadTitle("Pesquisa por notícias");
	         if (isset($this->params[":p"])) {
	            $page = $this->params[":p"];
	         } else {
	             $page = 1;
	         }
	         News::setLimitByPage(8);
	         News::setCurrentPage($page);
	         if (isset($this->params[":s"])){
	         	if ($this->params[":s"] != ""){
	            	$this->news = News::customerSearch($this->params[":s"]);
	            	$this->pagination = new Pager(News::count(), News::getLimitByPage(), $page);
	         	} else{
					FlashMessage::warningMessage("Digite algo para pesquisar.");
	         	}
	         }
	         else{			
	            $this->pagination = new \Pager(\News::count(), \News::getLimitByPage(), $page);
			}
   		}

		public function findNews(){
			$searchValue = $_POST["searchValue"];
			$searchValue = Search::formatSearchString($searchValue);
			$this->redirectTo("pesquisa/noticias/" . $searchValue);
		}

	} 
?>