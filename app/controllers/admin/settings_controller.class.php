<?php 
	namespace Admin;
	
	class SettingsController extends BaseAdminController{

      protected $actionForm;
		public function general() {
   		$this->setHeadTitle("Configurações Gerais");
         $this->settings = \Settings::find(array("description"), array("site_title"))[0];
         $this->actionForm = $this->getUri("admin/config");
         $this->configSection = 'site_title';
         $this->maintenance = \Settings::checkMaintenance();
		}

		public function theme(){
			$this->setHeadTitle("Configurações de Tema");
		}

		public function banners(){
			$this->setHeadTitle("Configurações dos banners");
         $this->bannersNames = \Settings::find(array("description"), array("banner%_name"), "LIKE");
         $this->bannersPaths = \Settings::find(array("description"), array("banner%_path"), "LIKE");
         // echo "<pre>"; var_dump($this->bannersPaths); exit;
         $this->actionForm = $this->getUri("admin/config");
         $this->titleBtnSubmit = "Alterar";
         $this->configSection = 'site_title';
		}

		public function payment(){
			$this->setHeadTitle("Configurações de Pagamento");
		}

      public function contacts(){
         $this->settings = \Settings::find(array("description"), array("contact_mail"))[0];
         $this->actionForm = $this->getUri("admin/config");
         $this->titleBtnSubmit = "Alterar";
         $this->setHeadTitle("Configurações de Contato");
         $this->configSection = 'contact_mail';
      }


      public function update(){
         $this->settings = \Settings::findByDescription($this->params['section'])[0];
         //var_dump($this->settings); exit;
         if ($this->settings->update($this->params['setting'])){
            \FlashMessage::successMessage("Configuração alterada com sucesso.");
            $this->returnToLastPage();
         }
         else{
            \FlashMessage::errorMessage("Erro ao alterar a configuração.");
            $this->redirectTo("admin/config/geral");
         }
      }

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