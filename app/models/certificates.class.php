<?php

/**
 * Classe que gerencia certificados.
 * @author Gustavo Pchek
 */

	class Certificates extends BaseModel{

		/**
	     * @var int $idCertificate ID do certificado
	     * @var int $idEnrollment ID da inscrição
	     */
		private $idCertificate, $idEnrollment;
		
		public function setIdCertificate($idCertificate){
			$this->idCertificate = $idCertificate;
		}

		public function setIdEnrollment($idEnrollment){
			$this->idEnrollment = $idEnrollment;
		}

		public function getIdCertificate(){
			return $this->idCertificate;
		}

		public function getIdEnrollment(){
			return $this->idEnrollment;
		}

		public static function find($params = null){
			$sql = "SELECT * FROM certificate " . (!is_null($params) ? " WHERE " . $params['paramsName'] : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params["paramsValue"]);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$certificates = array();			

			foreach ($rows as $row) {
				$certificates[] = new Certificates($row);
			}
				
			return $certificates;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			$params = array(
				"paramsName" => "id_certificate = :id_certificate", 
				"paramsValue" => array(":id_certificate" => $id)
			);
			$certificates = self::find($params);
			return count($certificates) > 0 ? $certificates : NULL;
		}

		public function save(){
			$sql = 
			"INSERT INTO certificate
				(id_enrollment)
			VALUES
				(:id_enrollment)";

			$params = array(
					":id_enrollment" => $this->getIdEnrollment(),
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function update($data = array()){
			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE certificate SET %s WHERE id_certificate = ".$this->getIdCertificate();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}
	
			return $statment->execute($param);
		}

		public static function count(){
			$sql = "SELECT count(id_certificate) as count FROM certificate";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}

		public function remove(){
			$sql = "DELETE FROM certificate WHERE id_certificate = :id_certificate";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_certificate" => $this->getIdCertificate());
			return $statment->execute($params);
		}
	}
?>