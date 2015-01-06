<?php

/**
 * Classe para geração de relatórios.
 * @author Gustavo Pchek
 */

	class Reports extends BaseModel{
		/**
	     * @var string $dateTo Data inicial
	     * @var string $timeTo Hora inicial
	     * @var string $dateTo Data final
	     * @var string $timeTo Hora final
	     * @var bool $confirmed Se o relatório incluirá inscrições confirmadas
	     * @var bool $unconfirmed Se o relatório incluirá inscrições não confirmadas
	     * @var bool $present Se o relatório incluirá inscrições com presença confirmada
	     * @var bool $absent Se o relatório incluirá inscrições com presença não confirmada
	     * @var int[] $events Os eventos que as inscrições serão relacionadas, pode ser vazio para relatório geral
	     */
		private $dateFrom, $timeFrom, $dateTo, $timeTo, $confirmed = false, $unconfirmed = false, $present = false, $absent = false, $events = array();

		public function setDateFrom($dateFrom){
			$this->dateFrom = empty($dateFrom) ? null : date("Y-m-d", strtotime(str_replace("/", "-", $dateFrom)));
		}

		public function setTimeFrom($timeFrom){
			$this->timeFrom = empty($timeFrom) ? null : date("H:i", strtotime(str_replace("/", "-", $timeFrom)));
		}

		public function setDateTo($dateTo){
			$this->dateTo = empty($dateTo) ? null : date("Y-m-d", strtotime(str_replace("/", "-", $dateTo)));
		}

		public function setTimeTo($timeTo){
			$this->timeTo = empty($timeTo) ? null : date("H:i", strtotime(str_replace("/", "-", $timeTo)));
		}

		public function setEvents($events){
			$this->events = $events;
		}

		public function setConfirmed($confirmed){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($confirmed)
				$this->confirmed = true;
			else
				$this->confirmed = false;
		}

		public function setUnconfirmed($unconfirmed){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($unconfirmed)
				$this->unconfirmed = true;
			else
				$this->unconfirmed = false;
		}

		public function setPresent($present){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($present)
				$this->present = true;
			else
				$this->present = false;
		}

		public function setAbsent($absent){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($absent)
				$this->absent = true;
			else
				$this->absent = false;
		}

		public function getDateFrom($format = "Y-m-d"){
			return is_null($this->dateFrom) ? null : date($format, strtotime($this->dateFrom));
		}

		public function getDateTo($format = "Y-m-d"){
			return is_null($this->dateTo) ? null : date($format, strtotime($this->dateTo));
		}

		public function getTimeFrom($format = "H:i"){
			return is_null($this->timeFrom) ? null : date($format, strtotime($this->timeFrom));
		}

		public function getTimeTo($format = "H:i"){
			return is_null($this->timeTo) ? null : date($format, strtotime($this->timeTo));
		}

		public function getEvents(){
			return $this->events;
		}

		public function getConfirmed(){
			return $this->confirmed;
		}

		public function getUnconfirmed(){
			return $this->unconfirmed;
		}

		public function getPresent(){
			return $this->present;
		}

		public function getAbsent(){
			return $this->absent;
		}

		public function generate(){

			$sql = "SELECT * FROM enrollment WHERE";

			if($this->getConfirmed() && $this->getUnconfirmed()){
				// não faz nada
			}else if($this->getConfirmed()){
				$sql .= " date_payment IS NOT NULL AND";
			}else if($this->getUnconfirmed()){
				$sql .= " date_payment IS NULL AND";
			}

			$sql .= " date_enrollment BETWEEN '" . $this->getDateFrom() . " " . $this->getTimeFrom() . "' AND '" . $this->getDateTo() . " " . $this->getTimeTo() . "'";

			if($this->getConfirmed()){
				if($this->getPresent() && $this->getAbsent()){
				// não faz nada
				}else if($this->getPresent()){
					$sql .= " AND attendance = 1";
				}else if($this->getAbsent()){
					$sql .= " AND attendance = 0";
				}
			}		

			if($this->getEvents())
				$sql .= " AND id_event IN (" . implode(',', array_map('intval', $this->getEvents())) . ")";

			$sql .= " ORDER BY date_enrollment ASC";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$enrollments = array();			

			foreach ($rows as $row) {
				$enrollments[] = new Enrollment($row);
			}
				
			return $enrollments;
		}






		public function update($data = array()){

			$data["modification_date"] = date('Y-m-d H:i');

			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE news SET %s WHERE id_news = ".$this->getIdNews();
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
			"INSERT INTO news
				(id_event, creation_date, modification_date, title, subtitle, content)
			VALUES
				(:id_event, :creation_date, :modification_date, :title, :subtitle, :content)";
			$params = array(
					":id_event" => $this->getIdEvent(),
					":creation_date" => date('Y-m-d H:i'),
					":modification_date" => date('Y-m-d H:i'),
					":title" => $this->getTitle(),
					":subtitle" => $this->getSubtitle(),
					":content" => $this->getContent()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function remove(){
			$sql = "DELETE FROM news WHERE id_news = :id_news";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_news" => $this->getIdNews());
			return $statment->execute($params);
		}
	}
?>