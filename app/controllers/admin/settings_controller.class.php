<?php 
	namespace Admin;
	
	class SettingsController extends BaseAdminController{

      protected $actionForm;
		public function general() {
   		$this->setHeadTitle("Configurações Gerais");
         $settings = \Settings::all();
         $this->settings = array();
         foreach ($settings as $key => $setting) {
            $this->settings[$setting->getDescription()] = $setting->getValue(); 
         }
         $this->actionForm = $this->getUri("admin/config");
         $this->maintenance = \Settings::checkMaintenance();
		}

		public function theme(){
			$this->setHeadTitle("Configurações de Tema");
		}

		public function payment(){
			$this->setHeadTitle("Configurações de Pagamento");
		}

      public function email(){
         $this->settings = \Settings::find(array("description"), array("contact_mail"))[0];
         $this->actionForm = $this->getUri("admin/config");
         $this->titleBtnSubmit = "Alterar";
         $this->setHeadTitle("Configurações de Contato");
         $this->configSection = 'contact_mail';
      }


      public function update(){
         if(\Settings::update($this->params)){
            \FlashMessage::successMessage("Configurações alterada com sucesso.");  
            $this->returnToLastPage();
         }else{
            \FlashMessage::errorMessage("Não foi possível alterar as configurações.");
            $this->redirectTo("admin/config/geral");
         }
      }

      // public function updateOld(){
      //    $this->settings = \Settings::findByDescription($this->params['section'])[0];
      //    //var_dump($this->settings); exit;
      //    if ($this->settings->update($this->params['setting'])){
      //       \FlashMessage::successMessage("Configuração alterada com sucesso.");
      //       $this->returnToLastPage();
      //    }
      //    else{
      //       \FlashMessage::errorMessage("Erro ao alterar a configuração.");
      //       $this->redirectTo("admin/config/geral");
      //    }
      // }

      public function developer(){
         $this->setHeadTitle("Programador");
         $this->tests = \Settings::tests();
      }

      public function maintenance(){
         $this->maintenance = \Settings::maintenance();
         echo $this->maintenance;
         exit;
      }

	} 
?>