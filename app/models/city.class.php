<?php 
	class City extends BaseModel{
		private $idCity;
		private $name;
		private $idState;
		private $state;

   		public function setIdCity($idCity){
   			$this->idCity = $idCity;
   		}

   		public function setName($name){
   			$this->name = $name;
   		}

   		public function setIdState($idState){
   			$this->idState = $idState;
   		}

   		public function setState($state){
   			$this->state = $state;
   		}

   		public function getIdCity(){
   			return $this->idCity;
   		}

   		public function getName(){
   			return $this->name;
   		}

   		public function getIdState(){
   			return $this->idState;
   		}

   		public function getState(){
   			return $this->state;
   		}

		public static function find($params = null){
			$sql = 
			"SELECT 
				city.*, state.state 
			FROM
				city
			INNER JOIN
				state ON state.id_state = city.id_state" . 
				(!is_null($params) ? " WHERE " . $params['paramsName'] : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params["paramsValue"]);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$citys = array();			

			foreach ($rows as $row) {
				$citys[] = new City($row);
			}
			
			return $citys;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			$params = array(
				"paramsName" => "id_city = :id_city", 
				"paramsValue" => array(":id_city" => $id)
			);
			//retorna apenas o primeiro objeto (no caso o unico)
			$city = self::find($params);
			return count($city) > 0 ? $city[0] : NULL;
		}

		public static function findByName($name){
			$params = array(
				"paramsName" => "name = :name", 
				"paramsValue" => array(":name" => $name)
			);
			//retorna apenas o primeiro objeto (no caso o unico)
			return self::find($params);
		}

		public function save(){
			if ($exists = $this->exists()) return $exists;

			$sql = 
			"INSERT INTO city
				(name, id_state)
			VALUES
				(:name, :id_state)";

			$params = array(
					":name" => $this->getName(),
					":id_state" => $this->getIdState()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			$this->setIdCity($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		//retorna primeira cidade ou false se não existir
		public function exists(){
			$params = array(
				"paramsName" => "name = :name AND state.id_state = :id_state", 
				"paramsValue" => array(
						":name" => $this->getName(),
						":id_state" => $this->getIdState()
					)
			);
			$city = self::find($params);
			return $city ? $city[0] : false;
		}
	}
?>