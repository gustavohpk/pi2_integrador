<?php 
	class Enrollment extends BaseModel{
		private $idEnrollment;
		private $idParticipant;
		private $participant;
		public $event;
		private $dateEnrollment;
		private $datePayment;
		private $idPaymentType;
		private $cost;

		public function setIdEnrollment($idEnrollment){
			$this->idEnrollment = $idEnrollment;
		}

		public function getIdEnrollment(){
			return $this->idEnrollment;
		}

		public function setIdParticipant($idParticipant){
			$this->idParticipant = $idParticipant;
		}

		public function getIdParticipant(){
			return $this->idParticipant;
		}

		public function setParticipant($participant){
			$this->participant = $participant;
		}

		public function getParticipant(){
			return $this->participant;
		}

		protected function setIdEvent($idEvent){
			$event = Events::findById($idEvent);
			$this->setEvent($event[0]);
		}

		public function setEvent($event){
			$this->event = $event;
		}

		public function setDateEnrollment($dateEnrollment){
			$this->dateEnrollment = $dateEnrollment;
		}

		public function getDateEnrollment(){
			return $this->dateEnrollment;
		}

		public function setDatePayment($datePayment){
			$this->datePayment = $datePayment;
		}

		public function getDatePayment(){
			return $this->datePayment;
		}

		public function setIdPaymentType($idPaymentType){
			$this->idPaymentType = $idPaymentType;
		}

		public function getIdPaymentType(){
			return $this->idPaymentType;
		}

		public function setCost($cost){
			$this->cost = $cost;
		}

		public function getCost(){
			return $this->cost;
		}

		public function validateData(){
			if ($this->getIdParticipant() < 1) $this->errors[] = "Nome do participante não informado.";
			if ($this->event->getIdEvent() < 1) $this->errors[] = "Evento não informado.";
			if ($this->getIdPaymentType() < 1) $this->errors[] = "Forma de pagamento não localizada.";
			if ($this->getCost() <= 0) $this->errors[] = "Valor do evento não localizado.";
		}

 		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);

			$sql = 
			"SELECT 
				enrollment.*, participant.name AS participant
			FROM
				enrollment			
			INNER JOIN
				participant ON participant.id_participant = enrollment.id_participant" . 
				($paramsName ? " WHERE " . $paramsName : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($paramsValue);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$enrollments = array();			

			foreach ($rows as $row) {
				$enrollments[] = new Enrollment($row);
			}
			
			return $enrollments;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			return self::find(array("id_enrollment"), array($id));
		}

		public function save(){
			if (!$this->isValidData()) return false;

			$sql = 
			"INSERT INTO enrollment
				(id_participant, id_event, date_enrollment, date_payment, id_payment_type, cost)
			VALUES
				(:id_participant, :id_event, :date_enrollment, :date_payment, :id_payment_type, :cost)";

			$params = array(
					":id_participant" => $this->getIdParticipant(),
					":id_event" => $this->event->getIdEvent(),
					":date_enrollment" => date("Y-m-d"),
					":date_payment" => null,
					":id_payment_type" => $this->getIdPaymentType(),
					":cost" => $this->getCost()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			$this->setIdEnrollment($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		public function remove(){
			$sql = "DELETE FROM enrollment WHERE id_enrollment = :id_enrollment";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_enrollment" => $this->getIdEnrollment());
			return $statment->execute($params);
		}
	}
?>