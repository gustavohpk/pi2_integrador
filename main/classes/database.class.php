<?php
/**
 *   @author Rodrigo Miss
 */

class Database{	

	/**
	 * Realiza a conexão com o banco de dados
	 * @return bool Retorna o resultado da conexão.
	 */	
	public static function getConnection(){
		require "database_config.php";

		$datasource = sprintf(
			"mysql:host=%s;port=%s;dbname=%s", 
			$db_host, 
			$db_port, 
			$db_name
		);

		$pdo = new PDO($datasource, $db_username, $db_password);
		$pdo->exec("set names utf8");
		return $pdo;
	}
}
?>