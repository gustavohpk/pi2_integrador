<?php 
	class State extends BaseModel{
		private $idState;
		private $state;

   		public function setIdState($idState){
   			$this->idState = $idState;
   		}

   		public function setState($state){
   			$this->state = $state;
   		}

   		public function getIdState(){
   			return $this->idState;
   		}

   		public function getState(){
   			return $this->state;
   		}

   		public function validateData(){
   			if (strlen($this->getState()) < 2) $this->errors[] = "Estado não informado.";
   		}

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);
			$sql = "SELECT * FROM state" . (!is_null($paramsName) ? " WHERE " . $paramsName : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($paramsValue);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$states = array();			

			foreach ($rows as $row) {
				$states[] = new State($row);
			}
			
			return $states;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			//retorna apenas o primeiro objeto (no caso o unico)
			$state = self::find(array("id_state"), array($id));
			return count($state) > 0 ? $state[0] : NULL;
		}

		public static function findByName($state){
			$states = self::find(array("state"), array($state));
			return count($states) > 0 ? $states : NULL;
		}

		public function save(){
			if ($exists = $this->exists()) return $exists;
			if (!$this->isValidData()) return false;
			
			$sql = 
			"INSERT INTO state
				(state)
			VALUES
				(:state)";

			$params = array(
					":state" => $this->getState()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			$this->setIdState($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		//retorna primeiro state ou false se não existir
		public function exists(){
			$states = self::findByName($this->getState());
			return $states ? $states[0] : false;
		}
	}
?>