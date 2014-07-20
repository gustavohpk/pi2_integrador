<?php
	class EventsType extends BaseModel{
		private $idEventType;
		private $eventType;
		private $teacherType;
		
		public function setIdEventType($idEventType){
			$this->idEventType = $idEventType;
		}

		public function setEventType($eventType){
			$this->eventType = $eventType;
		}

		public function setTeacherType($teacherType){
			$this->teacherType = $teacherType;
		}

		public function getIdEventType(){
			return $this->idEventType;
		}

		public function getEventType(){
			return $this->eventType;
		}

		public function getTeacherType(){
			return $this->teacherType;
		}

		public static function find($params = null){
			$sql = "SELECT * FROM event_type " . (!is_null($params) ? " WHERE " . $params['paramsName'] : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params["paramsValue"]);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$eventsType = array();			

			foreach ($rows as $row) {
				$eventsType[] = new EventsType($row);
			}
				
			return $eventsType;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			$params = array(
				"paramsName" => "id_event_type = :id_event_type", 
				"paramsValue" => array(":id_event_type" => $id)
			);
			//retorna apenas o primeiro objeto (no caso o unico)
			$eventsType = self::find($params);
			return count($eventsType) > 0 ? $eventsType : NULL;
		}

		public function save(){
			$sql = 
			"INSERT INTO event_type
				(event_type, teacher_type)
			VALUES
				(:event_type, :teacher_type)";

			$params = array(
					":event_type" => $this->getEventType(),
					":teacher_type" => $this->getTeacherType()
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
			$sql = "UPDATE event_type SET %s WHERE id_event_type = ".$this->getIdEventType();
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
	}
?>