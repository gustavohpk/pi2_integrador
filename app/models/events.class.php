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
		private $startTime;
		private $endDate;
		private $endTime;
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
			$this->startDate = $this->formatDateTime($startDate, "Y-m-d");
			$this->setStartTime($startDate);
		}

		public function setStartTime($startTime){
			$this->startTime =  $this->formatDateTime($startTime, "H:i");
		}

		public function setEndDate($endDate){
			$this->endDate = $this->formatDateTime($endDate, "Y-m-d");
			$this->setEndTime($endDate);
		}

		public function setEndTime($endTime){
			$this->endTime =  $this->formatDateTime($endTime, "H:i");	
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
			return $this->idEventType;
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
			return $this->formatDateTime($this->startDate, "d/m/Y");
		}

		public function getStartTime(){
			return $this->startTime;
		}

		public function getEndDate(){
			return $this->formatDateTime($this->endDate, "d/m/Y");
		}

		public function getEndTime(){
			return $this->endTime;
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

		public static function find($params = null, $limit = 3, $page = 1){
			$start = ($page * $limit) - $limit;
			$sql = 
			"SELECT 
				event.*, event_type.event_type
			FROM 
				event
			NATURAL JOIN 
				event_type";

			if (!is_null($params)){
				$sql .= " WHERE " . $params['paramsName'];
			}

			$sql .= " LIMIT $start, $limit";

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

		public static function all(){
			return self::find();
		}

		public static function count(){
			$sql = "SELECT id_event FROM event";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			return count($rows);
		}

		public static function findById($id){
			$params = array("paramsName" => "id_event = :id_event", "paramsValue" => array(":id_event" => $id));
			//retorna apenas o primeiro objeto (no caso o unico)
			$events = self::find($params);
			return count($events) > 0 ? $events[0] : NULL;
		}

		public function update($data = array()){
			$data["start_date"] .= " " . $data["start_time"];
			$data["start_date"] = $this->formatDateTime($data["start_date"]);
			$data["end_date"] .= " " . $data["end_time"];
			$data["end_date"] = $this->formatDateTime($data["end_date"]);
			unset($data["start_time"]);
			unset($data["end_time"]);

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
	
			return $statment->execute($param);
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
					":id_event_type" => $this->getIdEventType(),
					":name" => $this->getName(),
					":details" => $this->getDetails(),
					":teacher" => $this->getTeacher(),
					":local" => $this->getLocal(),
					":start_date" => $this->startDate . " " . $this->startTime,
					":end_date" => $this->endDate . " " . $this->endTime,
					":spaces" => $this->getSpaces(),
					":id_payment_type" => $this->getIdPaymentType(),
					":start_date_registration" => date('Y-m-d'),
					":end_date_registration" => date('Y-m-d')
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function remove(){
			$sql = "DELETE FROM event WHERE id_event = :id_event";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_event" => $this->getIdEvent());
			return $statment->execute($params);
		}
	}
?>