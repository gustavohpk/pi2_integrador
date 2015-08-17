<?php
/**
 * Classe para gerenciamento de eventos
 * @author Gustavo Pchek
 * @author Rodrigo Miss
 */

	class Event extends BaseModel{

		/**
		 * @var int $idEvent ID do evento
		 * @var int $idParentEvent ID do evento pai
		 * @var boolean $enabled Verifica se evento está ativado
		 * @var boolean $isSubEvent Verifica se é um subevento
		 * @var string $name Nome do evento
		 * @var string $path URL única
		 * @var string $details HTML com os detalhes do evento
		 * @var string $teacher Ministrante do evento
		 * @var string $location Local do evento
		 * @var string $address Endereço do evento
		 * @var datetime $startDate Data e hora de início do evento
		 * @var datetime $endDate Data e hora de fim do evento
		 * @var int $spaces Número de vagas
		 * @var datetime $startDateEnrollment Data e hora de início das inscrições
		 * @var datetime $endDateEnrollment Data e hora de término das inscrições
		 * @var int $views Contador de visualizações da página do evento
		 * @var mixed $logo Logotipo em formato BLOB
		 * @var boolean $sendParticipantData Indica se está habilitado o envio de texto pelo participante
		 * @var int $rating Avaliação total do evento
		 * @var int $evaluations Número de avaliações realizadas
		 * @var boolean $free Indica se o evento é gratuito
		 * @var boolean $noEnrollment Indica se o evento não permite inscrição
		 * @var boolean $autoConfirmEnrollment Indica se as inscrições deste evento serão confirmadas automaticamente
		 * @var float $basePrice Preço base do evento
		 */
		private $idEvent;
		private $idParentEvent;
		private $enabled;
		private $isSubEvent;
		private $name;
		private $path;
		private $details;
		private $teacher;
		private $location;
		private $address;
		private $startDate;
		private $endDate;
		private $spaces;
		private $startDateEnrollment;
		private $endDateEnrollment;	
		private $views;
		private $logo;
		private $sendParticipantData;
		private $rating;
		private $evaluations;
		private $free;
		private $noEnrollment;
		private $autoConfirmEnrollment;
		private $basePrice;

		/**
	     * @var EventType $eventType Tipo do evento
	     * @var Event $parentEvent Evento pai
	     * @var Cost[] $cost Lista de custos de evento
	     * @var Sponsor[] $sponsorship Lista de patrocinadores
	     * @var EventBonus[] $eventbonus Lista de bônus de evento
	     */
		public $eventType;
		public $parentEvent;
		public $cost;
		public $sponsorship;
		public $eventBonus;

		public function setIdEvent($idEvent){
			$this->idEvent = $idEvent;
			$this->cost = CostEvent::findByIdEvent($idEvent);
			$this->sponsorship = Sponsorship::findByIdEvent($idEvent);
			$this->eventBonus = EventBonus::findByIdEvent($idEvent);
		}

		public function getIdEvent(){
			return $this->idEvent;
		}

		public function setIdParentEvent($idParentEvent){
			$this->idParentEvent = ($idParentEvent > 0 ? $idParentEvent : null);
			$this->isSubEvent = $idParentEvent > 0;

			if ($this->idParentEvent && $parentEvent = Event::findById($this->idParentEvent)) {
				$this->parentEvent = $parentEvent[0];
			}
		}

		public function isSubEvent(){
			return $this->isSubEvent;
		}

		public function getIdParentEvent(){
			return $this->idParentEvent;
		}

		public function getParentEvent(){
			return $this->parentEvent;
		}

		public function setIdEventType($idEventType){
			$this->eventType = EventType::findById($idEventType)[0];
		}

		public function getEnabled(){
			return $this->enabled;
		}

		public function setEnabled($enabled){
			$this->enabled = $enabled;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function getName(){
			return $this->name;
		}

		public function setPath($path){
			$this->path = $path;
		}

		public function getPath(){
			return $this->path;
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

		public function setLocation($location){
			$this->location = $location;
		}

		public function getLocation(){
			return $this->location;
		}

		public function setAddress($address){
			$this->address = $address;
		}

		public function getAddress(){
			return $this->address;
		}

		public function setViews($views){
			$this->views = $views;
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

		public function getViews(){
			return $this->views;
		}

		public function getLogo(){
			return $this->logo;
		}

		public function setLogo($logo){
			$this->logo = $logo;
		}

		public function getSendParticipantData(){
			return $this->sendParticipantData;
		}

		public function setSendParticipantData($sendParticipantData){
			$this->sendParticipantData = $sendParticipantData;
		}

		public function getRating(){
			return $this->rating;
		}

		public function setRating($rating){
			$this->rating = $rating;
		}

		public function getEvaluations(){
			return $this->evaluations;
		}

		public function setEvaluations($evaluations){
			$this->evaluations = $evaluations;
		}

		public function getFree(){
			return $this->free;
		}

		public function setFree($free){
			$this->free = $free;
		}

		public function getNoEnrollment(){
			return $this->noEnrollment;
		}

		public function setNoEnrollment($noEnrollment){
			$this->noEnrollment = $noEnrollment;
		}

		public function getAutoConfirmEnrollment(){
			return $this->autoConfirmEnrollment;
		}

		public function setAutoConfirmEnrollment($autoConfirmEnrollment){
			$this->autoConfirmEnrollment = $autoConfirmEnrollment;
		}

		public function getBasePrice(){
			return $this->basePrice;
		}

		public function setBasePrice($basePrice){
			$this->basePrice = $basePrice;
		}

		/**
		 * Realiza a validação dos dados
		 */	
		function validateData() {
			if (strlen(trim($this->getName())) < 3) $this->errors[] = "Título do evento muito curto [min. 3 caracteres].";
			if ($this->getSpaces() < 1) $this->errors[] = "Informe a quantidade de vagas disponíveis.";
			if ($this->getStartDate() > $this->getEndDate()) $this->errors[] = "A data e hora de início do evento deve ser menor que a data de término";
			if ($this->getStartDateEnrollment() > $this->getEndDateEnrollment()) $this->errors[] = "A data e hora de início das inscrições deve ser menor que a data de término";
			if ($this->getIdParentEvent() && !$this->findById($this->getIdParentEvent())) $this->errors[] = "Evento à ser vinculado não foi locationizado.";
		}

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND", $order = "id_event", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);	
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT 
				*
			FROM 
				event " .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;
			$sql .= " LIMIT $start, $limit";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$events = array();		
			foreach ($rows as $row) {
				$events[] = new Event($row);
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


		/**
	     * Retorna os próximos eventos habilitados (visíveis)
	     * @return Event[] Eventos
	     */
		public static function findNext($date){
			$events = self::find(array("end_date", "enabled"), array($date, true), array(">=", "="), "AND" ,"start_date", "ASC");
			return $events;
		}

		/**
	     * Retorna os eventos anteriores habilitados (visíveis)
	     * @return Event[] Eventos
	     */
		public static function findPrev($date){
			$events = self::find(array("end_date", "enabled"), array($date, true), array("<", "="), "AND", "end_date", "DESC");
			foreach ($events as $key => $event) {
				if(!$event->getEnabled()){
					unset($events[$key]);
				}
			}
			return $events;			
		}

		public static function all(){
			return self::find();
		}
		
		public function getEventsRelated() {
			// retorna OUTROS subeventos relacionados com evento pai
			$sql = 
			"SELECT 
				*
			FROM 
				event
			WHERE
				(id_event = :id_parent_event) AND id_event <> :id_event)";
				// OR (id_parent_event = :id_event
			$params = array(
				":id_parent_event" => $this->getIdParentEvent(),
				":id_event" => $this->getIdEvent()
			);
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($params);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$events = array();			

			foreach ($rows as $row) {
				$events[] = new Event($row);
			}
				
			return $events;
		}

		public function getSponsors(){
			$sql = 
			"SELECT 
				*
			FROM 
				sponsorship
			WHERE
				(id_event = :id_event)";
			$params = array(
				":id_event" => $this->getIdEvent()
			);
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($params);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$sponsors = array();			

			foreach ($rows as $row) {
				$sponsors[] = Sponsors::findById($row["id_sponsor"])[0];
			}
				
			return $sponsors;
		}

		public function getEventTypes(){
			$sql = 
			"SELECT 
				*
			FROM 
				event_bonus
			WHERE
				(id_event = :id_event)";
			$params = array(
				":id_event" => $this->getIdEvent()
			);
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($params);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$sponsors = array();			

			foreach ($rows as $row) {
				$sponsors[] = EventType::findById($row["id_event_type"])[0];
			}
				
			return $sponsors;
		}

		public function getMedia($type = "p") {
			return Media::findByIdEvent($this->getIdEvent(), $type);
		}

		public function canEnrollment() {
			return (
				!$this->eventFinalized() && 
				$this->enrollmentInitiated() && !$this->enrollmentFinalized()
			);
		}

		public function eventInitiated() {
			return (strtotime($this->getStartDate()) <= strtotime(date("Y-m-d H:i:s")));
		}

		public function eventFinalized() {
			return (strtotime($this->getEndDate()) < strtotime(date("Y-m-d H:i:s")));
		}

		public function enrollmentInitiated() {
			return (strtotime($this->getStartDateEnrollment()) <= strtotime(date("Y-m-d H:i:s")));
		}

		public function enrollmentFinalized() {
			return (strtotime($this->getEndDateEnrollment()) < strtotime(date("Y-m-d H:i:s")));
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
			$date = date("Y-m-d");
			$sql = "SELECT count(id_event) as count FROM event WHERE enabled = true AND end_date >= CURDATE()";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];

		}

		public static function countPrev(){
			$date = date("Y-m-d");
			$sql = "SELECT count(id_event) as count FROM event WHERE enabled = true AND end_date < CURDATE()";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}

		/**
		 * Procura um evento a partir do ID
		 * @param int $idEvent O id do evento
		 */
		public static function findById($idEvent){
	        $sql = "SELECT * FROM event WHERE id_event = :id_event";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_event" => $idEvent);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $events = array();

	        if($result){
	            $events[] = new Event($result[0]);
	        }

	        return $events;
	    }

		/**
		 * Procura um evento a partir do caminho
		 * @param string $path O caminho do evento
		 */
		public static function findByPath($path){
	        $sql = "SELECT * FROM event WHERE path = :path";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":path" => $path);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);
	        $cities = array();

	        $events = array();

	        if($result){
	            $events[] = new Event($result[0]);
	        }

	        return $events;
	    }

	    public function setCost($costs) {
			unset($this->cost);
			foreach ($costs["cost"] as $key => $value) {
				$data = array(
					"id_cost_event" => isset($costs["id_cost_event"][$key]) ? $costs["id_cost_event"][$key] : null,
					"id_event" => $this->getIdEvent(),
					"cost" => $value, 
					"date_max" => $costs["date_max"][$key]
				);
				$this->cost[] = new CostEvent($data);
			}
		}

		public function setCostOld($costs) {
			// Exclui os preços que foram removidos
			$ids = array();
			foreach ($costs["id_cost_event"] as $id) {
				$ids[] = $id;
			}
			$ids = implode(",", $ids);

			$sql = "DELETE FROM cost_event WHERE id_event = :id_event AND id_cost_event NOT IN ($ids)";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_event" => $this->getIdEvent());
			$result = $statment->execute($params);			

			foreach ($costs["cost"] as $key => $value) {
				$data = array(
						"id_cost_event" => isset($costs["id_cost_event"][$key]) ? $costs["id_cost_event"][$key] : null,
						"id_event" => $this->getIdEvent(),
						"cost" => $value, 
						"date_max" => $costs["date_max"][$key]
					);
				$cost = &$this->cost[];
				$cost = new CostEvent($data);	
				if ($cost->getIdCostEvent()) {
					$cost->update($data);
				}
				else {
					$cost->save();
				}
			}
		}

		public function setSponsorship($sponsorships) {
			unset($this->sponsorship);
			foreach ($sponsorships as $key => $value) {
				if($value == "on"){
					$data = array(
						"id_sponsorship" => isset($sponsorships["id_sponsorship"][$key]) ? $sponsorships["id_sponsorship"][$key] : null,
						"id_event" => $this->getIdEvent(),
						"id_sponsor" => $key
					);
					$this->sponsorship[] = new Sponsorship($data);
				}
			}
		}

		/**
		 * Função que define os bônus de evento
		 * @param $eventBonus array Os dados dos bônus
		 */
		public function setBonus($eventBonus) {
			unset($this->eventBonus);
			foreach ($eventBonus["id_event_type"] as $key => $value) {
				$data = array(
					"id_event_bonus" => isset($eventBonus["id_event_bonus"][$key]) ? $eventBonus["id_event_bonus"][$key] : null,
					"id_event" => $this->getIdEvent(),
					"id_event_type" => $eventBonus["id_event_type"][$key],
					"quantity" => $eventBonus["quantity"][$key]
				);
				$this->eventBonus[] = new EventBonus($data);
			}
		}

		/**
		 * Função que define os bônus de evento
		 * @param $eventBonus array Os dados dos bônus
		 */
		public function setEventBonusOld($bonusData) {
			// echo "<pre>";
			// var_dump($bonusData); exit;
			foreach ($bonusData["id_event_type"] as $key => $value) {
				$data = array(
						"id_event_bonus" => $bonusData["id_event_bonus"] > 0 ? $bonusData["id_event_bonus"][$key] : null,
						"id_event_type" => $value,
						"id_event" => $this->getIdEvent(),
						"quantity" => $bonusData["quantity"][$key]
					);
				$eventBonus = new EventBonus($data);
				if ($eventBonus->getIdEventBonus()) {
					$eventBonus->update($data);
				}
				// Caso não exista um registro na tabela de bônus, cria apenas se o valor for maior que 0, pois caso contrário, não há a necessidade
				elseif ($data["quantity"] > 0) {
					$eventBonus->save();
				}
			}
		}

		public function save(){
			if (!$this->isValidData()) return false;

			if($_FILES["logo"]["size"] > 0){
				$this->setLogo($this->openLogo($_FILES["logo"]));
			}

			$this->generatePath($this->getPath());

			$sql = 
			"INSERT INTO event
				(enabled, id_event_type, id_parent_event, name, path, details, teacher, location, address, start_date, end_date, 
				spaces, start_date_enrollment, end_date_enrollment, logo, send_participant_data, free, no_enrollment, auto_confirm_enrollment)
			VALUES
				(:enabled, :id_event_type, :id_parent_event, :name, :path, :details, :teacher, :location, :address, :start_date, :end_date,
				:spaces, :start_date_enrollment, :end_date_enrollment, :logo, :send_participant_data, :free, :no_enrollment, :auto_confirm_enrollment)";

			$params = array(
					":enabled" => $this->getEnabled(),
					":id_event_type" => $this->eventType->getIdEventType(),
					":name" => $this->getName(),
					":id_parent_event" => $this->getIdParentEvent(),
					":path" => $this->getPath(),
					":details" => $this->getDetails(),
					":teacher" => $this->getTeacher(),
					":location" => $this->getLocation(),
					":address" => $this->getAddress(),
					":start_date" => $this->getStartDate(), 
					":end_date" => $this->getEndDate(),
					":spaces" => $this->getSpaces(),
					":start_date_enrollment" => $this->getStartDateEnrollment(),
					":end_date_enrollment" => $this->getEndDateEnrollment(),
					":logo" => $this->getLogo(),
					":send_participant_data" => $this->getSendParticipantData(),
					":free" => $this->getFree(),
					":no_enrollment" => $this->getNoEnrollment(),
					":auto_confirm_enrollment" => $this->getAutoConfirmEnrollment()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			$this->setIdEvent($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		public function update($data = array()){
			$this->setData($data);
			if (!$this->isValidData()) return false;

			if($_FILES["logo"]["size"] > 0){
				$this->setLogo($this->openLogo($_FILES["logo"]));
			}

			$this->generatePath($this->getPath());

			$sql = 
			"UPDATE
				event
			SET
				enabled = :enabled,
				id_event_type = :id_event_type,
				id_parent_event = :id_parent_event,
				name = :name,
				path = :path,
				details = :details,
				teacher = :teacher, 
				location = :location,
				address = :address,
				start_date = :start_date, 
				end_date = :end_date, 
				spaces = :spaces,
				start_date_enrollment = :start_date_enrollment, 
				end_date_enrollment = :end_date_enrollment,
				logo = :logo,
				send_participant_data = :send_participant_data,
				free = :free,
				no_enrollment = :no_enrollment,
				auto_confirm_enrollment = :auto_confirm_enrollment
			WHERE
				id_event = :id_event";

			$params = array(
					":enabled" => $this->getEnabled(),
					":id_event_type" => $this->eventType->getIdEventType(),
					":id_parent_event" => $this->getIdParentEvent(),
					":name" => $this->getName(),
					":path" => $this->getPath(),
					":details" => $this->getDetails(),
					":teacher" => $this->getTeacher(),
					":location" => $this->getLocation(),
					":address" => $this->getAddress(),
					":start_date" => $this->getStartDate(), 
					":end_date" => $this->getEndDate(),
					":spaces" => $this->getSpaces(),
					":start_date_enrollment" => $this->getStartDateEnrollment(),
					":end_date_enrollment" => $this->getEndDateEnrollment(),
					":logo" => $this->getLogo(),
					":send_participant_data" => $this->getSendParticipantData(),
					":free" => $this->getFree(),
					":no_enrollment" => $this->getNoEnrollment(),
					":auto_confirm_enrollment" => $this->getAutoConfirmEnrollment(),
					":id_event" => $this->getIdEvent()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function remove(){
			//Remove os bônus
			$sql = "DELETE FROM event_bonus WHERE id_event = :id_event";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_event" => $this->getIdEvent());
			$statment->execute($params);

			$sql = "DELETE FROM event WHERE id_event = :id_event";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_event" => $this->getIdEvent());
			return $statment->execute($params);
		}

		/**
		 * Incrementa o número de visualizações
		 * @param int $id O ID do evento
		 */	
		public function updateViews($id){
			$sql = "UPDATE event SET views = views + 1 WHERE id_event = " . $id;

			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$statment->execute();
		}

		// public function addSpaces($id){
		// 	$sql = "UPDATE event SET spaces = spaces + 1 WHERE id_event = " . $id;

		// 	$pdo = \Database::getConnection();
		// 	$statment = $pdo->prepare($sql);
			
		// 	$statment->execute();
		// }

		// public function removeSpaces($id){
		// 	$sql = "UPDATE event SET spaces = spaces + 1 WHERE id_event = " . $id;

		// 	$pdo = \Database::getConnection();
		// 	$statment = $pdo->prepare($sql);
			
		// 	$statment->execute();
		// }

		private function openLogo($logo){
			$size = $logo["size"];
			$img = fread(fopen($logo["tmp_name"], "r"), $size); 
			return $img;
		}

		private function generatePath($path){
			if(!$path){
				$path = str_replace(" ", "-", strtolower(preg_replace('/[^a-zA-Z0-9\s]/', '-', self::removeSpecialCharacters($this->getName()))));
			}else{
				$path = str_replace(" ", "-", strtolower(preg_replace('/[^a-zA-Z0-9\s]/', '-', self::removeSpecialCharacters($this->getPath()))));
			}

			$number = 2;
			$end = "-" . strval($number);

			while ($event = self::find(array("path"), array($path))){
				if($event[0]->getIdEvent() != $this->getIdEvent()){
					if($number != 2){
						$path = substr($path, 0, -2);
					}
					$path = substr($path, 0, 48);
					$path = $path . $end;
					$number++;
					$end = "-" . strval($number);
				}else{
					break;
				}
			}

			$this->setPath($path);
		}

	}
?>