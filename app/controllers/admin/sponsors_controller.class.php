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
         	\Sponsors::setLimitByPage(5);
	        \Sponsors::setCurrentPage($page);

	        if (isset($this->params[":id"])){
	           $this->sponsors = \Sponsors::findById($this->params[":id"]);
	           $this->pagination = new \Pager(count($this->sponsors), \Sponsors::getLimitByPage(), $page);
	        }
	        else{
	           $this->sponsors = \Sponsors::find();
	           $this->pagination = new \Pager(\Sponsors::count(), \Sponsors::getLimitByPage(), $page);
	        }
		}

		public function _new(){
         	//prepara formulario para inserção
         	$this->sponsors = new \Sponsors();
			$this->setHeadTitle("Novo Colaborador");
         	$this->actionForm = $this->getUri("admin/colaboradores/novo");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			//salva inserção no db
			$this->sponsors = new \Sponsors($this->params["sponsor"]);
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

		public function edit(){
			//prepara formulario para edicao
			$this->sponsors = \Sponsors::findById($this->params[":id"])[0];
   			$this->setHeadTitle("Editar Colaborador");
   			$this->actionForm = $this->getUri("admin/colaboradores/{$this->sponsors->getIdSponsor()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			//salva edição no db  
			$this->sponsors = \Sponsors::findById($this->params[":id"])[0];
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
			$this->sponsors = \Sponsors::findById($this->params[":id"])[0];
			$this->sponsors->remove();
			\FlashMessage::successMessage("Colaborador removido com sucesso.");
			$this->redirectTo("admin/colaboradores/lista");
		}
	} 
?>