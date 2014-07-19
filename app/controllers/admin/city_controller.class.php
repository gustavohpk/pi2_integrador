<?php 
	namespace Admin;
	
	class CityController extends BaseAdminController{
      protected $cities;

		public function _list() {
   		$this->setHeadTitle("Lista de Cidades");
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         $limit = 15;
         $this->cities = \City::all();

         //$this->count = \Media::count();
         //$this->pagination = new \Pager($this->count, $limit, $page);
 
		}

		public function _new(){
			$this->setHeadTitle("Criar Cidade");
         $this->cities = new \City();
         $this->actionForm = $this->getUri("admin/cidades/nova");
		}

		public function edit(){
			$this->setHeadTitle("Modificar Cidade");
         $this->cities = \City::findById($this->params[":id"]);
         $this->actionForm = $this->getUri("admin/cidades/{$this->cities->getIdCity()}/alterar");
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