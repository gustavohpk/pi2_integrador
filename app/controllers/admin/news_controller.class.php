<?php 
	namespace Admin;
	
	class NewsController extends BaseAdminController{
      protected $news;
      protected $actionForm;

		public function _list() {
         $this->setHeadTitle("Lista de Notícias");
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         \News::setCurrentPage($page);

         if (isset($this->params[":id"])){
            $this->news = \News::findById($this->params[":id"]);
            $this->pagination = new \Pager(count($this->news), \News::getLimitByPage(), $page);
         }
         else{
            $this->news = \News::find();
            $this->pagination = new \Pager(\News::count(), \News::getLimitByPage(), $page);
         }
      }

		public function _new(){
		$this->setHeadTitle("Cadastrar notícia");
		$this->news = new \News();
        $this->actionForm = $this->getUri("admin/noticias");
        $this->titleBtnSubmit = "Cadastrar";
		}

		public function _edit(){
            $this->setHeadTitle("Modificar notícia");
            $this->news = \News::findById($this->params[":id"])[0];
            if($this->news){
                $this->setHeadTitle("Atualizar Notícia");
                $this->actionForm = $this->getUri("admin/noticias/{$this->news->getIdNews()}");
                $this->titleBtnSubmit = "Salvar";
            }else{
                 \FlashMessage::errorMessage("A notícia não foi encontrada.");
                 $this->redirectTo("admin/noticias/lista");
            }
            
		}

      public function create(){
         $params = $this->params["news"];
         $this->news = new \News($params);
         if ($this->news->save()){
            \Logger::creationLog($_SESSION["admin"]->getName(), "Notícias", $this->news->getIdNews());
            \FlashMessage::successMessage("Notícia cadastrada com sucesso.");
            $this->redirectTo("admin/noticias/lista");
         }
         else{
            \FlashMessage::errorMessage("Erro ao cadastrar a notícia.");
            $this->setHeadTitle("Cadastro de notícia");           
            $this->actionForm = $this->getUri("admin/noticias");
            $this->titleBtnSubmit = "Cadastrar";
            $this->render("_new");
         }
      }

        public function update(){ 
            $this->news = \News::findById($this->params[":id"])[0];
            if($this->news){
                if ($this->news->update($this->params['news'])){
                    \Logger::updateLog($_SESSION["admin"]->getName(), "Notícias", $this->news->getIdNews());
                    \FlashMessage::successMessage("Notícia alterada com sucesso.");
                    $this->redirectTo("admin/noticias/lista");
                }
                else{
                    \FlashMessage::errorMessage("Erro ao alterar a notícia.");
                    $this->setHeadTitle("Editar Notícia");
                    $this->actionForm = $this->getUri("admin/noticias/{$this->news->getIdNews()}");
                    $this->titleBtnSubmit = "Salvar";
                    $this->render("edit");
                }
            }else{
                \FlashMessage::errorMessage("A notícia não foi encontrada.");
                 $this->redirectTo("admin/noticias/lista");
            }
         
        }

        public function remove(){
            $this->news = \News::findById($this->params[":id"])[0];
            if($this->news){
                if ($this->news->remove()){
                    \Logger::deletionLog($_SESSION["admin"]->getName(), "Notícias", $this->news->getIdNews());
                    \FlashMessage::successMessage("Notícia excluída com sucesso.");
                }
                else {
                    \FlashMessage::errorMessage("Não foi possível excluír a notícia.");
                }
            }else{
                \FlashMessage::errorMessage("A notícia não foi encontrada.");
            }
                 
            $this->redirectTo("admin/noticias/lista");
	    } 
    }
?>