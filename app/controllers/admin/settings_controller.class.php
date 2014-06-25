<?php 
	namespace Admin;
	
	class SettingsController extends BaseAdminController{
   		public function general() {
      		$this->setHeadTitle("Configurações Gerais");
   		}

   		public function theme(){
   			$this->setHeadTitle("Configurações de Tema");
   		}

   		public function banners(){
   			$this->setHeadTitle("Configurações dos banners");
   		}

   		public function payment(){
   			$this->setHeadTitle("Configurações de Pagamento");
   		}
         public function contacts(){
            $this->setHeadTitle("Configurações de Contato");
         }
	} 
?>