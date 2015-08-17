<?php

	/**
	 * Classe de gerência de Estatos (status) de inscrição
	 * @author Gustavo Pchek
	 */
	class EnrollmentStatus extends BaseModel{

		/**
	     * @var int $idEnrollmentStatus ID do status de evento
	     * @var string $code Código do status
	     * @var string $name Nome do status
	     * @var string $description Descrição do status
	     */
		private $idEnrollmentStatus;
		private $code;
		private $name;
		private $description;
		
		public function setIdEnrollmentStatus($idEnrollmentStatus){
			$this->idEnrollmentStatus = $idEnrollmentStatus;
		}

		public function getIdEnrollmentStatus(){
			return $this->idEnrollmentStatus;
		}

		public function setCode($code){
			$this->code = $code;
		}

		public function getCode(){
			return $this->code;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function getName(){
			return $this->name;
		}

		public function setDescription($description){
			$this->description = $description;
		}

		public function getDescription(){
			return $this->description;
		}



		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND", $order = "id_enrollment_status", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT * FROM enrollment_status" .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$enrollmentStatus = array();			

			foreach ($rows as $row) {
				$enrollmentStatus[] = new EnrollmentStatus($row);
			}
				
			return $enrollmentStatus;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			$enrollmentStatus = self::find(array("id_enrollment_status"), array($id));
			return count($enrollmentStatus) > 0 ? $enrollmentStatus : NULL;
		}

		public function save(){
			$sql = 
			"INSERT INTO enrollment_status
				(code, name, description)
			VALUES
				(:code, :name, :description)";

			$params = array(
					":code" => $this->getCode(),
					":name" => $this->getName(),
					":description" => $this->getDescription()
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
			$sql = "UPDATE enrollment_status SET %s WHERE id_enrollment_status = ".$this->getIdEnrollmentStatus();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}
	
			return $statment->execute($param);
		}

		public function remove(){
			$sql = "DELETE FROM event_type WHERE id_event_type = :id_event_type";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_event_type" => $this->getIdEventType());
			return $statment->execute($params);
		}

		public static function count(){
			$sql = "SELECT count(id_event_type) as count FROM event_type";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}
	}
?>