<?php 
	class SearchController extends BaseController{

   		public function events(){
      		$this->setHeadTitle("Pesquisa por eventos");
	         // if (isset($this->params[":p"])) {
	         //    $page = $this->params[":p"];
	         // } else {
	             $page = 1;
	         // }
	         // \Events::setCurrentPage($page);
	         if (isset($this->params[":s"])){
	         	if ($this->params[":s"] != ""){
	            	$this->events = \Events::customerSearch($this->params[":s"]);
	            	//$this->pagination = new \Pager(count($this->events), \Events::getLimitByPage(), $page);
	         	} else{
					FlashMessage::warningMessage("Digite algo para pesquisar.");
	         	}
	         }
	         else{
	            				
	            //$this->pagination = new \Pager(\Events::count(), \Events::getLimitByPage(), $page);
			}
   		}

		public function findEvents(){
			$searchValue = $_POST["searchValue"];
			$searchValue = Search::formatSearchString($searchValue);
			$this->redirectTo("pesquisa/eventos/" . $searchValue);
			// $this->result = new Search($this->params["participant"]);
			
			// if ($this->participant->save()){
			// 	FlashMessage::successMessage("Cadastro realizado com sucesso.");
			// 	$this->redirectTo("conta/login");
			// }
			// else{
			// 	FlashMessage::errorMessage("Os seguintes ocorreram ao tentar realizar o cadastro:");
			// 	$errors = $this->participant->getErrors();				
			// 	foreach ($errors as $error){
			// 		FlashMessage::errorMessage($error);
			// 	}	

			// 	$this->prepareNew(true);
			// }
		}

   		public function news(){
      		$this->setHeadTitle("Pesquisa por notícias");
   		}

   		public function media(){
      		$this->setHeadTitle("Pesquisa por fotos e vídeos");
   		}
	} 
?>