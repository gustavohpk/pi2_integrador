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
		private $startDateEnrollment;
		private $endDateEnrollment;	

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

		public function setStartDateEnrollment($startDateEnrollment){
			$this->startDateEnrollment = $startDateEnrollment;
		}

		public function setEndDateEnrollment($endDateEnrollment){
			$this->endDateEnrollment = $endDateEnrollment;
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

		public function getStartDateEnrollment(){
			return $this->startDateEnrollment;
		}

		public function getEndDateEnrollment(){
			return $this->endDateEnrollment;
		}

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT 
				event.*, event_type.event_type
			FROM 
				event
			NATURAL JOIN 
				event_type" .($paramsName ? " WHERE $paramsName" : "");

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$events = array();			

			foreach ($rows as $row) {
				$events[] = new Events($row);
			}
				
			return $events;
		}

		public static function findNext($date){
			$events = self::find(array("start_date"), array($date), ">=");
			return $events;
		}

		public static function findPrev($date){
			$events = self::find(array("start_date"), array($date), "<");
			return $events;			
		}

		public static function all(){
			return self::find();
		}

		public static function count(){
			$sql = "SELECT count(id_event) as count FROM event";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}

		public static function countNext(){
			$date = date("d-m-Y");
			return count(self::findNext($date));			
		}

		public static function countPrev(){
			$date = date("d-m-Y");
			return count(self::findPrev($data));
		}

		public static function findById($id){
			return self::find(array("id_event"), array($id));
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
				spaces, id_payment_type, start_date_enrollment, end_date_enrollment)
			VALUES
				(:id_event_type, :name, :details, :teacher, :local, :start_date, :end_date,
				:spaces, :id_payment_type, :start_date_enrollment, :end_date_enrollment)";

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
					":start_date_enrollment" => date('Y-m-d'),
					":end_date_enrollment" => date('Y-m-d')
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