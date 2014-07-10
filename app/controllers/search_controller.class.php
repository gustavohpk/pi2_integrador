<?php 
	class SearchController extends BaseController{

   		public function events(){
      		$this->setHeadTitle("Pesquisa por eventos");
   		}

   		public function news(){
      		$this->setHeadTitle("Pesquisa por notícias");
   		}

   		public function media(){
      		$this->setHeadTitle("Pesquisa por fotos e vídeos");
   		}
	} 
?>