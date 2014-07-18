<?php 
	namespace Admin;
	
	class LoginController extends BaseAdminController{
      public function __construct(){
         $this->layout = "admin/layout/layout_login.phtml";
      }

      /* importante declarar o método beforeAction para subescrever
      * o método da superclasse pra não entrar em loop infinito por causa dos redirecionamento para login
      */
      public function beforeAction(){}

		public function index(){
         if (Administrator::getCurrentAdminLogged()){
            $this->redirectTo("admin");
         }
         else{
   		 $this->setHeadTitle("Login");
         }
		}

      public function login(){       
         $admin = Administrator::login($this->params["admin"]["email"], $this->params["admin"]["password"]);
         if ($admin){
            \FlashMessage::infoMessage('<span class="glyphicon glyphicon-info-sign"></span> [teste] Olá. Nas últimas <strong>24 horas</strong> foram realizadas <strong>8 inscrições</strong>.');
            $this->redirectTo("admin");
         }
         else{
            \FlashMessage::errorMessage("Email ou senha incorreta.");
            $this->redirectTo("admin/login");
         }
      }

      public function logout(){
         Administrator::logout();
         $this->redirectTo("admin/login");
      }
	} 
?>