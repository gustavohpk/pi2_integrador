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
         \Media::setCurrentPage($page);

         if (isset($this->params[":id"])){
            $this->media = \Media::findById($this->params[":id"]);
            $this->pagination = new \Pager(count($this->media), \Media::getLimitByPage(), $page);
         }
         else{
            $this->media = \Media::find();
            $this->pagination = new \Pager(\Media::count(), \Media::getLimitByPage(), $page);
         }
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
         $uri = $this->getUri("media/image/event/");
         if ($this->media->save($uri)){
            \FlashMessage::successMessage("Mídia cadastrada com sucesso.");
            if ($this->media->getMediaType() == "p") {
               move_uploaded_file($_FILES["media"]["tmp_name"], "/var/www/" . $this->media->getPath());
            }
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
            \FlashMessage::successMessage("Mídia removida com sucesso.");
            unlink("/var/www/" . $this->media->getPath());
         }
         else {
            \FlashMessage::errorMessage("Não foi possível excluír a mídia.");
         }
         $this->redirectTo("admin/midia/lista");
      }
	}
?>