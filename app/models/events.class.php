<?php
	class Events extends BaseModel{
		private $idEvent;
		private $idParentEvent;
		public $parentEvent;
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
		private $startDateEnrollment;
		private $endDateEnrollment;	
		public $cost;

		public function setIdEvent($idEvent){
			$this->idEvent = $idEvent;
			$this->cost = CostEvent::findByIdEvent($idEvent);
		}

		public function getIdEvent(){
			return $this->idEvent;
		}

		public function setIdParentEvent($idParentEvent){
			$this->idParentEvent = ($idParentEvent > 0 ? $idParentEvent : null);
			$this->isSubEvent = $idParentEvent > 0;

			if ($this->idParentEvent && $parentEvent = Events::findById($this->idParentEvent)) {
				$this->parentEvent = $parentEvent[0];
			}
		}

		public function isSubEvent(){
			return $this->isSubEvent;
		}

		public function getIdParentEvent(){
			return $this->idParentEvent;
		}

		public function setIdEventType($idEventType){
			$this->idEventType = $idEventType;
		}

		public function getIdEventType(){
			return $this->idEventType;
		}

		public function setEventType($eventType){
			$this->eventType = $eventType;
		}

		public function getEventType(){
			return $this->eventType;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function getName(){
			return $this->name;
		}

		public function setDetails($details){
			$this->details = $details;
		}

		public function getDetails(){
			return $this->details;
		}

		public function setTeacher($teacher){
			$this->teacher = $teacher;
		}

		public function getTeacher(){
			return $this->teacher;
		}

		public function setLocal($local){
			$this->local = $local;
		}

		public function getLocal(){
			return $this->local;
		}

		public function setStartDate($startDate){			
			$this->startDate = empty($startDate) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $startDate)));
		}

		public function getStartDate($format = "Y-m-d H:i:s"){
			return is_null($this->startDate) ? null : date($format, strtotime($this->startDate));
		}

		public function setEndDate($endDate){
			$this->endDate = empty($endDate) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $endDate)));
		}

		public function getEndDate($format = "Y-m-d H:i:s"){
			return is_null($this->endDate) ? null : date($format, strtotime($this->endDate));
		}

		public function setStartDateEnrollment($startDateEnrollment){
			$this->startDateEnrollment = empty($startDateEnrollment) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $startDateEnrollment)));
		}

		public function getStartDateEnrollment($format = "Y-m-d H:i:s"){
			return is_null($this->startDateEnrollment) ? null : date($format, strtotime($this->startDateEnrollment));
		}

		public function setEndDateEnrollment($endDateEnrollment){
			$this->endDateEnrollment = empty($endDateEnrollment) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $endDateEnrollment)));
		}

		public function getEndDateEnrollment($format = "Y-m-d H:i:s"){
			return is_null($this->endDateEnrollment) ? null : date($format, strtotime($this->endDateEnrollment));
		}

		public function setSpaces($spaces){
			$this->spaces = $spaces;
		}

		public function getSpaces(){
			return $this->spaces;
		}

		public function setIdPaymentType($idPaymentType){
			$this->idPaymentType = $idPaymentType;
		}

		public function getIdPaymentType(){
			return $this->idPaymentType;
		}

		function validateData() {
			if (strlen(trim($this->getName())) < 3) $this->errors[] = "Título do evento muito curto [min. 3 caracteres].";
			if ($this->getSpaces() < 1) $this->errors[] = "Informe a quantidade de vagas disponíveis.";
			if ($this->getStartDate() > $this->getEndDate()) $this->errors[] = "A data e hora de início do evento deve ser menor que a data de término";
			if ($this->getStartDateEnrollment() > $this->getEndDateEnrollment()) $this->errors[] = "A data e hora de início das inscrições deve ser menor que a data de término";
			if ($this->getIdParentEvent() && !$this->findById($this->getIdParentEvent())) $this->errors[] = "Evento à ser vinculado não foi localizado.";
			if (!PaymentType::findById($this->getIdPaymentType())) $this->errors[] = "Forma de pagamento não informada corretamente.";
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

		public static function customerSearch($searchValue) {
			$serachValue = preg_replace( '/[`^~\'"]/', null, iconv( 'UTF-8', 'ASCII//TRANSLIT', $searchValue ) );
			$serachValue = utf8_encode($searchValue);
			$searchValue = str_replace('%20', ' ', $searchValue);
			$searchValue = '%' . $searchValue . '%';
			$events = self::find(array("name"), array($searchValue), "LIKE");
			return $events;
		}

		public static function findNext($date){
			$events = self::find(array("end_date"), array($date), ">=");
			return $events;
		}

		public static function findPrev($date){
			$events = self::find(array("end_date"), array($date), "<");
			return $events;			
		}

		public static function all(){
			return self::find();
		}
		
		public function getEventsRelated() {
			if ($this->isSubEvent()) {
				// retorna evento pai e outros subeventos relacionados com evento pai
				return self::find(
					array("id_event", "id_parent_event"), 
					array($this->getIdParentEvent(), $this->getIdParentEvent()),
					"=",
					"OR"
				);		
			}
			else {
				// retorna subeventos
				return self::find(array("id_parent_event"), array($this->getIdEvent()));
			}
		}

		public function canEnrollment() {
			return (
				$this->eventInitiated() && !$this->eventFinalized() && 
				$this->enrollmentInitiated() && !$this->enrollmentFinalized()
			);
		}

		public function eventInitiated() {
			return ($this->getStartDate() <= date("Y-m-d H:i:s"));
		}

		public function eventFinalized() {
			return ($this->getEndDate() < date("Y-m-d H:i:s"));
		}

		public function enrollmentInitiated() {
			return ($this->getStartDateEnrollment() <= date("Y-m-d H:i:s"));
		}

		public function enrollmentFinalized() {
			return ($this->getEndDateEnrollment() < date("Y-m-d H:i:s"));
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

		public function save(){
			if (!$this->isValidData()) return false;

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
					":start_date" => $this->getStartDate(), 
					":end_date" => $this->getEndDate(),
					":spaces" => $this->getSpaces(),
					":id_payment_type" => $this->getIdPaymentType(),
					":start_date_enrollment" => $this->getStartDateEnrollment(),
					":end_date_enrollment" => $this->getEndDateEnrollment()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function update($data = array()){
			$this->setData($data);
			if (!$this->isValidData()) return false;

			$sql = 
			"UPDATE
				event
			SET
				id_event_type = :id_event_type,
				id_parent_event = :id_parent_event,
				name = :name,
				details = :details,
				teacher = :teacher, 
				local = :local,
				start_date = :start_date, 
				end_date = :end_date, 
				spaces = :spaces,
				id_payment_type = :id_payment_type, 
				start_date_enrollment = :start_date_enrollment, 
				end_date_enrollment = :end_date_enrollment
			WHERE
				id_event = :id_event";

			$params = array(
					":id_event_type" => $this->getIdEventType(),
					":id_parent_event" => $this->getIdParentEvent(),
					":name" => $this->getName(),
					":details" => $this->getDetails(),
					":teacher" => $this->getTeacher(),
					":local" => $this->getLocal(),
					":start_date" => $this->getStartDate(), 
					":end_date" => $this->getEndDate(),
					":spaces" => $this->getSpaces(),
					":id_payment_type" => $this->getIdPaymentType(),
					":start_date_enrollment" => $this->getStartDateEnrollment(),
					":end_date_enrollment" => $this->getEndDateEnrollment(),
					":id_event" => $this->getIdEvent()
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