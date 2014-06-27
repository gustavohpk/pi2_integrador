<?php
	class Events extends BaseModel{
		private $idEvent;
		private $idParentEvent;
		private $isSubEvent;
		private $idEventType;		
		private $eventType;
		private $name;
		private $details;
		private $teacher;
		private $local;
		private $startDate;
		private $endDate;
		private $spaces;
		private $idPaymentType;				
		private $typeEvent;
		private $startDateRegistration;
		private $endDateRegistration;	

		public function setIdEvent($idEvent){
			$this->idEvent = $idEvent;
		}

		public function setIdParentEvent($idParentEvent){
			$this->idParentEvent = $idParentEvent;
			$this->isSubEvent = $idParentEvent > 0;
		}

		public function setIdEventType($idEventType){
			$this->idEventType = $idEventType;
		}

		public function setEventType($eventType){
			$this->eventType = $eventType;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function setDetails($details){
			$this->details = $details;
		}

		public function setTeacher($teacher){
			$this->teacher = $teacher;
		}

		public function setLocal($local){
			$this->local = $local;
		}

		public function setStartDate($startDate){
			$this->startDate = $startDate;
		}

		public function setEndDate($endDate){
			$this->endDate = $endDate;
		}

		public function setSpaces($spaces){
			$this->spaces = $spaces;
		}

		public function setIdPaymentType($idPaymentType){
			$this->idPaymentType = $idPaymentType;
		}

		public function setStartDateRegistration($startDateRegistration){
			$this->startDateRegistration = $startDateRegistration;
		}

		public function setEndDateRegistration($endDateRegistration){
			$this->endDateRegistration = $endDateRegistration;
		}

		public function getIdEvent(){
			return $this->idEvent;
		}

		public function getIdParentEvent(){
			return $this->idParentEvent;
		}

		public function isSubEvent(){
			return $this->isSubEvent;
		}

		public function getIdEventType(){
			return $this->getIdEventType;
		}

		public function getEventType(){
			return $this->eventType;
		}

		public function getName(){
			return $this->name;
		}

		public function getDetails(){
			return $this->details;
		}

		public function getTeacher(){
			return $this->teacher;
		}

		public function getLocal(){
			return $this->local;
		}

		public function getStartDate(){
			return $this->startDate;;
		}

		public function getEndDate(){
			return $this->endDate;
		}

		public function getSpaces(){
			return $this->spaces;
		}

		public function getIdPaymentType(){
			return $this->idPaymentType;
		}

		public function getStartDateRegistration(){
			return $this->startDateRegistration;
		}

		public function getEndDateRegistration(){
			return $this->endDateRegistration;
		}

		public static function all(){
			$sql = 
			"SELECT 
				event.*, event_type.event_type
			FROM 
				event
			NATURAL JOIN 
				event_type";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$events = array();			

			foreach ($rows as $row) {
				$events[] = new Events($row);
			}
				
			return $events;
		}	

		public static function find($params){
			$sql = 
			"SELECT 
				event.*, event_type.event_type
			FROM 
				event
			NATURAL JOIN 
				event_type
			WHERE " . $params['paramsName'];

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($params["paramsValue"]);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$events = array();			

			foreach ($rows as $row) {
				$events[] = new Events($row);
			}
				
			return $events;
		}

		public static function findById($id){
			$params = array("paramsName" => "id_event = :id_event", "paramsValue" => array(":id_event" => $id));
			//retorna apenas o primeiro objeto (no caso o unico)
			return self::find($params)[0];
		}

		public function update($data = array()){
			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE event SET %s WHERE id_event = ".$this->getIdEvent();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}

			$statment->execute($param);
		}

		public function save(){
			$sql = 
			"INSERT INTO event
				(id_event_type, name, details, teacher, local, start_date, end_date, 
				spaces, id_payment_type, start_date_registration, end_date_registration)
			VALUES
				(:id_event_type, :name, :details, :teacher, :local, :start_date, :end_date,
				:spaces, :id_payment_type, :start_date_registration, :end_date_registration)";

			$params = array(
					":id_event_type" => 1,
					":name" => $this->getName(),
					":details" => $this->getDetails(),
					":teacher" => $this->getTeacher(),
					":local" => $this->getLocal(),
					":start_date" => $this->getStartDate(),
					":end_date" => $this->getEndDate(),
					":spaces" => $this->getSpaces(),
					":id_payment_type" => 1,
					":start_date_registration" => date('Y-m-d'),
					":end_date_registration" => date('Y-m-d')
				);

			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params);
		}

		public function remove(){
			$sql = "DELETE FROM event WHERE id_event = :id_event";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_event" => $this->getIdEvent());
			$statment->execute($params);
		}
	}
?>