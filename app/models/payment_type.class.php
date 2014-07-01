<?php
	class PaymentType extends BaseModel{
		private $idPaymentType;
		private $name;
		
		public function setIdPaymentType($idPaymentType){
			$this->idPaymentType = $idPaymentType;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function getIdPaymentType(){
			return $this->idPaymentType;
		}

		public function getName(){
			return $this->name;
		}

		public static function find($params = null){
			$sql = "SELECT * FROM payment_type " . (!is_null($params) ? " WHERE " . $params['paramsName'] : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params["paramsValue"]);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$paymentType = array();			

			foreach ($rows as $row) {
				$paymentType[] = new PaymentType($row);
			}
				
			return $paymentType;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			$params = array(
				"paramsName" => "id_payment_type = :id_payment_type", 
				"paramsValue" => array(":id_payment_type" => $id)
			);
			//retorna apenas o primeiro objeto (no caso o unico)
			$paymentType = self::find($params);
			return count($paymentType) > 0 ? $paymentType[0] : NULL;
		}

		public function save(){
			$sql = 
			"INSERT INTO payment_type
				(name)
			VALUES
				(:name)";
			$params = array(":name" => $this->getName());
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
			$sql = "UPDATE payment_type SET %s WHERE id_payment_type = ".$this->getIdPaymentType();
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
			$sql = "DELETE FROM payment_type WHERE id_payment_type = :id_payment_type";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_payment_type" => $this->getIdPaymentType());
			return $statment->execute($params);
		}
	}
?>