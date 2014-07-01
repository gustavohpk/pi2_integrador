<?php 
	namespace Admin;
	
	class PaymentTypeController extends BaseAdminController{
		protected $paymentsType;
    	protected $actionForm;
    	protected $titleBtnSubmit;

		public function _list(){
   			$this->setHeadTitle("Listando Formas de Pagamento");
   			$this->paymentsType = \PaymentType::all();
		}

		public function _new(){
         	//prepara formulario para inserção
         	$this->paymentsType = new \PaymentType();
			$this->setHeadTitle("Nova Forma de Pagamento");
         	$this->actionForm = $this->getUri("admin/config/pagamento/nova");
         	$this->titleBtnSubmit = "Cadastrar";
		}

		public function create(){
			//salva inserção no db
			$this->paymentsType = new \PaymentType($this->params["payment_type"]);

			if ($this->paymentsType->save()){
				\FlashMessage::successMessage("Forma de pagamento cadastrada com sucesso.");
				$this->redirectTo("admin/config/pagamento");
			}
			else{
				\FlashMessage::errorMessage("Erro ao cadastrar a forma de pagamento.");
				$this->setHeadTitle("Nova Forma de Pagamento");
	         	$this->actionForm = $this->getUri("admin/config/pagamento/nova");
	         	$this->titleBtnSubmit = "Cadastrar";
	         	$this->render("_new");
			}			
		}

		public function edit(){
			//prepara formulario para edicao
			$this->paymentsType = \PaymentType::findById($this->params[":id"]);
   			$this->setHeadTitle("Editar Forma de Pagamento");
   			$this->actionForm = $this->getUri("admin/config/pagamento/{$this->paymentsType->getIdPaymentType()}/alterar");
   			$this->titleBtnSubmit = "Salvar";   			
		}

		public function update(){
			//salva edição no db  
			$this->paymentsType = \PaymentType::findById($this->params[":id"]);

			if ($this->paymentsType->update($this->params['payment_type'])){
				\FlashMessage::successMessage("A forma de pagamento foi atualiza com sucesso.");
				$this->redirectTo("admin/config/pagamento");
			}
			else{
				\FlashMessage::errorMessage("Erro ao alterar a forma de pagamento.");
	   			$this->setHeadTitle("Editar Forma de Pagamento");
	   			$this->actionForm = $this->getUri("admin/config/pagamento/{$this->paymentsType->getIdPaymentType()}/alterar");
	   			$this->titleBtnSubmit = "Salvar";  
	   			$this->render("edit");
			}
		}

		public function remove(){
			$this->paymentsType = \PaymentType::findById($this->params[":id"]);
			$this->paymentsType->remove();
			\FlashMessage::successMessage("Forma de pagamento removida com sucesso.");
			$this->redirectTo("admin/config/pagamento");
		}
	} 
?>