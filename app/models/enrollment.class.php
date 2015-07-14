<?php 

/**
 * Classe de inscrição
 * @author Gustavo Pchek
 * @author Rodrigo Miss
 */

	class Enrollment extends BaseModel{

		/**
		 * @var int $idEnrollment Id da inscrição
		 * @var int $idEnrollmentStatus Id do estado da inscrição
		 * @var int $idParticipant Id do participante
		 * @var int $idPaymentTime Id do tipo de pagamento
		 * @var datetime $dateEnrollment Data e hora da realização da inscrição
		 * @var datetime $datePayment Data e hora em que foi realizado o pagamento
		 * @var float $cost Valor da inscrição
		 * @var boolean $attendance Verificador de presença/ausência
		 * @var int Nota/avaliação do evento
		 * @var boolean Indica se usou ou não bônus
		 * @var string Dados adicionais enviados pelo participante
		 */
		private $idEnrollment;
		private $idEnrollmentStatus;
		private $idParticipant;
		private $idPaymentType;
		private $dateEnrollment;
		private $datePayment;
		private $cost;
		private $uriPayment;
		private $attendance;
		private $participantData;
		private $rating;
		private $bonus;
		private $additionalInfo;

		/**
		 * @var EnrollmentStatus $enrollmentStatus Estado da inscrição
		 * @var Participant $participant Participante
		 * @var Event $event Evento
		 */
		public $enrollmentStatus;
		public $participant;
		public $event;

		public function setIdEnrollment($idEnrollment){
			$this->idEnrollment = $idEnrollment;
		}

		public function getIdEnrollment(){
			return $this->idEnrollment;
		}

		public function setIdEnrollmentStatus($idEnrollmentStatus){
			// $this->idEnrollmentStatus = $idEnrollmentStatus;
			$status = EnrollmentStatus::findById($idEnrollmentStatus);
			$this->setEnrollmentStatus($status[0]);
		}

		public function getIdEnrollmentStatus(){
			return $this->idEnrollmentStatus;
		}

		public function setEnrollmentStatus($enrollmentStatus){
			$this->enrollmentStatus = $enrollmentStatus;
		}

		public function getEnrollmentStatus(){
			return $this->enrollmentStatus;
		}

		public function setIdParticipant($idParticipant){
			$this->participant = Participant::findById($idParticipant)[0];
		}

		public function getIdParticipant(){
			return $this->idParticipant;
		}

		protected function setIdEvent($idEvent){
			$event = Event::findById($idEvent);
			$this->setEvent($event[0]);
		}

		public function setEvent($event){
			$this->event = $event;
		}

		public function getEvent(){
			return $this->event;
		}

		public function setDateEnrollment($dateEnrollment){
			$this->dateEnrollment = $dateEnrollment;
		}

		public function getDateEnrollment($format = "Y-m-d H:i:s"){
			return is_null($this->dateEnrollment) ? null : date($format, strtotime($this->dateEnrollment));
		}

		public function setDatePayment($datePayment){
			$this->datePayment = $datePayment;
		}

		public function setAttendance($attendance){
			$this->attendance = $attendance;
		}

		public function getDatePayment($format = "Y-m-d H:i:s"){
			return is_null($this->datePayment) ? null : date($format, strtotime($this->datePayment));
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

		public function setUriPayment($uriPayment) {
			$this->uriPayment = $uriPayment;
		}

		public function getUriPayment() {
			return $this->uriPayment;
		}

		public function getAttendance() {
			return $this->attendance;
		}

		public function setParticipantData($participantData){
			$this->participantData = $participantData;
		}

		public function getParticipantData(){
			return $this->participantData;
		}

		public function setRating($rating){
			$this->rating = $rating;
		}

		public function setBonus($bonus){
			$this->bonus = $bonus;
		}

		public function getRating(){
			return $this->rating;
		}

		public function getBonus(){
			return $this->bonus;
		}

		public function getAdditionalInfo(){
			return $this->getAdditionalInfo();
		}

		public function setAdditionalInfo($additionalInfo){
			$this->additionalInfo = $additionalInfo;
		}

		// mensagens exibidas para confirmação da inscrição do participante
		private function setMessage($message, $type) {
			if (!isset($_SESSION["msg_enrollment"])) {
				$_SESSION["msg_enrollment"] = array();
			}
			$_SESSION["msg_enrollment"][] = array("type" => $type, "message" => $message);
		}

		public function setMessageSuccess($message) {
			$this->setMessage($message, "success");
		}

		public function setMessageError($message) {
			$this->setMessage($message, "error");
		}

		public function getMessagesConfirmation() {
			$messages = (isset($_SESSION["msg_enrollment"]) ? $_SESSION["msg_enrollment"] : array());
			unset($_SESSION["msg_enrollment"]);
			return $messages;
		}

		public function validateData(){
			if($this->participant->getIdParticipant() < 1) $this->errors[] = "Nome do participante não informado.";
			if($this->event->getIdEvent() < 1) $this->errors[] = "Evento não informado.";
			if(!$this->event->getEnabled() || $this->event->getNoEnrollment()) $this->errors[] = "Não é possível se inscrever neste evento.";
			if(!$this->event->getFree() && $this->getIdPaymentType() < 1) $this->errors[] = "Forma de pagamento não localizada.";
			if(!$this->event->getFree() && $this->getCost() <= 0) $this->errors[] = "Valor do evento não localizado.";
		}

 		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);

			$sql = 
			"SELECT 
				enrollment.*
			FROM
				enrollment" . ($paramsName ? " WHERE " . $paramsName : "") . 
			" ORDER BY 
				id_enrollment DESC";
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

		public static function findByIdEvent($id){
			return self::find(array("id_event"), array($id));
		}

		public static function findByIdParticipant($id){
			return self::find(array("id_participant"), array($id));
		}

		public function save(){
			if (!$this->isValidData()) return false;

			if(self::find(array("id_event", "id_participant"), array($this->event->getIdEvent(), $this->participant->getIdParticipant()))){
				$this->setMessageError("Você já se inscreveu neste evento.");
				return false;
			}

			if($this->getBonus())
				$this->setCost(0);

			$sql = 
			"INSERT INTO enrollment
				(id_participant, id_enrollment_status, id_event, date_enrollment, date_payment, id_payment_type, cost, bonus)
			VALUES
				(:id_participant, :id_enrollment_status, :id_event, :date_enrollment, :date_payment, :id_payment_type, :cost, :bonus)";

			$params = array(
					":id_participant" => $this->participant->getIdParticipant(),
					":id_enrollment_status" => EnrollmentStatus::find(array("code"), array("pending"))[0]->getIdEnrollmentStatus(),
					":id_event" => $this->event->getIdEvent(),
					":date_enrollment" => date("Y-m-d H:i:s"),
					":date_payment" => null,
					":id_payment_type" => $this->getIdPaymentType(),
					":cost" => $this->getCost(),
					":bonus" => $this->getBonus()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			$this->setIdEnrollment($pdo->lastInsertId());
			if($statment){
				\Event::removeSpaces($this->event->getIdEvent());
			}
			return $statment ? $this : false;
		}

		public function remove(){
			$sql = "DELETE FROM enrollment WHERE id_enrollment = :id_enrollment";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_enrollment" => $this->getIdEnrollment());
			$statment = $statment->execute($params);
			// if($statment){
			// 	\Event::addSpaces($this->event->getIdEvent());
			// }
			return $statment;
		}

		private function modifyUriPayment($uri) {
			$sql = "UPDATE enrollment SET uri_payment = :uri_payment WHERE id_enrollment = :id_enrollment";
			$params = array(
					":id_enrollment" => $this->getIdEnrollment(),
					":uri_payment" => $this->getUriPayment()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);		
			return $statment;
		}

		public function executePayment($item) {
			require_once APP_ROOT_FOLDER . '/main/classes/pagseguro/PagSeguroLibrary/PagSeguroLibrary.php';
         	$pagseguro = new PagSeguroPaymentRequest();       
         	
     		if ($event = Event::findById($item["id_event"])) {
     			$event = $event[0];
   				$pagseguro->addItem(
				        $event->getIdEvent(),
				        $event->getName(),
				        1, //QTDE
				        $event->cost[0]->getCostOfDay(),
				        0 //PESO
				     );
			}
         	
			$pagseguro->setCurrency("BRL");
			$pagseguro->setShippingType(3); //Frete 3 = não especificado
			$pagseguro->setReference($this->getIdEnrollment());
			$pagseguro->setSender(
					$this->participant->getName(), 
					$this->participant->getEmail(),
					substr($this->participant->getPhone(), 0, 2), 
					substr($this->participant->getPhone(), 2)
				);
			$pagseguro->setShippingAddress(
					$this->participant->getZipcode(), 
					$this->participant->getAddress(), 
					$this->participant->getNumber(), 
					$this->participant->getComplement(),  
					$this->participant->getDistrict(),
					$this->participant->getCity(), $this->participant->getState(), 'BRA'
				);
			$credenciais = new PagSeguroAccountCredentials('rodrigomiss@hotmail.com', 'A3F7B6573E8B40E4AF0A58F0F059F6DA');
			$this->uriPayment = $pagseguro->register($credenciais);
			$this->modifyUriPayment($this->uriPayment);
			return $this->getUriPayment();
		}

		public function checkAttendance($params){
			//var_dump($params); exit;
			foreach ($params as $key => $enrollmentStatus) {
				//var_dump($key);
				//var_dump($enrollment); exit;
				$status = $enrollmentStatus? true : false;
				$sql = "UPDATE enrollment SET attendance = :attendance WHERE id_enrollment = :id_enrollment";
				$pdo = \Database::getConnection();
				$statment = $pdo->prepare($sql);
				$statment->execute(array(":attendance"=>$status, ":id_enrollment"=>$key));
			}
		}

		public function updateRating($rating){
			//Validação - A nota tem que estar entre 1 e 5 e só é possível avaliar se a presença for confirmada
			if($rating < 1 || $rating > 5 || $this->getAttendance() == 0){
				return 0;
			} else {
				$sql = "UPDATE enrollment SET rating = :rating WHERE id_enrollment = :id_enrollment";
				$pdo = \Database::getConnection();
				$statment = $pdo->prepare($sql);
				return $statment->execute(array(":rating"=> $rating, ":id_enrollment"=> $this->getIdEnrollment()));
			}
		}

		public function setPayment($date = null){
			$date = is_null($date) ? date("Y-m-d H:i:s") : $date;
			$sql = 
			"UPDATE
				enrollment
			SET 
				date_payment = :date_payment
			WHERE
				id_enrollment = :id_enrollment";
			$params = array(				
					":date_payment" => $date,
					":id_enrollment" => $this->getIdEnrollment()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function cancelPayment(){
			$sql = 
			"UPDATE
				enrollment
			SET 
				date_payment = null
			WHERE
				id_enrollment = :id_enrollment";
			$params = array(":id_enrollment" => $this->getIdEnrollment());
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}
	}
?>