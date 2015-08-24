<?php

/**
 * Classe que gerencia certificados.
 * @author Gustavo Pchek
 */

	class Certificate extends BaseModel{

		/**
	     * @var int $idCertificate ID do certificado
	     * @var int $idEnrollment ID da inscrição
	     * @var string $code Código único
	     */
		private $idCertificate, $idEnrollment, $code;

		/**
		 * @var Enrollment $enrollment A inscrição relacionada ao certificado
		 */
		public $enrollment;
		
		public function setIdCertificate($idCertificate){
			$this->idCertificate = $idCertificate;
		}

		public function setIdEnrollment($idEnrollment){
			$this->idEnrollment = $idEnrollment;
			$enrollment = Enrollment::findById($idEnrollment);
			$this->setEnrollment($enrollment[0]);
		}

		public function setCode($code){
			$this->code = $code;
		}

		public function setEnrollment($enrollment){
			$this->enrollment = $enrollment;
		}

		public function getIdCertificate(){
			return $this->idCertificate;
		}

		public function getIdEnrollment(){
			return $this->idEnrollment;
		}

		public function getCode(){
			return $this->code;
		}

		public function getEnrollment(){
			return $this->enrollment;
		}

		private function generateCode(){
			$code = uniqid("e-");
			$this->code = $code;
		}


		/**
	     * Busca por certificados
	     * @param mixed[] $params Os parâmetros (atributos / colunas)
	     * @param mixed[] $values valores
	     * @param string $comparsion O operador de comparação
	     * @param string $conjunctive O operador de conjunção
	     * @param string $order Ordernar resultados por este campo
	     * @param string $direction Ordem ascendente ou descendente dos resultados
	     * @return Certificate[] Resultado da busca
	     */
		public static function find($params = array(), $values = array(), $comparsion = "=", $conjunctive = "AND", $order = "id_certificate", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $comparsion, $conjunctive);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT * FROM certificate" .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$certificates = array();			

			foreach ($rows as $row) {
				$certificates[] = new Certificate($row);
			}
				
			return $certificates;
		}


		public static function all(){
			return self::find();
		}

		/**
	     * Busca por certificados a partir do id
	     * @param $id Id do certificado
	     * @return Certificate[] Resultado da busca
	     */
		public static function findById($id){
			$sql = "SELECT * FROM certificate WHERE id_certificate = :id_certificate";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_certificate" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $certificates = array();

	        if($result){
	            $certificates[] = new Certificate($result[0]);
	        }

	        return count($certificates) > 0 ? $certificates : NULL;
		}

		/**
	     * Busca por certificados a partir do id do participante
	     * @param $id Id do participante
	     * @return Certificate[] Resultado da busca
	     */
		public static function findByIdParticipant($id){
			$sql = "SELECT * FROM certificate WHERE id_participant = :id_participant";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_participant" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $certificates = array();

	        if($result){
	            $certificates[] = new Certificate($result[0]);
	        }

	        return count($certificates) > 0 ? $certificates : NULL;
		}

		/**
	     * Busca por certificados a partir do id da inscrição
	     * @param $id Id da inscrição
	     * @return Certificate[] Resultado da busca
	     */
		public static function findByIdEnrollment($id){
			$sql = "SELECT * FROM certificate WHERE id_enrollment = :id_enrollment";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_enrollment" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $certificates = array();

	        if($result){
	            $certificates[] = new Certificate($result[0]);
	        }

	        return count($certificates) > 0 ? $certificates : NULL;
		}

		/**
	     * Busca por certificados a partir do id do código
	     * @param $code Código
	     * @return Certificate[] Resultado da busca
	     */
		public static function findByCode($code){
			$sql = "SELECT * FROM code WHERE code = :code";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":code" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $certificates = array();

	        if($result){
	            $certificates[] = new Certificate($result[0]);
	        }

	        return count($certificates) > 0 ? $certificates : NULL;
		}

		/**
	     * Cria uma certificado
	     * @return boolean Resultado da criação
	     */
		public function save(){
			$this->generateCode();
			$sql = 
			"INSERT INTO certificate
				(id_enrollment, code)
			VALUES
				(:id_enrollment, :code)";

			$params = array(
					":id_enrollment" => $this->getIdEnrollment(),
					":code" => $this->getCode()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params);
			$this->setIdCertificate($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		// public function update($data = array()){
		// 	$this->setData($data);

		// 	$keys = array_keys($data);
		// 	foreach ($keys as $key) {
		// 		$params .= "$key = :$key, ";
		// 	}

		// 	//remove a ultima (",") virgula
		// 	$params = substr($params, 0, -2);
		// 	$sql = "UPDATE certificate SET %s WHERE id_certificate = ".$this->getIdCertificate();
		// 	$sql = sprintf($sql, $params);
		// 	$pdo = \Database::getConnection();
		// 	$statment = $pdo->prepare($sql);
			
		// 	$param = array();
		// 	foreach ($keys as $key){
		// 		$param[":$key"] = $data[$key];
		// 	}
	
		// 	return $statment->execute($param);
		// }

		/**
	     * Conta quantos certificados
	     * @return int Resultado da contagem
	     */
		public static function count(){
			$sql = "SELECT count(id_certificate) as count FROM certificate";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}

		/**
	     * Exclui o certificado
	     * @return boolean Resultado da exclusão
	     */
		public function remove(){
			$sql = "DELETE FROM certificate WHERE id_certificate = :id_certificate";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_certificate" => $this->getIdCertificate());
			return $statment->execute($params);
		}
	}
?>