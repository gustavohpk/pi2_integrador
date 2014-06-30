<?php 
	namespace Admin;
	
	class MediaController extends BaseAdminController{
      protected $media;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Mídia");
         $this->media = \Media::all();
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
         $this->media->save();
         $this->redirectTo("admin/midia/lista");
      }

      public function update(){
         //salva edição da midia no db  
         $this->media = \Media::findById($this->params[":id"]);
         $this->media->update($this->params['media']);
         $this->redirectTo("admin/midia/lista");
      }

      public function remove(){
         $this->media = \Media::findById($this->params[":id"]);
         $this->media->remove();
         $this->redirectTo("admin/midia/lista");
      }
	} 
?>