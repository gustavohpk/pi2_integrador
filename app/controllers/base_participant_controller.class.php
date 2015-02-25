<?php
	class BaseParticipantController extends BaseController {
		protected $currentParticipant;
		private $loginRequired;

		public function setLoginRequired($loginRequired) {
			$this->loginRequired = $loginRequired;
		}

		public function beforeAction(){
			if (!isset($_SESSION["participant"]) && $this->loginRequired) {
				flashMessage::infoMessage("Realize o login antes de continuar.");
				$this->saveUrl($_SERVER['REQUEST_URI']);
				$this->redirectTo("conta/login");
			}
			else {
				$this->currentParticipant = $_SESSION["participant"];
			}
		}
	}
?>