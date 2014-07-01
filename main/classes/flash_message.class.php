<?php

class FlashMessage {

	static function successMessage($msg) {
		self::setMessage($msg, 'success');
	}

	static function errorMessage($msg) {
		self::setMessage($msg, 'danger');
	}

	static function warningMessage($msg) {
		self::setMessage($msg, 'warning');
	}

	static function infoMessage($msg) {
		self::setMessage($msg, 'info');
	}

	private static function setMessage($msg, $type) {
		self::startSession();
		$_SESSION["flash"][] = array(
			'content' => $msg, 
			'type' => $type);
	}

	private static function startSession() {
		if (!isset($_SESSION["flash"])) {
			$_SESSION["flash"] = array();
		}
	}

	static function getMessages() {
		self::startSession();
		$messages = $_SESSION["flash"];
		$_SESSION["flash"] = array();
		return $messages;
	}

}