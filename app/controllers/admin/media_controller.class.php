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
        $this->setHeadTitle("Cadastrar Vídeo");
        $this->media = new \Media();
        $this->actionForm = $this->getUri("admin/midia/video");
        $this->titleBtnSubmit = "Cadastrar";
        }

        public function _newMultiple(){
        $this->setHeadTitle("Upload de mídia");
        $this->media = new \Media();
        $this->actionForm = $this->getUri("admin/midia/fotos");
        $this->titleBtnSubmit = "Cadastrar";
    }

    public function _edit(){
        $this->setHeadTitle("Modificar mídia");
        $this->media = \Media::findById($this->params[":id"]);
        $this->actionForm = $this->getUri("admin/midia/{$this->media->getIdMedia()}");
        $this->titleBtnSubmit = "Salvar";
    }

    public function createVideo(){
        $params = $this->params["media"];

        $this->media = new \Media($params);
        $this->media->setMediaType("v");

        $uri = $this->getUri("media/image/event/");

        if ($this->media->save($uri, 0)){
            \FlashMessage::successMessage("Vídeo cadastrado com sucesso.");
            $this->redirectTo("admin/midia/lista");
        }
        else{
            \FlashMessage::errorMessage("Erro ao cadastrar vídeo.");
            $this->setHeadTitle("Cadastrar Vídeo");
            $this->actionForm = $this->getUri("admin/midia/video");
            $this->titleBtnSubmit = "Cadastrar";
            $this->render("_new");
        }
    }

    public function createPhotos(){
        $params = $this->params["media"];
        $successes = array();
        $errors = array();

        for($i = 0; $i < count($this->params["media"]["label"]); $i++)
        {
            $data = array(
                        "id_media" => null,
                        "label" => $this->params["media"]["label"][$i],
                        "id_event" => $this->params["media"]["id_event"][$i], 
                        "media_type" => "p",
                        "path" => ""
            );
            $this->media = new \Media($data);
            $this->media->setMediaType("p");

            $uri = $this->getUri("media/image/event/");

            if($_FILES["photos"]["size"][$i] == 0){
                $errors[] = $_FILES["photos"]["name"][$i] . " - o tamanho do arquivo não pode ser superior a " . (int)(ini_get('upload_max_filesize')) . " mb.";
            }else{
                if ($this->media->save($uri, $i)){
                    $successes[] = $_FILES["photos"]["name"][$i];
                    move_uploaded_file($_FILES["photos"]["tmp_name"][$i], "/var/www/" . $this->media->getPath());
                }
                else{
                    $errors[] = $_FILES["photos"]["name"][$i];
                }
            }

            
        }

        $successMsg = "Fotos cadastradas com sucesso: ";
        foreach ($successes as $name) {
            $successMsg .= $name . ", ";
        }
        if($successes)
            \FlashMessage::successMessage(substr($successMsg, 0, -2));

        $errorMsg = "Erro ao cadastrar fotos: ";
        foreach ($errors as $name) {
            $errorMsg .= $name . ", ";
        }

        if($errors)
            \FlashMessage::errorMessage(substr($errorMsg, 0, -2));


        $this->redirectTo("admin/midia/lista");

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