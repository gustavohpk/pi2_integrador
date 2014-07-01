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
			$this->paymentsType->save();
			$this->redirectTo("admin/config/pagamento");
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
			$this->paymentsType->update($this->params['payment_type']);
			$this->redirectTo("admin/config/pagamento");
		}

		public function remove(){
			$this->paymentsType = \PaymentType::findById($this->params[":id"]);
			$this->paymentsType->remove();
			$this->redirectTo("admin/config/pagamento");
		}
	} 
?>