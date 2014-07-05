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

		public static function find($params = null){
			$sql = "SELECT * FROM state" . (!is_null($params) ? " WHERE " . $params['paramsName'] : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params["paramsValue"]);
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
			$params = array(
				"paramsName" => "id_state = :id_state", 
				"paramsValue" => array(":id_state" => $id)
			);
			//retorna apenas o primeiro objeto (no caso o unico)
			$state = self::find($params);
			return count($state) > 0 ? $state[0] : NULL;
		}

		public static function findByName($state){
			$params = array(
				"paramsName" => "state = :state", 
				"paramsValue" => array(":state" => $state)
			);
			$states = self::find($params);
			return count($states) > 0 ? $states : NULL;
		}

		public function save(){
			if ($exists = $this->exists()) return $exists;
			
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