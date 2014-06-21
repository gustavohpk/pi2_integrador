<?php 
	class AccountController extends BaseController{
		public function login() {
      		$this->setHeadTitle("Login");
   		}
		public function register() {
      		$this->setHeadTitle("Cadastro");
   		}
	} 
?>