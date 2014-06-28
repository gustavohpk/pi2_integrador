<?php 
	namespace Admin;
	
	class LoginController extends BaseAdminController{
      public function __construct(){
         $this->layout = "admin/layout/layout_login.phtml";
      }

      /* importante declarar o método beforeAction para subescrever
      * o método da superclasse pra não entrar em loop infinito por causa dos redirecionamento para login
      */
      public function beforeAction(){
         if (Administrator::getCurrentAdminLogged()){
            $this->redirectTo("admin");
         }
      } 

		public function index(){
   		$this->setHeadTitle("Login");
		}

      public function login(){         
         $admin = Administrator::login($this->params["admin"]["login"], $this->params["admin"]["password"]);
         $this->redirectTo($admin ? "admin" : "admin/login");
      }

      public function logout(){
         Administrator::logout();
         $this->redirectTo("");
      }
	} 
?>