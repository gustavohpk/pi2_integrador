<?php 
	namespace Admin;
	
	class SponsorsController extends BaseAdminController{
		protected $sponsors;
    	protected $actionForm;
    	protected $titleBtnSubmit;

		public function _list(){
   			$this->setHeadTitle("Lista de Colaboradores");
	        if (isset($this->params[":p"])) {
	           $page = $this->params[":p"];
	        } else {
	           $page = 1;
	        }
         	\Sponsor::setLimitByPage(5);
	        \Sponsor::setCurrentPage($page);

	        if (isset($this->params[":id"])){
	           $this->sponsors = \Sponsor::findById($this->params[":id"]);
	           $this->pagination = new \Pager(count($this->sponsors), \Sponsor::getLimitByPage(), $page);
	        }
	        else{
	           $this->sponsors = \Sponsor::find();
	           $this->pagination = new \Pager(\Sponsor::count(), \Sponsor::getLimitByPage(), $page);
	        }
		}

		public function _new(){
         	//prepara formulario para inserção
         	$this->sponsors = new \Sponsor();
			$this->setHeadTitle("Novo Colaborador");
         	$this->actionForm = $this->getUri("admin/colaboradores/novo");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			$this->sponsors = new \Sponsor($this->params["sponsor"]);
			if ($this->sponsors->save()){
				\FlashMessage::successMessage("Colaborador cadastro com sucesso.");
				$this->redirectTo("admin/colaboradores/lista");
			}
			else{
				\FlashMessage::errorMessage("Erro ao cadastrar colaborador.");
				$this->setHeadTitle("Novo Colaborador");
	         	$this->actionForm = $this->getUri("admin/colaboradores/novo");
	         	$this->titleBtnSubmit = "Cadastrar";
	         	$this->render("_new");
			}
		}

		public function _edit(){
			$this->sponsors = \Sponsor::findById($this->params[":id"])[0];
   			$this->setHeadTitle("Editar Colaborador");
   			$this->actionForm = $this->getUri("admin/colaboradores/{$this->sponsors->getIdSponsor()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			$this->sponsors = \Sponsor::findById($this->params[":id"])[0];
			if ($this->sponsors->update($this->params['sponsor'])){
				\FlashMessage::successMessage("Colaborador alterado com sucesso.");
				$this->redirectTo("admin/colaboradores/lista");
			}
			else{
				\FlashMessage::errorMessage("Erro ao alterar colaborador.");
				$this->setHeadTitle("Editar Colaborador");
	         	$this->actionForm = $this->getUri("admin/colaboradores/{$this->sponsors->getIdEventType()}/alterar");
	         	$this->titleBtnSubmit = "Salvar";
	         	$this->render("edit");
			}
		}

		public function remove(){
			$this->sponsors = \Sponsor::findById($this->params[":id"])[0];
			$this->sponsors->remove();
			\FlashMessage::successMessage("Colaborador removido com sucesso.");
			$this->redirectTo("admin/colaboradores/lista");
		}
	} 
?>