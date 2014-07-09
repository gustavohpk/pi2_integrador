<?php 
	namespace Admin;
	
	class MediaController extends BaseAdminController{
      protected $media;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Mídia");
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         $limit = 3;
         $this->media = \Media::find(null, $limit, $page);
         $this->count = \Media::count();
         $this->pagination = new \Pager($this->count, $limit, $page);
 
		}

		public function _new(){
			$this->setHeadTitle("Upload de mídia");
         $this->media = new \Media();
         $this->actionForm = $this->getUri("admin/midia");
         $this->titleBtnSubmit = "Cadastrar";
		}

		public function _edit(){
			$this->setHeadTitle("Modificar mídia");
         $this->media = \Media::findById($this->params[":id"]);
         $this->actionForm = $this->getUri("admin/midia/{$this->media->getIdMedia()}");
         $this->titleBtnSubmit = "Salvar";
		}

      public function create(){
         $params = $this->params["media"];
         $this->media = new \Media($params);
         if ($this->media->save()){
            \FlashMessage::successMessage("Mídia cadastrada com sucesso.");
            $this->redirectTo("admin/midia/lista");
         }
         else{
            \FlashMessage::errorMessage("Erro ao cadastrar a mídia.");
            $this->setHeadTitle("Upload de Mídia");           
            $this->actionForm = $this->getUri("admin/midia");
            $this->titleBtnSubmit = "Cadastrar";
            $this->render("_new");
         }
      }

      public function update(){
         //salva edição da midia no db  
         $this->media = \Media::findById($this->params[":id"]);
         if ($this->media->update($this->params['media'])){
            \FlashMessage::successMessage("Mídia alterada com sucesso.");
            $this->redirectTo("admin/midia/lista");
         }
         else{
            \FlashMessage::errorMessage("Erro ao alterar a mídia.");
            $this->setHeadTitle("Editar Mídia");
            $this->actionForm = $this->getUri("admin/midia/{$this->media->getIdMedia()}");
            $this->titleBtnSubmit = "Salvar";
            $this->render("edit");
         }
      }

      public function remove(){
         $this->media = \Media::findById($this->params[":id"]);
         if ($this->media->remove()){
            \FlashMessage::successMessage("Mídia alterada com sucesso.");
         }
         else {
            \FlashMessage::errorMessage("Não foi possível excluír a mídia.");
         }
         $this->redirectTo("admin/midia/lista");
      }
	} 
?>