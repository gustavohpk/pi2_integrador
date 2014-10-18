<?php
/**
  * Gerenciador de mensagens Flash.
  * @author Gustavo Pchek
  * @author Rodrigo Miss
  */

class FlashMessage {

	/**
	 * Mensagem flash de sucesso.
	 * @param string $msg Mensagem a ser formatada.
	 */
	static function successMessage($msg) {
		self::setMessage($msg, 'success');
	}

	/**
	 * Mensagem flash de erro.
	 * @param string $msg Mensagem a ser formatada.
	 */
	static function errorMessage($msg) {
		self::setMessage($msg, 'danger');
	}

	/**
	 * Mensagem flash de alerta.
	 * @param string $msg Mensagem a ser formatada.
	 */
	static function warningMessage($msg) {
		self::setMessage($msg, 'warning');
	}

	/**
	 * Mensagem flash de informação.
	 * @param string $msg Mensagem a ser formatada.
	 */
	static function infoMessage($msg) {
		self::setMessage($msg, 'info');
	}

	/**
	 * Cria a mensagem flash.
	 * @param string $msg Mensagem.
	 * @param string $type Tipo da mensagem.
	 */
	private static function setMessage($msg, $type) {
		self::startSession();
		$_SESSION["flash"][] = array(
			'content' => $msg, 
			'type' => $type);
	}

	/**
	 * Inicia a sessão de mensagens flash.
	 */
	private static function startSession() {
		if (!isset($_SESSION["flash"])) {
			$_SESSION["flash"] = array();
		}
	}

	/**
	 * Obtêm as mensagens flash.
	 * @return array Array de mensagens flash.
	 */
	static function getMessages() {
		self::startSession();
		$messages = $_SESSION["flash"];
		$_SESSION["flash"] = array();
		return $messages;
	}

}