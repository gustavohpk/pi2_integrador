<?php 
	class AccountController extends BaseController{
		public function login() {
      		$this->title = "Login";
      		$this->setHeadTitle("Login");
   		}
		public function register() {
      		$this->title = "Cadastro";
      		$this->setHeadTitle("Cadastro");
   		}
	} 
?>