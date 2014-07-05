<?php 
	namespace Admin;
	
	class NewsController extends BaseAdminController{
      protected $news;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de notícias");
		}

		public function _new(){
			$this->setHeadTitle("Cadastrar notícia");
         $this->actionForm = $this->getUri("admin/noticias");
         $this->titleBtnSubmit = "Cadastrar";
		}

		public function _edit(){
			$this->setHeadTitle("Modificar notícia");
         $this->titleBtnSubmit = "Salvar";
		}

      public function create(){

      }

      public function update(){

      }

      public function remove(){

      }
	} 
?>